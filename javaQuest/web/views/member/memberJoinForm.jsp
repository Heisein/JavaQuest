<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	#tableform{
		margin-left:300px;
	}
	#tableform2{
		margin-left:200px;
	}
	#tableform div{
		margin-top:10px;
	}
	body h3{
		margin-left:300px;
		font-size:40px;
		
	}
	button{
		border-radius:10px;
		
	}
	button:hover{
		background-color:;
	}
	#tableform{
		margin-left:500px;
		background:rgba(255,255,255,1);
		width:400px;
		padding:30px;
	}
</style>
<!-- 유저 아이디, 유저 패스워드, 유저 닉네임, 이메일, 폰번호 -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<div id="backgroundImage" style="height:600px; background-image:url('<%= request.getContextPath() %>/images/join_background.jpg');">
		<div id="container">
			<br/>
			<h3 style="margin-left:630px; color:white;">회원가입</h3>  
			<br>
			<div id="tableform">
				<form id="joinForm" action="<%= request.getContextPath() %>/insertMember.me" method="post">
					<div>
		          		<label>아이디</label>
		          		<input type="text" placeholder="아이디" name="userId" id="userId">
		          		<span>
		                  <button type="button" class="btn btn-primary" id="idCheck">중복 확인</button>
		                </span>
		          	</div>
		          	<div>
		          		<label>닉네임</label>
		          		<input type="text" placeholder="닉네임" name="userNickName" id="userNickName">
		          		<span>
		                  <button type="button" class="btn btn-primary" id="nickCheck">중복 확인</button>
		                </span>
		          	</div>
		            <div>
		              <label for="InputPassword1">비밀번호</label>
		              <input type="password" placeholder="비밀번호" name="userPwd">
		            </div>
		            <div>
		              <label for="InputPassword2">비밀번호 확인</label>
		              <input type="password"placeholder="비밀번호 확인" name="userPwd2">
		            </div>
		            <div>
		              <label for="InputEmail">이메일 주소</label>
		              <input type="email" placeholder="이메일 주소" name="email">
		              <span>
		              	<button class="btn btn-primary" onclick="emailCheck();">인증</button> 
		              </span>
		            </div>
		            <div>
		              <label for="username">휴대폰 입력</label>
		                <input type="tel" placeholder="하이픈(-)을 포함해주세요" name="phone">
		            </div>
		            
		            <div>
						<div data-toggle="buttons"><input type="checkbox"><a href="#">이용약관</a>에 동의합니다.</div>
		            </div>
		          
		        	<br/>
		        	
		            <button class="btn btn-primary" style="width:100%;">회원가입</button>
		            
		        </form>
		        </div>
		    </div> <!-- end of container -->
		</div>
        <script>
        	<!-- 아이디,닉네임 중복확인, 이메일인증  -->
        		$("#idCheck").click(function(){
        			var userId = $("#userId").val();
					console.log(userId);
					
					$.ajax({
						url:"/jqt/idCheck.me",
						type:"post",
						data:{"userId":userId},
						success:function(data){
							console.log(data);
							if(data === "fail"){
								alert("중복된 아이디입니다.");
							}else{
								alert("사용 가능한 아이디입니다.");
							}
						},
						error:function(msg){
							console.log(data)
							alert("에러가남~");	
						}
        			});
        		});
        		
        		$("#nickCheck").click(function(){
        			var userNickName = $("#userNickName").val();
        			console.log(userNickName);
        			$.ajax({
        				url:"/jqt/nickCheck.me",
        				data:{"userNickName":userNickName},
        				success:function(data){
        					console.log(data);
        					if(data ==="fail"){
        						alert("중복된 닉네임입니다.");
        					}else{
        						alert("사용 가능한 닉네임입니다.");
        					}
        				},
        				error:function(msg){
        					alert("에러가남~");
        				}
        			});
        		});
        	function emailCheck(){
        		alert("이메일인증확인바람");
        	}
        	
        	function insertMember(){
        		$("#joinForm").submit;
        	}
        </script>
</body>
</html>