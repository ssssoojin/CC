<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Header</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/resources/style/reset.min.css" />
    <link rel="stylesheet" href="/resources/style/style.css" />
    <link rel="stylesheet" href="/resources/style/header-8.css" />
	<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    
  </head>
  <body>
    <!-- Header Start -->
    <header class="site-header">
      <div class="wrapper site-header__wrapper">
        <div class="site-header__start">
          <a href="#" class="brand">C <a class="header_inner">color</a><a href="#" class="brand">C </a><a a class="header_inner">custom</a>
          
        </div>
        <div class="site-header__middle">
          <nav class="nav">
            <button class="nav__toggle" aria-expanded="false" type="button">
              menu
            </button>
            <ul class="nav__wrapper">
              <li class="nav__item"><a href="/member/main">홈</a></li>
              <li class="nav__item"><a href="/feed/feedClick">게시판</a></li>
              
            </ul>
          </nav>
        </div>
        <div class="site-header__end">
          <!-- 로그인 하지 않은 상태 -->
                <c:if test = '${member == null}'>
                    <div class="login_button"><a href="/member/login">로그인</a></div>
                    <span><a href="/member/join">회원가입</a></span>                
                </c:if>  
                 <!-- 로그인한 상태 -->
                <c:if test='${member != null }'>
            <p class="loginId" style="margin-right:20px!important;"><c:out value="${member.userId}"/>님</p>
          <a href="/member/logout.do">로그아웃</a>
		<a href="/mypage/myPage">마이페이지</a>
          <a href="/mypage/cart"><i class="bi bi-cart4"></i>장바구니</a>
          
                </c:if>  
        </div>
      </div>
    </header>
    <!-- Header End -->

    <script src="/resources/js/header-8.js"></script>
  </body>
</html>
