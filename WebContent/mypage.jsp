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
					<li><a href="reservation.jsp"><div>예약하기</div></a></li>
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
			<h3>푸터</h3>
			<form action="test_logout.jsp">
				<input type="submit" value="로그아웃"><br>
			</form>
		</div>
	</footer>
</body>
</html>