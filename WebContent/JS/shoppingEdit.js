//shopping js


  function btn_click(str){                             
        if(str=="update"){
			var r = confirm("수정하시겠습니까?");
			
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
    
