/**
 * 
 */
function chkDelete(pet_num) {
	var a = confirm("반려견을 삭제하시겠습니까?");

	if (a) {
		location.href = 'pet_deleteOk.do?pet_num='+pet_num;
	}
}
