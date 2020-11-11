$('.slick-container').slick({
  infinite: true, //양방향 무한 모션
  speed:300, // 슬라이드 스피드
  autoplay: true, //자동플레이 유무( false시 자동플레이 안됨 )
  arrows: true, /* 화살표 */
  autoplaySpeed:3000, // 자동플레이 스피드
  slidesToShow: 1
});

var submenu = document.getElementsByClassName("submenu")[0];
var submenulist = document.getElementsByClassName("submenulist")[0];
submenu.onmouseover = function() {
	//  alert("짠");
	submenulist.style.display = '';
}

submenu.onmouseout = function() {
	//  alert("짠");
	submenulist.style.display = 'none';
}