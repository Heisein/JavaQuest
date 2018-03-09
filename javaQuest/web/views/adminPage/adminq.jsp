<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/semi/css/reset.css">
<link rel="stylesheet" href="/semi/css/common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.accordion {
	background-color: #67c6ea;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

.questPage {
	margin: 80px 0px 10px 0px;
}

.active, .accordion:hover {
	background-color: #55bfe8;
}

.accordion:after {
	content: '\002B';
	color: #55bfe8;
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.active:after {
	content: "\2212";
}

.panel {
	padding: 0 18px;
	background-color: white;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
}

.submit {
	float: right;
	background-color: #a8daed;
	padding: 15px 40px;
}

.cancel {
	float: right;
	background-color: #eee;
	padding: 15px 40px;
}

.questToggle{
	padding : 30px 0px; 

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
			<h3>퀘스트 요청</h3>

			<div class="questPage">
				<button class="accordion">Section 1</button>
				<div class="panel">
					<p>
					<div class="questToggle">
						<ul>
							<li>퀘스트 설명 : 헬로우 월드를 찌그세여</li>
							<li>기본코드</li>
							<li>레벨 등등</li>
						</ul>
						<div class="questinfo">
							<span class="submit">수락</span> <span class="cancel">거절</span>
						</div>
					</div>
				</div>
			</div>
			<button class="accordion">Section 2</button>
			<div class="panel">
				<p>
				<div class="questToggle">
					<ul>
						<li>퀫트 설명</li>
						<li>기본코드</li>
						<li>레벨 등등</li>
					</ul>
					<div class="questinfo">
						<span class="submit">수락</span> <span class="cancel">거절</span>
					</div>
				</div>

			</div>

			<button class="accordion">Section 3</button>
			<div class="panel">
				<p>
				<div class="questToggle">
					<ul>
						<li>퀫트 설명</li>
						<li>기본코드</li>
						<li>레벨 등등</li>
					</ul>
					<div class="questinfo">
						<span class="submit">수락</span> <span class="cancel">거절</span>
					</div>
				</div>
			</div>

			<script>
				var acc = document.getElementsByClassName("accordion");
				var i;

				for (i = 0; i < acc.length; i++) {
					acc[i].addEventListener("click", function() {
						this.classList.toggle("active");
						var panel = this.nextElementSibling;
						if (panel.style.maxHeight) {
							panel.style.maxHeight = null;
						} else {
							panel.style.maxHeight = panel.scrollHeight + "px";
						}
					});
				}
			</script>
		</div>
	</div>
		
</body>
</html>