<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/reset.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.con-table {
	width: 100%;
	margin: 80px 0px 20px 0px;
}

.con-table tr:first-child {
	border-top: 2px solid #222
}

.con-table tr:last-child {
	border-bottom: 2px solid #222
}

.con-table td {
	padding: 10px 15px
}

.con-table td: first-child {
	border-top: 2px solid #222
}

.con-table td, th {
	border: 1px solid #717171;
}

.con-table th {
	background-color: #eee;
	padding: 15px 40px;
	width: 20%;
	border: 1px solid #717171;
}

button {
	background: #00acee;
	color: #fff;
	border: none;
	position: relative;
	height: 40px;
	font-size: 1em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
	margin: 10px;
}

button:hover {
	background: #fff;
	color: #00acee;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #00acee;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

INPUT[type=text] {
	width: 80px;
}
</style>
<title>Insert title here</title>
</head>
<body>
		<div class="container">
		<div class="leftBox">
			<div class="visiArea">회원</div>
			<!-- visiArea -->

			<ul class="leftNav">
				<li
					onclick="location.href='<%=request.getContextPath()%>/views/myPage/myInfo.jsp'"><i
					class="fa fa-user"></i> 내 정보</li>
				<li
					onclick="location.href='<%=request.getContextPath()%>/views/myPage/updateInfo.jsp'"><i
					class="fa fa-user"></i> 정보수정</li>
				<li
					onclick="location.href='<%=request.getContextPath()%>/views/colorPicker.jsp'"><i
					class="fa fa-window-maximize"></i> 테마변경</li>
				<li
					onclick="location.href='<%=request.getContextPath()%>/views/myPage/resume.jsp'"><i
					class="fa fa-vcard"></i> 이력서</li>
			</ul>
		</div>
		<!-- leftBox -->
		<div class="conArea">
		<h3>회원 정보 수정</h3>
		<form>
		<table class="con-table">
			<tr>
				<th><label>아이디</label></th>
				<td><input type="text" name="userId" readonly></td>
			</tr>
			<tr>
				<th><label>비밀번호</label></th>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<th><label>비밀번호 확인</label></th>
				<td><input type="password" name="password2"></td>
			</tr>
			<tr>
				<th><label>닉네임</label></th>
				
				<td><input id="text" maxlength="13" name="nick_name"></td>
			</tr>
			<tr>
				<th><label>이메일</label></th>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<th><label>핸드폰</label></th>
				<td>
					 <input type="text" maxlength="3" name="tel1" size="2"> ―
   					 <input type="text" maxlength="4" name="tel2" size="2"> ―
    				 <input type="text" maxlength="4" name="tel3" size="2">
				</td>
			</tr>
			<tr>
				<th><label>레벨</label></th>
				<td><span></span></td>
			</tr>
			<tr>
				<th><label>경험치</label></th>
				<td><span></span></td>
			</tr>

		</table>
		
		<div class="" align="center">
  			<button type="button" onclick="location.href='#'">메인으로</button>&nbsp; &nbsp; &nbsp;
            <button type="submit">수정하기</button>
    	</div>
		</form>
	</div>
	<!-- conArea -->
	
	
</div>
<!-- container -->
</body>
</html>