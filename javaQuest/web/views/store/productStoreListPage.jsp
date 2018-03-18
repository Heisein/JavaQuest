<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<title>myPage</title>
<style>
body {
	width: 100%;
	height: 100%;
}

tr, td, th {
	border: 1px solid black;
}

.questNameli {
	line-height: 25px !important;
	padding-left: 0px !important;
	padding-left: 60px;
	line-height: 60px;
	cursor: pointer;
	font-size: 14px;
	border: 1px solid #ddd;
	float: left;
	width: 90%;
	height: 100%;
	margin: 10px;
}

.questNameli:hover {
	background: #00acee;
	color: #fff;
	border-color: #00acee;
}

.leftNav li {
	padding-left: 10px;
	height: 100%;
}

.questDetail {
	border: 1px solid lightgray;
	background: white;
	display: none;
	cursor: Default;
}

#buyBtn, #detailBtn {
	display: inline-block;
	verrtical-align: middle;
	text-align: center;
	background: orangered;
	color: white;
	height: 25px;
	width: 100px;
	border-radius: 5px;
	cursor: pointer;
}

.innerTopText {
	height: 40px;
	line-height: 40px;
	margin: auto 0;
	background: blue;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="/views/common/loginOnly.jsp"%>
	<%@ include file="/views/common/menubar.jsp"%>
	<br/>
	<div class="container">

		<div class="leftBox">
			<div class="visiArea">웹사이트 회원</div>
			<!-- visiArea -->

			<ul class="leftNav">
				<li onclick="location.href='<%= request.getContextPath() %>/selectList.st'"><i class="fa fa-diamond"></i>포인트 구매</li>
				<li onclick="location.href='<%= request.getContextPath() %>/views/store/productStoreListPage.jsp'"><i class="fa fa-shopping-cart"></i>상품 리스트</li>
				<li onclick="location.href='<%= request.getContextPath() %>/selectResume.st'"><i class="fa fa-list"></i>구매내역</li>
			</ul>
		</div>
		<!-- leftBox -->

		<div class="conArea" id="mainArea">
			<div class="container alert alert-danger" role="alert">
				현재 상품 입고 준비중입니다.
			</div> 
		</div>
		<!-- conArea -->
	</div>
	<!-- container -->
	<script>
		
	</script>

</body>
</html>