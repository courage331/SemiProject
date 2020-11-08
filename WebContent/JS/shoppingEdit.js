//shopping js
function shopModify(){
	var form = document.getElementsByName("frm");
	form.action = "shopEditOk.do";
	form.submit();
	location.href = "shopEditOk.do";
}

function shopdelete(){
	
	var form = document.getElementsByClassName("frm");
	form.action = "shopEditOk.do";
	form.submit();
}

function chkDelete(pNum) {
	// 삭제 여부, 다시 확인하고 진행하기
	var r = confirm("삭제하시겠습니까?");

	if (r) {
		var form = document.getElementsByClassName("frm");
		form.action='shopDeleteOk.do';
		form.submit();
	}
}

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
    
