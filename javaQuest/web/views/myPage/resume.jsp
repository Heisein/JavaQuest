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
      .resumeList { width: 700px; border :1px solid #d5d5d5; margin: 100px 80px 5px 80px; }
      .resumeList tr { width : 100px; height : 40px; }
      .resumeList th, td { border : 1px solid #717171; }
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
		margin-left : 570px;
	}
	.btn-wrap input[type=button]{
		border: 0; 
		width: 100px;
		margin: 0;
	}
	.display-none{opacity: 0; width: 0px}
	.file-div{height: 15px}
	.upload-btn2{margin-left: 71%} 
	.upload-btn2 input[type=button]{ height: 40px; background: #555; color: white;}
	.upload-btn2 input[type=button]:HOVER{background: #222}
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
			<th width="200px"><label>이력서 제목</label></th>
			<td> <div id="file-name-div" class="file-div"></div>  </td>
		</tr>
		<tr>
			<th width="200px"><label>최초 수정일</label></th>
			<td>  <div id="file-date-div" class="file-div"></div>	 </td>
		</tr>
</table>
	<form name="fileForm" id="fileForm" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/fileUpload.me">
		<div class="btn-wrap">
			<input type="file" class="display-none" id="file" name="filename" onchange="javascript:changeFileName()">
			<input type="button" id="fileChange-btn" value="파일 변경">
			<input type="button" id="fileDown-btn" value="파일 다운로드">
			</div>
			<br>
		<div class="btn-wrap upload-btn2">
			
			<input type="button" id="fileSubmit-btn" value="저장하기">
			<input type="button" id="new-btn" value="신규작성">
		</div>
	</form>
	
	
	</div>
</div>

 
</body>
<script type="text/javascript">

var fileName="";


$(document).ready(function(){
	$("#fileChange-btn").click(function(){
		$("#file").trigger("click");
	});
});

function changeFileName(){
	fileName = document.fileForm.filename.value;
	var fileNameArr = fileName.split("\\");
	
	var fileNameSize = fileNameArr.length
	//alert(fileNameArr[fileNameSize-1]);
	
	$("#file-name-div").empty();
	$("#file-name-div").append(fileNameArr[fileNameSize-1]);
	
}

$("#fileSubmit-btn").click(function(){
	if (fileName=="") {
		alert("저장할 파일을 선택해주세요.");
	}
	
	$("#fileForm").submit();

})







</script>

</html>