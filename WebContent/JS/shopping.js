//shopping js
function submit1(){
	if(session.getAttribute("c_num") == 0){
			alert("이용불가");
			return false;
			
		}else{
	var form = document.getElementsByClassName("frm");
	form.action = "shoppingOk.jsp";
	form.submit();
		}
}
