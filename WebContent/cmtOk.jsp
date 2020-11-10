<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>

<%  // Controller 로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("cmt");
	System.out.println("cnt: " + cnt);
	int r_num = Integer.parseInt(request.getParameter("r_num"));
%>

<% if(cnt == 0){ %>
	<script>
		alert("댓글 등록 실패!!!!!");
		history.back();  // 브라우저가 직전에 기억하는 이전 페이지로..
	</script>
<% } else { %>
	<script>
		alert("댓글 등록 성공~!");
		location.href = "view.do?num="+<%= r_num%>;
	</script>
<% } %>





















