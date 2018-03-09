<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.jqt.quest.model.vo.*, com.jqt.member.model.vo.*" %>
<%
	Quest q = (Quest)request.getAttribute("q"); // 진행중인 퀘스트 정보
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	
	System.out.println(loginUser);

	int qid = q.getQuestId();

	String className = "HereWeGo";
	
	String defaultcode = "null"; // 기본코드 초기화
	String writedCode = String.valueOf(request.getAttribute("writedCode")); // 작성중이었던 코드
	
	if(q.getDefaultCode() != null) defaultcode = q.getDefaultCode(); // 해당 퀘스트의 기본코드 불러옴
	
	float elapsedTime = 0;
	if((request.getAttribute("elapsedTime")) != null){
		elapsedTime = (float)request.getAttribute("elapsedTime");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/codemirror/lib/codemirror.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/codemirror/lib/codemirror.css">
<script src="<%= request.getContextPath() %>/codemirror/mode/clike/clike.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/codemirror/theme/eclipse.css">
<style>
	html, body {
		background-size:100% 100%;
		width: 100%;
		height: 100%;
		padding:0px;
		margin:0px;
		background-image:url("<%= request.getContextPath() %>/images/backvil1.jpg");
	}
	.left-box{
		color:black;
		float: left;
		background:#ffffff;
		width:30%;
		height:90%;
		font-family:"나눔고딕";
		border:5px solid lightgray;
		padding:0% 0% 1% 0%;
		font-size:16px;
		position:relative;
	}
	.right-box{
		overflow-x:hidden;
		background: blue;
		background-color: #263238;
		float: left;
		width:66%;
		margin-left:0.5%;
		height:60%;
		border:5px solid lightgray;
		padding:0% 0% 1% 0%;
	/*	padding:2% 2% 0 4%; /* 패딩 순서 위 오 아 왼 */
	}
	.right-box-bottom{
		background: blue;
		background-color: #263238;
		float: left;
		width:66%;
		margin-left:0.5%;
		height:26.5%;
		border:5px solid lightgray;
		padding:0% 0% 1% 0%;
		overflow-x:hidden;
	/*	padding:2% 2% 0 4%; /* 패딩 순서 위 오 아 왼 */
	}
	.compilearea,.compilearea2{
		resize:none;
		font-size:18px;
	}
	.compilebtn{
		float:right;
		padding:10px;
		border:none;
		background-color:#1267fa;
		color:#ffffff;
		border-left:1px solid #2a2a2a;
		border-top:1px solid #2a2a2a;
	}
	.CodeMirror{
	    -moz-appearance: textfield-multiline;
	    -webkit-appearance: textarea;
	    font: medium -moz-fixed;
	    font: -webkit-small-control;
	    width:100%;
		height:93%;
	    padding:2px;
	    color:white;
		background-color: #263238;
		font-size:16px;
	}
	#left-bottom{
		clear:both;
		border-top:1px solid gray;
		padding:2% 1% 1% 1%;
		width:100%;
	}
	#left-bottom-footer{
 		position: absolute;
		bottom: 5px;
	}
	.CodeMirror-cursor{
		border-left-color:white !important;
	}
	.CodeMirror-linenumbers{
		background:#263238;
	}
	.CodeMirror-gutters{
		border-right:none;	
	}
	*{
		font-family:"나눔고딕";
	}
	.levelDiv{
		width:40px;
		text-align:center;
		padding:5px;
		color:#ffffff;
		font-size:12px;
		border-radius:5px;
		font-weight:Bold;
		float:left;
		margin-top:13px;
		margin-left:5px;
	}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<!-- 왼쪽 상자 문제 정보 출력하는 부분 -->
	<div class='left-box'>
			<div style="padding:0% 2% 2% 2%;"><p style="float:left;width:auto;"><%= q.getQuestName() %></p><div style="background-color:<%= q.getColor() %>" class="levelDiv">Level 1</div></div>
			<div id="left-bottom"><%= q.getQuestContents() %><div id="left-bottom-footer">출제자 : <%= q.getQuestWriter() %> / 보상 경험치 : <%= q.getRewardExp() %></div></div>
	</div> <!-- leftbox end -->
	<!-- 오른쪽 위, 편집기 출력하는 부분 -->
	<div class='right-box'>
		<div style="color:#ffffff;width:100%;border-bottom:1px solid black;padding:0% 1% 0.5% 1%;"><p style="">에디터</p> </div>
			<form action="<%= request.getContextPath() %>/compile.co" method="post" id="comform">
				<!-- 에디터 텍스트칸, 기본코드도 없고 작성중인 코드도 없을때는 기본코드를 출력해준다 -->
				<textarea id="compilearea" class="compilearea" name="code">
<% if(defaultcode.equals("null") && writedCode.equals("null")) {%>public class HereWeGo {
	public void runMethod(){
		//여기부터 시작!
	}
}<% }else{ %><%= q.getDefaultCode() %><% } %></textarea> <!-- 그외엔 기본코드를 출력해준다. --> 
				<input type="hidden" value="<%= className %>" id="className" name="className"> <!-- 클래스네임을 저장할 히든 인풋(꼼수) -->
			</form>
	</div> <!-- rightbox end -->
		
	<div class='right-box-bottom'>
		<div style="color:#ffffff;width:100%;border-bottom:1px solid black;padding:0% 1% 0.5% 1%;"><p style="">실행 결과</p> </div>
		<button value="제출" class="compilebtn" id="wpcnf" onclick="goSubmit()">제출</button>
		<button value="실행" class="compilebtn" id="tlfgod" onclick="goCompile()">실행</button>
		<button value="제출" class="compilebtn" id="chrlghk" onclick="deleteAll()">초기화</button>
		<button value="던지기" class="compilebtn" id="giveup" onclick="goBack()">던지기</button>
		<label style="color:white;" id="resultLabel">이곳에 실행 결과가 표시됩니다.</label>
	</div> <!-- rightboxbottom end -->
		
	<script>
		// 제출하기
		function goSubmit(){
			// 세션에 진행중인 퀘스트를 추가한다
			var code = editor.getValue();
			var className = $("#className").val();
			
			<% session.setAttribute("q", q); %> 
			
			sessionStorage.setItem("code",code);
			sessionStorage.setItem("className",className);
			
			location.href="<%= request.getContextPath() %>/views/compiler/gradingPage.jsp";
			
			// ajax로 passInfo를 실행시켜서 지금 페이지에 저장되있는 정보를 넘겨서 그쪽에서 세션을 추가하게 한다
			$.ajax({
				url:"/jqt/passInfo.co",
				data : { "code":code, "className":className }, // 전송할 코드
				type:"post",
				success:function(data){
					//ajax의 결과가 돌아오면 세션이 추가된 상태니까 결과페이지로 넘어간다. 결과페이지에서 세션에서 사용한 속성들을 제거할것이다.
					location.href="<%= request.getContextPath() %>/views/compiler/gradingPage.jsp";
				},
				error:function(data){
					console.log("컴파일 제출중 에러");
					$("#resultLabel").text("제출중 에러가 발생하였습니다!");
				}
			})// end of inner ajax
			
			
			
		}
		
		function goBack(){
			
		}
		
		//초기화
		function deleteAll(){
			var defaultStr = "public class HereWeGo {\n";
			defaultStr += "	public void runMethod(){\n"
			defaultStr += "		//여기부터 시작!\n";
			defaultStr += "	}\n";
			defaultStr += "}";
			editor.setValue(defaultStr);
		}
	
		function goCompile(){
			var code = editor.getValue();
			var className = $("#className").val();
			
			$.ajax({
				url:"/jqt/compile.co",
				data : { "code":code, "className":className }, // 전송할 코드
				type:"post",
				success:function(data){
					var htmlStr = data["result"]; // html 내용물 채울 변수
					if(data["elapsedTime"] != null)	htmlStr += ("<br><br>" + "경과시간 : " + data["elapsedTime"] + "초");
					$("#resultLabel").html(htmlStr);
				},
				error:function(data){
					console.log("컴파일 요청중 에러");
				}
			})// end of inner ajax
			
		}
		
		// 코드미러 에디터 설정하는부분
		var editor = CodeMirror.fromTextArea(document.getElementById("compilearea"), {
			lineNumbers: true,
			theme:"eclipse",
			mode:"text/x-java"
		});
	</script>
	<br><br><br>
</body>
</html>