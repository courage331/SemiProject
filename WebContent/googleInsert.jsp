<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  // Controller 로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
	String c_id = (String)request.getParameter("c_id");
	String c_pw = (String)request.getParameter("c_pw");
	String url = "loginOk.do?c_id="+c_id+"&c_pw="+c_pw;
%>

<% if(cnt == 0){ %>
	<script>
		alert("회원가입 실패했습니다");
		location.href = "login.jsp";  // 브라우저가 직전에 기억하는 이전 페이지로..
	</script>
<% } else { %>
	<script>
		alert("<%=c_id%>");
		location.href = "<%=url%>";
	</script>
<% } %>





















