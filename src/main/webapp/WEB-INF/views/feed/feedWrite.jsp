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
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
	opacity: .5;
}
.slick-center{
	opacity: 1.0;
	width: 100%;
}
.col-sm-6 img{
	margin-top: 10px;
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
			<div class="col-sm-6" style="display:flex;flex-direction: column;">
				<div class="col-sm-12" style="display: flex; align-items: center; height: 342px; align-content: flex-start; justify-content: space-evenly;">
					<img src="http://placehold.it/180x300?text=1" id='showTop' style="width: 180px; background-color: gray; margin-right: 10px;">
					<img src="http://placehold.it/180x300?text=2" id='showBottom' style="width: 180px; background-color: gray;">
					<div class="col" style="display: flex; flex-direction: column; align-items: center; justify-content: space-around; height: 100%; flex-grow: 0">
						<img src="http://placehold.it/130x130?text=3" id='ShowCusAcc' style="width: 130px; background-color: gray;">
						<img src="http://placehold.it/130x130?text=4" id='ShowAcc' style="width: 130px; background-color: gray;">
					</div>
				</div>
				<div class="col-sm-12">
					<button type="button" class="btn btn-secondary col-sm-3" style="margin: 20px;" data-toggle="modal" data-target="#myModal">글쓰기</button>
				</div>
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
			<div class="modal fade" id="myModal">
    			<div class="modal-dialog modal-dialog-centered">
      				<div class="modal-content">
      				<form id="modal" class="form-group" action="/feed/feedWrite" method="post">
        			<!-- Modal Header -->
        				<div class="modal-header">
          					<h4 class="modal-title">게시판 글쓰기</h4>
          					<button type="button" class="close" data-dismiss="modal">&times;</button>
        				</div>
        
        				<!-- Modal body -->
        				<div class="modal-body">
         					
         						<label for="title">제목</label>
         						<input type="text" class="form-control" name="title" id="title"/>
         						
         						<div style="display: flex; margin-top: 20px; margin-bottom: 20px;">
         							<div class="col-sm-6">
         								<label for="color">color</label>
         								<select class="form-control" id="color" name="color">
        									<option>red</option>
        									<option>orange</option>
        									<option>yellow</option>
        									<option>green</option>
        									<option>skyblue</option>
        									<option>blue</option>
        									<option>pink</option>
        									<option>purple</option>
        									<option>white</option>
        									<option>black</option>
      									</select>
         							</div>
         							<div class="col-sm-6">
         								<label for="size">size</label>
         								<div style="display: flex;">
         									<input type="text" class="form-control" name="sizeTop" id="sizeTop" readonly="readonly"/>
         									<input type="text" class="form-control" name="sizeBottom" id="sizeBottom" readonly="readonly"/>
         								</div>
         							</div>
         						</div>
         						<label for="description">추가 정보</label>
         						<textarea name="description" id="description" class="form-control" rows="10"></textarea>
								<input type="hidden" id='imgTop' name="imgTop"/>
								<input type="hidden" id='imgBottom' name="imgBottom"/>
								<input type="hidden" id='imgAccCustom' name="imgAccCustom"/>
								<input type="hidden" id='imgAccReal' name="imgAccReal"/>
								<!-- userId Session으로 값넣기 기본값은 '1111' -->
								<input type="hidden" name="userId" value="${member.userId }"/>
							
        				</div>
        
        				<!-- Modal footer -->
        				<div class="modal-footer">
        					<input class="btn btn-secondary" type="submit" value="등록">
        				</div>
        				</form>
      				</div>
   		 		</div>
  			</div>
		</div>
	</div>

	<jsp:include page="../includes/footer.jsp" />
	<script type="text/javascript">
		$(document).on('ready', function() {
			//category이미지 출력
			var str ='';
			<c:forEach var="item" items="${categoryOne }">
				str += "<img src='/display?fileName=${item.image}' id='topImage' alt='${item.image}/${item.size}'style='width: 100px;'>" ;
			</c:forEach>
			$("#categoryOne").append(str);
			
			str ='';
			<c:forEach var="item" items="${categoryTwo }">
				str += "<img src='/display?fileName=${item.image}' id='bottomImage' alt='${item.image}/${item.size}'style='width: 100px;'>";
			</c:forEach>
			$("#categoryTwo").append(str);
			
			str ='';
			<c:forEach var="item" items="${categoryThree }">
				str += "<img src='/resources/images/${item.image}' id='cusAccImage' alt='${item.image}'style='width: 100px;'>";
			</c:forEach>
			$("#categoryThree").append(str);
			str ='';
			<c:forEach var="item" items="${categoryFour }">
				str += "<img src='/resources/images/${item.image}' id='accImage' alt='${item.image}'style='width: 100px;'>";
			</c:forEach>
			$("#categoryFour").append(str);
			
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
		//===========================================================
		$('#categoryOne').on('setPosition',function(event, slick){
			var image = $(this).find('.slick-center.slick-active').find('#topImage');
			var imgTop = $("#modal").find("#imgTop");
			var size = $("#modal").find("#sizeTop");
			var alt = image.attr("alt");
			console.log("alt : "+alt);
			var info = alt.split("/");
			imgTop.val(info[0]);
			size.val('#'+info[1]);
			$('#showTop').attr("src", "/display?fileName="+info[0]);
		});
		$('#categoryTwo').on('setPosition',function(event, slick){
			var image = $(this).find('.slick-center.slick-active').find('#bottomImage');
			var imgBottom = $("#modal").find("#imgBottom");
			var size = $("#modal").find("#sizeBottom");
			var alt = image.attr("alt");
			var info = alt.split("/");
			imgBottom.val(info[0]);
			size.val('#'+info[1]);
			$('#showBottom').attr("src", "/display?fileName="+info[0]);
		});
		$('#categoryThree').on('setPosition',function(event, slick){
			var image = $(this).find('.slick-center.slick-active').find('#cusAccImage');
			var input = $("#modal").find("#imgAccCustom");
			input.val(image.attr("alt"));
			$('#ShowCusAcc').attr("src", "/resources/images/"+image.attr("alt"));
		});
		$('#categoryFour').on('setPosition',function(event, slick){
			var image = $(this).find('.slick-center.slick-active').find('#accImage');
			var input = $("#modal").find("#imgAccReal");
			input.val(image.attr("alt"));
			$('#ShowAcc').attr("src", "/resources/images/"+image.attr("alt"));
		});
		//===========================================================
	</script>
</body>
</html>