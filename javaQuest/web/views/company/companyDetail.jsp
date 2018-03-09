<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.jqt.company.model.vo.*" %>
<%
	ArrayList<Company> list = (ArrayList<Company>)request.getAttribute("list");
	session.setAttribute(arg0, arg1)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/reset.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>myPage</title>
<style>
	body{
		width:100%;
		height:100%;
	}
 	.questNameli{
		line-height:25px !important;
		padding-left: 0px !important;
		padding-left: 60px;
		line-height: 60px;
		cursor: pointer;
		font-size: 14px;
		border: 1px solid #ddd;
		float:left;
		width:90%;
		height:100%;
		margin:10px;
	} 
	.questNameli:hover{
		background: #00acee;
		color: #fff;
		border-color: #00acee;
	}
	.leftNav li{
		padding-left: 10px;
		height:100%;
	}
	.innerInfo{
		color:gray;
		font-size: 11px;
	}
	.questDetail{
		border:1px solid lightgray;
		background:white;
		display:none;
		cursor:Default;
	}
	#okBtn{
		display:inline-block;
		verrtical-align:middle;
		text-align:center;
		background:orangered;
		color:white;
		height:25px;
		width:100px;
		border-radius:5px;	
		cursor:pointer;
	}
	.levelNav{
		background:lightgray;
		color:white;
	}
	.levelNav label{
		color:blue;
		font-size:14px;
		line-height:30px;
     	font-weight:900;
		text-shadow: 2px 4px 20px blue;
	}
	.levelNav label:hover{
		cursor:pointer;
	}
</style>
</head>
<body>
<div class="container">
	<%@ include file = "/views/common/menubar.jsp" %>

	<!-- 메뉴 바는 불러올것  -->
	<div class="leftBox">
		<div class="visiArea">
			웹사이트 회원
		</div>
		<!-- visiArea -->
		
		<ul class="leftNav">
			<li onclick="questBtn(1);"><i class="fa fa-quora"></i>제휴 회사 정보</li>
			<li onclick="questBtn(2);"><i class="fa fa-quora"></i>서브 퀘스트</li>
		</ul>
	</div>
	<!-- leftBox -->
	
	<br>

	<div class="conArea" id="mainArea">
		<div class="companyInfo" id="companyInfo">
			<% for(Company c : list){ %>
			<form>
				<ul>
					<li>1</li>
					<li><%= c.getCompanyname() %></li>
					<li><%= c.getCeoName() %></li>
					<li><%= c.getContantAddress() %></li>
				</ul>
				<input type="hidden" name="companyCode" value="<%= c.getCompanyCode() %>">
			<% } %>
		</div>
	</div>
	<!-- conArea -->
	
	<script>
		// 메인/서브퀘스트 변경
		function questBtn(num){
		}
		
		// 퀘스트 버튼 토글
		function questLi(li){
		}
	</script>

</div>
<!-- container -->

</body>
</html>