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
			<button class="btn btn-secondary" id="allCheckButton" onclick="allCheck()">전체선택</button>
			<button class="btn btn-secondary" id="delectItemButton" onclick="delectItem()">삭제</button>
			<hr style="border: solid 5px #FC7B70;">
			<ul class="cbp_tmtimeline">
					<!-- forEach -->
					<c:forEach items="${cartList}" var="cart">
					<li id="item" value="${cart.cartNo }">
						<div class="cbp_tmicon">
							<i class="fas fa-gift"></i>
						</div>
						<div class="cbp_tmlabel row align-items-center">
							<div class="col-sm-5 ">
							<c:choose>
								<c:when test="${cart.category eq 1 or cart.category eq 2}">
									<img src="/display?fileName=${cart.image}" class="rounded-circle"
									alt="Cinque Terre" width="150px">
								</c:when>
								<c:otherwise>
									<img src="/resources/images/${cart.image}" class="rounded-circle"
									alt="Cinque Terre" width="150px">
								</c:otherwise>
							</c:choose>
							</div>
							<div class="col-sm-7">
								<label for="productName">상품명</label>
								<input type="text" class="form-control form-control-sm" id="productName" readonly="readonly" value="${cart.itemName}">
								<label for="color">색상</label>
								<input type="text" class="form-control form-control-sm" id="color" readonly="readonly" value="${cart.color}">
								<label for="size">사이즈 : </label>
								<input type="text" class="form-control form-control-sm" id="size" readonly="readonly" value="${cart.size}">
								<label for="count">수량</label>
								<input type="text" class="form-control form-control-sm" id="count" readonly="readonly" value="${cart.quantity}">
								<div class="form-check-inline">
									<label class="form-check-label"> ${cart.price}&nbsp;
									<input type="checkbox" class="form-check-input" style="width: 20px; height: 20px;" id="checkItem" value="${cart.price}">
									</label>
								</div>
							</div>
						</div>
					</li>
					</c:forEach>
					
					<!-- forEach -->
			</ul>
			<hr style="border: solid 5px #FC7B70;">
			<div class="col-sm-8" style="display: flex;justify-content: flex-end;max-width: 81.92%;">
				<form action="/mypage/purchase" method="post" id="NextForm" style="width: 100%; display: flex; justify-content: flex-end;">
					<input type="text" class="form-control col-sm-3" style="text-align: right;" value="0" name="sumPrice" id="sumPrice">
					<button type="button" class="btn btn-secondary col-sm-3" onclick="selectItem()">선택</button>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp" />
	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("input:checkbox").click(function(){
				var sumPrice = $("#sumPrice");
				if($(this).prop("checked")){
					$(sumPrice).val(parseInt($(sumPrice).val())+parseInt($(this).val()));
				}
				else{
					$(sumPrice).val(parseInt($(sumPrice).val())-parseInt($(this).val()));
				}
			});			
		});
		function allCheck(){
			var items = $("input:checkbox");
			var sumPrice = 0;
			items.each(function(index,item){
				sumPrice+=parseInt($(item).val());
				$(item).prop("checked",true);
			});
			$("#sumPrice").val(sumPrice);
		}
		
		function delectItem(){
			var items = $("input:checkbox");
			
			items.each(function(index,item){
				if($(item).prop("checked")){
					var itemLi = $(item).closest("#item");
				  	$.ajax({
						url : '/mypage/cartDelete/'+parseInt($(itemLi).val()),
						type : 'POST',
						success : function(result, status, xhr) {
							console.log(result);
						}
					});
				  	$(itemLi).remove();
					$("#sumPrice").val(0);
				}
			});
		}
		
		function selectItem(){
			var items = $("input:checkbox");
			var str='';
			var checkCount = 0;
			items.each(function(index,item){
				if($(item).prop("checked")){
					var selectItem = $(item).closest("#item").val();
					str+= "<input type='hidden' name='selectItem' value='"+ selectItem +"'>"
					checkCount++;
				}
			});
			if(checkCount<=0){
				alert("상품을 선택해 주세요");
				return;
			}
			$("#NextForm").append(str);
			$("#NextForm").submit();
		}
	</script>
</body>
</html>

