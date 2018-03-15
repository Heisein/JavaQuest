<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.jqt.member.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/reset.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/menubar.css">
=======
<link rel="stylesheet" href="/jqt/css/reset.css">
<link rel="stylesheet" href="/jqt/css/common.css">
<link rel="stylesheet" href="/jqt/css/menubar.css">
>>>>>>> origin/jo3
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!-- container  -->
	<div class="container">
	
		<div class="login-join">
		<% if(loginUser == null) { %>
			<ul>
				<li><a href="<%= request.getContextPath() %>/views/common/loginForm.jsp">로그인 </a></li>
				<li><a href="#">회원가입</a></li>
			</ul>
		<% } else { %>
			<button class="logout" onclick="location.href='<%= request.getContextPath() %>/logout'">로그아웃</button>
		
		<% } %>
		</div>
		<div class="logo">
<<<<<<< HEAD
			<a href="<%= request.getContextPath() %>/views/main/mainPage.jsp"><img src="<%= request.getContextPath() %>/images/"/></a>
=======
			<a href="<%= request.getContextPath() %>/views/main/mainPage.jsp"><img src="/jqt/images/logo.png"/></a>
>>>>>>> origin/jo3
		</div>		
		<!-- menu-Area -->
		<div class="menu-Area">
			<ul class="menu-bar">
				<li><a href="<%= request.getContextPath() %>/selectList.st">MY PAGE</a></li>
				<li><a href="#">BOARD</a></li>
				<li><a href="#">RANKING</a></li>
				<li><a href="<%= request.getContextPath() %>/views/games/gameMainPage.jsp">GAME</a></li>
				<li><a href="<%= request.getContextPath() %>/selectList.qu">QUEST</a></li>
			</ul>
		</div>
		<!-- menu-Area -->
	</div>
	
</body>
</html>