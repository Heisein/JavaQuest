<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>



/* 광고판 이미지 공간 */
.carousel-inner {
	width: 100%;
	height: 500px;
}

.image {
	height : auto;
}

/* 채점판  */
.parallax-counter-v1 {
	background: white;
	width: 100%;
	padding-top: 60px;
	padding-right: 0px;
	padding-bottom: 60px;
	padding-left: 0px;
}

.parallax-counter-v1 .counters {
	color: #fff;
	padding: 15px 0 10px;
	border: solid 1px #555;
	border-top-color: rgb(85, 85, 85);
	border-top-style: solid;
	border-top-width: 1px;
	border-right-color: rgb(85, 85, 85);
	border-right-style: solid;
	border-right-width: 1px;
	border-bottom-color: rgb(85, 85, 85);
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-left-color: rgb(85, 85, 85);
	border-left-style: solid;
	border-left-width: 1px;
	border-image-source: initial;
	border-image-slice: initial;
	border-image-width: initial;
	border-image-outset: initial;
	border-image-repeat: initial;
}

.container- {
	width: 60%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

.counters {
	background: black;
	text-align: center;
	color: white;
}

.counter {
	font-size: 30px;
}

.tempClass {
	height: 150px;
}

.col-md-9 {
	width: 100%;
}

p, h1 {
	width: 60%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	padding-top: 60px;
	padding-right: 0px;
	padding-bottom: 60px;
	padding-left: 0px;
}

/* 광고/공지판 버튼크기 */
.carousel-control {
	position: absolute;
	top: 40%;
	bottom: 0;
	left: 0;
	width: 5%;
	height: 100px; font-size : 20px;
	color: #fff;
	text-align: center;
	text-shadow: 0 1px 2px rgba(0, 0, 0, .6);
	background-color: rgba(0, 0, 0, 0);
	filter: alpha(opacity = 50);
	opacity: .5;
	font-size: 20px;
}
</style>
</head>
<body>

<%@ include file = "/views/common/menubar.jsp" %>
<br/>
<br/>

<!-- 광고판/공지 영역 -->  
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
    
<!-- 광고판 아래 순서표시 -->
    	<ol class="carousel-indicators">
		    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    		<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
    	</ol>
		
<!-- 광고판 실제 내용 -->
		<div class="carousel-inner">
	     	<div class="item active" >
		        <img src="images/pic1.jpg" alt="Los Angeles" style="width:100%;" class = "image">
	     	</div>
	
      		<div class="item">
	        	<img src="images/pic2.jpg" alt="Chicago" style="width:100%;" class = "image">
        	</div>
	    
        	<div class="item">
	        	<img src="images/pic3.jpg" alt="New york" style="width:100%;" class = "image">
        	</div>
    	</div>
	
<!-- 좌우 버튼 -->
	    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      		<span class="glyphicon glyphicon-chevron-left"></span>
      		<span class="sr-only">Previous</span>
    	</a>
    	<a class="right carousel-control" href="#myCarousel" data-slide="next">
      		<span class="glyphicon glyphicon-chevron-right"></span>
      		<span class="sr-only">Next</span>
    	</a>
	</div>
	
<div class="container">	


<!-- 중간 소개글 -->
<div class = "tempClass" align = "center" >
	<h1>JavaQuest</h1>
	<button onclick="location.href='<%= request.getContextPath() %>/views/admin/selectAllResult.jsp'">관리자페이지</button>
	<button onclick="location.href='<%= request.getContextPath() %>/selectList.st'">결제페이지</button>
</div>

<!-- 문제 수 영역  -->
<div class="parallax-counter-v1 parallaxBg">
    <div class="container-">
        <div class="row margin-bottom-10">
            <div class="col-sm-3 col-xs-6">
                <div class="counters">
                    <span class="counter">14494</span>   
                    <h4>전체 문제</h4>
                </div>    
            </div>
            <div class="col-sm-3 col-xs-6">
                <div class="counters">
                    <span class="counter">11989</span> 
                    <h4>채점 가능한 문제</h4>
                </div>    
            </div>
            <div class="col-sm-3 col-xs-6">
                <div class="counters">
                    <span class="counter">9363</span>
                    <h4>풀린 문제</h4>
                </div>    
            </div>
            <div class="col-sm-3 col-xs-6">
                <div class="counters">
                    <span class="counter">62</span>
                    <h4>채점 가능한 언어</h4>
                </div>    
            </div>
        </div>
    </div>
</div>

<!-- 테스트용 빈 공간 -->
<div class = "tempClass">
	
</div>
</div>
<!-- 제일 아래 푸터 -->
<%@ include file = "/views/common/footer.jsp" %>     
</body>
</html>