// 충전 페이지 JavaScript
var sum = 0;

var price = document.getElementsByClassName("price_btn").length;
var cashok = document.getElementsByClassName("cashok")[0];
var close = document.getElementById("close_cash");

function chargeopen() {
	myWindow = open("charge.jsp", "팝업창", "width = 500, height = 615, left = 650, top = 10")
}

for (i = 0; i < price; i++) {
	price_btn = document.getElementsByClassName("price_btn")[i];
	
	price_btn.onclick = function() {
		var clickvalue = parseInt(this.value);
		sum+=clickvalue;
		document.getElementById("area").innerHTML = sum+"원";
		document.getElementById("bone_rs").innerHTML = sum/100+(sum/100*0.1);
		
	}
}

close.onclick = function() {
	sum = 0;
	document.getElementById("area").innerHTML = sum+"원";
	document.getElementById("bone_rs").innerHTML = sum/100+(sum/100*0.1);
}

cashok.onclick = function() {
	alert(sum+"원 결제완료");
	myWindow.close();
}

