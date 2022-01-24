<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feed Detail Modify</title>
<link rel="stylesheet" href="/resources/css/feedDetail.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<%@ include file="../includes/header.jsp"%>
	<div class="container">
		<header class="clearfix">
			<h1>나만의 CC</h1>
		</header>
		<div class="feed-box col-md-12">
			<div>
				<div class="col-md-1"></div>
				<p class="writer col-md-2">작성자</p>
				<div class="col-md-6"></div>
				<div class="col-md-2">
					<a href="#"><img src="/resources/images/delete.png" class="icon" /></a> 
					<a href="#"><img src="/resources/images/check.png" class="icon"></a>
				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="col-md-12">
				<div class="col-md-1"></div>
				<img src="/resources/images/ma.jpg" class="feed-img col-md-10" />
			</div>
			<div class="col-md-12">
				<div class="col-md-1"></div>
				<div class="heart-location col-md-10">
					<img src="/resources/images/hearttt.png" class="heart" /> <img
						src="/resources/images/hearttt.png" class="heart" /> <img src="/resources/images/hearttt.png"
						class="heart" /> <img src="/resources/images/hearttt.png" class="heart" /> <img
						src="/resources/images/hearttt.png" class="heart" />
				</div>
			</div>
			<div class="col-md-12">
				<div class="col-md-1"></div>
				<div class="content col-md-10">
					<p class="text1 col-md-4">#color</p>
					<p class="col-md-1"></p>
					<p class="text1 col-md-5">#size</p>

					<p class="text2 col-md-12">추가정보</p>
					<p class="text3 col-md-12">자랑자랑</p>

					<div class="col-md-1"></div>
				</div>
			</div>
		</div>
	</div>
		<%@ include file="../includes/footer.jsp"%>
</body>
</html>