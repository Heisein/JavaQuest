<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] sideColor = {"blue", "blue", "green", "green", "green", "green", "green", "red"};
	String[] questName = {"첫번째", "두번째", "세번째", "네번째", "이쯤되면 좀지겹지", "참신한 이름", "진부한 제목", "슈퍼 짱짱 어려운 문제"};
	String[] questContext = {"자바 여행길의 첫번째에 이른 당신을 위한 문제입니다! 한번 도전해보세요!<br>출제자 : GM, 보상 경험치 : 10", "쉬울겁니다", "쉬울수도있습니다", "아닐수도있구요", "설명쓰기귀찮다이제", "참신한 설명", "진부한 설명", "진짜존나어렵습니다 풀다뒤질수도있어요 화이팅"};
	int[] questLv = {1, 1, 2, 2, 2, 2, 2, 99};

	String[] sideColor2 = {"blue", "blue", "green", "green", "green", "green", "green", "red"};
	String[] questName2 = {"바뀐첫번째", "바뀐두", "세번째", "네번째", "이쯤되면 좀지겹지", "참신한 이름", "진부한 제목", "슈퍼 존나게 어려운 문제"};
	int[] questLv2 = {1, 1, 2, 2, 2, 2, 2, 100};
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
			<li style="padding-left:0px;" onclick="location.href='../compiler/addQuestPage.jsp'"><div style="border-left:6px solid black">&nbsp;<i class="fa fa-plus-circle"></i> 퀘스트 작성하기</div></li>
		</ul>
	</div>
	<!-- leftBox -->
	

	<div class="conArea" id="mainArea">
		<h3>Select Your Quest</h3>
		
		<p>
			<ul>
				<% for(int i=0; i< questName.length; i++){ %>
				<li class="questNameli">
					<div onclick="questLi(this)" style="border-left:6px solid <%= sideColor[i] %>; height:100%;">&nbsp;<%= questName[i] %><br><label class="innerInfo">&nbsp;Level <%= questLv[i] %></label></div>
					<div class="questDetail"><%= questContext[i] %><br><br><div id="okBtn" onclick="agree(this);">퀘스트 수락<input type="hidden" value="<%= i %>번째"></div></div>
				</li>
				<% } %>
			</ul>
		</p>
	</div>
	<div class="conArea" id="subArea" style="display:none;">
		<h3>Select Your Quest</h3>
		
		<p>
			<ul>
				<% for(int i=0; i< questName.length; i++){ %>
				<li class="questNameli">
					<div onclick="questLi(this)" style="border-left:6px solid <%= sideColor[i] %>; height:100%;">&nbsp;<%= questName2[i] %><br><label class="innerInfo">&nbsp;Level <%= questLv2[i] %></label></div>
					<p class="questDetail">&nbsp;<%= questContext[i] %><br><br><button style="float:right;">퀘스트 수락</button></p>
				</li>
				<% } %>
			</ul>
		</p>
	</div>
	<!-- conArea -->
	
	<script>
		$(".questDetail").slideUp(); // 슬라이드 업된상태로 초기화 (기본 display none으로해놔서 안보여서 걱정없음)
		
		function questBtn(num){
			if(num == '1'){
				$(".questDetail").slideUp();
				document.getElementById("subArea").setAttribute("style","display:none;");
				document.getElementById("mainArea").removeAttribute("style","display:inline;");
			}else{
				$(".questDetail").slideUp();
				document.getElementById("mainArea").setAttribute("style","display:none;");
				document.getElementById("subArea").removeAttribute("style","display:inline");
			}
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
		
		function agree(btn){
			alert("버-튼");
			console.log(btn);
		}
		
	</script>

</div>
<!-- container -->

</body>
</html>