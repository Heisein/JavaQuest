<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align = "center">
	
		<h1>회원가입 성공</h1>
		<h2><%= msg %></h2>
		<br/>
		<button onclick = "location.href = 'index.jsp'">메인으로</button>
		
	</div>
</body>
</html>