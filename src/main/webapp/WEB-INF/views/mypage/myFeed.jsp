<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/myfeed.css" />
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="container">
		<div class="row align-items-center"
			style="display: flex; justify-content: space-evenly;">
			<div class="col-sm-6"
				style="display: flex; flex-direction: column; align-items: center; justify-content: space-around; height: 30rem;">
				<img src="/resources/images/${member.img}"
					onerror="this.src='/resources/images/userImage.jpg'"
					class="rounded-circle" alt="Cinque Terre" width="200px"> <label>${member.userId }</label>
				<a href="/mypage/cart" class="btn btn-secondary col-sm-4" id="cart"
					style="flex: 0;">장바구니</a> <a href="/mypage/confirmation"
					class="btn btn-secondary col-sm-4" id="confirmation"
					style="flex: 0;">구매내역</a> <a href="/mypage/myFeed?userId=${member.userId }"
					class="btn btn-secondary col-sm-4" id="myFeed" style="flex: 0;">내가
					쓴글</a> <a href="/mypage/myInfo?userId=${member.userId }"
					class="btn btn-secondary col-sm-4" id="updateInfo" style="flex: 0;">회원정보
					수정</a>

			</div>
			<div class="col-sm-6" style="background-color: gray;">
				<section class="center slider" id="categoryOne"></section>
				<section class="center slider" id="categoryTwo"></section>
				<section class="center slider" id="categoryThree"></section>
				<section class="center slider" id="categoryFour"></section>
			</div>
			<div class="col-sm-6" style="background-color: yellow">
				<img src="/display?fileName=${myfeed.imgTop}" alt="아직 CC를 안하셨군요!" style="width:30%; height:100%;"/>
				<img src="/display?fileName=${myfeed.imgBottom}" alt="아직 CC를 안하셨군요!" style="width:30%; height:100%;"/>
				<div class="">
					<img src="/resources/images/${myfeed.imgAccCustom }" alt="아직 CC를 안하셨군요!" style="width:100%; height:50%"/>
					<img src="/resources/images/${myfeed.imgAccReal }" alt="아직 CC를 안하셨군요!" style="width:100%; height:50%"/>
				</div>
			</div>

		</div>
	</div>

	<jsp:include page="../includes/footer.jsp" />
</body>
</html>