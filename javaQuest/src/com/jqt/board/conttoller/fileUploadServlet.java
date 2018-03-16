package com.jqt.board.conttoller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.jqt.board.model.service.BoardService;
import com.jqt.board.model.vo.AchievementResume;
import com.jqt.board.model.vo.Attachment;
import com.jqt.board.model.vo.Board;
import com.jqt.common.MyFileRenamePolicy;
import com.jqt.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class fileUploadServlet
 */
@WebServlet("/fileUpload.me")
public class fileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fileUploadServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

			
			//전송 파일 용량 제한 : 10Mbyte 제한한 경우
			int maxSize = 1024 * 1024 * 10;
			
			String root = "C:\\Users\\Kang\\git\\JavaQuest\\javaQuest\\web\\";
			System.out.println(root);
			
			//파일을 저장할 경로 지정
			String savePath = root +"upload_resume/";
			
			//System.out.println("경로" + savePath);
			
			
			  //이름과 제목을 저장할 변수
			  String saveFile = "";
			  //업로드 된 파일 이름을 저장할 변수
			  String filename = "";
			  //업로드 되기 전의 원본 파일 이름을 저장할 변수
			  String originFiles ="";
			  
			  try {
			  
			  MultipartRequest multiRequest = new MultipartRequest(request, savePath, 
					  maxSize, "UTF-8", new MyFileRenamePolicy());
			 
			  saveFile = multiRequest.getParameter("filename");
			  //System.out.println("세이브파일"+ saveFile);
			  
			   Enumeration<String> files = multiRequest.getFileNames();
			   //System.out.println("files : " + files);
			   
			   //첫번째 파일에 접근
			   String file = files.nextElement();
			   //System.out.println("file : " + file);
			   //업로드된 파일명 저장
			   filename = multiRequest.getFilesystemName(file);
			   //System.out.println("filename : " + filename);
			   //원본 파일명 저장
			   originFiles = multiRequest.getOriginalFileName(file);
			   //System.out.println("originFiles : " + originFiles);
			   
			   
				HttpSession session = request.getSession();
				Member m = (Member)session.getAttribute("loginUser");
			   
			   
/*				ArrayList<Attachment> fileList = new ArrayList<Attachment>();
				//전송 순서 역순으로 파일이 Enumeration에 저장되기 때문에
				//반복문을 역으로 수행함

				*/

				
				
				  //첨부파일의 정보를 저장할 arrayList객체 생성
				  Attachment fileList = new Attachment();
					System.out.println(fileList);

					int result = new BoardService().insertResume(fileList);
					
					System.out.println("result : " + result);
				  
					response.sendRedirect(request.getContextPath() + "/selectList.tn");

			   
			   
			
			  }catch(Exception e){
				  System.out.println(e.getMessage() + "에러에러");


			  }

			  RequestDispatcher view = request.getRequestDispatcher("views/myPage/resume.jsp");
			  view.forward(request,response);
			  System.out.println("뜨긴뜨는건가");
			  
			  
			
			  
			  
			  
			  
			  
			  
			  


		
		
	/*	if(ServletFileUpload.isMultipartContent(request)){
			//전송 파일 용량 제한 : 10Mbyte 제한한 경우
			int maxSize = 1024 * 1024 * 10;
			
			//컨테이너의 루트 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println(root);
			
			//파일을 저장할 경로 지정
			String savePath = root +"upload_resume/";
			
			//FileRenamePolicy상속 후 오버라이딩
			MultipartRequest multiRequest 
			= new MultipartRequest(request, savePath, 
					maxSize, "UTF-8",
					new MyFileRenamePolicy());
			
			//다중파일을 묶어서 업로드를 하기 위해 컬렉션을 사용한다.
			//저장한 파일 이름을 저장할 arrayList 생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			//원본 파일의 이름을 저장할 arrayList를 생성
			ArrayList<String> originFiles = new ArrayList<String>();
			
			//파일이 전송된 폼의 이름을 반환한다
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()){
				String name = files.nextElement();
				
				System.out.println(name);
				
				//지정한 경로에 저장된 파일 시스템의 이름을 가져와서 
				//arrayList에 담는다.
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				System.out.println("filesystem : " + multiRequest.getFilesystemName(name));
				System.out.println("originFile : " + multiRequest.getOriginalFileName(name));
			}
			
			
			HttpSession session = request.getSession();
			Member m = (Member)session.getAttribute("loginUser");
			
			
			//첨부파일의 정보를 저장할 arrayList객체 생성
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			//전송 순서 역순으로 파일이 Enumeration에 저장되기 때문에
			//반복문을 역으로 수행함
			for(int i = originFiles.size() - 1; i >= 0; i--){
				Attachment at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				System.out.println(at);
				fileList.add(at);
			}
			
			System.out.println(fileList);
			
			//service로 전송
			int result = new BoardService().insertResume(fileList);
			
			System.out.println("result : " + result);
			
			if(result > 0){
				response.sendRedirect(request.getContextPath() + "/selectList.tn");
			}else{
				//실패시 저장된 사진 삭제
				for(int i = 0; i < saveFiles.size(); i++){
					//파일시스템에 저장된 이름으로 파일 객체 생성
					File failedFile = new File(savePath + saveFiles.get(i));
					
					System.out.println(failedFile);
					
					//failedFile.delete();
					//true, false 리턴함
					System.out.println(failedFile.delete());
				}
				
				//에러페이지로 메세지 전달
				request.setAttribute("msg", "사진게시판 등록 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
		}*/
			
			
			
			
			
			
			
			
			
			
		}
		
		
		
		
		
		
		
		
		
		
		


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
