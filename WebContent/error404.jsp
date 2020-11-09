<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<% response.setStatus(200); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/index.css">
<link rel="stylesheet" href="CSS/errorPage.css">
<title>에러 안내</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
에러가 발생했습니다... <br/>
예외 타입은 : <%= exception.getClass().getName() %> <br/>
예외 메시지는 <%= exception.getMessage() %>
<section class="conA">
<div class="container">

<form name="frm"  id="contact-form" action="loginOk.do" method="post" onsubmit="return chkSubmit()">
	<div id="content-header">
		<h3>페이지 에러...</h3>
	</div>
	<div>
		<label>서비스 사용에 불편을 끼쳐드려서 대단히 죄송합니다.</label>
	</div>
	<div>
		<label>빠른 시간내에 문제를 처리하겠습니다...</label>
	</div>
	<div class="clearfix"></div>
	<input type="button" class="navyBtn" value="메인화면으로 가기" onClick="goIndex()">
</form>
</div>
</section>	


	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="JS/errorPage.js"></script>
</html>