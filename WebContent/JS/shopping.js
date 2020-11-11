//shopping js
function submit1(){
	if(session.getAttribute("c_num") == 0){
			alert("이용불가");
			return false;
			
		}else{
	frm.action = "shoppingOk.do";
	frm.submit();
		}
}
  function submit2(c_money,price){                             
 	console.log(c_money);
	console.log(price);
	if(c_money < price ){
			var m = confirm("뼈다귀가 부족합니다 충전하시겠습니까?");
			if(m){
				frm.action="charge.jsp";
			              
			} else{
				
			}
        } else {   
			var r = confirm("구매 하시겠습니까?");
				if(r){
				frm.action="shoppingOk.do"; 
				}  else{
					
				}  
               
        }  
            //...
      }

function btn_click(str){                             
        if(str=="update"){
			var r = confirm(session.getAttribute("c_num"));
			
				if(r){
					frm.action="shopEditOk.do";    
				}  else {
					
					history.back();
				}                              
        } else if(str=="delete"){   
			var r = confirm("삭제하시겠습니까?");
				if(r){
				frm.action="shopDeleteOk.do"; 
				} else {
	
				}  
               
        }  
            //...
      }

/* 수정중

var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  


 */