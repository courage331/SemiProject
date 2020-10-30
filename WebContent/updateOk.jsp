<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // Controller 로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
	int num = Integer.parseInt(request.getParameter("num"));
	int c_num = Integer.parseInt(request.getParameter("c_num"));
%>

<% if(cnt == 0){
	System.out.println("cnt: " + cnt); // 0
	System.out.println("num: " + num); // 7
	System.out.println("c_num: " + c_num); 
%>
	<script>
		alert("수정 실패");
		history.back();
	</script>
<% } else { 
	System.out.println("cnt: " + cnt); // 0
	System.out.println("num: " + num); // 7
	System.out.println("c_num: " + c_num); %> 
	<script>
		alert("수정 성공");
		location.href = "view.do?num=<%= num%>";
	</script>
<% } %>