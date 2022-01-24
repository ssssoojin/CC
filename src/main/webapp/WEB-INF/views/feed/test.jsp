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
   opacity: .5;
}
.slick-center{
   opacity: 1.0;
   width: 100%;
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
         <div class="col-sm-6"
            style="display: flex; align-items: center; height: 342px; align-content: flex-start; justify-content: space-evenly;">
            <img src="http://placehold.it/180x300?text=1" id='topImg'> <img
               src="http://placehold.it/180x300?text=2" id='bottomImg'>
            <div class="col"
               style="display: flex; flex-direction: column; align-items: center; justify-content: space-around; height: 100%; flex-grow: 0">
               <img src="http://placehold.it/130x130?text=3" id='cusAccImg'> <img
                  src="http://placehold.it/130x130?text=4" id='accImg'>
            </div>
            <button id="nextModal">글쓰기</button>
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
         <form id="modal">
               <input type="hidden" id='topInput'/>
               <input type="hidden" id='bottomInput'/>
               <input type="hidden" id='cusAccInput'/>
               <input type="hidden" id='accInput'/>
         </form>
      </div>
   </div>

   <jsp:include page="../includes/footer.jsp" />
   <script type="text/javascript">
      $(document).on('ready', function() {
         //category이미지 출력
         var str ='';
         <c:forEach var="item" items="${categoryOne }">
            str += "<img src='/resources/images/${item.image}' id='topImage' value='${item.image}'>";
         </c:forEach>
         $("#categoryOne").append(str);
         
         str ='';
         <c:forEach var="item" items="${categoryTwo }">
            str += "<img src='/resources/images/${item.image}' id='bottomImage' value='${item.image}'>";
         </c:forEach>
         $("#categoryTwo").append(str);
         
         str ='';
         <c:forEach var="item" items="${categoryThree }">
            str += "<img src='/resources/images/${item.image}' id='cusAccImage' value='${item.image}'>";
         </c:forEach>
         $("#categoryThree").append(str);
         str ='';
         <c:forEach var="item" items="${categoryFour }">
            str += "<img src='/resources/images/${item.image}' id='accImage' value='${item.image}'>";
         </c:forEach>
         $("#categoryFour").append(str);
         //===========================================================
         $('#categoryOne > button.slick-prev.slick-arrow').bind("click",function(){
            console.log("prev");
         });
            
         //===========================================================
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