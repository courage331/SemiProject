<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  // Controller 로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
	int cnt2 = (Integer)request.getAttribute("result2");
%>

<% if(cnt == 0){ %>
	<script>
		alert("예약 실패!!!!!");
		history.back();  // 브라우저가 직전에 기억하는 이전 페이지로..
	</script>
<% } else { %>
	<script>
		alert("예약 성공~!");
		location.href = "mypage.do?page=1";
	</script>
<% } %>



















