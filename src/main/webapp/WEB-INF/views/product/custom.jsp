<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Let's custom!</title>
<link rel="stylesheet" href="/resources/css/custom.css">
<link href="http://fonts.googleapis.com/css?family=Architects+Daughter" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<!-- font awesome cdn link  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/css/lightgallery.min.css">

<!-- color picker -->
<link rel="stylesheet" href="/resources/css/colorPick.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<style>
</style>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="container">
		<section class="home" id="home">
			<div class="slide active">
				<div class="image">
					<h3 style="font-size: 30pt;">#${product.itemName}</h3>
					<img src="/resources/images/${product.image}" alt="">
				</div>
				<div class="content">
					<h3>공지사항</h3>
					<p style="line-height:50px; font-size: 20pt;">
						세상에 하나뿐인 옷이 여기에!<br><br>
						첫 번째, 옷 색상을 선택해 주세요.<br>
						두 번째, 사이즈를 선택해 주세요.<br>
						세 번째, 이미지를 선택해 주세요.<br><br>
						지금 만들어볼까요?
					<div class="controls">
						<div class="fas fa-angle-left" id="fp" onclick="prev()"></div>
						<div class="fas fa-angle-right" id="fn" onclick="next()"></div>
					</div>
				</div>
			</div>

			<div class="slide">
				<div class="image">
					<img class="custom_img" src="/resources/images/${product.image}" alt="">
					<button class="delete-button">
						<span class="icon"> 
							<span class="lid"></span> 
							<span class="can">
							</span> <span class="trash"></span> 
							<span class="text">Reset!</span>
						</span>
					</button>
					<div class="attachImgWrapper">
						<div class="attachImg"></div>
					</div>
				</div>
				<div class="content">
					<p style="margin-top: -30px; margin-bottom: -100px;">색상·수량·사이즈</p>
					<div class="box" style="height:150px;">
						<div class="item">
							색상&nbsp;&nbsp;&nbsp;<div style="margin-right: 150px;" class="picker"></div>
							수량&nbsp;&nbsp;&nbsp;
							<div class="handle-counter" id="handleCounter">
								<button class="counter-minus btn btn-primary">-</button>
								<input type="text" value="1">
								<button class="counter-plus btn btn-primary">+</button>
							</div>
						</div>
						<div class="item" style="padding-top: 10px;">
							사이즈&nbsp;&nbsp;&nbsp;
							<select id="selectSize" class="w3-input w3-border w3-round-large" name="size">
								<option value="" disabled selected>사이즈를 선택하세요.</option>
								<option value="1">XS</option>
								<option value="2">S</option>
								<option value="3">M</option>
								<option value="4">L</option>
								<option value="5">XL</option>
							</select>
						</div>
					</div>
					<p style="margin-top: -50px; margin-bottom: -100px;">이미지</p>
					<div class="box">
						<div class="item uploadDiv">
							<input type="file" class="form-control-file" id="file" name="uploadFile" multiple>
						</div>
						<div class="item">
							<div class="uploadResult">
								<ul></ul>
							</div>
						</div>
					</div>
					<div class="controls">
						<div class="fas fa-angle-left" onclick="prev()"></div>
						<div class="fas fa-angle-right" onclick="saveCustom();"></div>
					</div>
				</div>
			</div>

			<div class="slide">
				<div class="image" id="result_img">
					<img class="custom_img" src="/resources/images/${product.image}" alt="">
					<div class="attachImgWrapper resultWrapper">
						<div class="attachImg resultImg"></div>
					</div>
				</div>
				<div class="content">
					<p style="margin-top: 50px; margin-bottom: -30px;">결제 정보</p>
					<div class="receipt">
						<header class="receipt__header">
							<p class="receipt__title">CC</p>
							<span>${product.itemName}</span>
						</header>
						<dl class="receipt__list">
							<div class="receipt__list-row">
								<dt class="receipt__item">색상</dt>
								<dd class="receipt__cost color"></dd>
							</div>
							<div class="receipt__list-row">
								<dt class="receipt__item">사이즈</dt>
								<dd class="receipt__cost size"></dd>
							</div>
							<div class="receipt__list-row">
								<dt class="receipt__item">수량</dt>
								<dd class="receipt__cost quantity"></dd>
							</div>
							<br>
							<div class="receipt__list-row">
								<dt class="receipt__item">기본 금액</dt>
								<dd class="receipt__cost">￦<fmt:formatNumber value="${product.price}" pattern="#,###" /></dd>
							</div>
							<div class="receipt__list-row">
								<dt class="receipt__item">이미지 아이콘</dt>
								<dd class="receipt__cost">￦<span class="imgIcon"></span></dd>
							</div>
							<div class="receipt__list-row receipt__list-row--total">
								<dt class="receipt__item">Total</dt>
								<dd class="receipt__cost">￦<span class="total"></span></dd>
							</div>
						</dl>
					</div>
					<div class="btn-grp">
						<button type="button" class="btn" onclick="moveCart();">
							장바구니 <i class="fas fa-shopping-cart"></i>
						</button>
						<button type="button" class="btn" onclick="movePurchase();">구매하기</button>
					</div>
					<div class="controls">
						<div class="fas fa-angle-left" id="tp" onclick="prev()"></div>
						<div class="fas fa-angle-right" id="tn" onclick="next()"></div>
					</div>
				</div>
			</div>
		</section>	
	</div>
	<!-- container -->
	
	<footer>
		<h3>C C. color custom</h3>
	</footer>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/js/lightgallery.min.js"></script>
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

	<!-- custom js file link -->
	<script src="/resources/js/custom.js"></script>
	<script src="/resources/js/colorPick.min.js"></script>
	
	<script src="/resources/js/handleCounter.js"></script>
	
	<script type="text/javascript">
		// 수량 버튼
		var quantity = 1; // 수량 초기화
		var options = {
			minimum: 1, // 최소 수량
	        maximize: 20, // 최대 수량
	        onChange: function(cnt) {
	        	quantity = cnt;
	        	console.log(quantity);
	        },
	        onMinimum: function(cnt) {
	            console.log('reached minimum: '+ cnt);
	        },
	        onMaximize: function(cnt) {
	            console.log('reached maximize: '+ cnt);
	        }
	    };
		
	    $('#handleCounter').handleCounter(options);
	
	
	
		let curColor;
		let curSize;
		let icon = false;
		
		// 썸네일 클릭 이벤트
		function showImage(fileCallPath) {
			icon = true;
			$(".attachImg").show();
			$(".attachImg")
			.html("<img src='/display?fileName=" + encodeURI(fileCallPath) + "'>")
			.css({width: '100%', height: '100%'});
			
			// 이미지를 다시 클릭하면 사라지도록 처리
			$(".attachImg").on("click", function(e) {
				$('.attachImg').hide();
				icon = false;
			});
			
			// 결과 페이지 이미지는 클릭해도 사라지지 않게 처리
			$('.resultImg').on("click", function(e) {
				$('.attachImg').show();
				$('.resultImg').show();
			});
		}
		
		// 정규식을 이용해서 파일 확장자 체크
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|txt|xlsx|pdf|html|css|jsp|show|hwp|mp4|java|xml)$");
		var maxSize = 5242880;
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert("파일 크기 초과");
				return false;
			}
			if(regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드 할 수 없음");
				return false;
			}
			return true;
		}
		
		// <input type="file"> 내용이 변경되는 것을 감지해서 무조건 업로드 처리
		$("input[type='file']").change(function(e) {
			// 파일 업로드
			// ajax 이용하는 경우에는 FormData 객체 이용 (form 태그와 같은 역할)
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			
			// add filedata to formdata
			for(var i = 0; i < files.length; i++) {
				if(!checkExtension(files[i].name, files[i].size)) { // 파일 확장자 체크
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			console.log("files.length : " + files.length);
			
			$.ajax({
				url : '/uploadAjaxAction',
				processData : false, // 전달할 데이터를 query string을 만들지 말 것
				contentType : false,
				data : formData, // 전달할 데이터
				type : 'POST',
				dataType: 'json', // 데이터 타입: json
				success : function (result) {
					//alert('Uploaded');
					console.log(result);
					showUploadedFile(result); // json 형태의 업로드 결과를 인자로 줌	
				}
			}); // $.ajax
		});
		
		var uploadResult = $(".uploadResult ul");
		function showUploadedFile(uploadResultArr) {
			if(!uploadResultArr || uploadResultArr.length == 0) {
				return;
			}
			var str = "";
			$(uploadResultArr).each(function(i, obj) {
				// 썸네일 나오게 처리
				var fileCallPath = encodeURIComponent(obj.uploadPath +  "/s_" + obj.uuid + "_" + obj.fileName);
				var originPath = obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName;
				console.log("originPath1 : " + originPath);
				originPath = originPath.replace(new RegExp(/\\/g), "/"); // \를 /로 통일
				console.log("originPath2 : " + originPath);
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='delete'></button><br>";
				str += "<a href=\"javascript:showImage(\'" + originPath + "\')\"><img src='/display?fileName=" + fileCallPath + "'></a>";
				str += "</div></li>";
			});
			uploadResult.append(str); // 요소 추가 (<li> 추가)
		} // showUploadedFile
		
		// 버튼 클릭시 삭제
		$(".uploadResult").on("click", "button", function(e) {
			//alert("delete file");
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url: '/deleteFile',
				data: {fileName: targetFile, type: type},
				dataType: 'text',
				type: 'post',
				success: function(result) {
					//alert(result);
					targetLi.remove(); // li 삭제
					$("input[type='file']").val(''); // 업로드 성공 후 초기 상태로 복원
				}
			}); // $.ajax
		}); // uploadResult
		
		
		// 옷에 이미지 넣는 위치 지정
		var tshirt = {
			top: "45%",
		    left: "34.1%",
			width: "250px",
			height: "250px"
		};
		
		var shirt = {
			top : "36%",
			left : "53.5%",
			width : "100px",
			height : "100px"
		};

		var short_pants = {
			top : "36%",
			left : "33.5%",
			width : "100px",
			height : "100px",
			transform: "skew(-5deg, 5deg)"
		};

		var pants = {
			top : "36%",
			left : "36.1%",
			width : "80px",
			height : "235px",
			transform: "skew(-5deg, 7deg)"
		};
		
		// 옷에 따라 맞는 css 적용
		var itemNo = "${product.itemNo}";
		if(itemNo == "3" || itemNo == "4") {
			$('.attachImgWrapper').css(shirt);
		} else if(itemNo == "6") {
			$('.attachImgWrapper').css(short_pants);
		} else if(itemNo == "7") {
			$('.attachImgWrapper').css(pants);
		} else {
			$('.attachImgWrapper').css(tshirt);
		}
			
		// 옷 색상 변경
		$(".picker").colorPick(
				{
					'initialColor' : 'white',
					//'palette': ["#1abc9c", "#16a085", "#2ecc71", "#27ae60", "#3498db", "#2980b9", "#9b59b6", "#8e44ad", "#34495e", "#2c3e50", "#f1c40f", "#f39c12", "#e67e22", "#d35400", "#e74c3c", "#c0392b", "#ecf0f1"],
					'palette' : [ "red", "orange", "yellow", "green",
							"skyblue", "blue", "pink", "purple", "white",
							"black" ],
					'onColorSelected' : function() {
						console.log("The user has selected the color: "
								+ this.color);
						this.element.css({
							'backgroundColor' : this.color,
							'color' : this.color
						});
						$('.custom_img').css({
							'backgroundColor' : this.color
						});
						// 옷 색상에 관계없이 이미지 위치 잘 보이도록 변경
						if (this.color == "WHITE" || this.color == "YELLOW") {
							// big_style.border = '3px dotted black';
							// console.log(big_style.border);
							$('.attachImgWrapper').css({
								'border' : '3px dotted black'
							});
						} else {
							// big_style.border = '3px dotted white';
							$('.attachImgWrapper').css({
								'border' : '3px dotted white'
							});
						}
						setColor(this.color);
					}
				});

		// 색 변경될 때마다 호출
		function setColor(color) {
			curColor = color;
		}

		// 사이즈 정보 저장
		$('#selectSize').on('change', function() {
			curSize = $("#selectSize option:selected").text();
		});

		// 커스텀 정보 넘김
		function saveCustom() {
			// 커스텀 정보 저장
			var custom = {
				'color' : curColor,
				'size' : curSize,
				'quantity': quantity
			};
			// console.log(custom.size);
			if (custom.size === undefined) {
				alert('사이즈를 선택해주세요');
				return;
			}

			$('.color').html(custom.color);
			$('.size').html(custom.size);
			$('.quantity').html(custom.quantity);
			
			if(icon) { // 이미지 아이콘 있을 때
				var price = "${product.price+5000}";
				console.log("1 " + price);
				$('.imgIcon').html("5,000");
			} else {
				var price = "${product.price}";
				console.log("1 " + price);
				$('.imgIcon').html("0");
			}
			var total = Number(price) * Number(custom.quantity);
			console.log("2 " + total);
			$('.total').html(total.toLocaleString());
			
			// console.log(custom.color, custom.size);
			next(); // 다음 페이지로 이동
		}

		// 리셋 버튼
		const deleteButton = $('.delete-button');
		deleteButton.on('click', function() {
			deleteButton.addClass('clicked');

			// 색, 이미지 초기화
			$('.custom_img').css({
				'backgroundColor' : 'WHITE'
			});
			$('.attachImg').hide();
			$('.attachImgWrapper').css({
				'border' : '3px dotted black'
			});

			setTimeout(function() {
				console.log('Works!');
				deleteButton.removeClass('clicked');
			}, 1000);

		});

		// 장바구니 버튼
		function moveCart() {
			screenShot("1", $('#result_img'));
		}

		// 구매 버튼
		function movePurchase() {
			screenShot("2", $('#result_img'));
		}

		// 이미지 캡쳐 및 업로드
		function screenShot(flag, target) {
			if (target != null && target.length > 0) {
				var t = target[0];
				html2canvas(t).then(
						function(canvas) {
							var myImg = canvas.toDataURL();
							myImg = myImg.replace("data:image/png;base64,", "");
							$.ajax({
								url : '/saveCapture',
								data : {
									"imgSrc" : myImg,
									"itemName" : "${product.itemName}"
								},
								type : 'POST',
								dataType : 'json',
								success : function(result) {
									console.log(result);
									var fileCallPath = encodeURIComponent(result.uploadPath + "/" + result.uuid + ".png");
									console.log(fileCallPath);
									transferData(flag, fileCallPath);
								},
								error : function(a, b, c) {
									alert("error");
								}
							});
						});
			}
		}

		function transferData(flag, fileCallPath) {
			// db에 넣을 데이터
			var form = {
				userId : '${member.userId}',
				itemName : '${product.itemName}',
				color : $('.color').text(),
				size : $('.size').text(),
				quantity : quantity,
				price : $('.total').text().replace(",", ""),
				category : '${product.category}',
				image : fileCallPath
			};
			
			if(flag == "1") { // 장바구니
				if (confirm('장바구니에 추가하시겠습니까?')) {
					$.ajax({
						url : '/mypage/cart',
						type : 'POST',
						data : form,
						dataType : "text",
						success : function(result) {
							if (confirm('장바구니로 이동하시겠습니까?')) {
								location.href = '/mypage/cart';
							}
						}
					});
				}
			} else { // 구매
				if (confirm('상품을 구매하시겠습니까?')) {
					$.ajax({
						url : '/mypage/cart',
						type : 'POST',
						data : form,
						dataType : "text",
						success : function(result) {
							location.href = '/mypage/purchase';
						}
					});
				}
			}
		}
	</script>
</body>
</html>