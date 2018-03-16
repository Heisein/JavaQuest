package com.jqt.compile.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.jqt.quest.model.service.QuestService;
import com.jqt.quest.model.vo.Quest;

/**
 * Servlet implementation class CompileServlet
 */
@WebServlet("/compile.co")
public class CompileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CompileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		String className = request.getParameter("className");

		//System.out.println("code : " + code);
		
		JSONObject comResult = new JSONObject(); //결과값을 가져갈놈
		//int qid = Integer.parseInt(request.getParameter("qid"));
		
		//Quest q = new QuestService().selectOne(qid);
		
		//컴파일된 파일이 저장될 경로
		String javaFileDirectory = "C:/compile";
		File javaFile = new File(javaFileDirectory);
		
		//해당 경로가 존재하지 않을 시 새로 생성하함. mkdirs는 생성됐을시 true를, 생성되지 않았을 시(이미 경로가 존재할때) false를 반환
		boolean makeResult = javaFile.mkdirs();
		
		System.out.println(makeResult ? "디렉토리 생성됨" : "디렉토리 생성되지 않음"); // 삼항연산자임
		
		//클래스파일의 위치
		String javaFilePath = javaFile + "/" + className + ".java";
		BufferedWriter out = new BufferedWriter(new FileWriter(javaFilePath));

		//해당 파일에 코드를 write하고 종료함
	    out.write(code);
	    out.close();

	    // ========== 이하 런타임 (cmd 실행하는부분) ==========
	    
	    //.java파일을 저장했으니 이하 컴파일해야하니 시작시간을 저장함 (실행 시간을 계산해야하므로)
	    long startTime = System.currentTimeMillis();
	    
	    // cmd에 입력할 커맨드, 인코딩 없으면 한글 깨짐, 프로젝트 설정마다 상이함
		String command = "cmd /C javac " + javaFilePath + " -encoding UTF-8";
		Process child = Runtime.getRuntime().exec(command); // runTime으로 cmd에 command넣고 실행

		//저장된 process에서 에러스트림을 가져옴
		BufferedReader errinput = new BufferedReader(new InputStreamReader(child.getErrorStream(), "MS949"));
		
		int line;
		//에러스트림이 존재할경우 스트링빌더에 에러메세지 쌓음. -1은 end of file : eof, 파일의 마지막이란 뜻임
		if ((line = errinput.read()) != -1) {
			StringBuilder errSb = new StringBuilder();
			do{
				if(line == 32) errSb.append("&nbsp;"); // 유니코드 32는 스페이스바, html에 표시해줘야되니 &nbsp;로
				else errSb.append((char)line);
			}while((line = errinput.read()) != -1);
			
			String errorStr = errSb.toString().replace("\n","<br>"); // 상동, html이니까 <br>로
			
			//에러를 담는다
			comResult.put("result", errorStr);
		} else {
			//이하 에러스트림이 존재하지 않을 경우, 즉 컴파일에 성공한 경우
			InputStreamReader in = new InputStreamReader(child.getInputStream());

			int c = 0;
			while ((c = in.read()) != -1) {
				System.out.print((char) c);
			}

			in.close();
			
			// ========== 이하 리플렉션 ==========
			
			// 클래스 로더에 사용할 url을 저장
			URL[] filePath = { new File(javaFileDirectory).toURL() }; // 노란줄 무시
			URLClassLoader ucl = new URLClassLoader(filePath);
			
			try {
				//해당 클래스를 가져옴
				Class<?> cls = ucl.loadClass(className);

				//가져온 클래스를 객체화
				Object obj = cls.newInstance();

				//가져온 클래스의 runMethod 메소드를 불러온다
				Method m = cls.getMethod("runMethod");
				
				//프린트를 저장할 스트림을 만든다
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				PrintStream ps = new PrintStream(baos);
				
				//이전까지 사용중이었던 System.out을 저장함
				PrintStream old = System.out; // temp, 임시저장
				
				//지금부터 ps라는 프린트 스트림을 사용하겠다
				System.setOut(ps);
				
				// obj에 담긴 m이라는 변수(메소드)를 invoke(실행)한다
				m.invoke(obj); // == obj.runMethod();
				
				//프린트 스트림에 밀어넣고, 다시 원래 사용하던 printStream으로 돌아온다.
				System.out.flush();
				System.setOut(old);

				//result 스트링에 출력결과(스트림에 저장된 프린트들)을 저장한다.
				String result = baos.toString();
				
				long endTime = System.currentTimeMillis();
				float elapsedTime = (endTime - startTime) / 1000.0f;
				
				//q가 존재하면 답도 같이 넘겨줌
				if(request.getSession().getAttribute("q") != null){
					Quest q = (Quest)request.getSession().getAttribute("q");
					comResult.put("answer", q.getQuestAnswer());
				}
				
				//결과와 진행 시간을 담아온다
				comResult.put("result", result);
				comResult.put("elapsedTime", elapsedTime);
				
				
			} catch (ClassNotFoundException e) {
				System.out.println("클래스파일 찾기 실패");
			} catch (InstantiationException e) { // newInstance()가 불가능할때 == 기본생성자가 존재하지 않을때
				e.printStackTrace();
			} catch (IllegalAccessException e) { // 접근권한이 없음
				e.printStackTrace();
			} catch (NoSuchMethodException e) { //해당 메소드를 못찾음
				e.printStackTrace();
			} catch (SecurityException e) { //보안문제? 잘모르겠음
				e.printStackTrace();
			} catch (IllegalArgumentException e) { //인자의 형태가 맞지 않음
				e.printStackTrace();
			} catch (InvocationTargetException e) { //리플렉션으로 불러올 타겟을 못찾았을때? 입력값 예외라는듯
				e.printStackTrace();
			}
		}
		
		// 인코딩 수정하고 제이슨 반환
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(comResult, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
