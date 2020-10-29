<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login 페이지</title>
</head>
<body>
	<%
		// 현재 로그인 상태인지, 즉 로그인 세션 (name이 'userid'인 세션값)이 있는지 확인
		if(session.getAttribute("userid") != null){					
	%>
		<h2>로그인 상태입니다 </h2>
		<form action="test_logout.jsp">
			<input type="submit" value="로그아웃"><br>
		</form>
	<%
		} else {
		// 로그인 상태가 아니라면 ... 
	%>
		<h2>로그인 상태가 아닙니다</h2>
		<form action="test_loginOk.jsp">
			id: <input type="text" name="id"><br>
			pw: <input type="password" name="pw"><br>
			<input type="submit" value="로그인"><br>
		</form>		
	<%}%>
</body>
</html>