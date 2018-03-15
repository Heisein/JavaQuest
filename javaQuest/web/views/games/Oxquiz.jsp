<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.jqt.member.model.vo.*"%>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/reset.css">
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/Oxquiz.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
	
		<div align="right">
			<p class="quiz-no">99번 문제</p>
			<button class="exit" onclick="exit();">나가기</button>
		</div>
		
			<!-- quiz -->
			<div class="quiz-ox">
				<button class="O"></button>
				<button class="X"></button>
				<div class="quiz-ox-con">문제입니다. <br>이걸 만드는게 쉬웠습니까?</div>
			</div>
			<!-- quiz -->
			
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
		
		var textarea = document.getElementById("textArea");
	    var webSocket = new WebSocket('ws://192.168.30.83:8222/<%= request.getContextPath() %>/broadcasting?<%= loginUser.getNickName() %>');
	    var inputMessage = document.getElementById('inputMessage');
	    var elem = document.getElementById('textArea');
	   
	    webSocket.onopen = function(event) {
	      onOpen(event)
	    };
	    function onOpen(event) {
	        textarea.value += "ox퀴즈대결에 참여하셨습니다.\n";
	        
	        /* 현재 웹소켓에 연결되어있는 다른 사람에게 영역을 표시 */
	        webSocket.send("흘흘흘흘흘|");
	        webSocket.send("<%= loginUser.getNickName() %>님이 참여하셨습니다.")
	    }
	    
	    /* 서버로부터 메세지 도착시 */
	    webSocket.onmessage = function(event) {
	      onMessage(event)
	    };
	    function onMessage(event) {
	    	
	    	var eventData = decodeURIComponent(event.data);
	    	var message = eventData.split("|");
	        var sender = message[0];
	        var content = message[1];
	        var del = "."+content;
	        
	        //유저가 입장시
	        if(sender === "흘흘흘흘흘"){
	        	//초기화
	        	$(".answer").html("");
					
	        	var nickName = content.split(", ");
	        	
	        	//기존에 접속 해있는 사람들의 영역표시
	        	$.each(nickName, function(index, value){
	        		
	        		if(value === "<%= loginUser.getNickName() %>"){
	        			 $(".answer").append("<li style='border: 5px solid green;' class='<%= loginUser.getNickName() %>'>" + "<%= loginUser.getNickName() %>" + "</li>");
	        		} else {
	        			$(".answer").append("<li class='"+ value + "'>" + value + "</li>");	
	        		}
	        	});
	        	
	        }else if(sender === "와우"){
	        	$(content).remove();
	        
	        }else if(sender === "buttonO"){
       			$("." + content).css("background", "green");
       			
	        }else if (sender === "buttonX"){
	        	$("." + content).css("background", "red");
	        	
	        }else {
		        //입장했을때
		        if(typeof(content) === "undefined"){
			        textarea.value += sender + "\n";
			    }else {
				    //일반 메세지
			    	textarea.value += sender + " : " + content + "\n";
			    }
	        }
	        elem.scrollTop = elem.scrollHeight;
	    }
	    
	    webSocket.onerror = function(event) {
	      onError(event)
	    };
	    function onError(event) {
	      alert(event.data);
	    }
	  
	    function send() {
	    	//내 대화창 화면에 올림
	        textarea.value += "<%= loginUser.getNickName() %>" + " : " + inputMessage.value + "\n";
	        //유져들에게 보냄.
	        webSocket.send("<%= loginUser.getNickName() %>"+ "|" + inputMessage.value);
	        //입력란 비움.
	        inputMessage.value = "";
	    }
	    //엔터키 전송으로 만들기
	    function enterkey() {
	        if (window.event.keyCode == 13) {
	            send();
	            //스크롤바 아래로 내리기
		        elem.scrollTop = elem.scrollHeight;
	        }
	    }
	    
	    function exit(){
	    	//종료 메세지 용도
	    	webSocket.send("<%= loginUser.getNickName() %>님이 나가셨습니다.");
	    	//종료시 다른유저들의 화면에서 지우기 위한 용도
	    	webSocket.send("와우|.<%= loginUser.getNickName() %>");
			location.href = "../games/gameMainPage.jsp";
			
			//webSocket.send("닉네임삭제|" + "<%= loginUser.getNickName() %>");
			onClose(event);
		}
	    function onClose(event){
	    	alert("?");
	    	webSocket.send("닉네임삭제|<%= loginUser.getNickName() %>");
	    	webSocket.onclose;
	    }
	    $(".O").click(function(){
			webSocket.send("buttonO|<%= loginUser.getNickName() %>");
	    });
	    $(".X").click(function(){
			webSocket.send("buttonX|<%= loginUser.getNickName() %>");
	    });
	</script>
</body>
=======
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
	
		<div align="right">
			<p class="quiz-no">99번 문제</p>
			<button class="exit" onclick="exit();">나가기</button>
		</div>
		
			<!-- quiz -->
			<div class="quiz-ox">
				<button class="O"></button>
				<button class="X"></button>
				<div class="quiz-ox-con">문제입니다. <br>이걸 만드는게 쉬웠습니까?</div>
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
				$("."+nickName).attr("id", "O").css("background", "blue");
				console.log(typeof($("."+nickName).attr("id")));
				break;
			
			case "X" : 
				$("."+nickName).attr("id", "X").css("background", "red");
				console.log($("."+nickName).attr("id"));
				break;
			
			case "start" :
				var user = $(".answer").children();
				console.log(user);
				console.log(user[0].value);
				console.log(user.length);
				
				$("#startBtn").remove();
				
					$.ajax({
						url: "/jqt/oxquizList.g",
						type: "get",
						data: {"roomNumber": roomNumber},
						success: function(data){
							//게임 문제를 받아와서 해당 div에 갱신을 해준다.
							//다만 시간이 지날때마다 문제가 바뀐다.
							var i = 0;	//다음문제를 위한 변수
							
							$(".quiz-ox-con").text(data[i].quizContent); //문제 올리는 공간
							$("#hiddenAnswer").text(data[i].quizAnswer); //답을 올리는 공간
							
							//시간을 설정하여 문제를 바뀌게 함
							var content = setInterval(function(){ 
								user = 	$(".answer").children();		
								$("#startBtn").remove();
								
								//현재 남은 사람의 인원수를 계산해 한명이 아닐경우.
								if(user.length !== 1){
									if($("#hiddenAnswer").text() === $(".<%= loginUser.getNickName() %>").attr("id")){
										//정답일때
										$(".quiz-ox-con").text("정답입니다.");
									}else {
										//오답일때
										alert("오답입니다. 게임을 종료합니다.");
										location.href="<%= request.getContextPath() %>/oxRoomList.g?type=minus&roomNumber="+roomNumber;
									}
									
									
										
									//문제가 시작할때마다 전의 답과 비교를 하여 탈락자들을 나가게함.
										
									
									//문제 바꾸기
									$(".quiz-ox-con").text(data[i].quizContent);
									i++;
									
									//마지막 문제일때 Interval을 멈춤.
									if(i === data.length){
										alert("게임 우승자가 한명 이상이므로 포인트는 분할 지급됩니다.");
										clearInterval(content);
									}
								}else {
									clearInterval(content);
									alert("축하합니다  게임에서 우승하셨습니다.");
								}
							}, 5000); 
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
		
		//방 나가기
	  	function exit() { 
			wsocket.send("&roomNumber="+roomNumber+"&nickName=<%= loginUser.getNickName() %>"+"&type=exit");
			wsocket.send("&roomNumber="+roomNumber+"&nickName=<%= loginUser.getNickName() %>"+"&type=close");
		}
	</script>
</body>
>>>>>>> origin/jo3
</html>