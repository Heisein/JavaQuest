<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.jqt.ranking.model.vo.Ranking"%>
<% 
	ArrayList<Ranking> list = (ArrayList<Ranking>)request.getAttribute("list");
	String type = (String)request.getAttribute("type");
%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		border:2px solid black;
		width:901px;
		height:700px;
		margin-right:auto;
		margin-left:auto;
		margin-top:10px;
		margin-bottom:10px;
	}

	.choice {
		width:100px;
		height:70px;
		text-align:center;
		vertical-align:middle;
	}
	.tableArea {
		margin-top:5px;
		height:600px;
		border:1px solid black;
	}
	table {
		width:900px;
		text-align:center;
		border:1px solid black;
	}
	table th {
		border-bottom:2px solid black;
		height:50px;
		vertical-align:middle;
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
	
	.wrap {
		border-top:1px solid black;
		width:900px;
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
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<br>
		<h2 align="center" id="title">Ranking</h2>
		<div class="tableArea">
			<div class="wrap">
				<input type="button" id="choice" name="level" value="Level">
				<input type="button" id="choice" name="ox" value="OX">
				<input type="button" id="choice" name="multichoice" value="Quiz">
				<input type="button" id="choice" name="timeAttack" value="Timeattack">
				<input type="button" id="choice" name="realtime" value="Realtime">
			</div>
			<table align="center">
				<tr>
					<th width="150px">랭킹</th>
					<th width="150px">닉네임</th>
					<th width="500px">상태메세지</th>
					<%if(type == "Level"){ %>
					<th width="150px">레벨</th>
					<% }else if(type == "Timeattack"){ %>
					<th width="150px">기록</th>
					<% }else{ %>
					<th width="150px">승리</th>
					<% } %>
				</tr>
				<tr class="myRank">
					<td>내랭킹</td>
					<td>내닉네임</td>
					<td>내 메세지</td>
					<%if(type == "Level"){ %>
					<td>내레벨</td>
					<% }else if(type == "Timeattack"){ %>
					<td>내 기록</td>
					<% }else{ %>
					<td>내 승수</td>
					<% } %>
				</tr>
				<%if(list != null){ %>
				<%for (Ranking r : list){ %>
				<tr>
					<td><%= r.getrNum() %></td>
					<td><%= r.getUserNickName() %></td>
					<td><%= r.getUserMsg() %></td>
					<%if(type == "Level"){ %>
					<td><%= r.getUserLevel() %></td>
					<% }else if(type == "Timeattack"){ %>
					<td><%= r.getTimeAttack() %></td>
					<% }else{ %>
					<td><%= r.getWinRate() %></td>
					<% } %>
				</tr>
				<% } %>
				<% } %>
			</table>
		</div>
		<% if(type != null){ %>
		<form action="<%= request.getContextPath() %>/searchNickName.ro?type=<%= type %>" method="post">
		<div class="searchArea" name="searchArea" align="center">
			<label>닉네임 검색 : </label>
			<input type="search" name="nickName">
			<button type="submit">검색</button>
		</div>
		</form>
		<% } %>
	</div>
	
	
	<script>
		$(function(){
			$(".tableArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				<%-- var num = $(this).parent().children("input").val();
				location.href="<%= request.getContextPath() %>/selectOne.bo?num=" + num; --%>
			});
		});
		
		$(function(){
			$(".wrap input").mouseenter(function(){
				$(this).css({"text-decoration":"underline", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"white", "text-decoration":"none"});
			}).click(function(){
				var type = $(this).val();
				location.href="/jqt/rankingList.ro?type=" + type;
			});
		});
		
		
	</script>
</body>
</html>