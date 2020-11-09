/**
 * 
 */
function chkDelete(pet_num) {
	var a = confirm("반려견을 삭제하시겠습니까?");

	if (a) {
		location.href = 'pet_deleteOk.do?pet_num='+pet_num;
	}
}

$('#okbtn').click(function() {
	frm = document.forms["frm"];

	var pet_name = frm["pet_name"].value.trim();
	var pet_age = frm["pet_age"].value.trim();
	var pet_weight = frm["pet_weight"].value.trim();
	
	if (pet_name == "") {
		alert("강아지 이름을 입력해주세요");
		frm["pet_name"].focus();
		return false;
	}

	if (pet_age == "") {
		alert("강아지 나이를 입력해주세요");
		frm["pet_age"].focus();
		return false;
	}

	if (pet_weight == "") {
		alert("강아지 무게를 입력해주세요");
		frm["pet_weight"].focus();
		return false;
	}
	
	return true;
})