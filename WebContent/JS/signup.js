/*회원가입 창*/

//비밀번호 확인
var pw;
var pwchk;
$("#user_pw").blur(function() {
	pw = $(this).val();
});
$("#user_pwchk").blur(function() {
	pwchk = $(this).val();
	console.log(pw);
	console.log(pwchk);
	if (pw==pwchk) {
		$("#pw2_check").text('');
	} else {
		$('#pw2_check').text('비밀번호를 확인해주세요');
		$('#pw2_check').css('color', 'red');
	}
});

//이름에 특수문자 들어가지 않도록 설정
$("#user_name").blur(function() {
	var nameJ = /^[가-힣]{2,6}$/;
	if (nameJ.test($(this).val())) {
		console.log(nameJ.test($(this).val()));
		$("#name_check").text('');
	} else {
		$('#name_check').text('이름을 확인해주세요');
		$('#name_check').css('color', 'red');
	}
});


// 휴대전화
$('#user_phone').blur(function(){
	var phoneJ = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	if(phoneJ.test($(this).val())){
		console.log(phoneJ.test($(this).val()));
		$("#phone_check").text('');
	} else {
		$('#phone_check').text('휴대폰번호를 확인해주세요 :)');
		$('#phone_check').css('color', 'red');
	}
});
// 이메일
$('#user_email').blur(function(){
	var emailJ = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	if(emailJ.test($(this).val())){
		console.log(emailJ.test($(this).val()));
		$("#email_check").text('');
	} else {
		$('#email_check').text('이메일을 확인해주세요 :)');
		$('#email_check').css('color', 'red');
	}
});

function chkSubmit(){	//공백안돼요
	frm = document.forms["frm"];
	
	var c_id = frm["c_id"].value.trim();
	var c_pw = frm["c_pw"].value.trim();
	var c_name = frm["c_name"].value.trim();
	var c_phone = frm["c_phone"].value.trim();
	var c_email = frm["c_email"].value.trim();
	
	if(c_id == ""){
		alert("아이디를 입력해주세요");
		frm["c_id"].focus();
		return false;
	}
	
	if(c_pw == ""){
		alert("비밀번호를 입력해주세요");
		frm["c_pw"].focus();
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
	
	return true;
} // end chkSubmit()



$("#user_id").blur(function() {
	// id = "id_reg" / name = "userId"
	var user_id = $('#user_id').val();
	$.ajax({
	url : 'list.ajax?userId='+ user_id,
	type : "GET",
	success : function(data) {
		console.log("1 = 중복o / 0 = 중복x : "+ data);							
		if (data == '1') {
			// 1 : 아이디가 중복되는 문구
			$("#id_check").text("사용중인 아이디입니다 :p");
			$("#id_check").css("color", "red");
		} else {
			
			$('#id_check').text("사용 가능한 아이디입니다 :) :)");
			$('#id_check').css('color', 'blue');
			
		}
		if(user_id == ""){
			$('#id_check').text("");
		}
	}, 
	error : function() {
		console.log("실패");
	}
});

	});
