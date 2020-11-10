/**
 * 로그인 페이지에서 유효성 검사 체크
 */

function chkSubmit(){	//공백안돼요
	frm = document.forms["frm"];
	
	var c_name = frm["c_name"].value.trim();
	var c_email = frm["c_email"].value.trim();
	var chk = true;
	
	if(c_name == ""){
		alert("이름을 입력해주세요");
		frm["c_name"].focus();
		return false;
	}
	
	return chk;
} // end chkSubmit()


$("#checking").click(function(){
	console.log("checking 제이쿼리 실행");
	var certif_num = $('#certif_num').val();
	console.log(certif_num+"|||"+sessionNum+"|||"+temp)
});

$("#user_email").blur(function() {
	// id = "id_reg" / name = "userId"
	var user_email = $('#user_email').val();
	console.log("제이쿼리 실행");
	$.ajax({
	url : 'emailchk.ajax?userEmail='+ user_email,
	type : "GET",
	success : function(data) {
		console.log("1 = 중복o / 0 = 중복x : "+ data);	
		console.log(user_email + "문자열");
		if (data == '1') {
			// 1 : 아이디가 중복되는 문구
			//$("#email_check").css("display", "block");
			$("#chk_button").attr('disabled', false);
			$("#email_comment").css("display", "none");
		} else {
			$('#email_comment').text("등록된 이메일이 아닙니다.");
			$("#email_comment").css("color", "red");
			$("#email_comment").css("display", "block");
			//$("#email_check").css("display", "none");
			$("#chk_button").attr('disabled', true);
		}
		if(user_email == ""){
			//$("#email_check").css("display", "none");
			$("#chk_button").attr('disabled', true);
			$("#email_comment").css("display", "none");
		}
	}, 
	error : function() {
		console.log("실패");
	}
});

	});

