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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Find ID</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
 
<section class="conA">
<div class="container">
<!--  아이디찾기용 form
<form name="frm"  id="contact-form" action="findidOk.do" method="post" onsubmit="return chkSubmit()">
인증되는 순간 attribute 바꿔서 위에껄로 
 -->
 <form name="frm"  id="contact-form"  action="searchPw.jsp" method="get">
	<div id="content-header">
		<h3>아이디 찾기</h3>
	</div>
	<div>
		<label>NAME :</label>
		 <input type="text" id="user_name" name="c_name" placeholder="이름을 입력해 주세요."/>
	</div>
	<div>
		<label>EMAIL :</label>
		<input type="text" id="user_email" name="c_email" placeholder="이메일을 입력해 주세요."/>
		<br><br>
		<div id="email_comment" style="display:none;"></div>
		<div class="check_font" id="email_check"> 
			<button type="submit" id="chk_button" disabled="false">인증번호 전송 ▶</button>
			<input type="text" id="certif_num" name="chk_num" placeholder="인증번호를 입력해 주세요"><br>
			<div id="certif_comment"></div>
		</div>
	</div>
	<div class="clearfix"></div>
				
	<input type="submit" id="logbtn" class="hc vc" value="아이디찾기" disabled="false"/>

</form>
</div>
</section>	
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>

<script src="JS/index.js" type="text/javascript"></script>
<script type="text/javascript" src="JS/find_id.js"></script>
</html>