<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // Controller 로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
%>
<% if(cnt == 0){ %>
	<script>
		alert("취소 실패");
		history.back();
	</script>
<% } else {%>
	<script>
		alert("취소 성공");
		location.href = "myInfo.do";
		self.close();
	</script>
<% } %>











