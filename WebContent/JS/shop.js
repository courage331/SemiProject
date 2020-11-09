/* 1102 js 파일 생성*/
function shoppingOpen(pName,kind, price, pNum, pCnt) {
	
   shopping = window.open("shopping.do?pName="+pName+"&kind=" +kind+"&price="+price+"&pNum="+pNum+"&pCnt="+pCnt, "팝업창", "width = 500, height = 615, left = 650, top = 10")
}

function editOpen(pName,kind, price, pNum, pCnt) {
	
   shopping = window.open("shoppingEdit.do?pName="+pName+"&kind=" +kind+"&price="+price+"&pNum="+pNum+"&pCnt="+pCnt, "팝업창", "width = 500, height = 615, left = 650, top = 10")
}

