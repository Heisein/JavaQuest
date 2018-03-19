<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.jqt.member.model.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width: 100%;
}

.adminSelect {
	margin: 40px 0px 10px 0px;
}

.selectThead {
	background: #eee;
}

.searchall th {
	border: 1px solid #d5d5d5;
}

.searchall td {
	border: 1px solid #d5d5d5;
}

.searchall {
	padding: 30px;
}

.idNameBox {
	float: left;
	padding: 10px 15px;
	border: 1px solid #d5d5d5;
}

.selectBox {
	padding: 30px;
}

.searchCondition {
	float: left;
}
#leaveBtn {
	verrtical-align: middle;
	text-align: center;
	background: orangered;
	color: white;
	border-radius: 5px;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<%@ include file="/views/common/loginOnly.jsp" %>
	<br>
	<div class="container">
		<div class="leftBox">
			<div class="visiArea" align="center">Admin</div>
			<!-- visiArea -->

			<ul class="leftNav">
				<li	onclick="location.href='<%=request.getContextPath()%>/views/admin/selectAllResult.jsp'">
					<i class="fa fa-user"></i> 회원 관리
				</li>
				<li	onclick="location.href='<%=request.getContextPath()%>/selectRequest.ad'">
					<i class="fa fa-user"></i> 서브 퀘스트 수락
				</li>
			</ul>
		</div>
		<!-- leftBox -->
		<div class="conArea">
			<h3 style="margin-top:0;">회원 정보 전체 보기</h3>
			<div class="adminSelect">
				<div class="selectBox" align="center">
					<form>
						<input type="radio" name="searchCondition" id="findId" value="findId" checked>
						<label for="findId">아이디로 찾기</label> <input type="radio" name="searchCondition" id="findName"
							value="findName"> <label for="findName">닉네임으로 찾기</label>
						<div id="idNameBox">
							<input type="search" id="searchValue">
							<button type="submit" onclick="return searchBtn()">검색하기</button>
						</div>
					</form>
				</div>
				<table class="searchall">
					<thead class="selectThead">
						<tr>
							<th>No.</th>
							<th>아이디</th>
							<th>닉네임</th>
							<th>이메일</th>
							<th>핸드폰</th>
							<th>레벨</th>
							<th>경험치</th>
							<th>분류</th>
							<th>가입일</th>
							<th>신고수</th>
							<th></th>
						</tr>
					</thead>
					<tbody class="serachBody">
					</tbody>
				</table>

			</div>
		</div>
		
		<script>
		
		// 페이지 시작하면 전체 불러오기
		$(function(){
			
			<% if(loginUser.getType() != 3){
				request.setAttribute("msg", "잘못된 접근입니다."); 
				request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
				} %>
			
			$.ajax({
				url:"/jqt/myInfo.me",
				success:function(data){
					var $userTable = $(".searchall");
					$userTable.children( 'tr:not(:first)' ).remove(); //첫번째 tr(th)를 제외하고 모두 지운다
					
					for(var key in data){
						var $tr = $("<tr>");
						var $unTd = $("<td>").text(data[key].userNum);
						var $idTd = $("<td>").text(data[key].userId);
						var $nickTd = $("<td>").text(data[key].nickName);
						var $emailTd = $("<td>").text(data[key].email);
						var $phoneTd = $("<td>").text(data[key].phone);
						var $lvTd = $("<td>").text(data[key].level);
						var $expTd = $("<td>").text(data[key].exp);
						var typeStr = "";
						if(data[key].type == 1) typeStr = "일반";
						else if(data[key].type == 2) typeStr = "기업";
						else typeStr = "관리자";
						var $typeTd = $("<td>").text(typeStr);
						var $enrollTd = $("<td>").text(data[key].enrollDate);
						var $reportedTd = $("<td>").text("0");
						var $leavebtnTd =$("<td>").html("<div id='leaveBtn' onclick='leave(" + data[key].userNum + ")'>강퇴</div>");
						
						$tr.append($unTd);
						$tr.append($idTd);
						$tr.append($nickTd);
						$tr.append($emailTd);
						$tr.append($phoneTd);
						$tr.append($lvTd);
						$tr.append($expTd);
						$tr.append($typeTd);
						$tr.append($enrollTd);
						$tr.append($reportedTd);
						$tr.append($leavebtnTd);
						$userTable.append($tr);
					}
				},
				error:function(msg){
					alert(msg);
				}
			})
		})
		
		function searchBtn(){
			var $searchValue = $('#searchValue').val();
			var $condition = $('input[name=searchCondition]:checked').val();
			
			$.ajax({
				url:"/jqt/myInfo.me",
				success:function(data){
					var $userTable = $(".serachBody");
					$userTable.children().remove();
					
					for(var key in data){
						// 찾는 조건이 아니면 리턴함
						if($condition == "findId" && data[key].userId.indexOf(String($searchValue))) continue;
						else if($condition == "findName" && data[key].nickName.indexOf($searchValue + "")) continue;
						
						var $tr = $("<tr>");
						var $unTd = $("<td>").text(data[key].userNum);
						var $idTd = $("<td>").text(data[key].userId);
						var $nickTd = $("<td>").text(data[key].nickName);
						var $emailTd = $("<td>").text(data[key].email);
						var $phoneTd = $("<td>").text(data[key].phone);
						var $lvTd = $("<td>").text(data[key].exp);
						var $expTd = $("<td>").text(data[key].exp);
						var typeStr = "";
						if(data[key].type == 1) typeStr = "일반";
						else if(data[key].type == 2) typeStr = "기업";
						else typeStr = "관리자";
						var $typeTd = $("<td>").text(typeStr);
						var $enrollTd = $("<td>").text(data[key].enrollDate);
						var $reportedTd = $("<td>").text('0');
						var $leavebtnTd =$("<td>").html("<div id='leaveBtn' onclick='leave(" + data[key].userNum + ")'>강퇴</div>");
						
						$tr.append($unTd);
						$tr.append($idTd);
						$tr.append($nickTd);
						$tr.append($emailTd);
						$tr.append($phoneTd);
						$tr.append($lvTd);
						$tr.append($expTd);
						$tr.append($typeTd);
						$tr.append($enrollTd);
						$tr.append($reportedTd);
						$tr.append($leavebtnTd);
						$userTable.append($tr);
					}
				},
				error:function(msg){
					alert(msg);
				}
			})
			
			return false;
		}
		
		function leave(userNum){
			if(confirm("정말로 제적하시겠습니까?")){
				alert("제적하였습니다.");
				
				location.href='/jqt/deleteMember.me?num=' + userNum;
			}
		}
		</script>
</div>		
</body>
</html>