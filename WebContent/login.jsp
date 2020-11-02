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
<!-- 
LOGIN
<br>
<form name="frm" action="loginOk.do" method="post" onsubmit="return chkSubmit()">
ID :  <input type="text" name="c_id" ><br>
PW : <input type="text" name="c_pw" ><br>
<input type="submit" value="LOGIN"/> <!-- index.jsp로 가는게 아니라 바로 전 화면으로 가게하면 더 좋을듯// 가는게 아니라 submit이 되어야함// 
</form> 
-->
 
<section class="conA">
<div class="container">

<form name="frm"  id="contact-form" action="loginOk.do" method="post" onsubmit="return chkSubmit()">
	<div id="content-header">
		<h3>로그인</h3>
	</div>
	<div>
		<label>ID :</label>
		 <input type="text" name="c_id" >
	</div>
	<div>
		<label>PW :</label>
		<input type="text" name="c_pw" >
	</div>
	<div class="clearfix"></div>
	<div class="content-footer">
	        <p>우리는 가입자의 정보를 무단으로 사용하지 않습니다.</p>
	</div>
	<input type="submit" id="logbtn" class="hc vc" value="LOGIN"/>
</form>

</div>
</section>	
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>

<script src="JS/index.js" type="text/javascript"></script>
<script type="text/javascript" src="JS/login.js"></script>
</html>