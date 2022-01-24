<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quick list</title>
</head>
<style>

.quick_area { position: fixed; top: 500px; right: 0; width: 94px; z-index: 100; }
.quick_area > .quick_list > li { text-align: center; background-color: #282828; font-size: 15px; }
.quick_area > .quick_list > li > a { display: block; padding: 15px 0; border-top: 1px solid #4d4d4d;}
.quick_area > .quick_list > li:first-child a { border-top: none; }
.quick_area > .quick_list > li > a > h3 { padding-bottom: 10px; color: #ddd; letter-spacing: -2px; }
.quick_area > .quick_list > li:last-child > a > h3 { padding-bottom: 0; }
.quick_area > .quick_list > li > a > p { line-height: 1.3; font-size: 12px; color: #fff; }

.quick_area > .quick_list > .to_top { text-align: center; background-color: #fff;}
.quick_area > .quick_list > .to_top a {
 display: block; 
 height: 45px;
  box-sizing: border-box;
   text-indent: -9999px; 
   overflow: hidden; 
   border-left: 1px solid #a3a3a3;
    border-bottom: 1px solid #a3a3a3;
     background: url(/resources/images/ico_totop.png) no-repeat center;
      background-size: 50%; }
</style>
<body>
    <!-- quick list -->
    <div class="quick_area" >
        <ul class="quick_list">
            <li class="tel"><a href="tel:02-1111-1111" style="margin:0 !important"><h3>고객센터</h3><p>02-1111-1111</p></a></li>
            <li class="kakao"><a href="#" style="margin:0 !important"><h3>카카오톡 <em>상담</em></h3><p>1:1상담</p></a></li>
            <li class="cart"><a href="/mypage/cart" style="margin:0 !important"><h3 class="to_content">장바구니</h3></a></li>
        	<li class="to_top"><a href="#" style="margin:0 !important">TOP</a></li>
        </ul>
    </div>
    <!-- quick list 끝-->
</body>
</html>