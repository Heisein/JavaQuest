<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.jqt.quest.model.vo.*" %>
<%
	Quest q = (Quest)session.getAttribute("q");
	String code = String.valueOf(session.getAttribute("code"));
	String className = String.valueOf(session.getAttribute("className"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<h1><%= q.getQuestName() %> 결과 확인중...</h1>
	<div class="storageOut"></div>
	<input type="hidden" id="answer" name="answer" value="<%= q.getQuestAnswer() %>"> 
	<table id="resultTable">
	</table>
	<div id="clearDiv" style="color:green; font-size:25px;"></div>
	<div id="failDiv" style="color:red; font-size:25px;"></div>
	
	<script>
		var code = sessionStorage.getItem('code');
		var className = sessionStorage.getItem('className');
		var answer = document.getElementById("answer").value.replace(/\n/gi,""); // 개행 제거
		answer = answer.replace(/\r/gi,""); // 줄바꿈 제거
		
		var resultBool = new Array();
		var elapsedTime = new Array();
		
		var compileCount = 0;
		
		//sysout으로 찍었는지 확인하기. 추후 이럴때 어떻게 처리할지 정하기.
		if (code.match(answer) && !code.match("Hello World")) {
				console.log("sysout으로 찍었음");
		}
		
		//1초에 한번씩 10번 체크하는 인터벌
		var checkInterval = setInterval(function(){ 
			$.ajax({
				url:"/jqt/compile.co",
				data : { "code":code, "className":className }, // 전송할 코드
				timeout : 10000,
				type:"post",
				success:function(data){
					var result = data["result"].replace(/\n/gi,""); // 개행 제거
					result =  result.replace(/\r/gi,""); // 엔터 제거
					
					resultBool[compileCount] = (result == answer);
					elapsedTime[compileCount] = data['elapsedTime'];
					
					if(resultBool[compileCount]) {
						$("#resultTable").append('<tr><td><font color="green">통과</font></td><td>' + elapsedTime[compileCount] +'초</td></tr>');
					}else{
						$("#resultTable").append('<tr><td><font color="red">실패</font></td><td>' + elapsedTime[compileCount] +'초</td></tr>');
					}
					compileCount++;
					
					//10번 다 실행됨
					if(compileCount == 10){
						// 10번돌면 인터벌 삭제 
						clearInterval(checkInterval);
						
						var isWrong = false;
						var avr = 0.0;
						
						// 10번 확인해서 그중에 하나라도 틀렸으면
						for(var j=0; j<10; j++){
							avr += elapsedTime[j];
							if(resultBool[j] == false) {
								console.log("틀림");
								isWrong = true;
							}
						}
						
						if(isWrong == false){ // 성공시
							$("#clearDiv").html("퀘스트 클리어!<br>평균 실행시간 : " + avr / elapsedTime.length + "초<br>경험치 " + <%= q.getRewardExp() %> + " 획득.");
						
							setTimeout(function(){ // 2초 대기후 리절트창으로
								location.href="<%= request.getContextPath() %>/questResult.qu";
							}, 2000);
						}else{ // 실패시
							$("#failDiv").text("퀘스트 실패..");
						}
					}
				},
				error:function(data){
						console.log("채점 컴파일 요청중 에러");
						compileCount++;
				}
			})// end of inner ajax
			
		}, 1000);
			
			
	</script>
</body>
</html>