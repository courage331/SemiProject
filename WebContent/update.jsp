<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>
<% // Controller 로부터 결과 데이터 받음
	ReviewDTO [] arr = (ReviewDTO []) request.getAttribute("list");
	int num = Integer.parseInt(request.getParameter("num"));
%>

<%
	if(arr == null || arr.length == 0){
%>
	<script>
		alert("해당 정보가 삭제되거나 없습니다");
		history.back();
	</script>
<%
		return;  //  ★더이상 JSP 프로세싱 하지 않고 종료
	}
%>
<%
	String subject = arr[0].getSubject();
	String content = arr[0].getContent();
	String regdate = arr[0].getRegDate();
	int star = arr[0].getStar();
	int c_num = arr[0].getC_num();
	String astar = "";
	String bstar = "";
	String cstar = "";
	String dstar = "";
	String estar = "";
	if(star == 1){
		astar = "checked";
		bstar = "";
		cstar = "";
		dstar = "";
		estar = "";
	} else if(star == 2){
		astar = "";
		bstar = "checked";
		cstar = "";
		dstar = "";
		estar = "";
	} else if(star == 3){
		astar = "";
		bstar = "";
		cstar = "checked";
		dstar = "";
		estar = "";
	} else if(star == 4){
		astar = "";
		bstar = "";
		cstar = "";
		dstar = "checked";
		estar = "";
	} else if(star == 5){
		astar = "";
		bstar = "";
		cstar = "";
		dstar = "";
		estar = "checked";
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<title>왈왈 호텔</title>
</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	var subject = frm['subject'].value.trim();
	var star = frm["star"].value;
	
	if(subject == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["subject"].focus();
		return false;
	}
	
	return true;
}
</script>
<body>
	<!-- 헤더 -->
	<header>
		<div class="container">
			<nav class="headN">
				<ul>
					<li><a href="reservation.jsp"><div>예약하기</div></a></li>
					<li><a href="use.jsp"><div>이용안내</div></a></li>
					<li><a href="shop.jsp"><div>쇼핑</div></a></li>
					<li><a href="review.do"><div>후기</div></a></li>
					<li><a href="login.jsp"><div>로그인</div></a></li>
				</ul>
			</nav>
		</div>
	</header>
	<h2>수정</h2>
	<form name="frm" action="updateOk.do" method="post" onsubmit="return chkSubmit()">
	<input type="hidden" name="num" value="<%= num %>">
	제목:
	<input type="text" name="subject" value="<%= subject%>"><br>
	평점:<br>
	<input type="radio" name="star" value="1" <%= astar%>>1점<br>
	<input type="radio" name="star" value="2" <%= bstar%>>2점<br>
	<input type="radio" name="star" value="3" <%= cstar%>>3점<br>
	<input type="radio" name="star" value="4" <%= dstar%>>4점<br>
	<input type="radio" name="star" value="5" <%= estar%>>5점<br>
	내용:<br>
	<textarea name="content"><%= content %></textarea>
	<input type="hidden" name="c_num" value="<%= c_num%>">
	<br><br>
	<input type="submit" value="수정"/>
	</form>
	
	<button onclick="history.back()">이전으로</button>
	<button onclick="location.href='review.do'">목록보기</button>
	<!-- 컨텐츠B -->
	<section class="conB">
		<div class="container">
		</div>
	</section>
	<!-- 컨텐츠C -->
	<section class="conC">
		<div class="container">
		</div>
	</section>
	<!-- 푸터 -->
	<footer>
		<div class="container">
			<h3>푸터</h3>
		</div>
	</footer>

</body>
</html>








