<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/reset.css">
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/game.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
	<div class="container">
	<div align="right"><button class="exit" onclick="exit();">나가기</button></div>
	<div align="center" class="title">사지선다</div>
	<br/>
		<div class="quiz">
			<p class="quiz-no">99번 문제</p>
			<div class="quiz-con">adklfj;alkdfj;alkfj;aldk<br>fja;ldkj</div>
		</div>
		<!-- quiz -->
		
		<div class="answer-wrap">
			<ul class="answer">
				<li class="number" value="1">1</li>
				<li class="number" value="2">2</li>
				<li class="number" value="3">3</li>
				<li class="number" value="4">4</li>
			</ul>
		</div>
		<!-- answer -->
	</div>
	<!-- container -->
	<script>
		function exit(){
			location.href = "../game/gameMainPage.jsp";
		}
		var answer = 1;
		$(".number").click(function(){
			if($(this).val() === answer){
				//정답일때
				$(".quiz").css({"border" : "5px solid green"});
				$(".quiz-con").html("정답입니다.<br/>다음 문제를 도전하시겠습니까?<br/><br/><button class='next'>다음문제</button>");
					
			}else {
				//오답일때
				$(".quiz").css({"border" : "5px solid red"});
				$(".quiz-con").text("오답입니다.");
			}
		});
	</script>
</body>
</html>