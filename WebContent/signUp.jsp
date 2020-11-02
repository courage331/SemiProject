<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGN UP</title>
</head>
<script>
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

</script>
<body>
SIGN UP
<form name="frm" action="signupOk.jsp" method="post" onsubmit="return chkSubmit()">
<input type="text" name="c_id" ><br>
<input type="text" name="c_pw" ><br>
<input type="text" name="c_name" ><br>
<input type="text" name="c_phone" ><br>
<input type="text" name="c_email" ><br>
<input type="submit" value="SIGNUP"/> <!--  바로 전 화면으로 가게하면 더 좋을듯// 가는게 아니라 submit이 되어야함// -->
</form>
</body>
</html>