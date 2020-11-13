<!-- 로그인확인페이지, 이주혁 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.lec.beans.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%  // Controller 로부터 결과 데이터 받음
	CustomerDTO [] arr = (CustomerDTO [])request.getAttribute("list");
	String c_id = (String)request.getParameter("c_id");
	String c_pw = (String)request.getParameter("c_pw");
	String c_name = (String)request.getParameter("c_name");
	String c_email = (String)request.getParameter("c_email");
	String c_phone = (String)request.getParameter("c_phone");
	String c_nameE = URLEncoder.encode(c_name, "utf-8");
	String c_emailE = URLEncoder.encode(c_email, "utf-8");
	String c_phoneE = URLEncoder.encode(c_phone, "utf-8");
	String cccc = java.net.URLEncoder.encode(c_name);
	//URL url = new 
%>

<% if(arr==null || arr.length==0){ 
	String url = "googleInsert.do?c_id="+c_id+"&c_pw="+c_pw+"&c_name="+c_nameE+"&c_phone="+c_phoneE+"&c_email="+c_emailE;
%>			
		
	<script>	
		alert(<%=cccc%>);
		//location.href = <%=url%>;
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