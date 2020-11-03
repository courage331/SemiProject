/**
 * 
 */

function byebye(){
	 self.close();
}

function chkDelete(num,pet_num) {
	// 삭제 여부, 다시 확인하고 진행하기
	var r = confirm("예약 취소하시겠습니까?");

	if (r) {
		location.href = 'reserve_deleteOk.do?num=' + num+'&pet_num='+pet_num;
	}
}
function deleteChk() {
	alert('권한이 없습니다.');
}

function userChk(){
	alert("권한이 없습니다.");
}