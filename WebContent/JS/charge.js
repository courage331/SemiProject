// 충전 페이지 JavaScript
var sum = 0;
var cash = sum/100+(sum/100*0.1);

var price = document.getElementsByClassName("price_btn").length;
var cashok = document.getElementsByClassName("cashok")[0];
var closecash = document.getElementById("close_cash");

function chargeopen() {
	myWindow = window.open("charge.jsp", "팝업창", "width = 500, height = 615, left = 650, top = 10")
}

for (i = 0; i < price; i++) {
	price_btn = document.getElementsByClassName("price_btn")[i];
	
	price_btn.onclick = function() {
		var clickvalue = parseInt(this.value);
		sum+=clickvalue;
		var cash = sum/100+(sum/100*0.1);
		document.getElementById("area").innerHTML = sum+"원";
		document.getElementById("bone_rs").value = cash;
		
	}
}

closecash.onclick = function() {
	sum = 0;
	var cash = sum/100+(sum/100*0.1);
	document.getElementById("area").innerHTML = sum+"원";
	document.getElementById("bone_rs").value = cash;
}

cashok.onclick = function() {
	var frm = document.forms['frm'];
	
  	var a = confirm("충전 하시겠습니까?");
    
  	if(a) {
  		var cash = sum/100+(sum/100*0.1);
  		alert(cash+" 뼈다귀 충전완료");
  		frm.submit();  // 특정 form 을 submit
  	}
}

