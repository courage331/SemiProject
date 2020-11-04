/**
 * 
 */
function chkSubmit(){	//공백안돼요
	frm = document.forms["frm"];
	
	var c_name = frm["c_name"].value.trim();
	var c_phone = frm["c_phone"].value.trim();
	var c_email = frm["c_email"].value.trim();
	var c_pwchk = frm["c_pwchk"].value.trim();
	var c_pw = frm["c_pw"].value.trim();
	
	if(c_pw == ""){
		alert("비밀번호를 입력해주세요");
		frm["c_pw"].focus();
		return false;
	}
	
	if(c_pwchk == ""){
		alert("비밀번호확인을 입력해주세요");
		frm["c_pwchk"].focus();
		return false;
	}
	
	if(c_name == ""){
		alert("이름을 입력해주세요");
		frm["c_name"].focus();
		return false;
	}
	
	if(c_phone == ""){
		alert("전화번호를 입력해주세요");
		frm["c_phone"].focus();
		return false;
	}
	
	if(c_email == ""){
		alert("이메일을 입력해주세요");
		frm["c_email"].focus();
		return false;
	}
	
	if(c_pw != c_pwchk){
		alert("비밀번호를 확인해주세요");
		frm["c_pwchk"].focus();
		return false;
	}
	

	
	return true;
} // end chkSubmit()
