<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String className = "HereWeGo";

	String code = String.valueOf(request.getAttribute("writedCode"));

	String result = String.valueOf(request.getAttribute("result"));
	if(result.equals("null")) result = "이곳에 실행 결과가 표시됩니다.";
	
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
<script src="/jqt/codemirror/lib/codemirror.js"></script>
<script src="/jqt/codemirror/mode/clike/clike.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jqt/codemirror/lib/codemirror.css">
<link rel="stylesheet" href="/jqt/codemirror/theme/eclipse.css">
<link rel="stylesheet" href="/jqt/css/countGame.css">
<style>
	html, body {
		width: 100%;
		height: 100%;
		padding:0px;
		margin:0px;
		background-image:url("image/backvil1.jpg");
		background-size:100% 100%;
	}
	.top-box{
		background: lightgray;
		float: top;
		width:99%;
		height:3%;
		color:red;
		background-color: rgba( 0, 0, 255, 0.8 );
		border:2px solid lightgray;
		margin:auto;
		padding:5px;
	}
	.left-box {
		color:black;
		float: left;
		background:#ffffff;
		width:30%;
		height:90%;
		font-family:"나눔고딕";
		border:5px solid lightgray;
		padding:0% 0% 1% 0%;
		font-size:16px;
	}
	.right-box {
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
	.right-box-bottom {
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
		.CodeMirror {
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
	#left_bottom{
		clear:both;
		border-top:1px solid gray;
		padding:2% 1% 1% 1%;
		width:100%;
	}
	.CodeMirror-cursor
	{
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
</style>
</head>
<body>
		<!-- <button onclick="location.href='views/myPage.jsp'">이동하기</button> -->
		<div class='left-box' style="position:relative;">
			<div style="padding:0% 2% 2% 2%;">
				<p style="float:left;width:auto;">딕셔너리 정렬</p>
				<div style="background-color:purple;width:40px;text-align:center;padding:5px;color:#ffffff;font-size:12px;border-radius:5px;font-weight:Bold;float:left;margin-top:13px;margin-left:5px;">Level 1</div>
			</div>
			<div id="left_bottom">
				처음 온 모험가를 환영하네! 자, 그럼 본격적으로 모험을 시작하기 전에 한가지 테스트를 해 보겠네. 물론 자네라면 어렵지 않게 넘어갈 수 있겠지만 쉬어간다고 생각하고 해보게나. 자, 오른쪽 대화창으로 'Hello World'를 출력해보게!
			</div>
			<div class="time-count">
				시간 div
			</div>
		</div>
		<div class='right-box'>
		
			<div style="color:#ffffff;width:100%;border-bottom:1px solid black;padding:0% 1% 0.5% 1%;"><p style="">에디터</p> </div>
			<form action="<%= request.getContextPath() %>/compile.co" method="post" id="comform">
			<textarea id="compilearea" class="compilearea" name="code">
<% if(code.equals("null")) {%>public class HereWeGo {
	public void runMethod(){
		System.out.println("dd");
	}
}<% }else{ %><%= code %><% } %></textarea>
			<input type="hidden" value="<%= className %>" name="className">
			</form>
			</div>
		
		<div class='right-box-bottom'>
			<div style="color:#ffffff;width:100%;border-bottom:1px solid black;padding:0% 1% 0.5% 1%;"><p style="">실행 결과</p> </div>
			<button value="제출" class="compilebtn" id="wpcnf">제출</button>
			<button value="실행" class="compilebtn" id="tlfgod" onclick="goCompile()">실행</button>
			<button value="제출" class="compilebtn" id="chrlghk">초기화</button>
			<label style="color:white;">
					<%= result %>
 					<% if(elapsedTime > 0){ %>
					<%= "<br><br> 실행시간: " + elapsedTime %>
					<% } %>
			</label>
		</div>
		
		<script>
			function goCompile(){
				var code = document.getElementById("compilearea").value;
				
				console.log(code);
				
				$("#comform").submit();
				
			}
		
			var editor = CodeMirror.fromTextArea(document.getElementById("compilearea"), {
				lineNumbers: true,
				theme:"eclipse",
				mode:"text/x-java"
			});
			
			var min = 5;
			var sec = 59;
			var counter = setInterval(function() {
				if (sec >= -1) {
					$(".time-count").html("남은시간<br/>" + min + " : " + sec);
					sec--;
					if(sec == -1){
						min--;
						sec = 59;
					}
				}else if(min == 0 && sec == 0){ 
					clearInterval(counter);
					$(".time-count").html("Timeout!!"); //카운트가 끝날때 디스플레이 멘트
				}     
			}, 1000); //1초에 한번씩 카운트
		</script>
		<br><br><br>
</body>
</html>