function chkSubmit(){
	frm = document.forms['frm'];
	var subject = frm['subject'].value.trim();
	var star = frm["star"].value;
	
	if(subject == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["subject"].focus();
		return false;
	}
	
	return true;
}
