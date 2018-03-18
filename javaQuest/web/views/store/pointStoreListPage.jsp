<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.text.DecimalFormat, java.util.*, com.jqt.store.model.vo.*"%>
<%
	ArrayList<PointProduct> list = (ArrayList<PointProduct>) request.getAttribute("list");

	DecimalFormat df = new DecimalFormat("#,###"); // 천단위마다 ,찍어주는처리
	
	String[] pdPriceComma = new String[list.size()]; // 실제로 화면에 뿌릴 포맷처리된 스트링

	for (int i = 0; i < pdPriceComma.length; i++) {
		pdPriceComma[i] = df.format(list.get(i).getPrice());
	}

	int[] pdCode2 = {1, 2, 3, 4};
	int[] pdPrice2 = {20, 30, 40, 50};
	int[] pdAmount = {2, 2, 2, 2};
	String[] pdName = {"AG70", "키보-드", "temp", "피규어"};
	String[] pdContext = {"겁나 죠습니다", "요즘 유행하는 조약돌 키보드입니다", "Data Error", "재고처리중입니다"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<title>myPage</title>
<style>
body {
	width: 100%;
	height: 100%;
}

tr, td, th {
	border: 1px solid black;
}

.questNameli {
	line-height: 25px !important;
	padding-left: 0px !important;
	padding-left: 60px;
	line-height: 60px;
	cursor: pointer;
	font-size: 14px;
	border: 1px solid #ddd;
	float: left;
	width: 90%;
	height: 100%;
	margin: 10px;
}

.questNameli:hover {
	background: #00acee;
	color: #fff;
	border-color: #00acee;
}

.leftNav li {
	padding-left: 10px;
	height: 100%;
}

.questDetail {
	border: 1px solid lightgray;
	background: white;
	display: none;
	cursor: Default;
}

#buyBtn, #detailBtn {
	display: inline-block;
	verrtical-align: middle;
	text-align: center;
	background: orangered;
	color: white;
	height: 25px;
	width: 100px;
	border-radius: 5px;
	cursor: pointer;
}

.innerTopText {
	height: 40px;
	line-height: 40px;
	margin: auto 0;
	background: blue;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="/views/common/loginOnly.jsp"%>
	<%@ include file="/views/common/menubar.jsp"%>
	<br/> 
	
	<div class="container">

		<div class="leftBox">
			<div class="visiArea">웹사이트 회원</div>
			<!-- visiArea -->

			<ul class="leftNav">
				<li onclick="location.href='<%= request.getContextPath() %>/selectList.st'"><i class="fa fa-diamond"></i>포인트 구매</li>
				<li onclick="location.href='<%= request.getContextPath() %>/views/store/productStoreListPage.jsp'"><i class="fa fa-shopping-cart"></i>상품 리스트</li>
				<li onclick="location.href='<%= request.getContextPath() %>/selectResume.st'"><i class="fa fa-list"></i>구매내역</li>
			</ul>
		</div>
		<!-- leftBox -->

		<div class="conArea" id="mainArea">
			<div class="innerPointDiv">
				<br>
				<div class="innerTopText">&nbsp;&nbsp;&nbsp;포인트 상품 선택</div>
				<br>

				<%
					int i = 0;
					for (PointProduct pp : list) {
				%>
				<!-- 크기만큼 데이터 가져와서 화면에 뿌려주기 -->
				<input type="radio" name="pd" id="<%=pp.getProductCode()%>"	value="<%=pp.getProductCode()%>">
				<label for="<%=pp.getProductCode()%>">&nbsp;<%=pp.getGivePoint()%>포인트	- <%=pdPriceComma[i++]%>원</label>
				<hr>
				<!-- 가로줄 -->
				<% } %>
				<button onclick="buy()">구매하기</button>
			</div>

			<div class="innerProductDiv" style="display: none;">
				<br>
				<div class="innerTopText">&nbsp;&nbsp;&nbsp;현재 구매 가능한 상품들입니다 :
				</div>
				<br>

				<!-- 마찬가지로 크기만큼 데이터 가져오기 -->
				<table style="border: 1px solid black;">
					<!-- 여긴 테이블로 -->
					<tr>
						<th colspan="2" width="150px" align="center">사진</th>
						<th>이름</th>
						<th>설명</th>
						<th>수량</th>
						<th>가격</th>
						<th></th>
					</tr>
					<%
						for (int j = 0; j < pdCode2.length; j++) {
					%>
					<tr>
						<td colspan="2" height="150px" align="center"
							style="line-height: 150px;">사진</td>
						<td><%=pdName[j]%></td>
						<td><%=pdContext[j]%></td>
						<td><%=pdAmount[j]%>개</td>
						<td><%=pdPrice2[j]%> 포인트</td>
						<td>
							<div id="buyBtn">구매하기</div> <br> <br>
							<div id="detailBtn">자세히보기</div>
						</td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
		<!-- conArea -->
	</div>
	<!-- container -->
	<script>
		function buy(){
			var pc = $("input[name='pd']:checked").val(); // product code
			var myPrice;
			var givePoint;
			
			var IMP = window.IMP;
			IMP.init('imp23781469');
			
			console.log(IMP);
			// 결제할 상품 가져오는 ajax
			$.ajax({
				url : "/jqt/selectPP.st",
				data : { "productCode" : pc	},
				tpye : "post",
				success : function(data) {
					myPrice = data['price'];
					givePoint = data['givePoint'];
					console.log(myPrice);
					console.log(givePoint);
					
					//결제모듈 호출
					IMP.request_pay({
					    pg : 'kakao', // version 1.1.0부터 지원.
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : 'JavaQuest ' + givePoint + '포인트',
					    amount : parseInt(myPrice),
					    buyer_name : '<%=loginUser.getNickName()%>',
						m_redirect_url : 'https://www.yourdomain.com/payments/complete'
					},
					function(rsp) {
						if (rsp.success) {
							var msg = '결제가 완료되었습니다.';
								msg += '고유ID : ' + rsp.imp_uid;
								msg += '상점 거래ID : ' + rsp.merchant_uid;
								msg += '결제 금액 : ' + rsp.paid_amount;
								msg += '카드 승인번호 : ' + rsp.apply_num;
						} else {
							//결제 실패 해결이 불가능함, 임시로 결제 실패를 전제로 코딩해놓음
								var msg = givePoint + '포인트 결제가 완료되었습니다.\n';
								console.log('Message : ' + rsp.error_msg);
								msg += '결제ID : ' + rsp.imp_uid;

								//결제 성공시 결제 이력을 추가해야하므로 ajax를 추가호출
								$.ajax({
									url : "/jqt/insertPayed.st",
									data : {"givePoint" : givePoint,"pc" : pc,"impUid" : rsp.imp_uid,"msg" : msg }, // 금액, 결제성공 메세지, 선택한 상품, 결제 uid 저장	
									type : "post",
									success : function(data) {
										console.log("포인트 결제 이력 추가");
									},
									error : function(data) {
										console.log("포인트 결제 이력 ajax 에러");
									}
								})// end of inner ajax
						}
						
						alert(msg);
					}); // end of outer ajax
				},
				error : function(data) {
					console.log("포인트 구매 실패..");
				}
			});
		}
		
	</script>

</body>
</html>