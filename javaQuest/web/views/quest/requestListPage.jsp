<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.jqt.quest.model.vo.*, com.jqt.member.model.vo.*" %>
<%
	ArrayList<Quest> list = (ArrayList<Quest>)request.getAttribute("list");
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
	
</style>
</head>
<body>
<div class="container">
	<%@ include file = "/views/common/loginOnly.jsp" %>
	<%@ include file = "/views/common/menubar.jsp" %>

	<!-- 메뉴 바는 불러올것  -->
	<div class="leftBox">
		<div class="visiArea">
			<% if(loginUser != null) { %>
				<%=loginUser.getNickName() %> 로그인
			<% } else{ %>
				로그인이 필요한 서비스입니다.
			<% } %>
		</div>
		<!-- visiArea -->
		
		<ul class="leftNav">
			<li onclick="<%= request.getContextPath() %>/selectList.qu""><i class="fa fa-quora"></i>메인 퀘스트</li>
			<li onclick="<%= request.getContextPath() %>/selectList.qu""><i class="fa fa-quora"></i>서브 퀘스트</li>
		</ul>
		<br>
		<ul class="leftNav">
			<li style="padding-left:0px;" onclick="location.href='<%= request.getContextPath() %>/views/quest/addQuestPage.jsp'"><div style="border-left:6px solid black">&nbsp;<i class="fa fa-plus-circle"></i> 퀘스트 작성하기</div></li>
			<li style="padding-left:0px;" onclick="location.href='<%= request.getContextPath() %>/selectRequest.qu'"><div style="border-left:6px solid black">&nbsp;<i class="fa fa-plus-circle"></i> 요청중인 퀘스트</div></li>
		</ul>
	</div>
	<!-- leftBox -->
	

	<div class="conArea" id="mainArea">
		<h3>현재 요청중인 퀘스트</h3>
		<% if(list.size() <= 0){ %>
		<h3>가 없네요. </h3>
		<% } %>
		
		<p>
			<ul>
				<% for(Quest q : list){ %> <!-- 요청중인 퀘스트 출력 -->
						<li class="questNameli">
							<div onclick="questLi(this)" style="border-left:6px solid <%= q.getColor() %>; height:100%;">&nbsp;<%= q.getQuestName() %> &nbsp;(<%= q.getQuestWriter() %>)<br><label class="innerInfo">&nbsp;Level <%= q.getQuestLevel() %></label></div>
							<div class="questDetail"><%= q.getQuestContents() %><br><br><div id="okBtn" onclick="agree(this);">승인<input type="hidden" id="qid" value="<%= q.getQuestId() %>"></div><div id="okBtn" onclick="reject(this);">거절<input type="hidden" id="qid" value="<%= q.getQuestId() %>"></div></div>
						</li>
				<% } %>
			</ul>
		</p>
	</div>
	<!-- conArea -->
	
	<script>
		function agree(btn){
			var rnum = $(btn).children('#qid').val();
			location.href="<%= request.getContextPath() %>/agree.qu?rnum=" + rnum;
		}
		
		function reject(btn){
			var rnum = $(btn).children('#qid').val();
			location.href="<%= request.getContextPath() %>/reject.qu?rnum=" + rnum;
		}
		
		function questLi(li){
			if (!$(li).next("div").is(':visible')){ // visible이 none인지 아닌지 체크함 = slideDown중인지 아닌지 체크함
				// 선택한에 slideDown상태면 
				$(".questDetail").slideUp(300);
				$(li).next("div").slideToggle(300);
			}else{ // 이미 열려있으면 닫음
				$(li).next("div").slideToggle(300);
			}
		}

	</script>

</div>
<!-- container -->

</body>
</html>