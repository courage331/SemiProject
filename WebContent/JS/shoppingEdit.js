//shoppingEdit.js js
/* 1102 js 파일 생성*/

function editOpen(num) {


	shopping = window.open("shoppingEdit.do?pNum=" + num, "팝업창", "width = 500, height = 615, left = 650, top = 10")
}

var img_list = document.getElementsByTagName("img").length;

for (i = 0; i < img_list; i++) {
	img_btn = document.getElementsByTagName("img")[i];
	img_btn.onclick = function(e) {
		var num = $(e.target).parent().parent().find('#pNum').val();
		console.log(num)


		//var pNum = $(e.target).parent().find('#pNum').val();

		//console.log(cnt);

		if (sessionStorage.length == 0) {
			//alert(cnt);

			location.href = 'login.do';
		} else {

			shopping = window.open("shoppingEdit.do?pNum=" + num, "팝업창", "width = 500, height = 615, left = 650, top = 10")
		}


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
    
