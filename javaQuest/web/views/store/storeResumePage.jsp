<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.text.DecimalFormat, java.util.*, com.jqt.store.model.vo.*"%>
<%
	ArrayList<PayedResume> list = (ArrayList<PayedResume>) request.getAttribute("list");
	DecimalFormat df = new DecimalFormat("#,###");
%>
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

table{
	width:100%;
	border:1px solid black;
}
th, td{
	text-align:center;
}
tr:hover{
	background:#68a2ff;
	color:red;
}
</style>
</head>
<body>
	<div class="container">
		<%@ include file="/views/common/loginOnly.jsp"%>
		<%@ include file="/views/common/menubar.jsp"%>

		<div class="leftBox">
			<div class="visiArea">웹사이트 회원</div>
			<!-- visiArea -->

			<ul class="leftNav">
				<li onclick="btnEvent(1);"><i class="fa fa-diamond"></i>포인트 구매</li>
				<li onclick="btnEvent(2);"><i class="fa fa-shopping-cart"></i>상품 리스트</li>
				<li onclick="btnEvent(3);"><i class="fa fa-list"></i>구매내역</li>
			</ul>
		</div>
		<!-- leftBox -->

		<div class="conArea" id="mainArea">
			<div class="resumeDiv">
				<br>
				<div class="innerTopText">&nbsp;&nbsp;&nbsp;구매 내역 : 
				</div>
				<br>

				<!-- 마찬가지로 크기만큼 데이터 가져오기 -->
				<table style="border: 1px solid black;">
					<!-- 여긴 테이블로 -->
					<tr style="border: 1px solid black;">
						<th>상품명</th>
						<th>결제번호</th>
						<th>가격</th>
						<th>포인트증감</th>
						<th>구매일</th>
					</tr>
					<%
					for (PayedResume pr : list) {
					%>
					<tr>
						<td><%= pr.getPayMsg()  %></td>
						<td><%= pr.getPayUid() %></td>
						<%if(pr.getProductType() == 1){ %>
						<td><%= df.format(pr.getPrice()) %>원</td>
						<% }else{ %>
						<td><%= df.format(pr.getPrice()) %>P</td>
						<% }
						if(pr.getPointUpdown() > 0){%>
						<td style="color:blue;"><%= pr.getPointUpdown() %></td>
						<% }else{ %>
						<td style="color:red;"><%= pr.getPointUpdown() %></td>
						<% } %>
						<td><%= pr.getPayDay() %></td>
					</tr>
					<% } %>
				</table>
			</div>
		</div>
		<!-- conArea -->
	</div>
	<!-- container -->
	<script>
		
	</script>

</body>
</html>