<!-- 로그인페이지, 이주혁 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 메인 페이지  -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/index.css">
<link rel="stylesheet" href="CSS/login.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>LOGIN</title>
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
 
<section class="conA">
<div class="container">

<form name="frm"  id="contact-form" action="loginOk.do" method="post" onsubmit="return chkSubmit()">
	<div id="content-header">
		<h3>로그인</h3>
	</div>
	<div>
		<label>ID :</label>
		 <input type="text" name="c_id" placeholder="아이디를 입력해 주세요."/>
	</div>
	<div>
		<label>PW :</label>
		<input type="password" name="c_pw" placeholder="비밀번호를 입력해 주세요."/>
	</div>
	<div class="clearfix"></div>

	<input type="submit" id="logbtn" class="hc vc" value="LOGIN"/>
	<input type="button" class="navyBtn" value="회원가입" onClick="location.href='signUp.jsp'">
	<input type="button" class="navyBtn" value="아이디 찾기" onClick="location.href='find_id.jsp'">
	<input type="button" class="navyBtn" value="비밀번호 찾기" onClick="location.href='find_pw.jsp'">
</form>

</div>
</section>	
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>

<script src="JS/index.js" type="text/javascript"></script>
<script type="text/javascript" src="JS/login.js"></script>
</html>