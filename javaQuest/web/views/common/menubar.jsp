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
<link rel="stylesheet" href="/jqt/css/reset.css">
<link rel="stylesheet" href="/jqt/css/common.css">
<link rel="stylesheet" href="/jqt/css/menubar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<!-- container  -->
	<div class="container">
	
		<div class="login-join">
		<% if(loginUser == null) { %>
			<ul>
				<li onclick="location.href='<%= request.getContextPath() %>/views/common/loginForm.jsp'"><button type="button" class="btn btn-danger"><i class="fa fa-user-circle" aria-hidden="true" style="color:white;"></i> 로그인</button></li>
				<li onclick="location.href='<%= request.getContextPath() %>/views/member/memberJoinForm.jsp'"><button type="button" class="btn btn-primary"><i class="fa fa-sign-in" aria-hidden="true" style="color:white;"></i> 회원가입</button></li>
			</ul>
		<% } else { %>
			<button class="btn btn-danger" onclick="location.href='<%= request.getContextPath() %>/logout'"><i class="fa fa-sign-in" aria-hidden="true" style="color:white;"></i> 로그아웃</button>
		
		<% } %>
		</div>
		
		<!-- menu-Area -->
		<div class="menu-Area">
			<div  class="logo">
				<a href="<%= request.getContextPath() %>/"><img src="/jqt/images/logo.png"/></a>
			</div>
			
			<ul class="menu-bar">
			<% if(loginUser == null || loginUser.getType() != 3){ %>
				<li><a href="<%= request.getContextPath() %>/views/myPage/myInfo.jsp">MY PAGE</a></li>
			<%}else{ %>
				<li><a href="<%= request.getContextPath() %>/views/admin/selectAllResult.jsp">ADMIN PAGE</a></li>
			<%} %>
				<li><a href="<%= request.getContextPath() %>/selectList.st">STORE</a></li>
				<li><a href="<%= request.getContextPath() %>/rankingList.ro?type=Level">RANKING</a></li>
				<li><a href="<%= request.getContextPath() %>/selectqaa.no">BOARD</a></li>
				<li><a href="<%= request.getContextPath() %>/views/games/gameMainPage.jsp">GAME</a></li>
				<li id="questLi"><a href="<%= request.getContextPath() %>/selectList.qu">QUEST</a></li>
			</ul>
		</div>
		<!-- menu-Area -->
		<script>
			$(function(){
				<% if(request.getRequestURL().indexOf("quest") > 0){ %>
					document.getElementById("questLi").id = "selectedLi";
				<% } %>
			})
		</script>
	</div>
	<hr>
	
</body>
</html>