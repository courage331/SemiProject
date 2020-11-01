<!-- 로그인확인페이지, 이주혁 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  // Controller 로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
%>

<% if(cnt == 0){ %>			
	<script>				//DB에 해당아이디가 없으면 로그인 실패  아이디찾기, 비밀번호찾기, 회원가입 유도...
		alert("가입된 아이디가 아닙니다.");
		history.back();  // 다시 로그인페이지로
	</script>
<% } else { %>			
	<script>				//로그인 성공할라면 DB에 해당 아이디 있는지 확인
		alert("로그인 성공");
		location.href = "index.jsp";  //history.back 두번 하는건 어떨까
	</script>
<% } %>
