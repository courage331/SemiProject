<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 -->
	<header>
		<div class="container">
			<a href="index.jsp" class="headA"><i class="fas fa-dog"></i></a>
			<button class="head-btn" style="display: none"><i class="fas fa-bars"></i></button>
			<nav class="headN">
				<ul>
					<c:choose>
						<c:when test="${not empty sessionScope.userid }">
							<li><a class="mainmenu" href="reservation.do"><div>예약하기</div></a></li>
						</c:when>
						<c:when test="${empty sessionScope.userid }">
							<li><a class="mainmenu" href="login.do"><div>예약하기</div></a></li>
						</c:when>
					</c:choose>
					<li><a class="mainmenu" href="use.jsp"><div>이용안내</div></a></li>
					<li><a class="mainmenu" href="shop.do"><div>쇼핑</div></a></li>
					<li><a class="mainmenu" href="review.do?page=1"><div>후기</div></a></li>
					<c:choose>
						<c:when test="${not empty sessionScope.userid }">
							<li class="submenu"><a class="mainmenu" href="#"><div>내정보</div></a>
								<ul class="submenulist" style="display: none;">
									<li><a href="mypage.do?page=1"><div>마이 페이지</div></a></li>
									<li><a href="myinfo.do"><div>내 정보관리</div></a></li>
									<li><a href="pet.do"><div>애완견 정보관리</div></a></li>
									<li><a href="logOut.jsp"><div>로그아웃</div></a></li>
								</ul></li>
						</c:when>
						<c:when test="${empty sessionScope.userid }">
							<li><a class="mainmenu" href="login.do"><div>로그인</div></a></li>
						</c:when>
					</c:choose>
				</ul>
			</nav>
		</div>
	</header>
</body>

<script src="JS/index.js" type="text/javascript"></script>
</html>