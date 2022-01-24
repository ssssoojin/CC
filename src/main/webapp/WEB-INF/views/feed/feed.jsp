<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Feed Click</title>
<meta name="description"
	content="Blueprint: Blueprint: Google Grid Gallery" />
<meta name="keywords"
	content="google getting started gallery, image gallery, image grid, template, masonry" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="/resources/css/feedClickdemo.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/feedClickcomponent.css" />
<script src="/resources/js/feedClick_modernizr.custom.js"></script>

<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-7243260-2' ]);
	_gaq.push([ '_trackPageview' ]);
	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>

</head>
<body>
	<div class="container">
		<header class="clearfix">
			<h1>너만의 CC를 표현해봐!!</h1>
			<div class="title-line"></div>
			<!-- <div class="search">
				<input type='text' placeholder="검색어 입력" class="search-in" />
				<button class="search-btn">검색</button>
			</div> -->
		</header>
		<div class="line"></div>
		<ul>
			<li>
			<p style="background:yellow; width:300px; height:200px;"></p>
			</li>
			<li>
			<p style="background:red; width:300px; height:200px;"></p>
			</li>
			<li>
			<p style="background:blue; width:300px; height:200px;"></p>
			</li>
			<li>
			<p style="background:pink; width:300px; height:200px;"></p>
			</li>
			<li>
			<p style="background:green; width:300px; height:200px;"></p>
			</li>
			<li>
			<p style="background:yellow; width:300px; height:200px;"></p>
			</li>
			<li>
			<p style="background:red; width:300px; height:200px;"></p>
			</li>
			<li>
			<p style="background:blue; width:300px; height:200px;"></p>
			</li>
			<li>
			<p style="background:pink; width:300px; height:200px;"></p>
			</li>
			<li>
			<p style="background:green; width:300px; height:200px;"></p>
			</li>
		</ul>
		<div>
			
			<section class="slideshow">
				<ul class="animatable">
					<!-- <li class="show current">
						<figure>
							<p class="feed-writer">@작성자</p>
							<img src="/resources/images/1.png" alt="img01" />
							<p class="explain-box">오늘의 컬러는 #YELLOW 라구~!~!</p>
						</figure>
					</li> -->
					
					<c:forEach items="${all}" var="all">
						<li>
							<figure>
								<figcaption>
									<h3>작성자 : <c:out value="${all.userId }"/></h3>
									<p class="feed-writer">작성자 : <c:out value="${all.userId }"/></p>
								</figcaption>
										
						<a class='detail' href='feedDetail2?feedNo=<c:out value="${all.feedNo}"/>'>
						<div class="row align-items-center">
							<div class="col-sm-4" style="display: flex;height: 100%;justify-content: space-evenly;align-items: stretch;">
								
								<img src="/resources/images/${all.imgTop}"alt="img01" id="topImg" style="width:180px; height:300px">
								<img src="/resources/images/${all.imgBottom}"alt="img01" id="bottomImg" style="width:180px; height:300px">
								<div class="col" style="display: flex;flex-direction: column;height: 150%;flex-grow: 0;justify-content: center;">	
									<img src="/resources/images/${all.imgAccCustom}"alt="img01" id="cusAccImg" style="width:130px; height:130px">
									<img src="/resources/images/${all.imgAccReal}"alt="img01" id="accImg" style="width:130px; height:130px">									
								</div>
							</div>							
						</div></a>
								<figcaption>	
												
									<p class="explain-box">${all.title}</p>									
								</figcaption>
							</figure>
						</li>
					</c:forEach>
					

				</ul>
				<nav>
					<span class="icon nav-prev"></span> <span class="icon nav-next"></span>
					<span class="icon nav-close"></span>
				</nav>
				<div class="info-keys icon">Navigate with arrow keys</div>
			</section>
			<!-- // slideshow -->
		
		<!-- // grid-gallery -->
	</div>
	<script src="/resources/js/feedClick_imagesloaded.pkgd.min.js"></script>
	<script src="/resources/js/feedClick_masonry.pkgd.min.js"></script>
	<script src="/resources/js/feedClick_classie.js"></script>
	<script src="/resources/js/feedClick_cbpGridGallery.js"></script>
	<script>
		new CBPGridGallery(document.getElementById('grid-gallery'));
	</script>
	<!-- For the demo ad only -->
	<script src="//tympanus.net/codrops/adpacks/demoad.js"></script>
	
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>
