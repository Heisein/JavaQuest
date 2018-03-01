<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/reset.css">
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/login.css">
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<hr/>
	<div class="container">
	<p class="title">로그인</p>
	</div>
	<hr/>
	<!-- container -->
	<div class="container">
		
		<div class="login-form">
		<div class="sub-title">
			로그인
		</div>
			<form>
				<div class="radio-btn">
					<input type="radio" name="select" id="nomal" value="nomal"/>
					<label for="nomal">일반 </label>
					<input type="radio" name="select" id="company" value="company"/>
					<label for="company">기업</label>
				</div>
				<div class="input-group">
					<input type="text" placeholder="아이디" name="userId"><br/>
				</div>
				<div class="input-group">
					<input type="password" placeholder="비밀번호" name="userPwd">
				</div>
				<div>
					<div class="id-pwd">
						<a href="#">아이디</a>&nbsp;/&nbsp;<a href="#">비밀번호찾기</a>
					</div>
					<div class="btnArea">
						<button class="login-btn">로그인</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- container -->
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>