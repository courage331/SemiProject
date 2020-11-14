/* 1102 js 파일 생성*/
function shoppingOpen(pNum) {

	shopping = window.open("shopping.do?pNum=" + pNum, "팝업창", "width = 500, height = 615, left = 650, top = 10")
}

function editOpen(pNum) {

	shopping = window.open("shoppingEdit.do?pNum=" + pNum, "팝업창", "width = 500, height = 615, left = 650, top = 10")
}

var img_list = document.getElementsByTagName("img").length;

for (i = 0; i < img_list; i++) {
	img_btn = document.getElementsByTagName("img")[i];
	img_btn.onclick = function(e) {
		var cnt = $(e.target).parent().parent().find('#pCnt').val();
		var num = $(e.target).parent().parent().find('#pNum').val();
		
		console.log(num,"nnnnn")
		
		
		console.log($(e.target), "111111")
		console.log($(e.target).parent(),"2222222")
		console.log($(e.target).parent().find('#pCnt'),"3333333")
		
		//var pNum = $(e.target).parent().find('#pNum').val();
		console.log(cnt);
		
		//console.log(cnt);

		if (sessionStorage.length == 0) {
			//alert(cnt);

			location.href = 'login.do';
		} else {
			if(cnt==0){
				alert("재고소진");
			} else{
				shopping = window.open("shopping.do?pNum=" + num, "팝업창", "width = 500, height = 615, left = 650, top = 10")
			}


		}


	}

}



