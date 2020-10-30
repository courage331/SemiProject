<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lec.beans.*"%>
<%
	// Controller 로부터 결과 데이터 받음
CustomerDTO[] arr = (CustomerDTO[]) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/mypage.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>마이 페이지</title>
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
	<!-- 컨텐츠A -->
	<section class="conA">
		<div class="container">
			<div class="announce">
				<h3>${sessionScope.userid }님의 예약 현황</h3>
			</div>
			<table>

			</table>
		</div>
	</section>
	<!-- 컨텐츠B -->
	<section class="conB">
		<div class="container">
			<h3>${sessionScope.c_num }</h3>
			<h3>뼈다귀현황</h3>
		</div>
	</section>

		<!-- 푸터 -->
	<footer>
		<div class="container">
			<div class="footer_">
				<div class="footer_logo">
					<i class="fas fa-dog"></i>
				</div>
				<div class="footer_main">
					<div class="footer_leader">
						<h4>(주) 왈왈호텔 역삼 지점</h4>
						<span class="footer_text">대표이사 : 성연철좌</span>
						<span class="footer_text">사업자번호 : 321-123-77777</span>
						<span class="footer_text">주소 : 서울 강남구 테헤란로 146 왈왈 호텔</span>
						<span class="footer_text">전화 : 1111-2222</span>
					</div>
					<div class="footer_cosat">
						<h4>(주) COSAT </h4>
						<span class="footer_text">팀장 : 김지민</span>
						<span class="footer_text">팀원 : 이호인</span>
						<span class="footer_text">팀원 : 이주혁</span>
						<span class="footer_text">팀원 : 장정호</span>
						<span class="footer_text">팀원 : 김영재</span>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
<script src="JS/index.js" type="text/javascript"></script>
</html>