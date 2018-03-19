<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.jqt.board.model.vo.*" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<style>
<!-- 공지사항 -->	
* {font-size: 9pt !important;}
.btn_align {width: 600px !important; text-align: right !important;}

tr, th, td{
border:1px solid black !important;
}
table{
	border:1px solid black !important;
	width:100% !important;
	text-align:center !important;
}

	.wrap{
		display:inline-block !important;
	}
	.choice{
		text-align:center !important;
		width:auto !important;
		padding:0 30px !important;
	}
	.choice:hover{
		text-decoration:underline !important;
		cursor:pointer !important;
		background:lightgray !important;
	}
	.nowType{
		background:#428bca !important;
		color:white !important;
	}
	input{
		width:120px !important;
		height:30px !important;
		margin-left:5px !important;
		background:white !important;
		border:1px solid white !important;
	}
	button{
		border-radius:10px !important;
		
	}
	button:hover{
		cursor:pointer;
	}
	td:hover{
		background-color: #e6ecff !important;
		cursor:pointer;
	}
	#thText th{
		text-align:center;
		border-bottom:2px solid black !important;
		height:40px !important;
		vertical-align:middle !important;
	}
	tr:nth-child(2n){
		background:#ededed !important;
	}
	.trArea:hover{
		background:#68a2ff !important;
	}
	.my-hr2 {
    border: 0;
    height: 1px;
    background: black;
  }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file= "/views/common/menubar.jsp" %>
<div class="container">
	<div class="wrap">
		<input type="button" class="choice" value="공지사항" onclick="noticeList();">
		<input type="button" class="choice nowType" value="자유게시판" onclick="freeList();">
		<input type="button" class="choice" value="질문답게시판" onclick="QaaList();">
	</div>
	<hr class="my-hr2">
	<table border="1" id="listArea">
		<caption>자유게시판</caption>
		<colgroup>
			<col width="50" />
			<col width="300" />
			<col width="80" />
			<col width="100" />
			<col width="70" />
			<col width="100">
			<col width="70">
		</colgroup>
		<thead>
			<tr id="thText">
			<!-- no. 닉네임, 제목 , 추천수, 댓글수, 작성일자, 조회수 배경 -->
				<th style="font-weight: bold">no.</th>
				<th style="font-weight: bold">제목</th>
				<th style="font-weight: bold">닉네임</th>
				<th style="font-weight: bold">추천수</th>
				<th style="font-weight: bold">댓글수</th>
				<th style="font-weight: bold">작성일자</th>
				<th style="font-weight: bold">조회수</th>
			</tr>
		</thead>
			<% int templ = 0; %>
			<% for(Board n: list){ %>
			<tr class="trArea" id="selectTr<%= templ++ %>">
				<input type="hidden" value="<%= n.getBid() %>">
				<td><%= n.getBno() %></td>
				<td><%= n.getBtitle() %></td>
				<td><%= n.getBwriter() %></td>
				<td id="selectCt"></td>
				<td id="selectcomment"></td>
				<td><%= n.getBdate() %></td>
				<td><%= n.getBcount() %></td>
			</tr>
			<% } %>
		<tfoot>
			<tr>
				<td align="center" colspan="7">
				</td>
			</tr>
		</tfoot>
	</table>
	<br>
	<p align="center">
		<input type="button" value="글쓰기" onclick="location.href='views/board/FrreBoardinsertForm.jsp'">
	</p>
	<div class="text-center" class="pagination">
		<button onclick="location.href='<%= request.getContextPath() %>/selectFb.no?currentPage=1'"><<</button>
		<% if(currentPage <= 1){ %>
		<button disabled><</button>
		<% }else{ %>
		<button onclick="location.href='<%= request.getContextPath() %>/selectFb.no?currentPage=<%= currentPage - 1 %>'"><</button>
		<% } %>
		<% for(int p=startPage; p<= endPage; p++){
				if(p == currentPage){ 
		%>
					<button disabled><%= p %></button>
		<% 		}else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/selectFb.no?currentPage=<%= p %>'"><%= p %></button>
		<%		} %>
		<% } %>
		<% if(currentPage > maxPage){ %>
		<button disabled>></button>
		<% }else{ %>
		<button onclick="location.href='<%= request.getContextPath() %>/selectFb.no?currentPage=<%= currentPage + 1 %>'">></button>
		<% } %>
		<button onclick="location.href='<%= request.getContextPath() %>/selectFb.no?currentPage=<%= maxPage %>'">>></button>
		
	</div>
	
	<form name="searchForm" align="center">
	<p>
		<select name="searchType">
			<option value="ALL" selected="selected">전체검색</option>
			<option value="SUBJECT">제목</option>
			<option value="WRITER">작성자</option>
			<option value="CONTENTS">내용</option>
		</select>
		<input type="text" name="searchText" value="" />
		<input type="submit" value="검색" />
	</p>
	</form>
</div>

	<script>
	$(function(){
		<% int iii = 0; // Tr을 가리킬 위치
		for(Board n : list){ %>
			var bid = <%= n.getBid() %>;
			console.log("댓글수~bid:"+bid);
			$.ajax({
				url:"/jqt/selectcomment.bo",
				data:{"bid":bid},
				type:"post",
				success:function(data){
					console.log(data);
					<% for(int i = 0; i< templ; i++){  // 게시글의 수
						if(i == iii){ // 지금 반복문이 i번째 게시글을 가리킬때 %>
							$('#selectTr<%= iii++ %>').find('#selectcomment').text(data);
							console.log("#selectcomment<%= i %>");
							<% i = templ; // 반복문을 종료함 (인덱스를 범위 밖으로 넘겨버려서 강제종료) %>
						<% }
					} %>
				}
			});
		
		<% } %>
	});
	$(function(){
		<% int ii = 0; // Tr을 가리킬 위치
		for(Board n : list){ %>
			var bid = <%= n.getBid() %>;
			console.log("좋아요bid:"+bid);
			$.ajax({
				url:"/jqt/likeArea.bo",
				data:{"bid":bid},
				type:"post",
				success:function(data){
					<% for(int i = 0; i< templ; i++){  // 게시글의 수
						if(i == ii){ // 지금 반복문이 i번째 게시글을 가리킬때 %>
							$('#selectTr<%= ii++ %>').find('#selectCt').text(data);
							<% i = templ; // 반복문을 종료함 (인덱스를 범위 밖으로 넘겨버려서 강제종료) %>
						<% }
					} %>
				}
			});
		
		<% } %>
	});
		$(function(){
			$("#listArea td").click(function(){
				var num = $(this).parent().children().eq(0).val();
				console.log($(this).parent().children());
				location.href="<%= request.getContextPath() %>/selectOneFb.bo?num="+num;
			});
		});
		function noticeList(){
			location.href="<%= request.getContextPath() %>/selectqaa.no";
		}
		function freeList(){
			location.href="<%= request.getContextPath() %>/selectFb.no";
		}
		function QaaList(){
			location.href="<%= request.getContextPath() %>/selectQuestion.bo"
		}
		
	</script>
	
</body>
</html>