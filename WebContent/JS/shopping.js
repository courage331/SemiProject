//shopping js
function submit1(){
	if(session.getAttribute("c_num") == 0){
			alert("이용불가");
			return false;
			
		}else{
	frm.action = "shoppingOk.jsp";
	form.submit();
		}
}
  function btn_click(c_money, price){                             
    var c_money = request.getAttribute("c_money");
	var price = request.getAttribute("price");  
	if(c_money < price ){
			alert("돈부족");                       
        } else {   
			var r = confirm("구매 하시겠습니까?");
				if(r){
				frm.action="shoppingOk.jsp"; 
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