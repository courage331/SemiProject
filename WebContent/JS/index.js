// 메인 페이지 JavaScript

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