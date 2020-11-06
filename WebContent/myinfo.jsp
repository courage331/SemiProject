<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.lec.beans.CustomerDTO"%>
    
    <%
    	String sessionId = session.getId();
    	CustomerDTO [] arr = (CustomerDTO [])session.getAttribute(sessionId);
    	int c_num = Integer.parseInt((String)session.getAttribute("c_num"));  //세션에서 회원번호 받아옴
    	String c_id = arr[0].getCus_id();
    	String c_pw = arr[0].getCus_pw();
    	String c_name = arr[0].getCus_name();
    	String c_phone = arr[0].getCus_phone();
    	String c_email = arr[0].getCus_email();
    %>
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
<title>내 정보관리</title>
</head>
<!-- 헤더 -->
<jsp:include page="common/header.jsp"></jsp:include>
 
<body>
	<section class="conA">
		<div class="container">
			<form name="frm" id="contact-form" action="myinfo_update.do" method="post"
				onsubmit="return chkSubmit()">
				<div id="content-header">
					<h3>내 정보관리</h3>
				</div>
				
				<div>
					<label>ID : </label><label><%=c_id%></label>
				</div>
				<div>
					<label>PW :</label> <input type="password" name="c_pw"
						placeholder="비밀번호 재설정" />
				</div>
				<div>
					<label>PW 확인 :</label> <input type="password" name="c_pwchk"
						placeholder="비밀번호 확인" />
				</div>
				<div>
					<label>이름 :</label> <input type="text" name="c_name"
						value=<%=c_name%> placeholder=<%=c_name%> />
				</div>
				<div>
					<label>전화번호 :</label> <input type="text" name="c_phone"
						value=<%=c_phone%> placeholder=<%=c_phone%> />
				</div>
				<div>
					<label>이메일 :</label> <input type="text" name="c_email"
						value=<%=c_email%> placeholder=<%=c_email%> />
				</div>
				<input type="submit" id="logbtn" class="hc vc" value="수정하기"/>
				<input type="button" class="hc vc" value="회원탈퇴" onClick="return test()">
			</form>
		</div>
</section>	
	<!-- 푸터// -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>

<script src="JS/index.js" type="text/javascript"></script>
<script type="text/javascript" src="JS/myinfo_update.js"></script>
</html>