<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.jqt.board.model.vo.*" %>
<% Board n = (Board)request.getAttribute("n"); %>

<!DOCTYPE html>
<html>
<head>
<style>
	#tableArea1 td{
		border:1px solid lightgray;
		text-align:left;
	}
	.tableArea{
		border:1px solid lightgray;
		width:800px;
		height:295px;
		margin-left:auto;
		margin-right:auto;
		
	}
	.h1{
		margin-left:350px;
	}
	#content{
		height:230px;
	}
	button{
		border-radius:10px;
		
	}
	button:hover{
		cusor:pointer;
	}
	span,p{
		font-size:14px;
		color:gray;
	}
	.detailArea{
		font-size:18px;
	}
	.detailArea2{
		font-size:18px;
	}
	#likeArea,#reportArea,#updatenotice,#addReply,#addReply2{
		
		background:no-repeat;
	}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file= "/views/common/menubar.jsp" %>
	<h1 class="h1" style="font-weight:bold">질문답게시판 상세보기</h1>
	<div class="tableArea" >
		<table id="tableArea1" align="center" width="800px" border="1">
				<tr class ="detailArea" style="background:LightBlue">
					<td style="font-weight: bold">글번호</td>
					<td>
						<span><%= n.getBno() %></span>
					</td>	
					<td style="font-weight: bold">제목</td>
					<td colspan="4">
						<span><%= n.getBtitle() %></span>
					</td>
				</tr>
				<tr class ="detailArea" style="background:LightBlue">
					<td style="font-weight: bold">작성자</td>
					<td>
						<span><%= n.getBwriter() %></span>
					</td>
					<td style="font-weight: bold">조회수</td>
					<td width="50px">
						<span><%= n.getBcount() %></span>
					</td>
					<td style="font-weight: bold">날짜</td>
					<td>
						<span><%= n.getBdate() %></span>
					</td>
				</tr>
				
				<tr class ="detailArea2" style="background:WhiteSmoke">
					<td colspan="6"></td>
				</tr>
				<tr>
					<td colspan="6" style="background:WhiteSmoke ">
						<p id="content"><%= n.getBcontext() %></p>
					</td>
				</tr>
		
		</table>
		<div class="etc">
			<button id="likeArea"> <img src="<%= request.getContextPath() %>/images/like.PNG" width="25px" height="25px"></button>
			<button id="reportArea"> <img src="<%= request.getContextPath() %>/images/unlike.png" width="25px" height="25px"></button>
			<!-- 수정하기 버튼 사이즈 버튼 바꿔야함~~~~~~~~~~~~~~~~~ -->
			<button id="updatenotice">수정하기</button>
		</div>
		<br>
		<table>
			<tr id="notRemoveThis">
				<td id="reply2"></td>
				<td></td>
				<td></td>
			</tr>
			<tr id="notRemoveThis">
				<td>
					<textarea style="resize:none" id="replyContent" cols="67" rows="4"></textarea>
					<button id="addReply">작성</button>
					<button id="addReply2" type="button" onclick="location.href='<%= request.getContextPath() %>/selectQuestion.bo'">목록으로 돌아가기</button>
				</td>	
			</tr>
		</table>
		<div>
			<table>
				<tr>
				<td width="80px" style="background:LightBlue">작성자</td>
				<td width="600px" style="background:LightBlue">내용</td>
				<td width="120px" style="background:LightBlue">날짜</td>
				</tr>
			</table>
		</div>
		<div>
		<table id="replyArea">
			<tr>
				<td></td>
			</tr>
		</table>
		</div>
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
					location.href="<%= request.getContextPath() %>/selectOneQt.bo";
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
					$("#reply2").text(data.length + "개의 댓글").css("font-size","25px");
						for(var key in data){
						var $tr = $("<tr>").css("border-bottom","solid 1px black");
						var $writerTd = $("<td>").text(data[key].bwriter).css({
							width:"80px",
							shadow: "1px 1px 1px #fff",
							background:"WhiteSmoke "
							});
						var $contentTd = $("<td>").text(data[key].bcontext).css({
							width:"600px",
							shadow: "1px 1px 1px #fff",
							background:"WhiteSmoke"
						});
						var $dateTd = $("<td>").text(data[key].bdate).css({
							width:"120px",
							shadow: "1px 1px 1px #fff",
							background:"WhiteSmoke"
						});
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
					$("#reply2").text(data.length + "개의 댓글").css("font-size","25px");
					for(var key in data){
						var $tr = $("<tr>").css("border-bottom","solid 1px black");
						var $writerTd = $("<td>").text(data[key].bwriter).css({
							width:"80px",
							shadow: "1px 1px 1px #fff",
							background:"WhiteSmoke "
						});
						var $contentTd = $("<td>").text(data[key].bcontext).css({
							width:"600px",
							shadow: "1px 1px 1px #fff",
							background:"WhiteSmoke"
							})
						var $dateTd = $("<td>").text(data[key].bdate).css({
							width:"120px",
							shadow: "1px 1px 1px #fff",
							background:"WhiteSmoke"
						});
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