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
	<h1>결과 확인중...</h1>
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
					
					console.log(compileCount);
					
					var msg = "";
					if(resultBool[compileCount]) {
						msg = "통과";
						$("#resultTable").append('<tr><td><font color="green">' + msg + '</font></td><td>' + elapsedTime[compileCount] +'초</td></tr>');
					}else{
						msg = "실패";
						$("#resultTable").append('<tr><td><font color="red">' + msg + '</font></td><td>' + elapsedTime[compileCount] +'초</td></tr>');
					}
					compileCount++;
					
					//10번 다 실행됨
					if(compileCount >= 10){
						var isWrong = false;
						for(var j=0; j<10; j++){
							if(resultBool[j] == false) {
								console.log("틀림");
								isWrong = true;
							}
						}
						
						if(isWrong == false){
							$("#clearDiv").text("퀘스트 클리어!");
						}else{
							$("#failDiv").text("퀘스트 실패..");
						}
						clearInterval(checkInterval);
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