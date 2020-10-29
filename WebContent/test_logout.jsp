<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sessionName = "userid";
	String sessoinNumName = "c_num";

	// 세션 삭제
	session.removeAttribute(sessionName);
	session.removeAttribute(sessoinNumName);
%>

<script>
alert("로그아웃 되었습니다");
location.href = "review.do";
</script>
<!-- <script>
alert("로그아웃 되었습니다");
location.href = "reservation.jsp";
</script> -->