/**
 *  반려견 정보 추가 페이지
 */

function chkSubmit(){
	frm = document.forms["frm"];
	
	var p_name = frm["p_name"].value.trim();
	var p_age = frm["p_age"].value.trim();
	var p_weight = frm["p_weight"].value.trim();
	
	if(p_name == ""){
		alert("강아지 이름을 입력해주세요");
		frm["p_name"].focus();
		return false;
	}
	
	if(p_age == ""){
		alert("강아지 나이를 입력해주세요");
		frm["p_age"].focus();
		return false;
	}
	
	if(p_weight == ""){
		alert("강아지 무게를 입력해주세요");
		frm["p_weight"].focus();
		return false;
	}
	
	return true;
} // end chkSubmit()
