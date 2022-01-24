<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/css/join.css">
<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<%--  <%@include file="../includes/header.jsp"%>  --%>
<div class="main-container">
<form id="join_form" method="post">
		<div class="main-wrap">
		<header>
			<div class="logo-wrap">
				<img src="/resources/images/loginlogo.png">
			</div>
		</header>
		<section class="join-input-section-wrap">
			<div class="join-input-wrap">	
				<input class ="id_input" placeholder="아이디" type="text" name="userId">
			</div>
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				<span class="final_id_ck">아이디를 입력해주세요.</span>
				
			<div class="join-input-wrap password-wrap">	
				<input class ="pw_input" placeholder="비밀번호" type="password" name="userPwd">
			</div>
			<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
			<div class="join-input-wrap passwordcheck-wrap">
				<input class ="pwck_input" placeholder="비밀번호 확인" type="password" >
			</div>
			<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
			<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
            <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
			<div class="join-input-wrap username-wrap">	
				<input class="user_input" placeholder="이름" type="text" name="userName">
			</div>
			<span class="final_name_ck">이름을 입력해주세요.</span>
			<div class="gender-wrap">
			<label>남<input type="radio" name="userSex" value="남"></label>
			<label>여<input type="radio" name="userSex" value="여"></label>
			</div>
			<div class="join-input-wrap birth-wrap">	
				<input placeholder="생년월일" type="date" name="userBirth" id="userBirth">
			</div>
			<div class="join-input-wrap email-wrap">	
				<input class="mail_input" placeholder="이메일" type="email" name="userEmail">
			</div>
			<span class="final_mail_ck">이메일을 입력해주세요.</span>
			<span class="mail_input_box_warn"></span>
			<!-- <div class="mail_check_wrap">
                    <div class="mail_check_input_box" id="mail_check_input_box_false">
                        <input class="mail_check_input" disabled="disabled">
                    </div>
                    <div class="mail_check_button">
                        <span>인증번호 전송</span>
                    </div>
                    <div class="clearfix"></div>
                    <span id="mail_check_input_box_warn"></span>
                </div> -->
               
			<div class="join-button-wrap">
				<input type="button" class="join_button" value="가입하기">
			</div>
		</section>
		<footer>
			<div class="copyright-wrap">
			<span>Color Custom </span>
			<p>©2022 All Rights Reserved.</p>
			</div>
		</footer>
		</div>
		</form>
	</div>
<script>

$(document).ready(function(){
	
	var code = ""; //이메일전송 인증번호 저장위한 코드
	/* 유효성 검사 통과유무 변수 */
	 var idCheck = false;            // 아이디
	 var idckCheck = false;            // 아이디 중복 검사
	 var pwCheck = false;            // 비번
	 var pwckCheck = false;            // 비번 확인
	 var pwckcorCheck = false;        // 비번 확인 일치 확인
	 var nameCheck = false;            // 이름
	 var mailCheck = false;            // 이메일
	 var mailnumCheck = false;        // 이메일 인증번호 확인
	
	
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		
		 /* 입력값 변수 */
        var id = $('.id_input').val();                 // id 입력란
        var pw = $('.pw_input').val();                // 비밀번호 입력란
        var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
        var name = $('.user_input').val();            // 이름 입력란
        var mail = $('.mail_input').val();            // 이메일 입력란
       
		//$("#join_form").attr("action", "/member/join");
		//$("#join_form").submit();
		
		
        /* 아이디 유효성검사 */
        if(id == ""){
            $('.final_id_ck').css('display','block');
            $('.final_id_ck').css('font-size','13px');
            idCheck = false;
            
        }else{
            $('.final_id_ck').css('display', 'none');
            $('.final_id_ck').css('font-size','13px');
            idCheck = true;
        }
        
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            $('.final_pw_ck').css('font-size','13px');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            $('.final_pw_ck').css('font-size','13px');
            pwCheck = true;
        }
        
        /* 비밀번호 확인 유효성 검사 */
        if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            $('.final_pwck_ck').css('font-size','13px');
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            $('.final_pwck_ck').css('font-size','13px');
            pwckCheck = true;
        }
 
        /* 이름 유효성 검사 */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            $('.final_name_ck').css('font-size','13px');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            $('.final_name_ck').css('font-size','13px');
            nameCheck = true;
        }
        
        /* 이메일 유효성 검사 */
        if(mail == ""){
            $('.final_mail_ck').css('display','block');
            $('.final_mail_ck').css('font-size','13px');
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            $('.final_mail_ck').css('font-size','13px');
            mailCheck = true;
        }
        
        /* 최종 유효성 검사 */
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck){
        	$("#join_form").attr("action", "/member/join");
            $("#join_form").submit();   
        }    
        return false; 

	});
	
	//아이디 중복검사
	$('.id_input').on("propertychange change keyup paste input", function(){

		var userId = $('.id_input').val();			// .id_input에 입력되는 값
		var data = {userId : userId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "/member/joinIdChk",
			data : data,
			success : function(result){
				console.log("성공 여부" + result);
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");		
					// 아이디 중복이 없는 경우
					idckCheck = true;
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");	
					// 아이디 중복된 경우
					idckCheck = false;
				}
			}// success 종료
		}); // ajax 종료	
	});
	
	/* 인증번호 이메일 전송 
	$(".mail_check_button").click(function(){
		 var email = $(".mail_input").val();            // 입력한 이메일
		 var checkBox = $(".mail_check_input");        // 인증번호 입력란
		 var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
		 var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
		   // 이메일 형식 유효성 검사 
		    if(mailFormCheck(email)){
		        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
		        warnMsg.css("display", "inline-block");
		    } else {
		        warnMsg.html("올바르지 못한 이메일 형식입니다.");
		        warnMsg.css("display", "inline-block");
		        return false;
		    }  
		  $.ajax({
		        
		        type:"GET",
		        url:"mailCheck?email=" + email,
		        success:function(data){
		        	checkBox.attr("disabled",false);
		        	boxWrap.attr("id", "mail_check_input_box_true");
		        	code = data;
		        }
		                
		    });
	}); 

	 
	 인증번호 비교 
	$(".mail_check_input").blur(function(){
	    
	    var inputCode = $(".mail_check_input").val();        // 사용자 입력코드    
	    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
	    
	    if(inputCode == code){                            // 일치할 경우 (inputCode : 사용자 입력 번호 / code : 이메일로 전송된 인증번호)
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct"); 
	        mailnumCheck = true;     // 일치할 경우
	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	        mailnumCheck = false;    // 일치하지 않을 경우
	    }    
	    
	});*/

	 
	/* 비밀번호 확인 일치 유효성 검사 */
	 
	$('.pwck_input').on("propertychange change keyup paste input", function(){
	 
	    var pw = $('.pw_input').val();
	    var pwck = $('.pwck_input').val();
	    $('.final_pwck_ck').css('display', 'none');
	 
	    if(pw == pwck){
	        $('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
	    }else{
	        $('.pwck_input_re_1').css('display','none');
	        $('.pwck_input_re_2').css('display','block');
	        pwckcorCheck = false;
	    }        
	    
	});     
	 /* 입력 이메일 형식 유효성 검사 */
	 function mailFormCheck(email){
		 var form =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		 return form.test(email);
	}
	 
	
});

</script>
</body>
</html>