function chkSubmit(){
	frm = document.forms['frm'];
	var content = frm['content'].value.trim();
	
	if(content == ""){
		alert("내용은 반드시 작성해야 합니다");
		frm["content"].focus();
		return false;
	}
	
	return true;
}
