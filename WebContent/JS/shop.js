
function openC(){
		
		var frm = document.forms['shopBuy']
		
		alert(frm['pKind'].value);
		
		window.open("shopBuy.jsp","장바니","width=570, height=350, resizable = no, scrollbars = no");
		frm.target="shopBuy.jsp";
		frm.action ="shopBuy.jsp";
		frm.submit();
		
}
/* 1102 js 파일 생성*/
function shoppingOpen() {
   shopping = window.open("shopping.jsp", "팝업창", "width = 500, height = 615, left = 650, top = 10")
}
