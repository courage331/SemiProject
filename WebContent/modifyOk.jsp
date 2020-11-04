<!-- 예약 수정관련 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // Controller 로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
%>
<% if(cnt == 0){ %>
	<script>
		alert("예약 수정 실패");
		history.back();
	</script>
<% } else {%>	
	<script>
		alert("예약 수정에 성공했습니다.");
		location.href = "mypage.do";
	</script>
<% } %>











