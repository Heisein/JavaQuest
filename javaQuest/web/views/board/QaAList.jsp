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
table tbody tr th {
	background-color: gray !important;
	text-align:center !important;
}
tr, th, td{
border:1px solid black !important;
}
table{
	border:1px solid black !important;
}

#label1{
	margin-left:;
}
button{
		border-radius:10px !important;
		
	}
	button:hover{
		background-color:;
	}
	td:hover{
		background-color: #e6ecff !important;
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
<div class="container">
	<%@ include file= "/views/common/menubar.jsp" %>
	<br>
	
	<div id="label1">
		<label><a href="<%= request.getContextPath() %>/selectqaa.no">공지사항</a></label>/
		<label><a href="<%= request.getContextPath() %>/selectFb.no">자유게시판</a></label>/
		<label><a href="<%= request.getContextPath() %>/selectQuestion.bo">Q % A</a></label>
	</div>
	<table border="1" align="center" id="listArea">
		<caption>질문답게시판</caption>
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
			<tr>
			<!-- no. 닉네임, 제목 , 추천수, 댓글수, 작성일자, 조회수 배경 -->
				<th align="center">no.</th>
				<th align="center">제목</th>
				<th align="center">닉네임</th>
				<th align="center">추천수</th>
				<th align="center">댓글수</th>
				<th align="center">작성일자</th>
				<th align="center">조회수</th>
			</tr>
		</thead>	
			<% int templ = 0; %>
			<% for(Board n: list){ %>
			<tr id="selectTr<%= templ++ %>">
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
		
		<input type="button" value="글쓰기" onclick="location.href='views/board/QaAinsertForm.jsp'">
		
	</p>
	<div class="text-center" class="pagination">
		<button onclick="location.href='<%= request.getContextPath() %>/selectQuestion.bo?currentPage=1'"><<</button>
		<% if(currentPage <= 1){ %>
		<button disabled><</button>
		<% }else{ %>
		<button onclick="location.href='<%= request.getContextPath() %>/selectQuestion.bo?currentPage=<%= currentPage - 1 %>'"><</button>
		<% } %>
		<% for(int p=startPage; p<= endPage; p++){
				if(p == currentPage){ 
		%>
					<button disabled><%= p %></button>
		<% 		}else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/selectQuestion.bo?currentPage=<%= p %>'"><%= p %></button>
		<%		} %>
		<% } %>
		<% if(currentPage > maxPage){ %>
		<button disabled>></button>
		<% }else{ %>
		<button onclick="location.href='<%= request.getContextPath() %>/selectQuestion.bo?currentPage=<%= currentPage + 1 %>'">></button>
		<% } %>
		<button onclick="location.href='<%= request.getContextPath() %>/selectQuestion.bo?currentPage=<%= maxPage %>'">>></button>
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
				location.href="<%= request.getContextPath() %>/selectOneQt.bo?num="+num;
			});
		});
		
	</script>
	
</body>
</html>