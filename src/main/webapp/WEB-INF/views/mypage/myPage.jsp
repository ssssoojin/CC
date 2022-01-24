<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/slick.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/slick-theme.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
}

* {
	box-sizing: border-box;
}

.slider {
	width: 100%;
	margin: 30px auto;
}

.slick-slide {
	margin: 0px 20px;
}

.slick-slide img {
	width: 100%;
}

.slick-prev:before, .slick-next:before {
	color: black;
}

.slick-slide {
	transition: all ease-in-out .3s;
	opacity: .2;
}

.slick-active {
	opacity: 1;
}

.slick-current {
	opacity: 1;
}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/slick.js" type="text/javascript"
		charset="utf-8"></script>
	<jsp:include page="../includes/header.jsp" />
	<div class="container">
		<div class="row align-items-center">
			<div class="col-sm-6" style="display: flex;flex-direction: column;align-items: center;justify-content: space-around;height: 30rem;">
				<img src="/resources/images/${member.img}" onerror="this.src='/resources/images/userImage.jpg'" class="rounded-circle" alt="Cinque Terre" width="200px">
				<label>${member.userId }</label>
				<a href="/mypage/cart" class="btn btn-secondary col-sm-4" id="cart" style="flex: 0;">장바구니</a>
				<a href="/mypage/confirmation" class="btn btn-secondary col-sm-4" id="confirmation" style="flex: 0;">구매내역</a>
				<a href="/mypage/myInfo?userId=${member.userId }" class="btn btn-secondary col-sm-4" id="updateInfo" style="flex: 0;">회원정보 수정</a>

			</div>
			<div class="col-sm-6" style="background-color: gray;">
				<section class="center slider" id="categoryOne">
					
				</section>
				<section class="center slider" id="categoryTwo">
					
				</section>
				<section class="center slider" id="categoryThree">
					
				</section>
				<section class="center slider" id="categoryFour">
					
				</section>
			</div>
		</div>
	</div>

	<jsp:include page="../includes/footer.jsp" />
	<script type="text/javascript">
		$(document).on('ready', function() {
			//category이미지 출력
			var str ='';
			<c:forEach var="item" items="${categoryOne }">
				str += "<img src='/display?fileName=${item.image}' id='topImage' alt='${item.image}/${item.size}'>";
			</c:forEach>
			$("#categoryOne").append(str);
			
			str ='';
			<c:forEach var="item" items="${categoryTwo }">
				str += "<img src='/display?fileName=${item.image}' id='bottomImage' alt='${item.image}/${item.size}'>";
			</c:forEach>
			$("#categoryTwo").append(str);
			
			str ='';
			<c:forEach var="item" items="${categoryThree }">
				str += "<img src='/resources/images/${item.image}' id='cusAccImage' alt='${item.image}'>";
			</c:forEach>
			$("#categoryThree").append(str);
			str ='';
			<c:forEach var="item" items="${categoryFour }">
				str += "<img src='/resources/images/${item.image}' id='accImage' alt='${item.image}'>";
			</c:forEach>
			$("#categoryFour").append(str);
			//=====================================================
			$('.center').slick({
				  centerMode: true,
				  centerPadding: '60px',
				  slidesToShow: 3,
				  responsive: [
				    {
				      breakpoint: 768,
				      settings: {
				        arrows: false,
				        centerMode: true,
				        centerPadding: '40px',
				        slidesToShow: 3
				      }
				    },
				    {
				      breakpoint: 480,
				      settings: {
				        arrows: false,
				        centerMode: true,
				        centerPadding: '40px',
				        slidesToShow: 1
				      }
				    }
				  ]
			});
		});	
	</script>
</body>
</html>