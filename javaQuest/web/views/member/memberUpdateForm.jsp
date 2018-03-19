<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.jqt.member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String password2 = loginUser.getUserPwd();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	
	<form>
		<table>
			<tr>
				<td><label>ID</label></td>
				<td><input type = "text" name = "userId" value = "<%= loginUser.getUserId() %>" readonly/></td>		
			</tr>
			<tr>
				<td><label>Pwd</label></td>
				<td><input type = "password" name = "password" id = "password"/></td>
				<td><label id = "password_text"></label></td>
			</tr>
			<tr>
				<td><label>닉네임</label></td>
				<td><input type = "text" name = "nickName" value = "<%= loginUser.getNickName() %>" readonly/></td>
			</tr>
			<tr>
				<td><label>상태 메세지</label></td>
				<td><input type = "text" name = "userMsg" value = "<%= loginUser.getMsg() %>" /></td>
			</tr>
			<tr>
				<td><label>이메일</label></td>
				<td><input type = "email" name = "email" value = "<%= loginUser.getEmail() %>"/></td>
			</tr>
			<tr>
				<td><label>핸드폰</label></td>
				<td><input type = "tel" name = "phone" value = "<%= loginUser.getPhone() %>"/></td>
			</tr>
			<tr>
				<td><label>푼 문제 수</label></td>
				<td><input type = "text" name = "clearedQuest" value = "<%= loginUser.getClearedQuest() %>" readonly/></td>
				<td><button onclick = "">자세히 보기</button></td>
			</tr>
			<tr>
				<td><label>보유 포인트</label></td>
				<td><input type = "text" name = "point" value = "<%= loginUser.getPoint() %>" readonly/></td>
			</tr>
			<tr>
				<td><label>본인인증 여부</label></td>
				<% if(loginUser.getIsIdentified() == 0){ %>
					<td><input type = "text" name = "identified" value = "X" readonly/></td>
					<td><button>본인인증 하기</button></td>
				<%} else { %>
					<td><input type = "text" name = "identified" value = "O" readonly/></td>
				<%} %>
			</tr>
			<tr>
				<td><label>가입일</label></td>
				<td><input type = "text" name = "enrollDate" value = "<%= loginUser.getEnrollDate() %>" readonly/></td>
			</tr>
		</table>
		<button type = "submit" id = "update" disabled>수정하기</button>
	</form>
	<script>
		$(function(){
			$("#password").keyup(function(){
					
				if($("#password").val() != <%= password2 %>){
					$("#password_text").html("비밀번호가 일치하지 않습니다.").css("color", "red");
					$(this).focus();
				}else {
					$("#password_text").html("비밀번호가 일치합니다.").css("color", "green");
					$("#update").removeAttr("disabled");
				}
				
			});
			
			$("#update").click(function(){
				location = "<%= request.getContextPath() %>/updateMember";
				alert("회원정보 수정이 완료되었습니다.");
			});
			
		});
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>