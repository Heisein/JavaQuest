<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/reset.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
      .resumeList {
        width: 700px;
        border :1px solid #d5d5d5;
        margin: 100px 80px 30px 80px;
      }
      
      .resumeList tr {
      	width : 100px;
      	height : 40px;   	
      }
      
      .resumeList th, td {
      	border : 1px solid #717171;
      }
      .resumeList th {
      	background-color : #eee; 
      }
      
      .resumeList td {
      padding : 10px;
      border : 1px solid #717171;
      }
      
	.btn-wrap{
 		width: 500px;
		align: right;
		margin-left : 460px;
	}
	.btn-wrap button{
		border: 0; 
		width: 100px;
		margin: 0;
	}
	</style>
</head>
<body>
		<div class="container">
		<div class="leftBox">
			<div class="visiArea">회원</div>
			<!-- visiArea -->

			<ul class="leftNav">
				<li
					onclick="location.href='<%=request.getContextPath()%>/views/myPage/myInfo.jsp'"><i
					class="fa fa-user"></i> 내 정보</li>
				<li
					onclick="location.href='<%=request.getContextPath()%>/views/myPage/updateInfo.jsp'"><i
					class="fa fa-user"></i> 정보수정</li>
				<li
					onclick="location.href='<%=request.getContextPath()%>/views/colorPicker.jsp'"><i
					class="fa fa-window-maximize"></i> 테마변경</li>
				<li
					onclick="location.href='<%=request.getContextPath()%>/views/myPage/resume.jsp'"><i
					class="fa fa-vcard"></i> 이력서</li>
			</ul>
		</div>
		<!-- leftBox -->
	<div class="conArea">
	
	<h3>이력서 관리</h3>
	<table class="resumeList">
		<tr>
			<th><label>이력서 제목</label></th>
			<td> 업로드한 이력서 파일명 불러오기  </td>
		</tr>
		<tr>
			<th width="200px"><label>최초 수정일</label></th>
			<td> 최종 수정일 불러오기 ex)2018년 3월 5일 </td>
		</tr>
</table>

		<div class="btn-wrap" >
			<button onclick="location.href=''">업로드</button>
			<button onclick="location.href=''">다운로드</button> 
			<button onclick="location.href=''">신규작성</button>
		</div>
	</div>
</div>

 
</body>
</html>