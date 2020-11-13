//shopping js

function submit1() {
	if (session.getAttribute("c_num") == 0) {
		alert("이용불가");
		return false;

	} else {
		frm.action = "shoppingOk.do";
		frm.submit();
	}
	
}

function submit2(c_money, price) {
	console.log(c_money);
	console.log(price);
	if (c_money < price) {
		var m = confirm("뼈다귀가 부족합니다 충전하시겠습니까?");
		if (m) {
			frm.action = "charge.jsp";

		} else {

		}
	} else {
		var r = confirm("구매 하시겠습니까?");
		if (r) {
			frm.action = "shoppingOk.do";
		} else {

		}

	}
	//...
}

function btn_click(str) {
	if (str == "update") {
		var r = confirm(session.getAttribute("c_num"));

		if (r) {
			frm.action = "shopEditOk.do";
		} else {

			history.back();
		}
	} else if (str == "delete") {
		var r = confirm("삭제하시겠습니까?");
		if (r) {
			frm.action = "shopDeleteOk.do";
		} else {

		}

	}
	//...
}

function plus(){
	document.getElementsByClassName("numBox");
	documnet.getelementsById();
}
