<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Find ID</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
 
<section class="conA">
<div class="container">

<form name="frm"  id="contact-form" action="findidOk.do" method="post" onsubmit="return chkSubmit()">
	<div id="content-header">
		<h3>아이디 찾기</h3>
	</div>
	<div>
		<label>NAME :</label>
		 <input type="text" name="c_name" placeholder="이름을 입력해 주세요."/>
	</div>
	<div>
		<label>EMAIL :</label>
		<input type="text" name="c_email" placeholder="이메일을 입력해 주세요."/>
	</div>
	<div class="clearfix"></div>
				<!-- 이메일 인증번호 넣을 input 만들어야함 -->
	<input type="submit" id="logbtn" class="hc vc" value="아이디찾기"/>

</form>
</div>
</section>	
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>

<script src="JS/index.js" type="text/javascript"></script>
<script type="text/javascript" src="JS/find_id.js"></script>
</html>