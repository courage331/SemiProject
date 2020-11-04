<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.lec.beans.CustomerDTO"%>
    
    <%
    	String sessionId = session.getId();
    	CustomerDTO [] arr = (CustomerDTO [])session.getAttribute(sessionId);
  //    CustomerDTO [] arr2 = (CustomerDTO [])request.getAttribute("data");
    	int c_num = Integer.parseInt((String)session.getAttribute("c_num"));  //세션에서 회원번호 받아옴
  //  	String c_id = (String)session.getAttribute("userid");
    	String c_id = arr[0].getCus_id();
    	String c_pw = arr[0].getCus_pw();
    	String c_name = arr[0].getCus_name();
    	String c_phone = arr[0].getCus_phone();
    	String c_email = arr[0].getCus_email();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보관리</title>
</head>
<body>
	<section class="conA">
		<div class="container">
			<form name="frm" id="contact-form" action="myinfo_update.do" method="post"
				onsubmit="return chkSubmit()">
				<div id="content-header">
					<h3>내 정보관리</h3>
				</div>
				<div>
					<label>ID : <%=c_id%></label>
				</div>
				<div>
					<label>PW :</label> <input type="password" name="c_pw"
						placeholder="비밀번호 재설정" />
				</div>
				<div>
					<label>PW 확인 :</label> <input type="password" name="c_pwchk"
						placeholder="비밀번호 확인" />
					<input type="button" id="logbtn" class="hc vc" value="PW바꾸기" onClick="return chkPw()"/>
				</div>
				<div>
					<label>이름 :</label> <input type="text" name="c_name"
						placeholder=<%=c_name%> />
				</div>
				<div>
					<label>전화번호 :</label> <input type="text" name="c_phone"
						placeholder=<%=c_phone%> />
				</div>
				<div>
					<label>이메일 :</label> <input type="text" name="c_email"
						placeholder=<%=c_email%> />
				</div>
				<input type="submit" id="logbtn" class="hc vc" value="수정하기"/>
				<input type="button" class="hc vc" value="회원탈퇴" onClick="location.href='account_delete.do'">
			</form>
		</div>
	</section>
</body>
</html>