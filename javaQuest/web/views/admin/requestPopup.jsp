<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.jqt.quest.model.vo.*" %>
<%
	Quest q = (Quest)request.getAttribute("q");
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
	.up-box{
		overflow-x:hidden;
		background: blue;
		background-color: #263238;
		float: left;
		width:100%;
		height:60%;
		border:2px solid lightgray;
		padding:0% 0% 1% 0%;
		color:white;
	}
	.bottom-box{
		background: blue;
		background-color: #263238;
		float: left;
		width:100%;
		height:26.5%;
		border:2px solid lightgray;
		padding:0% 0% 1% 0%;
		overflow-x:hidden;
		color:white;
	}
</style>
</head>
<body>
	<div class='up-box'>
		출제자 : <%= q.getQuestWriter() %> (요청일자 <%= q.getUploadDate() %>)
	</div>
	<div class='up-box'>
		<div style="color:#ffffff;width:100%;border-bottom:1px solid black;padding:0% 0.5% 0.5% 0.5%;"><p style="">출제자가 제시한 지문</p></div>
		<%= q.getQuestContents() %>
	</div>
	<div class='up-box'>
		<div style="color:#ffffff;width:100%;border-bottom:1px solid black;padding:0% 0.5% 0.5% 0.5%;"><p style="">출제자가 제시한 기본 코드</p></div>
		<textarea id="compilearea" class="compilearea" name="code"><%= q.getDefaultCode() %></textarea>
	</div>
	<div class='bottom-box'>
		<div style="color:#ffffff;width:100%;border-bottom:1px solid black;padding:0% 0.5% 0.5% 0.5%;"><p style="">출제자가 제시한 답</p></div>
		<%= q.getQuestAnswer() %>
	</div>
	<script>
		var editor = CodeMirror.fromTextArea(document.getElementById("compilearea"), {
			lineNumbers: true,
			theme:"eclipse",
			mode:"text/x-java"
		});
	</script>
</body>
</html>