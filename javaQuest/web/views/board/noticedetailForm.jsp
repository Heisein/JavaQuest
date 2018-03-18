<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.jqt.board.model.vo.*, java.util.*" %>
<% 
	Board n = (Board)request.getAttribute("n"); 
	ArrayList<String> list = n.getBcount3();
	
%>
<!DOCTYPE html>
<html>
<head>
<style>
	
	form{
		border:1px solid black;
	}
	#tableArea1 td{
		border:1px solid black;
	}
	.tableArea{
		border:1px solid black;
		width:800px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	#content{
		height:230px;
	}
	button{
		border-radius:10px;
		
	}
	button:hover{
		background-color:;
	}
	span,p{
		font-size:14px;
		color:gray;
	}
	
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file= "/views/common/menubar.jsp" %>
	<h1>공지사항 상세보기</h1>
	
	
	<div class="tableArea" >
		<table id="tableArea1" align="center" width="800px" border="1">
				<tr>
					<td>글번호</td>
					<td>
						<span><%= n.getBno() %></span>
					</td>	
					<td>제목</td>
					<td colspan="4">
						<span><%= n.getBtitle() %></span>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<span><%= n.getBwriter() %></span>
					</td>
					<td>조회수</td>
					<td>
						<span><%= n.getBcount() %></span>
					</td>
					<td>날짜</td>
					<td>
						<span><%= n.getBdate() %></span>
					</td>
				</tr>
				
				<tr>
					<td colspan="6">내용</td>
				</tr>
				<tr>
					<td colspan="6">
						<p id="content"><%= n.getBcontext() %></p>
					</td>
				</tr>
		
		</table>
		<div>
			<!-- 좋아요 기능 보류 ...다른기능부터 -->
			
			<button id="likeArea"> <img src="<%= request.getContextPath() %>/images/like.PNG" width="25px" height="25px"></button>
			<button id="reportArea"> <img src="<%= request.getContextPath() %>/images/unlike.png" width="25px" height="25px"></button>
			<!-- 수정하기 버튼 사이즈 버튼 바꿔야함~~~~~~~~~~~~~~~~~ -->
			<% if(loginUser !=null && loginUser.getUserId().equals("admin")){ %>
			<button>수정하기</button>
			<% } %>
		</div>
		<br>
		<table id="replyArea">
			<tr id="notRemoveThis">
				<td id="reply2"></td>	
			</tr>
			<tr id="notRemoveThis">
				<td>
					<textarea style="resize:none" id="replyContent" cols="60" rows="3"></textarea>
				</td>
				<td>
					<button id="addReply">작성</button>
					<button type="button" onclick="location.href='<%= request.getContextPath() %>/selectqaa.no'">목록으로 돌아가기</button>
				</td>
			</tr>
			
		</table>
	</div>
	<script>
		$("#likeArea").click(function(){
			alert("좋아요!");
			var user_num = <%= loginUser.getUserNum() %>
			var bid = <%= n.getBid() %>
			console.log(user_num);
			console.log(bid);
			$.ajax({
				url:"/jqt/selectLike.bo",
				data:{"user_num":user_num,"bid":bid},
				type:"post",
				succeess:function(){
					
				},
				error:function(){
					
				}
			});
		});
		
		$("#reportArea").click(function(){
			alert("게시물이 신고 되었습니다.\n관리자가 검토후 처리하도록 하겠습니다.");
			var rno = <%= loginUser.getUserNum() %>
			var bid = <%= n.getBid() %>
			 console.log(rno);
			 console.log(bid);
			 $.ajax({
				url:"/jqt/reportbd.bo",
				data:{"rno":rno,"bid":bid},
				tpye:"post",
				succeess:function(){
					location.href="<%= request.getContextPath() %>/selectOneQaa.bo";
				},
				error:function(msg){
					console.log("msg");
				}
			 });
		});
		
		$(function(){
			var count = <%= n.getRef_bid()  %>
			var writer = <%= loginUser.getUserNum() %>
			var bid = <%= n.getBid() %>
			var content = $("#replyContent").val();
			console.log(count);
			console.log(writer);
			console.log(bid);
			$.ajax({
				url:"/jqt/selectReply.bo",
				data:{"count":count,"writer":writer,"bid":bid,"content":content},
				type:"post",
				success:function(data){
					var $replyArea = $("#replyArea");
					$("#reply2").text(data.length + "개의 댓글");
						for(var key in data){
						var $tr = $("<tr>");
						var $writerTd = $("<td>").text(data[key].bwriter).css("width","");
						var $contentTd = $("<td>").text(data[key].bcontext);
						var $dateTd = $("<td>").text(data[key].bdate);
						
						$tr.append($writerTd);
						$tr.append($contentTd);
						$tr.append($dateTd);
						$replyArea.append($tr);	
						
					}	
					
				}
			});
		})
	
		$("#addReply").click(function(){
			//-- 1. 댓글수  2.작성자. 3.작성내용 . 4.작성날짜 --
			var count = <%= n.getRef_bid() %>
			var writer = <%= loginUser.getUserNum() %>
			var bid = <%= n.getBid() %>
			console.log(count);
			console.log(writer);
			console.log(bid);
			var content = $("#replyContent").val();
			
			
			$.ajax({
				url:"/jqt/insertReply.bo",
				data:{"count":count,"writer":writer,"bid":bid,"content":content},
				type:"post",
				success:function(data){
					var $replyArea = $("#replyArea");
					$replyArea.find('tr[id != "notRemoveThis"]').remove();
					console.log(data);
					$("#reply2").text(data.length + "개의 댓글");
					for(var key in data){
						console.log(data[0]);
						var $tr = $("<tr>");
						var $writerTd = $("<td>").text(data[key].bwriter).css("width","50px");
						var $contentTd = $("<td>").text(data[key].bcontext).css("width","200px");
						var $dateTd = $("<td>").text(data[key].bdate).css("width","100px");
						
						$tr.append($writerTd);
						$tr.append($contentTd);
						$tr.append($dateTd);
						$replyArea.append($tr);	
					}	
				},
				error:function(msg){
					alert("에러");
				}
			});
		});

	</script>
</body>
</html>