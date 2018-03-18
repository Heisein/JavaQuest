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
	<%@ include file="/views/common/menubar.jsp"%>
	<br/>
	
	<div class="container alert alert-danger" role="alert" align="center">
		<br/>
		<br/>
		<label style="font-size:35px; bold;">에러가 발생했습니다</label>
			<br/>
			<br/>
			<label style="font-size:25px;"><%= msg %></label>
			<br/>
			<br/>
			<button class="btn btn-primary" id="goMainBtn">메인으로 돌아가기</button>
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