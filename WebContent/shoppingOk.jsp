<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  // Controller 로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
	int dcnt = (Integer)request.getAttribute("list");
	

%>

<% if(cnt == 0 && dcnt == 0){ %>
	<script>
		alert("구매 실패");
		history.back();  // 브라우저가 직전에 기억하는 이전 페이지로..
	</script>
<% } else { %>
	<script>
		alert("구매 성공~!");
		opener.parent.window.location.reload(); //부모창 새로고침 해주는 것
		window.close();
		
	</script>
<% } %>



















