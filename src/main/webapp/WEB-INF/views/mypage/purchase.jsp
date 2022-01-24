<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blueprint: Vertical Timeline</title>
<meta name="description" content="Blueprint: Vertical Timeline" />
<meta name="keywords"
	content="timeline, vertical, layout, style, component, web development, template, responsive" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="../resources/css/cart_default.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/cart_component.css" />
<script src="../resources/js/modernizr.custom.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
	integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="../includes/header.jsp" />
	<div class="container">
		<div class="Cartmain">
			<hr style="border: solid 5px #FC7B70;">
			<!-- 사용자 정보 입력 -->
			<div class= "row divinfo" style="display: flex; margin: 0 25% 15px 25%;">
				<label class="col-sm-3" for="userName">수령인</label>
 				<input type="text" class="form-control col-sm-9" placeholder="수령인" id="userName">
 				<label class="col-sm-3" for="phoneNo">휴대전화</label>
 				<input type="text" class="form-control col-sm-9" placeholder="휴대전화" id="phoneNo">
				<label class="col-sm-3" for="address">배송지 주소</label>
 				<input type="text" class="form-control col-sm-9" placeholder="배송지 주소" id="address">
				<label class="col-sm-3" for="detailaddress">상세 주소</label>
 				<input type="text" class="form-control col-sm-9" placeholder="상세 주소" id="detailaddress">
				<label class="col-sm-3" for="Delmemo">배송 메모</label>
				<select class="form-control col-sm-9" id="Delmemo">
					<option selected="selected">배송메모를 선택해 주세요.</option>
				</select>
			</div>
			<!-- 사용자 정보 입력 -->
			<ul class="cbp_tmtimeline">
				<!-- forEach -->
				<c:forEach var="item" items="${itemList}">
				<li>
					<div class="cbp_tmicon">
						<i class="fas fa-gift"></i>
					</div>
					<div class="cbp_tmlabel row align-items-center">
						<div class="col-sm-5 ">
							<c:choose>
								<c:when test="${item.category eq 1 or item.category eq 2}">
									<img src="/display?fileName=${item.image}" class="rounded-circle"
									alt="Cinque Terre" width="150px">
								</c:when>
								<c:otherwise>
									<img src="/resources/images/${item.image}" class="rounded-circle"
									alt="Cinque Terre" width="150px">
								</c:otherwise>
							</c:choose>
							<h2 style="text-align: center; font-size: 25px;">${item.itemName }</h2>
						</div>
						<div class= "col-sm-7 row divinfo" style="display: flex;">
							<label class="col-sm-3" for="color">색상</label>
 							<input type="text" class="form-control col-sm-9" readonly placeholder="${item.color }" id="color">
 							<label class="col-sm-3" for="size">사이즈</label>
 							<input type="text" class="form-control col-sm-9" readonly placeholder="${item.size }" id="size">
 							<label class="col-sm-3" for="count">수량</label>
 							<input type="text" class="form-control col-sm-9" readonly placeholder="${item.quantity }" id="count">
							<input type="text" class="form-control col-sm-12" readonly placeholder="${item.price }" id="price">
						</div>
					</div>
				</li>
				</c:forEach>
				<!-- forEach -->
				<li>
					<input type="text" class="form-control col-sm-5" readonly value="${sumPrice}" id="priceSum" style="margin-left: 40% ">
				</li>
			</ul>
			<hr style="border: solid 5px #FC7B70;">
		</div>
		<button type="button" class="btn btn-secondary col-sm-5" style="left:25%;" onclick="Purchase()">구매</button>
		<form action="/mypage/purchaseCompleted" method="post" id="purchaseCompleted">
		</form>
	</div>
	<jsp:include page="../includes/footer.jsp" />
	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		function Purchase(){
			var str='';
			<c:forEach var="item" items="${itemList}">
				str+= '<input type="hidden" name="itemIndex" value="'+${item.cartNo}+'" >';
			</c:forEach>
			str += '<input type="hidden" name="recipient" value="'+$("#userName").val()+'" >';
			str += '<input type="hidden" name="phone" value="'+$("#phoneNo").val()+'" >';
			str += '<input type="hidden" name="address" value="'+$("#address").val()+'" >';
			str += '<input type="hidden" name="detailaddress" value="'+$("#detailaddress").val()+'" >';
			str += '<input type="hidden" name="deliveryMemo" value="'+$("#Delmemo").val()+'" >';
			str += '<input type="hidden" name="price" value="'+$("#priceSum").val()+'" >';
			
			$("#purchaseCompleted").append(str);
			$("#purchaseCompleted").submit();
		}
	</script>
</body>
</html>

