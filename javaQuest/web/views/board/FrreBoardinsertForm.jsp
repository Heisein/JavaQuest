<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<style>
	h1{
		font-size:6;
		color:gray;
	}
	form table tr td{
		height:16;
		font-size:12;
		text-align:center;
	}
	#tableArea{
		border:2px solid black;
	}
	button{
		border-radius:10px;
		
	}
	button:hover{
		background-color:;
	}
	
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file= "/views/common/menubar.jsp" %>
	
	<h1>글쓰기</h1>
	<form action="<%= request.getContextPath() %>/insertFb.bo" align="center" method="get">
		<table id="tableArea" width="700" align="center">
			<tr>
				<td>작성자</td>
				<td><input id="nickname" type="text" size="70" name="nickname" value="<%= loginUser.getNickName() %>" ></td>
				<td><input type="hidden" value="<%= loginUser.getUserNum() %>" name="uno"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" size="70" id="title" name ="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="70" rows="20" style="resize:none" size="75" id="content" name="content"></textarea></td>
			</tr>
			<tr>
				<td>파일첨부</td>
				<td><input type="file"></td>
			</tr>
		</table>
	
	<div align="center">
		<input type="submit" value="작성완료" id="insertFb" >
		<input type="reset" value="작성취소">
	</div>
	</form>
	
	
	<script>
	
		
	</script>
	
</body>
</html>