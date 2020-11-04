
function chkSubmit(){
	frm = document.forms["frm"];
	
	
	var pName = frm["pName"].value.trim(); //상품이름
	var pKind = frm["pKind"].value.trim(); //상품종류
	var pPrice = frm["pPrice"].value.trim(); //상품가격
	var pCnt = frm["pCnt"].value.trim(); //재고수량
	
	if(pName == ""){
		alert("상품명은 반드시 입력해야 합니다");
		alert(pName);
		frm["pName"].focus();
		return false;
	}
	
	if(pKind == ""){
		alert("상품종류 반드시 작성해야 합니다");
		alert(pName);
		alert(pKind);
		frm["pKind"].focus();
		return false;
	}
	
	if(pPrice == ""){
		alert("가격은 반드시 작성해야 합니다");
		alert(pName);
		alert(pKind);
		alert(pPrice);
		frm["pPrice"].focus();
		return false;
	}
	
	if(pCnt == ""){
		alert("재고수량은 반드시 작성해야 합니다");
		alert(pName);
		alert(pKind);
		alert(pPrice);
		alert(pCnt);
		frm["pCnt"].focus();
		return false;
	}
	
	
	return true;	
} // end chkSubmit()