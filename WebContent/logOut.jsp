<!-- 로그아웃페이지 이주혁 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sessionName = "userid";
String sessoinNumName = "c_num";
String sessionId = session.getId();
// 세션 삭제
session.removeAttribute(sessionName);
session.removeAttribute(sessoinNumName);
session.removeAttribute(sessionId);
%>

<script>
alert("로그아웃 되었습니다");
location.href = "index.jsp";
</script>