// 충전 페이지 JavaScript
var sum = 0;
var cash = sum/100+(sum/100*0.1);
var chk_value = "kakao";

var price = document.getElementsByClassName("price_btn").length;
var cashok = document.getElementsByClassName("cashok")[0];
var closecash = document.getElementById("close_cash");
var chk_cash = document.getElementsByName("chk_cash").length;
var buyer_email = document.getElementsByName("buyer_email")[0];
var buyer_name = document.getElementsByName("buyer_name")[0];

function chargeopen() {
	myWindow = window.open("charge.do", "팝업창", "width = 500, height = 615, left = 650, top = 10")
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

for(i = 0; i < chk_cash; i++) {
	
	var chk_cash_btn = document.getElementsByName("chk_cash")[i];
	
	chk_cash_btn.onclick = function() {
// alert(this.value);
		chk_value = this.value;
	}
}

cashok.onclick = function() {
	var a = confirm("충전 하시겠습니까?");
	
  	if( sum == 0 ) {
  		alert("충전 금액을 선택해주세요.")
  	} else if(a && chk_value == "cash") {	 
  	  	var cash = sum/100+(sum/100*0.1);
  	  	alert(cash+" 뼈다귀 충전완료");
  	  	frm.submit();  
  	} else if(a && chk_value == "kakao") {
  		window.resizeTo(850, 650);
  	$(function(){
  	var IMP = window.IMP; // 생략가능
  	IMP.init('imp02041808'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
  	var msg;
  	
  	IMP.request_pay({
  	    pg : 'inicis',
  	    pay_method : 'card',
  	    merchant_uid : 'merchant_' + new Date().getTime(),
  	    name : '뼈다귀 충전',
  	    amount : sum,
  	    buyer_email : buyer_email.value,
  	    buyer_name : buyer_name.value,
  	}, function(rsp) {
  	    if ( rsp.success ) {
  	                msg = '결제가 완료되었습니다.';
  	                msg += '\n고유ID : ' + rsp.imp_uid;
  	                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
  	                msg += '\결제 금액 : ' + rsp.paid_amount;
  	                msg += '카드 승인번호 : ' + rsp.apply_num;
  	                
  	                var cash = sum/100+(sum/100*0.1);
  	                alert(cash+" 뼈다귀 충전완료");
  	                frm.submit(); 
  	            } else {
  	    	        msg = '결제에 실패하였습니다.';
  	    	        msg += '에러내용 : ' + rsp.error_msg;
  	    	        // 실패시 이동할 페이지
  	            }
  	});
  	
  	});
  	}	// end if
  	
	


}
