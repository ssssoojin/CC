/**
 * 
 */
let slides = document.querySelectorAll('.home .slide');
let index = 0;

function next(){
  slides[index].classList.remove('active');
  index = (index + 1) % slides.length;
  slides[index].classList.add('active');
}

function prev(){
  slides[index].classList.remove('active');
  index = (index - 1 + slides.length) % slides.length;
  slides[index].classList.add('active');
};
	
$('#fp').hide(); // 공지사항 이전 페이지로 못 가게 하기 위함
$("#tn").hide(); // 마지막 페이지 이후로 못 가게 하기 위함