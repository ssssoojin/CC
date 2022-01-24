<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feed Detail</title>
<link rel="stylesheet" href="/resources/css/feedDetail2.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<div class="container">
		<section class="home" id="home">
			
			<div class="slide active" style="display: flex; flex-direction: row;">

				<div class="image" style="width: 50%; position: relative; background-color: ${feed.color};">
				<div>
				<a href="feedClick"><img src="/resources/images/feedList.png"
					class="icon-feedList"></a>
				<h1 class="top-top-title">  </h1>
			</div>
					<div class=""
						style="display: flex; height: 60%; width: 100%; align-items: stretch; /* border:1px solid pink; */ align-content: space-around; justify-content: center; margin-top:100px;">
						<img src="/display?fileName=${feed.imgTop}" alt="아직 cc를 안하셨군요!"
							id="topImg" style="width: 30%; height: 100%;"> <img
							src="/display?fileName=${feed.imgBottom}" alt="아직 cc를 안하셨군요!"
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
				</div>
				<div class="content">
					<h3><c:out value="${feed.userId}"/><br>님의 CC</h3>
									
					<div class="content col-md-12">
					<div>

					<c:set var="heart" value="0"/>
					<c:choose>
						<c:when test="${heart==0}">								
							<span><a  href="javascript:" class="heart-click heart_icon${feed.feedNo}"><span class="bi bi-suit-heart">♡</span></a></span>
						</c:when>
						<c:otherwise>	
							<span><a  href="javascript:" class="heart-click heart_icon${feed.feedNo }"><span class="bi bi-suit-heart-fill">♥</span></a></span>
						</c:otherwise>
					</c:choose>
					<span id="heart${feed.feedNo}">${feed.hit}</span>
					
					

					</div>
					<p class="text1 col-md-12">#<c:out value="${feed.color}"/> </p>
					<p class="text1 col-md-12">#<c:out value="${feed.size}" /></p>
					<p class="text2 col-md-12"><c:out value="${feed.title}"/></p>
					<p class="text3 col-md-12"><c:out value="${feed.description }"/></p>
					
					<%-- <p>작성 날짜<c:out value="${feed.regDate }"/></p> --%>
					<div>
					<p>작성 날짜 <input class="form-control" name="regDate" value='<fmt:formatDate value="${feed.regDate}" pattern="yyyy/MM/dd  HH시mm분"/>' readonly="readonly" style="background:none;"></p>					
					<br>
					<%-- <p>수정 날짜<c:out value="${feed.updateDate }"/></p> --%>
					<p>수정 날짜 <input class="form-control" name="regDate" value='<fmt:formatDate value="${feed.updateDate}" pattern="yyyy/MM/dd  HH시mm분"/>' readonly="readonly" style="background:none;"></p>					
					<br>
					</div>
				</div>
				</div>
			</div>
		</section>
	</div>
	<!-- container -->
	<footer>
		<h3>C C. color custom</h3>
	</footer>

<script>
				$(".heart-click").click(function(){
					//게시물 번호(feedNo)를 idx로 전달받아 저장.					
					var feedNo = '<c:out value="${feed.feedNo}"/>';
					var hit = '<c:out value="${feed.hit}"/>';
					hit = parseInt(hit);
					console.log("heart-click");
					
					//빈하트 눌렀을 때
					if($(this).children('span').attr('class') == "bi bi-suit-heart"){
						console.log("빈하트 클릭");
						<c:set var="heart" value="1"/>	
						//Like +1하고 그 값을 불러온다.
						 $.ajax({
							url: '/feed/saveHeart.do/'+feedNo,
							type : 'post',
							success : function(result){
								//document.location.reload(true);	//페이지 새로고침
								//document.addEventListener('DOMContentLoaded', function(){})
								$('#heart'+feedNo).html(hit+result);
														
								console.log("하트 추가 성공");	
							},
							error : function(){
								alert('서버에러');
							}
						});
						console.log("꽉찬 하트로 바껴라!!!!!");
						//꽉찬 하트로 바꾸기
						$(this).html('<span class="bi bi-suit-heart-fill">♥</span>');
						$('.heart_icon' + feedNo).html('<span class="bi bi-suit-heart-fill">♥</span>');
						//$('#heart'+feedNo).html('<span id="heart${feed.feedNo}">${feed.hit}</span>');
					}else{
						<c:set var="heart" value="0"/>
							$.ajax({
								url: '/feed/removeHeart.do/'+feedNo,
								type : 'post',
								success : function(result){
									document.location.reload(true);
									
								},
								error : function(){
									alert('서버에러');
								}
							});
						$(this).html('<span class="bi bi-suit-heart">♡</span>');
						$('.heart_icon' + feedNo).html('<span class="bi bi-suit-heart">♡</span>');
					}
				})
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
	

	<%-- <%@ include file="../includes/footer.jsp"%> --%>

</body>
</html>