/* 1102 js 파일 생성*/
function shoppingOpen(pName,kind, price, pNum) {
	
   shopping = window.open("shopping.do?pName="+pName+"&kind=" +kind+"&price="+price+"&pNum="+pNum, "팝업창", "width = 500, height = 615, left = 650, top = 10")
}

