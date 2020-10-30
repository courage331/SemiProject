<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	// 예제용 로그인 아이디 , 비번 세팅
	public static final String ADMIN_ID = "test";
	public static final String ADMIN_PW = "1234";
	//호인아 너꺼 주석처리해둠
	//public static final String ADMIN_CNUM = "17";
	//김지민 test
	public static final String ADMIN_CNUM = "1";
%>    
<% 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String c_num = ADMIN_CNUM;

	// 세션 name-value 지정
	String sessionName = "userid";
	String sessionValue = id;
	
	String sessionNumName = "c_num";
	String sessionNumValue = c_num;
	
	
	
	System.out.println("id: " + id); 
	System.out.println("pw: " + pw); 
	System.out.println("c_num: " + c_num); 
	// 전송된 id / pw 값이 일치하면  로그인 성공 + 세션 생성
	if(ADMIN_ID.equalsIgnoreCase(id) && ADMIN_PW.equals(pw)){
		out.println("<script>");
		out.println("alert('로그인 성공');");
		out.println("</script>");
		// 세션 (이름) 생성
		session.setAttribute(sessionName, sessionValue);
		session.setAttribute(sessionNumName, sessionNumValue);
	}else{
		out.println("<script>");
		out.println("alert('로그인 실패');");
		out.println("</script>");
		// 혹시 있으면(?) 세션 삭제
		session.removeAttribute(sessionName);
		session.removeAttribute(sessionNumName);
	}
	
%>

<script>
location.href = "reservation.jsp?c_num=1";
</script>
<!--  <script>
location.href = "review.do";
</script>-->