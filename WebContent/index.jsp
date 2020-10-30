<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 메인 페이지  -->
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
<title>왈왈 호텔</title>
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
					<li><a href="login.jsp"><div>로그인</div></a></li>
				</ul>
			</nav>
		</div>
	</header>
	<!-- 컨텐츠A -->
	<section class="conA">
		<div class="container">
			<img id="main_pethotel" alt="애견호텔" src="img/main_pethotel.png">
		</div>
	</section>
	<!-- 컨텐츠B -->
	<section class="conB">
		<div class="container">
			<div class="guide_announce">
				<h3>왈왈 호텔은 365일 연중 무휴로 운영됩니다.</h3>
			</div>
			<div class="guide">
				<div class="guide_img">
					<img id="main_dog" alt="강아지" src="img/main_dog.png">
				</div>
				<div class="guide_main">
					<div class="guide_top_time">
						<img alt="시계" src="img/time.png">
						<p>매일 09:00 ~ 21:00</p>
					</div>
					<div class="guide_top_friend">
						<img alt="플러스친구" src="img/friend.png">
						<p>플러스친구 [왈왈호텔]로 검색</p>
					</div>
					<div class="guide_bottom_phone">
						<img alt="번호" src="img/phone.png">
						<p>왈왈 호텔 서울 지점 1111-2222</p>
					</div>
					<div class="guide_bottom_route">
						<img alt="위치" src="img/route.png">
						<p>서울 강남구 테헤란로 146 왈왈 호텔</p>
					</div>
				</div>
			</div>
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








