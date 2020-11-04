

function openC(){
		
		var frm = document.forms['shopBuy']
		
		alert(frm['pKind'].value);
		
		window.open("shopBuy.jsp","장바니","width=570, height=350, resizable = no, scrollbars = no");
		frm.target="shopBuy.jsp";
		frm.action ="shopBuy.jsp";
		frm.submit();
		
}
