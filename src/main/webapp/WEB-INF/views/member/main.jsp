<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<!-- css -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link href="/resources/css/dashboard.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/font-awesome.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<!-- js -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/base.js"></script>



</head>
<style>
@media (min-width: 1200px){
.container{
max-width: 1600px !important;}
}}
</style>

<body>
	<script>
	$('.carousel').carousel(
			{ interval: 2000 //기본 5초
				}) 
	</script>
	
	<%@include file="../includes/header.jsp"%>
	<div class="allcontainer" style="margin: 25px 0">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<br>
					<div id="demo" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<!-- 슬라이드 쇼 -->
							<div class="carousel-item active">
								<!--가로-->
								
								<img style="height: 800px" src="/display?fileName=${feed[0].imgTop }"
									alt="First slide">
								<div class="carousel-caption d-none d-md-block">
									<h5>${feed[0].title} </h5>
									<p>${feed[0].description }</p>
								</div>
								
							</div>
							<c:forEach var="feed2" items="${feed2 }">
							<div class="carousel-item">
								<img style="height: 780px" src="/display?fileName=${feed2.imgTop }"
									alt="Second slide">
									<div class="carousel-caption d-none d-md-block">
									<h5>${feed2.title }</h5>
									<p>${feed2.description }</p>
								</div>
							</div>
							
							</c:forEach>
							<!-- / 슬라이드 쇼 끝 -->
							<!-- 왼쪽 오른쪽 화살표 버튼 -->
							<a class="carousel-control-prev" href="#demo" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<!-- <span>Previous</span> -->
							</a> <a class="carousel-control-next" href="#demo" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<!-- <span>Next</span> -->
							</a>
							<!-- / 화살표 버튼 끝 -->
							<!-- 인디케이터 -->
							<ul class="carousel-indicators">
								<li data-target="#demo" data-slide-to="0" class="active"></li>
								<!--0번부터시작-->
								<li data-target="#demo" data-slide-to="1"></li>
								<li data-target="#demo" data-slide-to="2"></li>
							</ul>
							<!-- 인디케이터 끝 -->
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="container">
						<br>
						<div class="widget">
							<div class="widget-header">
								<!-- <h3>Important Shortcuts</h3> -->
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<div class="shortcuts">
									<a href="javascript:;" onclick="moveCustom(this.id);"
										class="shortcut" id="1"> <img src="https://img.icons8.com/external-kiranshastry-lineal-kiranshastry/64/000000/external-shirt-camping-kiranshastry-lineal-kiranshastry.png"/><span
										class="shortcut-label">반팔</span>
									</a> <a href="javascript:;" onclick="moveCustom(this.id);"
										class="shortcut" id="2"> <img src="https://img.icons8.com/external-bearicons-detailed-outline-bearicons/50/000000/external-Sweater-winter-holiday-bearicons-detailed-outline-bearicons.png"/><span
										class="shortcut-label">긴팔</span>
									</a> <a href="javascript:;" onclick="moveCustom(this.id);"
										class="shortcut" id="3"> <img src="https://img.icons8.com/external-icongeek26-outline-icongeek26/50/000000/external-shirt-travel-accessories-icongeek26-outline-icongeek26.png"/> <span
										class="shortcut-label">반팔셔츠</span>
									</a> <a href="javascript:;" onclick="moveCustom(this.id);"
										class="shortcut" id="4"> <img src="https://img.icons8.com/external-victoruler-outline-victoruler/64/000000/external-long-sleeve-clothes-and-outfit-victoruler-outline-victoruler.png"/> <span
										class="shortcut-label">긴팔셔츠</span>
									</a> <a href="javascript:;" onclick="moveCustom(this.id);"
										class="shortcut" id="5"> <img src="https://img.icons8.com/external-kiranshastry-lineal-kiranshastry/64/000000/external-sleeveless-shirt-fitness-kiranshastry-lineal-kiranshastry.png"/> <span
										class="shortcut-label">민소매</span>
									</a> <a href="javascript:;" onclick="moveCustom(this.id);"
										class="shortcut" id="6"> <img src="https://img.icons8.com/ios/50/000000/shorts.png"/><span
										class="shortcut-label">반바지</span>
									</a> <a href="javascript:;" onclick="moveCustom(this.id);"
										class="shortcut" id="7"><img src="https://img.icons8.com/dotty/80/000000/long-shorts.png"/><span
										class="shortcut-label">긴바지</span>
									</a> <a href="javascript:;" onclick="moveCustom(this.id);"
										class="shortcut" id="8"><img src="https://img.icons8.com/external-victoruler-outline-victoruler/50/000000/external-skirt-clothes-and-outfit-victoruler-outline-victoruler-1.png"/>
										<span class="shortcut-label">치마</span>
									</a>
								</div>
								<!-- /shortcuts -->

								<form id="form" action="/product/custom" method="post">
									<input type="hidden" id="itemNo" name="itemNo">
								</form>

							</div>
							<!-- /widget-content -->
						</div>
					</div>

					<div class="container">
						<p style="text-align: center; text-size: 20px; font-weight: bold; margin: 10px;">ITEMS</p>
						<div class="row">
							<c:forEach var="item" items="${cg3}">
								<div class="col-md-4 col-sm-6">
									<div class="product-grid" onclick="moveDetail('${item.itemNo}');">
										<div class="product-image">
											<a href="#"> 
												<img class="pic-1" src="/resources/images/${item.image}"> 
												<img class="pic-2" src="/resources/images/${item.image}">
											</a>
											
											<span class="product-new-label">NEW!</span> 
											<span class="product-discount-label">hat</span>
										</div>
										<!-- <ul class="rating">
											<li class="fa fa-star"></li>
											<li class="fa fa-star"></li>
											<li class="fa fa-star"></li>
											<li class="fa fa-star"></li>
											<li class="fa fa-star disable"></li>
										</ul> -->
										<div class="product-content">
											<h3 class="title">
												<a href="#" style="margin-right: 0px;">${item.itemName}</a>
											</h3>
											<div class="price">
												₩<fmt:formatNumber value="${item.price}" pattern="#,###" />
												<!-- <span>$20.00</span> -->
											</div>
											<a class="add-to-cart" href="">+ Add To Cart</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<br>
					<div class="container">
						<div class="row">
							<c:forEach var="item" items="${cg4}">
								<div class="col-md-4 col-sm-6">
									<div class="product-grid" onclick="moveDetail('${item.itemNo}');">
										<div class="product-image">
											<a href="#"> 
												<img class="pic-1" src="/resources/images/${item.image}"> 
												<img class="pic-2" src="/resources/images/${item.image}">
											</a>
											
											<span class="product-new-label">NEW!</span> <span
												class="product-discount-label">acc</span>
										</div>
										<!-- <ul class="rating">
											<li class="fa fa-star"></li>
											<li class="fa fa-star"></li>
											<li class="fa fa-star"></li>
											<li class="fa fa-star"></li>
											<li class="fa fa-star disable"></li>
										</ul> -->
										<div class="product-content">
											<h3 class="title">
												<a href="#" style="margin-right: 0px;">${item.itemName}</a>
											</h3>
											<div class="price">
												₩<fmt:formatNumber value="${item.price}" pattern="#,###" />
												<!-- <span>$20.00</span> -->
											</div>
											<a class="add-to-cart" href="">+ Add To Cart</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id="form1" action="/product/detail" method="post">
		<input type="hidden" id="itemNo1" name="itemNo1">
	</form>


<script>
	// 커스텀 페이지로 이동
	function moveCustom(id) {
		console.log(id);
		$('#itemNo').val(id);
		console.log("${member.userId}");
		if("${member.userId}" !== "") {
			$('#form').submit();
		} else {
			alert('로그인 후 이용해주세요');
			location.href = "/member/login";
		}
	}

	// 상품 상세페이지로 이동
	function moveDetail(id) {
		console.log(id);
		$('#itemNo1').val(id);
		if("${member.userId}" !== "") {
			$('#form1').submit();
		} else {
			alert('로그인 후 이용해주세요');
			location.href = "/member/login";
		}
	}
</script>


<!-- 	<script>
$(function(){
// 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
$('.carousel').carousel({
// 슬리아딩 자동 순환 지연 시간
// false면 자동 순환하지 않는다.
interval: 1000,
// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
pause: "hover",
// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
wrap: true,
// 키보드 이벤트 설정 여부(?)
keyboard : true
});
});
</script> -->
<%@include file="../includes/quicklist.jsp"%>
<%@include file="../includes/footer.jsp"%>
</body>
</html>