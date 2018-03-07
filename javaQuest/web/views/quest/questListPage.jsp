<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.jqt.quest.model.vo.*" %>
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
			<li onclick="questBtn(1);"><i class="fa fa-quora"></i>메인 퀘스트</li>
			<li onclick="questBtn(2);"><i class="fa fa-quora"></i>서브 퀘스트</li>
		</ul>
		<br>
		<ul class="leftNav">
			<li style="padding-left:0px;" onclick="location.href='<%= request.getContextPath() %>/views/quest/addQuestPage.jsp'"><div style="border-left:6px solid black">&nbsp;<i class="fa fa-plus-circle"></i> 퀘스트 작성하기</div></li>
			<li style="padding-left:0px;" onclick="location.href='<%= request.getContextPath() %>/selectRequest.qu'"><div style="border-left:6px solid black">&nbsp;<i class="fa fa-plus-circle"></i> 요청중인 퀘스트</div></li>
		</ul>
	</div>
	<!-- leftBox -->
	
	<br>

	<div class="conArea" id="mainArea">
		<h3>Select Your Quest</h3>
		<div class="levelNav">
			< <label id="l1-0" onclick="levelBtn(this)">All</label> / <label id="l1-1" onclick="levelBtn(this)">Level1</label> / <label id="l1-2" onclick="levelBtn(this)">Level2</label> / <label id="l1-3" onclick="levelBtn(this)">Level3</label> / <label id="l1-4" onclick="levelBtn(this)">Level4</label> / <label id="l1-5" onclick="levelBtn(this)">Level5</label> / <label id="l1-6" onclick="levelBtn(this)">Level6</label> / <label id="l1-7" onclick="levelBtn(this)">Level7</label> / <label id="l1-8" onclick="levelBtn(this)">Level8</label> / <label id="l1-9" onclick="levelBtn(this)">Level9</label> / <label id="l1-10" onclick="levelBtn(this)">Level10</label> >
		</div>
		<br>
		<p>
			<ul id="mainQuestUl">
				<% for(Quest q : list){ 
				   		if(q.getQuestType() == 1){ %> <!-- 메인퀘스트 출력 -->
						<li class="questNameli">
							<div onclick="questLi(this)" style="border-left:6px solid <%= q.getColor() %>; height:100%;">&nbsp;<%= q.getQuestName() %><br><label class="innerInfo">&nbsp;Level <%= q.getQuestLevel() %></label></div>
							<div class="questDetail"><%= q.getQuestContents() %><br><br><div id="okBtn" onclick="agree(this);">퀘스트 수락<input type="hidden" id="qid" value="<%= q.getQuestId() %>"></div></div>
						</li>
				<%   	}
				   } %>
			</ul>
		</p>
	</div>
	<div class="conArea" id="subArea" style="display:none;">
		<h3>Select Your Quest</h3>
		
		<p>
			<div class="levelNav">
			< <label id="l1-0" onclick="levelBtn(this)">All</label> / <label id="l2-1" onclick="levelBtn(this)">Level1</label> / <label id="l2-2" onclick="levelBtn(this)">Level2</label> / <label id="l2-3" onclick="levelBtn(this)">Level3</label> / <label id="l2-4" onclick="levelBtn(this)">Level4</label> / <label id="l2-5" onclick="levelBtn(this)">Level5</label> / <label id="l2-6" onclick="levelBtn(this)">Level6</label> / <label id="l2-7" onclick="levelBtn(this)">Level7</label> / <label id="l2-8" onclick="levelBtn(this)">Level8</label> / <label id="l2-9" onclick="levelBtn(this)">Level9</label> / <label id="l2-10" onclick="levelBtn(this)">Level10</label> >
			</div>
			<br>
			<ul id="subQuestUl">
				<% for(Quest q : list){ 
				   		if(q.getQuestType() == 2){ %>
						<li class="questNameli">
							<input type="hidden" value="<%= q.getQuestId() %>">
							<div onclick="questLi(this)" style="border-left:6px solid <%= q.getColor() %>; height:100%;">&nbsp;<%= q.getQuestName() %><br><label class="innerInfo">&nbsp;Level <%= q.getQuestLevel() %></label></div>
							<div class="questDetail"><%= q.getQuestContents() %><br><br><div id="okBtn" onclick="agree(this);">퀘스트 수락<input type="hidden" id="qid" value="<%= q.getQuestId() %>"></div></div>
						</li>
				<%   	}
				   } %>
			</ul>
		</p>
	</div>
	<!-- conArea -->
	
	<script>
		$(".questDetail").slideUp(); // 슬라이드 업된상태로 초기화 (기본 display none으로해놔서 안보여서 걱정없음)
		
		// 메인/서브퀘스트 변경
		function questBtn(num){
			if(num == '1'){
				$(".questDetail").slideUp();
				document.getElementById("subArea").setAttribute("style","display:none;");
				document.getElementById("mainArea").removeAttribute("style","display:inline;");
				levelBtn(document.getElementById("l1-0"));
			}else{
				$(".questDetail").slideUp();
				document.getElementById("mainArea").setAttribute("style","display:none;");
				document.getElementById("subArea").removeAttribute("style","display:inline");
				levelBtn(document.getElementById("l2-0"));
			}
		}
		
		// 퀘스트 버튼 토글
		function questLi(li){
			if (!$(li).next("div").is(':visible')){ // visible이 none인지 아닌지 체크함 = slideDown중인지 아닌지 체크함
				// 선택한에 slideDown상태면 
				$(".questDetail").slideUp(300);
				$(li).next("div").slideToggle(300);
			}else{ // 이미 열려있으면 닫음
				$(li).next("div").slideToggle(300);
			}
		}
		
		// 수락버튼(컴파일러로)
		function agree(btn){
			var qid = $(btn).children('#qid').val();
			location.href="<%=request.getContextPath()%>/selectOne.qu?qid=" + qid;
		}
		
		// 특정 레벨만 보는 버튼
		function levelBtn(btn){
			var btn = btn.id;
			var type = btn.slice(1,2);
			console.log(type);
			var lv = btn.slice(-1);
			console.log(lv);
			
			if(type == "1"){
				var $ul = $("#mainQuestUl");
				$ul.find("li").remove();
				
				switch(lv){
					case "0":
						<% for(Quest q : list){ 
					   		if(q.getQuestType() == 1){ %>
						   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
					   		<% }
					   		}%>
					   	break;
					case "1":
						<% for(Quest q : list){ 
					   		if(q.getQuestType() == 1 && q.getQuestLevel() == 1){ %>
						   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
					   		<% }
					   		}%>
					   	break;
					case "2":
						<% for(Quest q : list){ 
					   		if(q.getQuestType() == 1 && q.getQuestLevel() == 2){ %>
						   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
					   		<% }
					   		}%>
						break;
					case "3":
						<% for(Quest q : list){ 
					   		if(q.getQuestType() == 1 && q.getQuestLevel() == 3){ %>
						   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
					   		<% }
					   		}%>
						break;
					case "4":
						<% for(Quest q : list){ 
					   		if(q.getQuestType() == 1 && q.getQuestLevel() == 4){ %>
						   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
					   		<% }
					   		}%>
						break;
					case "5":
						<% for(Quest q : list){ 
					   		if(q.getQuestType() == 1 && q.getQuestLevel() == 5){ %>
						   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
					   		<% }
					   		}%>
						break;
					case "6":
						<% for(Quest q : list){ 
					   		if(q.getQuestType() == 1 && q.getQuestLevel() == 6){ %>
						   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
					   		<% }
					   		}%>
						break;
					case "7":
						<% for(Quest q : list){ 
					   		if(q.getQuestType() == 1 && q.getQuestLevel() == 7){ %>
						   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
					   		<% }
					   		}%>
						break;
					case "8":
						<% for(Quest q : list){ 
					   		if(q.getQuestType() == 1 && q.getQuestLevel() == 8){ %>
						   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
					   		<% }
					   		}%>
						break;
					case "9":
						<% for(Quest q : list){ 
					   		if(q.getQuestType() == 1 && q.getQuestLevel() == 9){ %>
						   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
					   		<% }
					   		}%>
						break;
					case "10":
						<% for(Quest q : list){ 
					   		if(q.getQuestType() == 1 && q.getQuestLevel() == 10){ %>
						   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
					   		<% }
					   		}%>
						break;
				}
			}else{
				var $ul = $("#subQuestUl");
				$ul.find("li").remove();
				
				switch(lv){
				case "0":
					<% for(Quest q : list){ 
				   		if(q.getQuestType() == 2){ %>
					   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
				   		<% }
				   		}%>
				   	break;
				case "1":
					<% for(Quest q : list){ 
				   		if(q.getQuestType() == 2 && q.getQuestLevel() == 1){ %>
					   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
				   		<% }
				   		}%>
				   	break;
				case "2":
					<% for(Quest q : list){ 
				   		if(q.getQuestType() == 2 && q.getQuestLevel() == 2){ %>
					   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
				   		<% }
				   		}%>
					break;
				case "3":
					<% for(Quest q : list){ 
				   		if(q.getQuestType() == 2 && q.getQuestLevel() == 3){ %>
					   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
				   		<% }
				   		}%>
					break;
				case "4":
					<% for(Quest q : list){ 
				   		if(q.getQuestType() == 2 && q.getQuestLevel() == 4){ %>
					   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
				   		<% }
				   		}%>
					break;
				case "5":
					<% for(Quest q : list){ 
				   		if(q.getQuestType() == 2 && q.getQuestLevel() == 5){ %>
					   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
				   		<% }
				   		}%>
					break;
				case "6":
					<% for(Quest q : list){ 
				   		if(q.getQuestType() == 2 && q.getQuestLevel() == 6){ %>
					   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
				   		<% }
				   		}%>
					break;
				case "7":
					<% for(Quest q : list){ 
				   		if(q.getQuestType() == 2 && q.getQuestLevel() == 7){ %>
					   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
				   		<% }
				   		}%>
					break;
				case "8":
					<% for(Quest q : list){ 
				   		if(q.getQuestType() == 2 && q.getQuestLevel() == 8){ %>
					   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
				   		<% }
				   		}%>
					break;
				case "9":
					<% for(Quest q : list){ 
				   		if(q.getQuestType() == 2 && q.getQuestLevel() == 9){ %>
					   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
				   		<% }
				   		}%>
					break;
				case "10":
					<% for(Quest q : list){ 
				   		if(q.getQuestType() == 2 && q.getQuestLevel() == 10){ %>
					   		$ul.append($("<li class='questNameli'>").html("<div onclick='questLi(this)' style='border-left:6px solid <%= q.getColor() %>; height:100%;'>&nbsp;<%= q.getQuestName() %><br><label class='innerInfo'>&nbsp;Level <%= q.getQuestLevel() %></label></div><div class='questDetail'><%= q.getQuestContents() %><br><br><div id='okBtn' onclick='agree(this);''>퀘스트 수락<input type='hidden' id='qid' value='<%= q.getQuestId() %>'></div></div></li>"));
				   		<% }
				   		}%>
					break;
				}
			}
		}
			
	</script>

</div>
<!-- container -->

</body>
</html>