<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.jqt.game.model.vo.*"%>
<% 
	ArrayList<Room> list = (ArrayList<Room>)request.getAttribute("list"); 
	String type = (String)request.getAttribute("type");
	String roomNumber = (String)request.getAttribute("roomNumber");
	String present = (String)request.getAttribute("present");
	System.out.println("waitingRoom present : " + present);

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/jqt/css/reset.css">
<link rel="stylesheet" href="/jqt/css/common.css">
<link rel="stylesheet" href="/jqt/css/waitingRoom.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/jqt/js/ParamSpliter.js"></script>
</head>
<body>
<%@ include file="/views/common/menubar.jsp" %>

<div class="container">
	<br/>
	<div class="roomArea">
		<div class="titleArea">대기실	</div>
			<div class="roomNumber" style="display:none;"></div>
			<div class="present" style="display:none;"></div>			
			<ul class="room">
			</ul>
	
			<div class="btnArea">
				<button class="create">방 만들기</button>
			</div>
		
			<div id="modalLayer">
				<div class="modalContent">
					<table class="contentA">
						<tr>
							<td>방제목</td>
						</tr>
						<tr>
							<td>
								<input type="text" class="roomTitle"/>	  	
							</td>
						</tr>
					</table>
			  		<button type="button" id="newRoom">생성하기</button>
			  		<button type="button" id="close">닫기</button>
				</div>
			</div>
		</div>	
	</div>
	<script>
	//뒤로가기 막기
	history.pushState(null, document.title, location.href); 
	window.addEventListener('popstate', function(event) {
		history.pushState(null, document.title, location.href); 
	});
	
	var modalLayer = $("#modalLayer");
	var modalLink = $(".modalLink");
	var modalCont = $(".modalContent");
	var marginLeft = modalCont.outerWidth()/2;
	var marginTop = modalCont.outerHeight()/2;
	var marginLeft = modalCont.outerWidth()/2;
	var marginTop = modalCont.outerHeight()/2;
	
	
	var	wsocket = new WebSocket("ws://192.168.0.22:8222/<%= request.getContextPath() %>/waiting?type=<%= type %>&roomNumber=<%= roomNumber %>&present=<%= present %>");
	wsocket.onmessage = onMessage;  // 메세지가 왔을때 호출할 메소드 지정
	
	<% for(int i = 0; i < list.size(); i++) { %>
		var roomNumber = <%= list.get(i).getRoomNo() %>;
		var title = "<%= list.get(i).getRoomTitle() %>";
		var present = <%= list.get(i).getPresentNo() %>;
		var total = <%= list.get(i).getTotal() %>;
		var started = "<%= list.get(i).getStarted() %>";
		if(started === "0"){
			$(".room").append("<li class='number' value='"+ roomNumber + "' id='" + roomNumber +"'>" 
					+ roomNumber + "번<br/>" 
					+ "<label id='title'>" + title + "</label>" + "<br/>" 
					+ "<label id='present'>" + present + "</label>/"
					+ total + "</li>");
		}else if(started === "1"){
			$(".room").append("<li class='number' value='"+ roomNumber + "' id='" + start +"'>" 
					+ roomNumber + "번<br/>" 
					+ "<label id='title'>" + title + "</label>" + "<br/>" 
					+ "<label id='present'>" + present + "</label>/"
					+ total + "</li>");
		}
	<% } %>
	
	function onMessage(event) {  // 서버로부터 메세지가 왔을때 호출되는 메소드
		var type = paramSpliter(event.data, "type");
		var roomNumber = paramSpliter(event.data, "roomNumber");
		var present = paramSpliter(event.data, "presentNo");
		var title = paramSpliter(event.data, "title");
		var total = 30;
		
		switch(type){
		case "create" :
			var roomTitle = $(".roomTitle").val();
			console.log("roomTitle : " + roomTitle);
				$.ajax({
					url:"<%= request.getContextPath() %>/insertRoom.g",
					type:"get",
					data:{"roomTitle":roomTitle},
					success: function(data){
						console.log(data);
						var roomNo = data.roomNo;
						var roomTitle = data.roomTitle;
						var presentNo = data.presentNo;
						var total = data.total;
						
						wsocket.send("type=exit&roomNumber="+roomNo+"&title="+roomTitle+"&presentNo="+presentNo+"&total="+total);
						location.href = "<%= request.getContextPath() %>/views/games/Oxquiz.jsp?roomNumber="+roomNo;
						
					},
					error: function(msg){
						alert(msg);
					}
				});
			break;
			
		case "exit" :
			$(".room").append("<li class='number' value='"
								+ roomNumber + "' id='" + roomNumber +"'>"
								+ roomNumber + "번<br/>"
								+ title + "<br/>"
								+ "<label id='present'>" + present + "</label>/"
								+ total + "</li>");
			break;
		
		case "upCount" :
			$("#"+roomNumber).find("#present").text(present);
			break;
		
		case "delete" :
			console.log("지워버려!!!1");
			$("#"+roomNumber).remove();
			break;
			
		case "minus" : 
			if(Number(present) > 0){
				$("#"+roomNumber).find("#present").text(present);
			}else {
				$("#"+roomNumber).remove();
			}
			break;
			
		case "start" :
			$("#"+roomNumber).attr("class", "started");
			
			break;
			
		}
		
	}
	$(".create").click(function(){
		
		modalLayer.fadeIn("slow");
		modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
		$(this).blur();
		$(".modalContent > a").focus(); 
		return false;
	})
	
	//방들어가기 버튼
	$(document).on("click", "#newRoom", function(){
		wsocket.send("type=create");
	});
	
	$(document).on("click", ".number", function(){
		var present = $(this).find("#present").text();
		var title = $(this).find("#title").text();
		if(Number(present) < 2) {
			wsocket.send("type=upCount&roomNumber="+$(this).val()+"&title="+title+"&presentNo="+present); 
			location.href = "<%= request.getContextPath() %>/upCount.g?roomNumber="+$(this).val();
		}else {
			alert("해당방의 인원이 초과하였습니다.");
		}
	});
	</script>
</body>
</html>