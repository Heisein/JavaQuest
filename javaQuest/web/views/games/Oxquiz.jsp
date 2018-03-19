<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.jqt.member.model.vo.*"%>
<% 
	Member loginUser = (Member)session.getAttribute("loginUser"); 
	String queryString = request.getQueryString();
	String roomNumber = queryString.substring(11, queryString.length());
	/* System.out.println("oxquiz 상단 : " + present); */
	System.out.println("oxquiz 상단 : " + roomNumber);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaQuest</title>
<link rel="stylesheet" href="/jqt/css/reset.css">
<link rel="stylesheet" href="/jqt/css/common.css">
<link rel="stylesheet" href="/jqt/css/Oxquiz.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/jqt/js/ParamSpliter.js"></script>
</head>
<body>
	<div class="container">
	
		<div class="topArea" align="right">
			<p class="quiz-no">99번 문제</p>
			<button class="exit" onclick="exit();">나가기</button>
		</div>
		
			<!-- quiz -->
			<div class="quiz-ox">
				<button class="O"></button>
				<button class="X"></button>
				<div class="quiz-ox-con">이 게임은 5초마다 문제가 바뀌며 틀리신분들은 자동으로 나가집니다.<br/><br/> 총 30문제가 끝날동안 살아남으세요.</div>
			</div>
			<div id="hiddenAnswer" style="display: none;">gd</div>
			<!-- quiz -->
			<div class="btnArea">
			
			</div>
			
			
			<!-- answer -->
			<div class="answer-wrap">
				<ul class="answer">
				</ul>
			</div>
			<!-- answer -->
			<fieldset>
		        <textarea id="textArea" rows="10" cols="168" readonly style="resize: none;"></textarea>
		        <br/>
		        <input id="inputMessage" type="text" onkeyup="enterkey()"/>
		        <input type="submit" value="send" onclick="send()"/>
		    </fieldset>
	</div>
	<!-- container -->
	<script>
		//뒤로가기 막기
		history.pushState(null, document.title, location.href); 
		window.addEventListener('popstate', function(event) {
			history.pushState(null, document.title, location.href); 
		});	
	
		//새로고침 막기
		function LockF5(){
			if (event.keyCode == 116) {
				event.keyCode = 0;
				return false;
			}
		}
		document.onkeydown = LockF5;

		var wsocket;                           //websocket 객체를 저장할 변수
		var textarea = document.getElementById("textArea");
	    var inputMessage = document.getElementById('inputMessage');
		var roomNumber = <%= roomNumber %>;
		
		window.addEventListener("load", connect, false);    //창이 열리면 websocket 객체 호출
		function connect() {                   // 웹소켓 생성
			wsocket = new WebSocket("ws://192.168.30.83:8222/<%= request.getContextPath() %>/broadcasting?roomNumber=" + roomNumber + "&nickName=<%= loginUser.getNickName() %>");
			wsocket.onmessage = onMessage;        // 메세지가 왔을때 호출할 메소드 지정
		}
		
		function onMessage(event) {  // 서버로부터 메세지가 왔을때 호출되는 메소드
			var roomNumber = paramSpliter(event.data, "roomNumber");
			var type = paramSpliter(event.data, "type");
			var members = paramSpliter(event.data, "members");
			var message = paramSpliter(event.data, "data");
			var nickName = paramSpliter(event.data, "nickName");
			var oldMember = members.split("@");
 
			switch(type){
			case "sendToAll" :
				textarea.innerHTML+=message;   //textArea에 서버로부터 온 메시지 추가
				textarea.scrollTop = textarea.scrollHeight;
				break;
				
			case "close" :
				textarea.innerHTML+=message;   //textArea에 서버로부터 온 메시지 추가
				textarea.scrollTop = textarea.scrollHeight;
				$(".answer").html("");	
				$(".btnArea").html("");
				for(var i = 0; i < oldMember.length; i++){
					if(i == oldMember.length-1){
						$(".answer").append("<li class='"+ oldMember[i] + "' style='border: 5px solid red'>" + oldMember[i] + "</li>");
					}else if(oldMember[i] === "<%= loginUser.getNickName() %>"){
						$(".answer").append("<li class='"+ oldMember[i] + "' style='border: 5px solid green'>" + oldMember[i] + "</li>");
					}else {
						$(".answer").append("<li class='"+ oldMember[i] + "'>" + oldMember[i] + "</li>");
					}
					
				}
				
				if(oldMember[oldMember.length-1] === "<%= loginUser.getNickName() %>") {
					$(".btnArea").append("<button id='startBtn'>시작하기</button>");
				}
				break;
				
			case "new" :
				$(".answer").html("");	//새로운 사람이 올때마다 초기화
				$(".btnArea").html("");
				for(var i = 0; i < oldMember.length; i++){
					if(i == oldMember.length-1){
						$(".answer").append("<li class='"+ oldMember[i] + "' style='border: 5px solid red'>" + oldMember[i] + "</li>");
					}else if(oldMember[i] === "<%= loginUser.getNickName() %>"){
						$(".answer").append("<li class='"+ oldMember[i] + "' style='border: 5px solid green'>" + oldMember[i] + "</li>");
					}else {
						$(".answer").append("<li class='"+ oldMember[i] + "'>" + oldMember[i] + "</li>");
					}
					
				}
				
				if(oldMember[oldMember.length-1] === "<%= loginUser.getNickName() %>") {
					$(".btnArea").append("<button id='startBtn'>시작하기</button>");
				}
				
				textarea.innerHTML+= message;
				textarea.scrollTop = textarea.scrollHeight;		
				
				break;
				
			//메세지를 보낸 사람이 다시 받음.
			case "exit" :
				if(members === "<%= loginUser.getNickName() %>"){
					location.href="<%= request.getContextPath() %>/oxRoomList.g?type=delete&roomNumber="+roomNumber;
				}else {
					location.href="<%= request.getContextPath() %>/oxRoomList.g?type=minus&roomNumber="+roomNumber;				
				}
				
				break;
				
			case "O" :
				$("."+nickName).attr("id", "O").css({"background":"url(/jqt/images/o.png) no-repeat center", "background-size":"contain"});
				break;
			
			case "X" : 
				$("."+nickName).attr("id", "X").css({"background":"url(/jqt/images/x.png) no-repeat center", "background-size":"contain"});
				break;
			
			case "start" :
				var user = $(".answer").children();
				var total = user.length;
				
				$("#startBtn").remove();
				
				
				$.ajax({
					url: "/jqt/oxquizList.g",
					type: "get",
					data: {"roomNumber": roomNumber},
					success: function(data){
						//게임 문제를 받아와서 해당 div에 갱신을 해준다.
						//다만 시간이 지날때마다 문제가 바뀐다.
						var count = 5;
						var i = 0;	//다음문제를 위한 변수
						
						$(".quiz-ox-con").text(count);
						$("#hiddenAnswer").text(data[i].quizAnswer); //답을 올리는 공간

						alert(data.length);
						//시간을 설정하여 문제를 바뀌게 함
						var content = setInterval(function(){ 
							user = 	$(".answer").children();		
							$("#startBtn").remove();
							
							if(count > 0){
								$(".quiz-ox-con").text(count);
								count--;
								
								console.log(count);
							}else {
								$(".quiz-ox-con").text(data[i].quizContent); //문제 올리는 공간
								count--;
								console.log(count);
								//현재 남은 사람의 인원수를 계산해 한명이 아닐경우.
								if(count === -5){
									if(user.length !== 1){
										//정답과 O,X를 누를때마다 바뀌는 아이디 값이 같은때
										if($("#hiddenAnswer").text() === $(".<%= loginUser.getNickName() %>").attr("id")){
											//정답일때
											$(".quiz-ox-con").text("정답입니다.");
										}else {
											//오답일때
											alert("오답입니다. 게임을 종료합니다.");
											location.href="<%= request.getContextPath() %>/oxRoomList.g?type=minus&roomNumber="+roomNumber;
										}
										
										//문제 바꾸기
										$(".quiz-ox-con").text(data[i].quizContent);
										$("#hiddenAnswer").text(data[i].quizAnswer);
										i++;
										
										//마지막 문제일때 Interval을 멈춤.
										if(i === data.length){
											alert("게임 우승자가 한명 이상이므로 포인트는 분할 지급됩니다.");
											clearInterval(content);
										}
									count = 5;
									}else {
										clearInterval(content);
										$(".btnArea").append("<button id='startBtn'>시작하기</button>");
										alert("축하합니다  게임에서 우승하셨습니다.");
										
										$.ajax({
											url: "/jqt/reward.g",
											type: "post",
											data: {
												"reward": total,
												"userNum": <%= loginUser.getUserNum() %>
											},
											success: function(data){
												
											},
											error: function(data){
												
											}
										});
										
									}
								}
							}
						}, 1000); 
					},
					error: function(msg){
						console.log("에러!");
					}
				}); //ajax끝
				
				break;
				
			default : 
				textarea.innerHTML+= message;
				textarea.scrollTop = textarea.scrollHeight;
				break;
			}

		}
	
		//엔터키
		function enterkey() {
	        if (window.event.keyCode == 13) {
	        	submitMessage();
	            //스크롤바 아래로 내리기
		        textarea.scrollTop = textarea.scrollHeight;
	        }
	        
	    }
		
		//메세지 전송 메소드
	  	function submitMessage(event) {    
				var nickName = "<%= loginUser.getNickName() %>";
	    		var message = document.getElementById("inputMessage").value;
	    		if(message !== ""){
	        		send("message="+message+"&roomNumber="+roomNumber+"&nickName="+nickName+"&type=sendToAll");
		    		document.getElementById("inputMessage").value=""; 
	    		}

	    		function send(data){  // 서버로 데이터를 보냄
				wsocket.send(data);
			}
		}
		//o,x버튼
		$(".O").click(function(){
			$(".<%= loginUser.getNickName() %>").attr("id", "O");
			wsocket.send("roomNumber="+roomNumber+"&nickName=<%= loginUser.getNickName() %>"+"&type=O");
		});
		$(".X").click(function(){
			$(".<%= loginUser.getNickName() %>").attr("id", "X");
			wsocket.send("roomNumber="+roomNumber+"&nickName=<%=loginUser.getNickName() %>"+"&type=X");
		});
		
		
		//시작버튼
		$(document).on("click", "#startBtn", function(){
			var user = $(".answer").children();//유저 인원

			//게임 시작 최소인원
			if(user.length >= 1){ //시작 할때 대기방에 잠깐 들려 버튼막기
				wsocket.send("roomNumber="+roomNumber+"&nickName=<%=loginUser.getNickName() %>"+"&type=start");
				var webSocket = new WebSocket("ws://192.168.30.83:8222/<%= request.getContextPath() %>/waiting?type=start&roomNumber=<%= roomNumber %>&present=99");
				
				setTimeout(function() {
					webSocket.close();
				}, 3000);
				
			}else {
				alert("최소인원은 3명입니다.");
			}
			
		});
		
		function count(){
			var i = 5;
			var time = setInterval(function(){
				$(".quiz-ox-con").text(i);
				
				i--;
				
				if(i == 1){
					clearInterval(time);
				}
			});
		}
		
		//방 나가기
	  	function exit() { 
			wsocket.send("&roomNumber="+roomNumber+"&nickName=<%= loginUser.getNickName() %>"+"&type=exit");
			wsocket.send("&roomNumber="+roomNumber+"&nickName=<%= loginUser.getNickName() %>"+"&type=close");
		}
	</script>
</body>
</html>