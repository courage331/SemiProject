/*회원가입 창*/

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
			
			if (data != 0) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("사용중인 아이디입니다 :p");
					$("#id_check").css("color", "red");
				} else {
					
						$('#id_check').text("사용 가능한 아이디입니다 :) :)");
						$('#id_check').css('color', 'blue');
					
				}
			}, error : function() {
					console.log("실패");
			}
		});
	});
