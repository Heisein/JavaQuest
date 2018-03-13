<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	String msg = (String)request.getAttribute("msg");
	String userId = (String)request.getAttribute("userId");
	String nickname = (String)request.getAttribute("nickname");
%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	#imgarea{
		margin-left:200px;
		margin-top:70px;
	}
	#result, #result p{
		margin-top:10px;
	}
	#resultset{
		color: red;
		font-size:25px;
		font-weight:bold;
	}
	#login{
		margin-left:200px;
	}
	body h3{
		margin-left:200px;
	}
	button{
		border-radius:10px;
		
	}
	
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="/views/common/menubar.jsp" %>
	
	<h3>회원가입 성공, 회원 가입 수정, 회원탈퇴 등...</h3>
	<div id ="imgarea">
		<img src="<%= request.getContextPath() %>/images/logo.png">
		<div id="result">
			<p id="resultset">자바퀘스트 홈페이지 <%= msg %>이 완료 되었습니다.</p>
			<p>회원아이디: <%= userId %> </p>
			<p>회원닉네임: <%= nickname %> 님 환영합니다</p>
			<p><u>가입 하신 아이디로 다시 로그인 바랍니다.</u></p>
		</div>
	</div>
	<br>
	<div id="login">
		<button onclick="location.href='<%= request.getContextPath() %>/views/common/loginForm.jsp'">로그인</button>
	</div>
	
	
</body>
</html>