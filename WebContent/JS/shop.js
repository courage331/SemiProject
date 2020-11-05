/* 1102 js 파일 생성*/
function shoppingOpen(nn,kind, price) {
	/*세션이 있는지 체크 
		세션이 있다면 아래 쇼핑을 실항하게
		
		세션이 없다면 다시 상점페이지로 돌아가거나, login.do로 보내면 될
	

	
	*/

	

   shopping = window.open("shopping.do?nn="+nn+"&kind=" +kind+"&price="+price, "팝업창", "width = 500, height = 615, left = 650, top = 10")
}

