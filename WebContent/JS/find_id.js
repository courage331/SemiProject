/**
 * 로그인 페이지에서 유효성 검사 체크
 */

function chkSubmit(){	//공백안돼요
	frm = document.forms["frm"];
	
	var c_name = frm["c_name"].value.trim();
	var c_email = frm["c_email"].value.trim();
	
	if(c_name == ""){
		alert("이름을 입력해주세요");
		frm["c_name"].focus();
		return false;
	}
	
	if(c_email == ""){
		alert("이메일을 입력해주세요");
		frm["c_email"].focus();
		return false;
	}
	
	return true;
} // end chkSubmit()
