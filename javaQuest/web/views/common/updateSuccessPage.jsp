<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.jqt.member.model.vo.Member"%>
<%
   String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/reset.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
.con-table {
	width: 100%;
	margin: 80px 0px;
}

.con-table tr:first-child {
	border-top: 2px solid #222;
}

.con-table tr:last-child {
	border-bottom: 2px solid #222;
}

.con-table td {
	padding: 10px 15px;
}

.con-table td: first-child {
	border-top: 2px solid #222;
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
	ailgn: center;
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

input {
	border: 0;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<%@ include file="../common/loginOnly.jsp"%>
	<div class="container">
		<div class="leftBox">
			<div class="visiArea"><a><img src="/jqt/images/member1.png"/></a></div>
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
			<h3 align="center">회원 정보</h3>
			<br><br>
			<h2 align="center"><%= msg %></h2>
			<br><br><br>
			<div align="center">
			<button onclick="location.href = '<%=request.getContextPath()%>/views/myPage/myInfo.jsp'">확인</button>
			</div>
		</div>
		<!-- conArea -->
	</div>
	<!-- container -->
<br><br><br><br><br><br><br><br><br><br>
	<!-- 제일 아래 푸터 -->
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>