<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.jqt.member.model.vo.*" %>
<% Member loginUser = (Member)request.getSession().getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add</title>
<script src="<%= request.getContextPath() %>/codemirror/lib/codemirror.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/codemirror/lib/codemirror.css">
<script src="<%= request.getContextPath() %>/codemirror/mode/clike/clike.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/codemirror/theme/eclipse.css">
<style>
	html, body{
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
	<div class='left-box'>
		<div style="padding:0% 2% 2% 2%;"><p style="float:left;width:auto;" contenteditable="true" class="noEnter" id="questNameP">문제 제목을 적어주세요.</p></div>
		<div id="left-bottom" contenteditable="true">이곳에 문제 내용을 적어주세요.</div>
	</div>
	<div class='right-box'>
		
		<div style="color:#ffffff;width:100%;border-bottom:1px solid black;padding:0% 1% 0.5% 1%;"><p style="">에디터</p> </div>
		
		<textarea id="compilearea" class="compilearea" name="code">public class HereWeGo {
	public void runMethod(){
		// 이곳에 기본 코드를 작성해주시면 됩니다.
	}
}</textarea>
	</div>
		
	<div class='right-box-bottom'>
		<div style="color:#ffffff;width:100%;border-bottom:1px solid black;padding:0% 1% 0.5% 1%;"><p style="">실행 결과</p> </div>
		<button value="제출" class="compilebtn" id="wpcnf" onclick="goSubmit()">제출</button>
		<label style="color:white;" contenteditable="true" class="noEnter" id="questAnswerP">이곳에 문제의 답을 적어주세요.</label>
	</div>
	
	<!-- 히든 영역, 폼 데이터 전송용! -->
	<form id="comform" action="<%= request.getContextPath() %>/insertRequest.qu" method="post">
		<input type="hidden" name="questName" id="questName">
		<input type="hidden" name="questContents" id="questContents">
		<input type="hidden" name="questWriter" id="questWriter">
		<input type="hidden" name="defaultCode" id="defaultCode">
		<input type="hidden" name="questAnswer" id="questAnswer">
	</form>

	<script>
		//엔터키 못치게 막기
		$(".noEnter").keypress(function (evt) {
			var keycode = evt.charCode || evt.keyCode;
			
			if (keycode  == 13) { // 엔터의 유니코드
				return false;
			}
		});
	
		//코드미러 설정
		var editor = CodeMirror.fromTextArea(document.getElementById("compilearea"), {
			lineNumbers: true,
			theme:"eclipse",
			mode:"text/x-java"
		});
		
		function goSubmit(){
			//서브밋버튼 누르면 각 칸의 글자를 가져와서 히든 div에 넣고 전송함
			var qn = document.getElementById("questNameP").innerHTML;
			var qc = document.getElementById("left-bottom").innerHTML;
			var dc = editor.getValue();
			var qa = document.getElementById("questAnswerP").innerHTML;
			
			console.log(dc);
			
			$("#questName").val(qn);
			$("#questContents").val(qc);
			$("#defaultCode").val(dc);
			$("#questWriter").val("<%= loginUser.getUserNum() %>");
			$("#questAnswer").val(qa);
			
			$("#comform").submit();
		}
	</script>
	<br><br><br>
</body>
</html>