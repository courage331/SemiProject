function chkSmt() {
	frm = document.forms["cmt"];

	var content = frm["content"].value.trim();

	if (content == "") {
		alert("내용은 반드시 작성해야 합니다");
		frm["content"].focus();
		return false;
	}


	return true;
} // end chkSubmit()

function datachk(url){
	newPage = window
	.open(url, 'cmtupdate',
			'width=500,height=500,left=650,location=no,status=no,scrollbars=no');
}
