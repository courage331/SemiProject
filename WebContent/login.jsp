<!-- 로그인페이지, 이주혁 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<script>
function chkSubmit(){	//공백안돼요
	frm = document.forms["frm"];
	
	var c_id = frm["c_id"].value.trim();
	var c_pw = frm["c_pw"].value.trim();
	
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
	
	return true;
} // end chkSubmit()


</script>
<body>

LOGIN
<br>
<form name="frm" action="loginOk.do" method="post" onsubmit="return chkSubmit()">
<input type="text" name="c_id" ><br>
<input type="text" name="c_pw" ><br>
<input type="submit" value="LOGIN"/> <!-- index.jsp로 가는게 아니라 바로 전 화면으로 가게하면 더 좋을듯// 가는게 아니라 submit이 되어야함// -->
</form>


</body>
</html>