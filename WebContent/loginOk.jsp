<!-- 로그인확인페이지, 이주혁 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.lec.beans.*" %>
<%@ page import = "java.util.*" %>
<%  // Controller 로부터 결과 데이터 받음
	CustomerDTO [] arr = (CustomerDTO [])request.getAttribute("list");
%>

<% if(arr==null || arr.length==0){ %>			
	<script>	
		alert("가입된 회원이 아닙니다.");
		history.back();  // 다시 로그인페이지로
	</script>
<%
		return;
	} 
%>

<% 
	// 세션 name-value 지정
	String sessionName = "userid";
	String sessionValue = arr[0].getCus_id();
	
	String sessionNumName = "c_num";
	String sessionNumValue = Integer.toString(arr[0].getCus_num());
	//주혁 추가 (sessionId, arr) 1103/ 실패
	String sessionId = session.getId();
	
	
	// 전송된 id / pw 값이 일치하면  로그인 성공 + 세션 생성
		out.println("<script>");
		out.println("alert('로그인 성공');");
		out.println("</script>");
		// 세션 (이름) 생성
		session.setAttribute(sessionName, sessionValue);
		session.setAttribute(sessionNumName, sessionNumValue);
		session.setAttribute(sessionId, arr);
%>
<script>
location.href = "index.jsp";
</script>