<!-- 아이디찾기, 이주혁 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.lec.beans.*" %>
<%@ page import = "java.util.*" %>
<%  // Controller 로부터 결과 데이터 받음
	CustomerDTO [] arr = (CustomerDTO [])request.getAttribute("list");
	String c_id = "";
%>

<% if(arr==null || arr.length==0){ %>			
	<script>	
		alert("가입된 아이디가 아닙니다.");
		history.back();  // 다시 로그인페이지로
	</script>
<%
		return;
	}
	c_id = arr[0].getCus_id();
%>

<script>
alert("아이디는 <%=c_id%> 입니다.");
location.href = "login.jsp";
</script>