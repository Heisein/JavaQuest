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
</html>