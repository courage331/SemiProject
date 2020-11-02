// view.js	

function chkDelete(num) {
	// 삭제 여부, 다시 확인하고 진행하기
	var r = confirm("삭제하시겠습니까?");

	if (r) {
		location.href = 'deleteOk.do?num=' + num;
	}
}
function deleteChk() {
	alert('권한이 없습니다.');
}

function userChk(){
	alert("권한이 없습니다.");
}