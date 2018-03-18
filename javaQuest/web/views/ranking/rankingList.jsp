<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.jqt.ranking.model.vo.Ranking"%>
<% 
	ArrayList<Ranking> list = (ArrayList<Ranking>)request.getAttribute("list");
	String type = (String)request.getParameter("type");
	System.out.println(type);
%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 	.outer {
		border:2px solid black;
		width:901px;
		height:700px;
		margin-right:auto;
		margin-left:auto;
		margin-top:10px;
		margin-bottom:10px;
	} */
	.wrap {
		display:inline-block;
	}
	.choice {
		text-align:center;
		width:auto;
		padding:0 30px;
	}
	.nowType{
		background:#428bca;
		color:white;
	}
	.choice:hover{
		text-decoration:underline;
		cursor:pointer;
		background:lightgray;
	}
/* 	.tableArea {
		margin-top:5px;
		height:600px;
		border:1px solid black;
	} */
	table {
		width:100%;
		text-align:center;
		border:1px solid black;
	}
	table th {
		border-bottom:2px solid black;
		height:50px;
		vertical-align:middle;
		text-align:center;
	}
	table tr {
		border-top:1px solid black;
		border-bottom:1px solid black;
		width:100%;
	}
	table td {
		border-bottom:1px solid black;
	}
	#title {
		font-size:20px;
		style:bold;
		margin-bottom:5px;
		vertical-align:middle;
	}
	input {
		width:170px;
		height:30px;
		margin-left:5px;
		background:white;
		border:1px solid white;
	}
	.myRank {
		height:30px;
		font-size:20px;
	}
	tr:nth-child(2n){
		background:#ededed;
	}
	#rankInnerTr:hover{
		background:#68a2ff;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 컨테이너 영역 -->
	<div class="container">
		<!-- 카테고리 -->
		<div class="wrap">
			<% if(type.equals("Level")){ %>
			<input type="button" class="choice nowType" name="level" value="Level">
			<% }else{ %>
			<input type="button" class="choice" name="level" value="Level">
			<% } %>
			<% if(type.equals("Quiz")){ %>
			<input type="button" class="choice nowType" name="multichoice" value="Quiz">
			<% }else{ %>
			<input type="button" class="choice" name="multichoice" value="Quiz">
			<% } %>
			<% if(type.equals("TimeAttack")){ %>
			<input type="button" class="choice nowType" name="timeAttack" value="TimeAttack">
			<% }else{ %>
			<input type="button" class="choice" name="timeAttack" value="TimeAttack">
			<% } %>
			<% if(type.equals("BattleRoyale")){ %>
			<input type="button" class="choice nowType" name="battle" value="BattleRoyale">
			<% }else{ %>
			<input type="button" class="choice" name="battle" value="BattleRoyale">
			<% } %>
		</div>
		<br/>
		<br/>
		
		<!-- 테이블 -->
		<div class="tableArea">
			<!-- 랭킹 테이블 시작 -->
			<table id="rankTable" align="center">
				<tr>
					<th width="50px;">랭킹</th>
					<th width="50px;">레벨</th>
					<th width="70px;">경험치</th>
					<th>닉네임</th>
					<th>상태메세지</th>
					<th>클리어 퀘스트</th>
					<th>승수</th>
				</tr>
				<%	int count = 1;
					if(list != null){ %>
					<%for (Ranking r : list){ %>
					<tr id="rankInnerTr">
						<td><%= count++ %></td>
						<td><%= r.getUserLevel() %></td>
						<td><%= r.getUserExp() %></td>
						<td><%= r.getUserNickName() %></td>
						<% if(r.getUserMsg() == null){ %>
						<td></td>
						<% }else{ %>
						<td><%= r.getUserMsg() %></td>
						<% } %>
						<td><%= r.getClearQuest() %></td>
						<td><%= r.getWinRate() %></td>
					</tr>
					<% } %>
				<% } %>
			</table>
		</div>
		<%-- <% if(type != null){ %>
		<form action="<%= request.getContextPath() %>/searchNickName.ro?type=<%= type %>" method="post">
			<div class="searchArea" name="searchArea" align="center">
				<label>닉네임 검색 : </label>
				<input type="search" name="nickName">
				<button type="submit">검색</button>
			</div>
		</form>
		<% } %> --%>
	<!-- end of container -->
	</div> 
	
	<script>
		$(function(){
			$(".wrap input").click(function(){
				var type = $(this).val();
				location.href="/jqt/rankingList.ro?type=" + type;
			});
		});
		
		
	</script>
</body>
</html>