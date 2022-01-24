<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/detail.css">
<link href="http://fonts.googleapis.com/css?family=Architects+Daughter" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="container">
		<!-- container left -->
        <div class="product-imgs">
			<img src="/resources/images/${item.image}" alt="shoe image">
        </div>
        <!-- container right -->
        <div class="product-content">
          <h2 class="product-title">${item.itemName}</h2>
		  <br>
          <div class="product-price">
            <p class="price">가격: <span>₩<fmt:formatNumber value="${item.price}" pattern="#,###" /></span></p>
          </div>

          <div class="product-detail">
            <h2 style="font-weight: bold; font-size: 15pt;">제품 소개</h2>
            <p>${item.detail}</p>
            <ul>
              <li>재고: <span>있음</span></li>
              <li>분류: 
					<c:choose>
						<c:when test="${item.category eq 3}">
							<span>모자</span>
						</c:when>
						<c:otherwise>
							<span>액세서리</span>
						</c:otherwise>
					</c:choose>
			  </li>
              <li>배송지역: <span>전국(제주도·도서산간 지역 제외)</span></li>
              <li>배송비: <span>무료</span></li>
            </ul>
          </div>

          <div class="purchase-info">
				<div class="handle-counter" id="handleCounter">
					<button class="counter-minus btn btn-primary">-</button>
					<input type="text" value="1">
					<button class="counter-plus btn btn-primary">+</button>
				</div>
				<br><br>
				<button type="button" class="bt" onclick="moveCart();">
              장바구니 <i class="fas fa-shopping-cart"></i>
            </button>
            <button type="button" class="bt" onclick="movePurchase();">구매하기</button>
          </div>
        </div>
      </div>
	
	<footer>
		<h3>C C. color custom</h3>
	</footer>
	
	<script src="/resources/js/handleCounter.js"></script>
	<script>
		var quantity = 1; // 수량 초기화
		var options = {
			minimum: 1, // 최소 수량
            maximize: 10, // 최대 수량
            onChange: function(cnt) {
            	quantity = cnt;
            },
            onMinimum: function(cnt) {
                console.log('reached minimum: '+ cnt);
            },
            onMaximize: function(cnt) {
                console.log('reached maximize: '+ cnt);
            }
        };
		
        $('#handleCounter').handleCounter(options);
		
		// db에 넣을 데이터
		const form = {
				userId : '${member.userId}',
				itemName : '${item.itemName}',
				color : 'ONE',
				size : 'FREE',
				quantity : '',
				price : '',
				category : '${item.category}',
				image : '${item.image}'
		}
		var price = "${item.price}";
		
		// 장바구니 버튼
		function moveCart() {
			if(confirm('장바구니에 추가하시겠습니까?')) {
				form.quantity = quantity;
				form.price = price*quantity;
				$.ajax({
					url : '/mypage/cart',
					type : 'POST',
					data : form,
					dataType: "text",
					success: function(result) {
						if(confirm('장바구니로 이동하시겠습니까?')) {
							location.href = '/mypage/cart';
						}
					}	
				});
			}
		}
		// 구매 버튼
		function movePurchase() {
			if(confirm('상품을 구매하시겠습니까?')) {
				form.quantity = quantity;
				form.price = price*quantity;
				$.ajax({
					url : '/mypage/cart',
					type : 'POST',
					data : form,
					dataType: "text",
					success: function(result) {
						location.href = '/mypage/purchase';
					}	
				});
			}
		}
	</script>
</body>
</html>