<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<style>


.like-btn,
.clap-btn {
  display: inline-block;
  Cursor: pointer;
  width: 80px;
  height: 80px;
}

.like-btn {
  background: url('https://i.ibb.co/vw78mf3/heart.png') no-repeat 0% 50%;
  background-size: 2900%;
}

.clap-btn {
  background: url('https://i.ibb.co/GVsbrFF/claps.png') no-repeat 0% 50%;
  background-size: 900%;
 }

.like-active,
.clap-active {
  animation-name: animate;
  animation-duration: .8s;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
}
.like-active {
  animation-timing-function: steps(28);
}

.clap-active {
   animation-timing-function: steps(8);
}
@keyframes animate {
  0%   { background-position: left;  }
  50%  { background-position: right; }
  100% { background-position: right; }
}
</style>
</head>
<body>
<input id="toggle-heart" type="checkbox"/>
<label for="toggle-heart" aria-label="like">❤</label>

<div>
  <span class="like-btn"></span>
</div>


<div>
  <span class="clap-btn"></span>
</div>

<script>
//jQuery
$('.like-btn').on('click', function() {
   $(this).toggleClass('like-active');
});

$('.clap-btn').on('click', function() {
   $(this).toggleClass('clap-active');
});

</script>

</body>
</html>