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
	<div class="container">
		<%@ include file="/views/common/menubar.jsp"%>
		<br/>
		<br/>
		
		<div class="conArea" id="mainArea" align="center">
			<label style="font-size:35px; bold;">에러가 발생했습니다.</label>
			<br/>
			<br/>
			<label style="font-size:25px;"><%= msg %></label>
			<br/>
			<br/>
			<button id="goMainBtn">메인으로 돌아가기</button>
		</div>
		<!-- conArea -->
	</div>
	<!-- container -->
	
	<script>
		$(function(){
			$("#goMainBtn").click(function(){
				location.href="<%= request.getContextPath() %>";
			})
		})
	</script>
</body>
</html>