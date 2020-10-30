<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link rel="stylesheet" href="CSS/index.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>왈왈 호텔</title>
<script src="ckeditor/ckeditor.js"></script>
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
			<a href="index.jsp" class="headA"><i class="fas fa-dog"></i></a>
			<nav class="headN">
				<ul>
					<c:choose>
						<c:when test="${not empty sessionScope.userid }">
							<li><a class="mainmenu" href="reservation.do"><div>예약하기</div></a></li>
						</c:when>
						<c:when test="${empty sessionScope.userid }">
							<li><a class="mainmenu" href="test_login.jsp"><div>예약하기</div></a></li>
						</c:when>
					</c:choose>
					<li><a class="mainmenu" href="use.jsp"><div>이용안내</div></a></li>
					<li><a class="mainmenu" href="shop.jsp"><div>쇼핑</div></a></li>
					<li><a class="mainmenu" href="review.do"><div>후기</div></a></li>
					<c:choose>
						<c:when test="${not empty sessionScope.userid }">
							<li class="submenu"><a class="mainmenu" href="mypage.jsp"><div>내정보</div></a>
								<ul class="submenulist" style="display: none;">
									<li><a href="#"><div>마이 페이지</div></a></li>
									<li><a href="#"><div>내 정보관리</div></a></li>
									<li><a href="#"><div>애완견 정보관리</div></a></li>
									<li><a href="test_logout.jsp"><div>로그아웃</div></a></li>
								</ul></li>
						</c:when>
						<c:when test="${empty sessionScope.userid }">
							<li><a class="mainmenu" href="test_login.jsp"><div>로그인</div></a></li>
						</c:when>
					</c:choose>
				</ul>
			</nav>
		</div>
	</header>
	<section class="conA">
		<div class="container">
			<h2 style="text-align: center">리뷰 수정</h2>
		</div>
	</section>
		<section class="conB">
		<div class="container">
	<form name="frm" action="updateOk.do" method="post" onsubmit="return chkSubmit()">
	<input type="hidden" name="num" value="<%= num %>">
	제목:
	<input type="text" name="subject" value="<%= subject%>"><br>
	평점:<br>
	<input type="radio" name="star" value="1" <%= astar%>>★☆☆☆☆<br>
	<input type="radio" name="star" value="2" <%= bstar%>>★★☆☆☆<br>
	<input type="radio" name="star" value="3" <%= cstar%>>★★★☆☆<br>
	<input type="radio" name="star" value="4" <%= dstar%>>★★★★☆<br>
	<input type="radio" name="star" value="5" <%= estar%>>★★★★★<br>
	<br>
	<br>
	내용:<br>
	<textarea name="content" id="editor1"><%= content %></textarea>
	<script>
		CKEDITOR.replace('editor1',{
			allowedContent: true,    // HTML 태그 자동 삭제 방지 설정
			width: '800px',       //  최초 너비, 높이 지정 가능
			height: '400px'
		});
	</script>
	<input type="hidden" name="c_num" value="<%= c_num%>">
	<br><br>
	<input type="submit" value="수정하기"/>
	</form>
			</div>

	</section>
	
	
	<section class="conB">
		<div class="container">
		<button onclick="history.back()">◀◀이전으로</button>
		<button onclick="location.href='review.do'">목록보기</button>
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








