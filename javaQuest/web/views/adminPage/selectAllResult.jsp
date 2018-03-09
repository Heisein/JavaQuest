<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/reset.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
</style>
</head>
<body>

	<div class="container">
		<div class="leftBox">
			<div class="visiArea" align="center">Admin</div>
			<!-- visiArea -->

			<ul class="leftNav">
				<li
					onclick="location.href='<%=request.getContextPath()%>/views/adminPage/selectAllResult.jsp'"><i
					class="fa fa-user"></i> 회원 관리</li>
				<li
					onclick="location.href='<%=request.getContextPath()%>/views/adminPage/adminq.jsp'"><i
					class="fa fa-user"></i> 서브 퀘스트 수락</li>
			</ul>
		</div>
		<!-- leftBox -->
		<div class="conArea">

			<h3>회원 정보 전체 보기</h3>
			<div class="adminSelect">
				<div class="selectBox" align="center">
					<form>
						<input type="radio" name="searchCondition" value="findId" checked>
						<label>아이디로 찾기</label> <input type="radio" name="searchCondition"
							value="findName"> <label>이름으로 찾기</label>
						<div id="idNameBox">
							<input type="search" name="searchValue">
							<button type="submit">검색하기</button>
						</div>
					</form>
				</div>
				<table class="searchall">
					<thead class="selectThead">
						<tr>
							<th></th>
							<th>아이디</th>
							<th>닉네임</th>
							<th>이메일</th>
							<th>핸드폰</th>
							<th>레벨</th>
							<th>경험치</th>
							<th>경고</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>데이터2</td>
							<td>데이터3</td>
							<td>데이터4</td>
							<td>데이터5</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>데이터2</td>
							<td>데이터3</td>
							<td>데이터4</td>
							<td>데이터5</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>3</td>
							<td>데이터2</td>
							<td>데이터3</td>
							<td>데이터4</td>
							<td>데이터5</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>4</td>
							<td>데이터2</td>
							<td>데이터3</td>
							<td>데이터4</td>
							<td>데이터5</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>5</td>
							<td>데이터2</td>
							<td>데이터3</td>
							<td>데이터4</td>
							<td>데이터5</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
</div>		
</body>
</html>