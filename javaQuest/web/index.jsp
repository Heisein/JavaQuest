<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/jqt/css/slider.css">
<title>Insert title here</title>
<style>
/* 광고판 이미지 공간 */
.slider {
	width: 100%;
	height: 500px;
}

.image {
	height : auto;
}

/* 채점판  */
.parallax-counter-v1 {
	background: gray;
	width: 100%;
	padding-top: 60px;
	padding-right: 0px;
	padding-bottom: 60px;
	margin-top:20px;
	padding-left: 0px;

}

.parallax-counter-v1 .counters {
	color: #fff;
	/*padding: 15px 0 10px;*/
	padding:15px 10px;
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
	width: 75%;
	/*padding-right: 15px;
	padding-left: 15px;*/
	margin-right: auto;
	margin-left: auto;
}

.counters {
	font-family:"맑은 고딕";
	background: black;
	text-align: center;
	color: white;
	font-weight:650;
}

/*
.counters h4{
	font-size:16px;
}*/

.counter {
	font-size: 2.5em;
}

.tempClass {
	margin:0 auto;
	width:250px;
	/*height: 110px;*/
}

.col-md-9 {
	width: 100%;
}

/*p, h1 {
	width: 60%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	padding-top: 60px;
	padding-right: 0px;
	padding-bottom: 60px;
	padding-left: 0px;
}*/
	.javaquest{
		font-size:42px;
		margin-top:42px;
	}
	
	.counters h4 {
		font-size:1.4em;
	}

</style>
</head>
<body>
	<%@ include file = "/views/common/menubar.jsp" %>
	
	<div class="slider" id="slider">
		<div class="slItems">
			<div class="slItem" style="background-image: url('/jqt/images/car1.png');">
				<div class="slText">
				</div>
			</div>
			<div class="slItem" style="background-image: url('/jqt/images/car2.png');">
				<div class="slText">
				</div>
			</div>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	<script src="/jqt/js/slider.min.js"></script>
	<script>
	$(function(){
		$('#slider').rbtSlider({
			height: '700px', 
			'dots': true,
			'arrows': true,
			'auto': 3
		});
	});
	</script>
	<script type="text/javascript">

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-36251023-1']);
	  _gaq.push(['_setDomainName', 'jqueryscript.net']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
  </script>
	
	<div class="container" style="width:100%;padding-right:0px;padding-left:0px;">	
		<!-- 중간 소개글 -->
		<div class = "tempClass" align = "center" >
			<h1 class="javaquest" style="border-bottom:3px dashed black;">Java Quest</h1>
			<br>
		</div>
		<!-- 문제 수 영역  -->
		<div class="parallax-counter-v1 parallaxBg">
		    <div class="container-">
		        <div class="row margin-bottom-10">
		            <div class="col-sm-3 col-xs-6">
		                <div class="counters">
		                    <span class="counter">13</span>   
		                    <h4>전체 문제</h4>
		                </div>
		            </div>
		            <div class="col-sm-3 col-xs-6">
		                <div class="counters">
		                    <span class="counter">13</span> 
		                    <h4>채점 가능한 문제</h4>
		                </div>    
		            </div>
		            <div class="col-sm-3 col-xs-6">
		                <div class="counters">
		                    <span class="counter">5</span>
		                    <h4>이번주의 타임어택 참가자</h4>
		                </div>    
		            </div>
		            <div class="col-sm-3 col-xs-6">
		                <div class="counters">
		                    <span class="counter">모집 중..</span>
		                    <h4>제휴 회사 수</h4>
		                </div>    
		            </div>
		        </div>
		    </div>
		</div>
	</div> <!-- container -->
	<!-- 제일 아래 푸터 -->
	<%@ include file = "/views/common/footer.jsp" %>     
</body>
</html>