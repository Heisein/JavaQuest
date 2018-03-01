<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<style>
	.title {
		margin-top : 5%;
		font-size : 50px;
	}
	.mainArea {
		margin-top : 2%;
		margin-left : 39%;
	}
	.data {
		margin-top : 5%;
		width : 400px;
		height : 40px;	
	}
	button {
		margin-top : 3%;
		width : 400px;
		height : 40px;
		background : orange;
		font-size : 25px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<h1 align = "center" class = "title">JavaQuest</h1>
	<div class = "mainArea">					<%-- 프로젝트의 절대경로 --%>
		<form action = "<%= request.getContextPath() %>/insertMember" method = "post">
			<table >
				<tr>
					<td colspan = "2"><input class = "data" type = "text" name = "userId" placeholder = "ID"/></td>
				</tr>
				<tr>
					<td colspan = "2"><input class = "data" type = "password" name = "password" id = "password" placeholder="PASSWORD"/></td>
				</tr>
				<tr>
					<td colspan = "2"><input class = "data" type = "password" name = "password2" id = "password2" placeholder="PASSWORD"/></td>
					<td><label id = "password_text"></label></td>
				</tr>
				<tr>
					<td colspan = "2"><input class = "data" type = "text" name = "nickName" placeholder = "NICK NAME"/></td>
				</tr>
				<tr>
					<td colspan = "2"><input class = "data" type = "email" name = "email" placeholder = "EMAIL"/></td>
				</tr>
				<tr>
					<td colspan = "2"><input class = "data" type = "tel" name = "phone" placeholder="PHONE"/></td>
				</tr>
				
			</table>
			<button type = "submit" id = "join" disabled>회원가입</button>
		</form>
			<button onclick = "jump();">취소</button>
	</div>
	<script>
		function jump(){
			location.href = "../index.jsp";
		}
		
		$(function(){
			$("#password2").keyup(function(){
				if($("#password").val() != $("#password2").val()){
					$("#password_text").html("비밀번호가 일치하지 않습니다.").css("color", "red");
					$(this).focus();
				}else {
					$("#password_text").html("비밀번호가 일치합니다.").css("color", "green");
				}
			});
			
		});
		
		$("#password2").change(function(){
			if($("#password").val() == $("#password2").val()){
				$("#join").removeAttr("disabled");
			}	
		});
	</script>
</body>
</html>