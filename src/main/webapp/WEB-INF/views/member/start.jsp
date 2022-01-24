<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>COLOR CUSTOM</title>
		<meta name="description" content="A draggable menu that shows a thumbnail preview of an image grid" />
		<meta name="keywords" content="draggable, menu, navigation, thumbnails, grid, javascript, gsap, web design, layout" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="stylesheet" href="https://use.typekit.net/crf4rue.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/base.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
<script>
document.documentElement.className="js";
var supportsCssVars=function(){
	var e,t=document.createElement("style");
	return t.innerHTML="root: { --tmp-var: bold; }"
		,document.head.appendChild(t)
		,e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)"))
		,t.parentNode.removeChild(t)
		,e};supportsCssVars()||alert("Please view this demo in a modern browser that supports CSS Variables.");
</script>
	
</head>
<style>
    .grid_item{
        width: 200px;
        height: 200px;
        border-radius: 100px;

    }
</style>
<body class="loading">
    
    <main>
    <div class="page page--preview">
        <div class="grid-wrap">
            <div class="grid grid--layout-1">
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/red.png)"></div></div>
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/black.png)"></div></div>
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/blue.png)"></div></div>
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/white.png)"></div></div>
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/yellow.png)"></div></div>
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/orange.png)"></div></div>
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/purple.png)"></div></div>
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/green.png)"></div></div>
            </div>
            <div class="grid grid--layout-2">
             <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/red.png)"></div></div>
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/black.png)"></div></div>
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/blue.png)"></div></div>
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/white.png)"></div></div>
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/yellow.png)"></div></div>
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/orange.png)"></div></div>
            	<div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/purple.png)"></div></div>
                <div class="grid__item-wrap"><div class="grid__item" style="background-image: url(/resources/images/green.png)"></div></div>
            </div>
            
            <button class="gridback"><svg width="27px" height="15px" viewBox="0 0 27 15"><path d="M1.469 6.75l-.719.719 7.938 6.937.718-.719L1.47 6.75zM8.594.531L.75 7.375l.688.688L9.28 1.218 8.594.53zM1.406 6.938v1h24.75v-1H1.406z" fill="#de6565"/></svg></button>
        </div><!-- /grid-wrap -->
    </div><!-- /page -->
    <div class="menu-wrap">
        <div class="menu-draggable"></div>
        <nav class="menu">
            <div class="menu__item">
                <a class="menu__item-link">Color</a>
                <a href="/member/main" class="menu__item-explore">Start!</a>
            </div>
            <div class="menu__item">
                <a class="menu__item-link">Custom</a>
                <a  href="/member/main" class="menu__item-explore">Start!</a>
            </div>
            
        </nav><!--menu-->
    </div><!--/menu-wrap-->
</main>
<div class="cursor">
    <div class="cursor__inner cursor__inner--circle">
        <div class="cursor__side cursor__side--left"></div>
        <div class="cursor__side cursor__side--right"></div>
    </div>
</div>
<script src="/resources/js/imagesloaded.pkgd.min.js"></script>
<script src="/resources/js/charming.min.js"></script>
<script src="/resources/js/TweenMax.min.js"></script>
<script src="/resources/js/draggabilly.pkgd.min.js"></script>
<script src="/resources/js/demo.js"></script>
</body>
</html>