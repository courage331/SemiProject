<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 이호인 리뷰 화면   -->
<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% // Controller 로부터 결과 데이터 받음
	ReviewDTO [] arr = (ReviewDTO [])request.getAttribute("list");
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
	int num = arr[0].getNum();
	String subject = arr[0].getSubject();
	String content = arr[0].getContent();
	String regdate = arr[0].getRegDate();
	int star = arr[0].getStar();
	int c_num = arr[0].getC_num();  // 게시글의 cus_num
	
	String ca;
	int cus_num; // 로그인 한 사람의 cus_num
	if(session.getAttribute("c_num") != null){
		ca = (String)session.getAttribute("c_num");
		cus_num = Integer.parseInt(ca);
	}else {
		ca = null;
		cus_num = 0;
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>왈왈 호텔</title>
</head>
<body>
	<!-- 헤더 -->
	<header>
		<div class="container">
			<a href="index.jsp" class="headA"><i class="fas fa-dog"></i></a>
			<nav class="headN">
				<ul>
					<c:choose>
						<c:when test="${not empty sessionScope.userid }">
							<li><a href="reservation.do"><div>예약하기</div></a></li>
						</c:when>
						<c:when test="${empty sessionScope.userid }">
							<li><a href="test_login.jsp"><div>예약하기</div></a></li>
						</c:when>
					</c:choose>
					<li><a href="use.jsp"><div>이용안내</div></a></li>
					<li><a href="shop.jsp"><div>쇼핑</div></a></li>
					<li><a href="review.do"><div>후기</div></a></li>
					<c:choose>
						<c:when test="${not empty sessionScope.userid }">
							<li class="submenu"><a href="mypage.jsp"><div>내정보</div></a>
								<ul style="display: none;">
									<li><div>마이 페이지</div></li>
									<li><div>내 정보관리</div></li>
									<li><div>애완견 정보관리</div></li>
									<li><div>로그아웃</div></li>
								</ul></li>
						</c:when>
						<c:when test="${empty sessionScope.userid }">
							<li><a href="test_login.jsp"><div>로그인</div></a></li>
						</c:when>
					</c:choose>
				</ul>
			</nav>
		</div>
	</header>
	<script>
	function chkDelete(num){
		// 삭제 여부, 다시 확인하고 진행하기
		var r = confirm("삭제하시겠습니까?");
			
		if(r){
			location.href = 'deleteOk.do?num=' + num;
		}
	}
	function deleteChk(){
		alert('권한이 없습니다.');
	}
	</script>
	<br>
	<section class="conA">
		<div class="container">
			<h1 style="text-align: center;"><span style="color: #3f3f3f;">리뷰&amp후기</span></h1>
		</div>
	</section>
	<br>
	<br>
	<section class="conB">
		<div class="container">
			<h3 style="text-algin: center;"><span style="color: #3f3f3f;">제목: <%= subject %></span></h3>
		</div>
	</section>
	<br>
	<br>
	<br>
	<section class="conB">
		<div class="container" style="font-size: 20px;"> 
			<div class="col-12" style="background-color:#F8F8FF;">
				글 번호 : <%= num%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				제목: <%= subject %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 평점: <%= star %>점</div>
			<div class="col-12" style="background-color:#F8F8FF;">등록일: <%= regdate %></div>
		</div>
	</section>
	<section class="conB">
		<div class="container">
			<div class="guide_anounce">
				<br> 내용:
				<hr>
				<div>
					<%=content%>
				</div>
				<hr>
			</div>
		</div>
	</section>
	<br>
	<script>
	function userChk(){
		alert("권한이 없습니다.");
	}
	</script>
	<section class="conC">
		<div class="container">
		<% if(cus_num == c_num) {%>
			<button class="btn btn-warning" onclick="location.href='update.do?num=<%= num%>'">수정하기</button>
		<%} else {%> 
			<button class="btn btn-warning" onclick="userChk()">수정하기</button>
		<% } %>
		<button class="btn btn-warning" onclick="location.href='review.do'">목록보기</button>
		<% if(cus_num == c_num) {%>
			<button class="btn btn-warning" onclick="chkDelete(<%= num%>)">삭제하기</button>
		<%} else {%> 
			<button class="btn btn-warning" onclick="deleteChk()">삭제하기</button>
		<%} %>
		<%if(cus_num != 0){ %>
		<button class="btn btn-warning" onclick="location.href='write.do'">새글작성</button>
		<%} else {%> 
		<button class="btn btn-warning" onclick="location.href='test_login.jsp'">새글작성</button>
		<%} %>
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








