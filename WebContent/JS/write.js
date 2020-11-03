function chkSubmit() {
	frm = document.forms["frm"];

	var subject = frm["subject"].value.trim();
	var star = "";

	for (i = 0; i < frm["star"].length; i++) {
		if (frm["star"][i].checked) {
			star = frm["star"][i].value;
			break;
		}
	}

	if (subject == "") {
		alert("제목은 반드시 작성해야 합니다");
		frm["subject"].focus();
		return false;
	}

	if (star == "") {
		alert("별점을 골라주세요!");
		return false;
	}

	return true;
} // end chkSubmit()
