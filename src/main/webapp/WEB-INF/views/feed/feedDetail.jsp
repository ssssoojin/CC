<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feed Detail</title>
<link rel="stylesheet" href="/resources/css/feedDetail.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<%@ include file="../includes/header.jsp"%>

	<div class="container">
		<header class="clearfix">
		<a href="feedClick"><img src="/resources/images/feedList.png" class="icon-feedList"/></a>
			<h1 class="top-top-title">나만의 CC</h1>
		</header>
		<div class="feed-box col-md-12" style="   display: flex;   flex-direction: column;    justify-content: center;">

			<div>
				<div class="col-md-1"></div>					
						<p class="writer col-md-6">작성자 : <c:out value="${feed.userId}"/></p>				
					<!-- <p class="writer col-md-2">작성자</p>	 -->			
				<div class="col-md-2"></div>
				<div class="col-md-2">
					<a href="#"><img src="/resources/images/delete.png" class="icon" /></a>
					<a href="#"><img src="/resources/images/modify.png" class="icon"></a>
				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="col-md-12">
			<hr style="border: solid 3px #FC7B70; width:80%">
				<div class="col-md-2"></div>
				<!-- <img src="/resources/images/ma.jpg" class="feed-img col-md-10" /> -->

				<div class="row align-items-center col-md-8"
					style="box-shadow:grey 3px 1px 17px; background-color: ${feed.color}">
					<div class="col-sm-6"
						style="display: flex; height: 400px; width: 100%; align-items: stretch; /* border:1px solid pink; */ align-content: space-around; justify-content: center;">
						<img src="/resources/images/${feed.imgTop}" alt="아직 cc를 안하셨군요!"
							id="topImg" style="width: 40%; height: 100%;"> <img
							src="/resources/images/${feed.imgBottom}" alt="아직 cc를 안하셨군요!"
							id="bottomImg" style="width: 40%; height: 100%;">
						<div class="col"
							style="display: flex; flex-direction: column; height: 100%; flex-grow: 0; justify-content: center;">
							<img src="/resources/images/${feed.imgAccCustom}"
								alt="아직 cc를 안하셨군요!" id="cusAccImg"
								style="width: 100%; height: 50%"> <img
								src="/resources/images/${feed.imgAccReal}" alt="아직 cc를 안하셨군요!"
								id="accImg" style="width: 100%; height: 50%">
						</div>
					</div>
					<div class="col-sm-2"></div>
				</div>

			</div>
			<hr style="border: solid 3px #FC7B70; width:80%">
			<div class="col-md-12">
				<div class="col-md-1"></div>
				<div class="heart-location col-md-10">
					<!-- <img src="/resources/images/hearttt.png" class="heart" />  -->
					<%-- <button type="button" class="btn btn-light" id="likebtn">좋아요</button>
					<p id="like"><c:out value="${feed.hit}"/>명이 좋아합니다	</p>
					 --%>
					 <div>
					 	<span class="like-btn"></span><span class="clap-btn"></span><span class="like-btn"></span><span class="clap-btn"></span><span class="like-btn"></span><span class="clap-btn"></span>
					</div>
					<p id="like"><c:out value="${feed.hit}"/>명이 좋아합니다	</p>
        <%-- <!--Begin Third Favorite Icon-->
        <p>Do U Like this? Click!</p>		
	<a href="#" class="contain-icon icon-hook"><img src="/resources/images/heart.png"> 
        <svg class="heart-icon heart-icon-3" version="1.1" width="91px" height="85px" viewBox="0 0 90.65 85.04">
          <path class="heart-3" fill="none" stroke="#FFFFFF" stroke-width="5" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" d="
          M45.137,23.041c4.912-24.596,40.457-27.775,42.128-0.435c1.398,22.88-21.333,40.717-42.128,50.522 M45.137,23.041
          C40.225-1.555,5.057-4.734,3.387,22.606c-1.398,22.88,20.955,40.717,41.75,50.522"/>
        <p><c:out value="${feed.hit }"/>Likes</p>
     </a>
     <!-- Fin Third Favorite Icon --> --%>
     
				</div>
			</div>
			<div class="col-md-12">
				<div class="col-md-1"></div>
				<div class="content col-md-10">
				
					<p class="text1 col-md-4">#<c:out value="${feed.color}"/> </p>
					<p class="col-md-1"></p>
					<p class="text1 col-md-5">#<c:out value="${feed.size}" /></p>

					<p class="text2 col-md-12"><c:out value="${feed.title}"/></p>
					<p class="text3 col-md-12"><c:out value="${feed.description }"/></p>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>
	</div>
<script>
          // Get a list of all svg elements
icons = document.querySelectorAll('.icon-hook');

// Cycle through list
for (var i = 0; i < icons.length; i++) {
  icons[i].addEventListener('click', function(event) {
    event.preventDefault();
 
    var icon = this;
    var currentClass = icon.getAttribute('class'); // The starting class

    console.log(icon);

    if (currentClass.indexOf('active') > -1) { 
      // Remove .active
      icon.setAttribute('class', currentClass.replace(' active', ''));
    } else { 
      // Add .active
      icon.setAttribute('class', currentClass + ' active');
    }
  }, false);
}
</script>
<script>
//jQuery
$('.like-btn').on('click', function() {
   $(this).toggleClass('like-active');
});

$('.clap-btn').on('click', function() {
   $(this).toggleClass('clap-active');
});

</script>
		<%@ include file="../includes/footer.jsp"%>
</body>
</html>