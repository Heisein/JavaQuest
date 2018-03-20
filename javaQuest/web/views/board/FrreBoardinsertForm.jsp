<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<style>
	.h1{
		margin-left:400px;
		
	}
	form table tr td{
		height:16;
		font-size:12;
		text-align:center;
		vertical-align:middle;
	}
	
	#tableArea{
		border:1px solid lightgray;
		margin-left:400px;
		
	}
	#tableArea tr{
		border:1px solid lightgray;
	}

	button{
		border-radius:10px;
	}
	button:hover{
		background-color:;
	}
	#content{
		background:WhiteSmoke;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file= "/views/common/menubar.jsp" %>
	
	<h1 class="h1" style="font-weight:bold">글쓰기</h1>
	<form action="<%= request.getContextPath() %>/insertFb.bo" align="center" method="get">
		<table id="tableArea" width="700" align="center">
			<tr style="background:LightBlue">
				<td style="font-weight:bold">작성자</td>
				<td><input id="nickname" type="text" size="73" name="nickname" value="<%= loginUser.getNickName() %>" style="background:WhiteSmoke" ></td>
				<td><input type="hidden" value="<%= loginUser.getUserNum() %>" name="uno" style="background:WhiteSmoke"></td>
			</tr>
			<tr style="background:LightBlue">
				<td style="font-weight:bold">제목</td>
				<td><input type="text" size="73" id="title" name ="title" style="background:WhiteSmoke"></td>
			</tr>
			<tr style="background:LightBlue">
				<td style="font-weight:bold">내용</td>
				<td><textarea cols="72" rows="20" style="resize:none" size="72" id="content" name="content"></textarea></td>
			</tr>
			<tr style="background:LightBlue">
				<td style="font-weight:bold">첨부</td>
				<td><input type="file"></td>
			</tr>
		</table>
	<br>
	<div align="center">
		<input type="submit" value="작성완료" id="insertFb" style="background:no-repeat">
		<input type="reset" value="작성취소" style="background:no-repeat">
	</div>
	</form>
	<script>
	
		
	</script>
	
</body>
</html>