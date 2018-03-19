<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/jqt/css/reset.css">
<link rel="stylesheet" href="/jqt/css/common.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/loginOnly.jsp" %>
	<!-- container -->
	<div class="container" style="height: 550px;">

		<div class="leftBox">
			<div class="visiArea">
				Game Content
			</div>
			<!-- visiArea -->
			
			<ul class="leftNav">
				<li onclick="changeContent('select');"><i class="fa fa-user"></i> 사지선다</li>
				<li onclick="changeContent('count');"><i class="fa fa-user"></i> 카운트</li>
				<li onclick="changeContent('battle');"><i class="fa fa-window-maximize"></i> 배틀로얄</li>
				<!-- <li onclick="changeContent('dual');"><i class="fa fa-vcard"></i> 코딩대결</li> -->
			</ul>
		</div>
	<!-- leftBox -->

		<div class="conArea" style="height: 270px;">
			<div class="right-con" id="right-con">
				<h3 id="con-title">GAME CONTENT</h3>
				
				<p id="account">이곳은 공부를 게임으로 하는 곳 입니다. 좌측에서 하고싶은 게임을 선택하시면 <br/>
				이 글이 있는 영역에 해당 게임에 대한 설명이 기록됩니다. 읽어보시고 맘에 드는 게임을 골라 시작해보세요.</p>
				
			</div>
		</div>
		<!-- conArea -->
		<div class="btn-Area">
			<button class="btn btn-primary" id="game-start" onclick="location.href='/jqt/views/games/selectedGamePage.jsp'" style="display: none;">게임하기</button>
		</div>

	</div>
<!-- container -->
<script>
	function changeContent(str){
		$("#game-start").show();
		switch(str){
			case "select" : 
				$("#con-title").text("사지선다"); 
				$("#account").text("자바의 개념과 이론을 공부하는 게임이며, 한 문제당 4가지의 선택지가 나옵니다 그중 답이라고 생각하시는걸 선택하시고 정답일 경우 다음 문제가 틀렸을 경우 그 문제의 답을 설명해줍니다.");
				$("#game-start").attr("onclick", "location.href='<%= request.getContextPath() %>/selectGame.g'");
				break;
			case "count" : 
				$("#con-title").text("카운트"); 
				$("#account").text("저희 JAVA QUEST를 이용해주시는 회원님들간의 손이 너무가 더 빠른지 겨루는 게임입니다. 매주 한번씩 문제가 바뀌며 문제가 바뀌는 날에 1위를 하신 회원님에겐 소정의 상품을 드립니다.");
				$("#game-start").attr("onclick", "location.href='<%= request.getContextPath() %>/countGame.g'");
				$.ajax({
					url: "/jqt/timeAttackUserList.g",
					type: "get",
					data: {"userNum": "<%= loginUser.getUserNum() %>"},
					success: function(data){
						if(data === "check"){
							$("#game-start").attr("onclick", "alert('이번주 게임을 이미 참여하셨습니다 랭킹 페이지를 확인하세요.')");
						}
					},
					error: function(msg){
						
					}
				});
				break;	
			case "battle" : 
				$("#con-title").text("배틀로얄"); 
				$("#account").text("실시간으로 여러명과 자신의 지식을 겨루는 게임입니다. 기본적으로 O/X문제이며 참여 하실때 현재 보유하고 계신 포인트중 1포인트를 배팅하고 참여합니다 배팅금은 마지막 1위를 한 사람에게 지급되며," + 
									"총 50문제가 랜덤으로 출제됩니다. 마지막 한명이 남을때까지 계속 진행을 하는데 만약 50문제가 끝날때 생존자가 한명 이상일시 배팅금은 공정하게 나뉩니다.");
				$("#game-start").attr("onclick", "location.href='<%= request.getContextPath() %>/oxRoomList.g?type=allList'");
				$.ajax({
					url: "/jqt/pointCheck.g",
					type: "post",
					data: {"userNum": "<%= loginUser.getUserNum() %>"},
					success: function(data){
						if(data === "fail"){
							$("#game-start").attr("onclick", "alert('이 게임을 참여하실려면 1포인트가 필요합니다. 포인트를 확인해주세요.')");
						}
					},
					error: function(data){
						
					}
				});
				
				break;
			case "dual" : 
				$("#con-title").text("코딩대결"); 
				$("#account").text("실시간으로 상대방과 주어진 문제를 주제로 겨루게 되는 실시간 코딩대결입니다.");
				$("#game-start").attr("onclick", "location.href='/jqt/views/games/battle.jsp'");
				break;		
		}
	}
</script>
	
<%@ include file="../common/footer.jsp" %>
</body>
</html>