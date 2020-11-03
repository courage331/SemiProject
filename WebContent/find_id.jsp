<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID</title>
</head>
<body>
<form name="frm"  id="contact-form" action="findidOk.jsp/mail" method="post" onsubmit="return chkSubmit()">
	<div id="content-header">
		<h3>아이디 찾기</h3>
	</div>
	<div>
		<label>ID :</label>
		 <input type="text" name="c_name" placeholder="이름을 입력해 주세요."/>
	</div>
	<div>
		<label>EMAIL :</label>
		<input type="text" name="c_email" placeholder="이메일을 입력해 주세요."/>
	</div>
	<div class="clearfix"></div>

	<input type="submit" id="logbtn" class="hc vc" value="emailchk"/>

</form>
</body>
<script type="text/javascript" src="JS/find_id.js"></script>
</html>