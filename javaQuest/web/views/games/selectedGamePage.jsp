<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.jqt.game.model.vo.*"%>
<%
	ArrayList<SelectGame> list = (ArrayList<SelectGame>)request.getAttribute("list");

	int[] no = new int[list.size()];
	String[] content = new String[list.size()];
	String[] answers = new String[list.size()];
	String[][] choice = new String[list.size()][4];
	
	for(int j = 0; j < list.size(); j++){
		no[j] = list.get(j).getQuizNo();
		content[j] = list.get(j).getQuizContent().replace(" _b_ ", "<br/>");
		choice[j] = list.get(j).getQuizChoice().split(" _b_ ");
		answers[j] = list.get(j).getQuizAnswer();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/jqt/css/reset.css">
<link rel="stylesheet" href="/jqt/css/common.css">
<link rel="stylesheet" href="/jqt/css/game.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
	<div class="container">
	<div align="right"><button class="exit" onclick="exit();">나가기</button></div>
	<div align="center" class="title">사지선다</div>
	<br/>
		<div class="quiz">
			<p class="quiz-no" id="quiz_no"></p> <!-- 문제 번호  -->
			<div class="quiz-con" id="quiz_con"></div> <!-- 문제 내용 -->
		</div>
		<!-- quiz -->
		
		<!-- 답을 저장할 영역 -->
		<div id="hiddenAnswer" style="display: none;"></div>
		
		<div class="answer-wrap">
			
			<!-- 보기가 들어갈 영역 -->
			<ul class="answer" id="answer">
			
			</ul>
		</div>
		<!-- answer -->
	</div>
	<!-- container -->
	
	
	<script>
		var j = 0;					//배열 이용을 위한 변수.
		var no = new Array();		//문제 번호
		var content = new Array();	//문제 지문
		var answers = new Array();	//정답
		var choice = new Array(new Array(<%= content.length %>));	//문제수에 맞춰 보기 배열 생성
		var quiz_no = document.getElementById("quiz_no");			//퀴즈 번호 영역
		var quiz_con = document.getElementById("quiz_con");			//문제 영역
		var hiddenAnswer = document.getElementById("hiddenAnswer");	//답 영역
		
		//문제 추출
		<% for(int i = 0; i < content.length; i++){ %>
			
			content[<%= i %>] = ["<%= content[i] %>"];
			answers[<%= i %>] = ["<%= answers[i] %>"];
			no[<%= i %>] = [<%= no[i] %>];
			
		<% } %>
		
		//보기 추출
		<% for(int i = 0; i < choice.length; i++) {  %>
				choice[<%= i %>] = new Array();		//문제 수에 맞춰 보기담을 배열 생성.
			<% for(int j = 0; j < choice[i].length; j++){	%>
				choice[<%= i %>][<%= j %>] = ["<%= choice[i][j] %>"];
		<%	}
		   }  %>	
		
		//보기 추출한 값 보기 영역에 올리기
		<% for(int i = 0; i < 4; i++) { %>
			$(".answer").append("<li class='number'>" + choice[j][<%= i %>] + "</li>");
		<% } %>

		quiz_no.innerHTML = no[j] + "번 문제"; //문제 번호 올리기
		quiz_con.innerHTML = content[j];	//문제 올리기
		hiddenAnswer.innerHTML = answers[j];		//답 올리기
		
		
		//보기클릭시 발생하는 이벤트.
		$(document).on('click', '.number', function(){
			//정답일때
			if($(this).text() === hiddenAnswer.innerHTML){
				console.log($(this).text());
				$(".quiz-con").html("");
				$(".quiz").css({"border" : "5px solid blue"});
				$(".quiz-con").html("정답입니다.<br/>다음 문제를 도전하시겠습니까?<br/><br/><button class='next' onclick='next();'>다음문제</button>");
			}else {
				//오답일때
				$(".quiz").css({"border" : "5px solid red"});
				var temp = $(".quiz-con").html();
				$(".quiz-con").html(temp + "<br/><br/>아니다.").css("color", "red");
			}
		});
		
		//다음 문제 클릭시 발생하는 이벤트
		function next(){
			j++;
			$(".quiz-con").css("color", "black");	//초기화
			$(".quiz").css({"border" : "5px solid #dfdfdf"});	//전광판 리셋
			$(".answer").html("");					//초기화.
			quiz_no.innerHTML = no[j] + "번 문제";	//문제 번호 교체
			quiz_con.innerHTML = content[j];		//문제 교체
			
			<% for(int q = 0; q < 4; q++) { %>
				$(".answer").append("<li class='number'>" + choice[j][<%= q %>] + "</li>"); //보기 교체
			<% } %>
			
			hiddenAnswer.innerHTML = answers[j];	//다음문제 답으로 교체
		}
		
		function exit(){
			location.href = "<%= request.getContextPath() %>/views/games/gameMainPage.jsp";
		}
	</script>
</body>
</html>