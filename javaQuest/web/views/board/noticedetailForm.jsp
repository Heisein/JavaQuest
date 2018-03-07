<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<style>
	
	form{
		border:1px solid black;
	}
	#tableArea1 td{
		border:1px solid black;
	}
	.tableArea{
		border:1px solid black;
		width:800px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	#content{
		height:230px;
	}
	button{
		border-radius:10px;
		
	}
	button:hover{
		background-color:;
	}
	span,p{
		font-size:14px;
		color:gray;
	}
	
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file= "/views/common/menubar.jsp" %>
	<h1>내용상세보기</h1>
	
	
	<form class="tableArea" >
		<table id="tableArea1" align="center" width="800px" border="1">
			<tr>
					<td>제목</td>
					<td colspan="5">
						<span>제목입니다</span>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<span>유저1</span>
					</td>
					<td>조회수</td>
					<td>
						<span>100</span>
					</td>
					<td>날짜</td>
					<td>
						<span>2018-02-28</span>
					</td>
				</tr>
				
				<tr>
					<td colspan="6">내용</td>
				</tr>
				<tr>
					<td colspan="6">
						<p id="content">내용입니다</p>
					</td>
				</tr>
		</table>
		<br>
		<div>
			<button >좋아요 <img src="/views/images/like.PNG"/ width="25px" height="25px"></button>
			<button>신고하기 <img src="/views/images/unlike.png"/ width="25px" height="25px"></button>
			<!-- 수정하기 버튼 사이즈 버튼 바꿔야함~~~~~~~~~~~~~~~~~ -->
			<button>수정하기</button>
		</div>
		
		<br>
		<table>
			<tr>
				<td><a href="#">댓글3개</a></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>자바가 뭡니까??</td>
				<td>2018-02-28</td>
			</tr>
			<tr>
				<td>
					<textarea style="resize:none"></textarea>
					<button>작성</button>
				</td>
			</tr>
		</table>
	</form>
	<script>
	
	
	</script>
	
	
	
</body>
</html>