<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // Controller 로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
	int num = Integer.parseInt(request.getParameter("num"));
%>

<% if(cnt == 0){
	System.out.println("cnt: " + cnt); // 0
	System.out.println("num: " + num); // 7
%>
	<script>
		alert("수정 실패");
		history.back();
	</script>
<% } else { 
	System.out.println("cnt: " + cnt); // 0
	System.out.println("num: " + num);
	%> 
	<script>
		alert("수정 성공");
		opener.location.reload();
		self.close();
	</script>
<% } %>