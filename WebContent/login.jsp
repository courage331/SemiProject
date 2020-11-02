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
	//return chkDB(c_id, c_pw);	
} // end chkSubmit()
/*
function chkDB(c_id, c_pw){ //가입된 아이디니??
	//db에 c_id, c_pw 가진 회원이 있니??
	//alert(c_id+" : "+c_pw);
	String id =
	String pw = 
	
	if(c_id.equalsIgnoreCase(id) && c_pw.equals(pw)){
		
		alert(c_id+" : "+c_pw + " 로그인 성공");
		
		// 세션 (이름) 생성
		//session.setAttribute(sessionName, sessionValue);		
	}else{
		alert(c_id+" : "+c_pw + " 가입된 아이디가 아닙니다.");
		// 혹시 있으면(?) 세션 삭제
		//session.removeAttribute(sessionName);
	}
	return true;
}
*/

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