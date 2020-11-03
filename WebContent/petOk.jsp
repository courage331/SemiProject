<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  // Controller 로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
%>

<% if(cnt == 0){ %>
	<script>
		alert("반려견 정보 입력에 실패했습니다");
		history.back();  // 브라우저가 직전에 기억하는 이전 페이지로..
	</script>
<% } else { %>
	<script>
		alert("반려견정보 입력에 성공했습니다.");
		location.href = "pet.do";
	</script>
<% } %>
