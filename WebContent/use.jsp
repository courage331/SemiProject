<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 이용 안내 페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/use.css">
<script src="https://kit.fontawesome.com/b95da9d126.js" crossorigin="anonymous"></script>
<title>이용 안내</title>
</head>
<body>
	<!-- 헤더 -->
	<header>
		<div class="container">
			<nav class="headN">
				<ul>
					<li><a href="reservation.jsp"><div>예약하기</div></a></li>
					<li><a href="use.jsp"><div>이용안내</div></a></li>
					<li><a href="shop.jsp"><div>쇼핑</div></a></li>
					<li><a href="review.jsp"><div>후기</div></a></li>
					<li><a href="login.jsp"><div>로그인</div></a></li>
				</ul>
			</nav>
		</div>
	</header>
	<!-- 컨텐츠A -->
	<section class="conA">
		<div class="container">
			<h3>이용 안내</h3>
		</div>
	</section>
	<!-- 컨텐츠B -->
	<section class="conB">
		<div class="container">
			<i class="fas fa-headset"></i>
		</div>
	</section>
	<!-- 컨텐츠C -->
	<section class="conC">
		<div class="container">
			<div id="map"></div>
		</div>
	</section>
	<!-- 푸터 -->
	<footer>
		<div class="container">
			<h3>푸터</h3>
		</div>
	</footer>

</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc2df8359ac0dd02633bb7bf5a6a5456"></script>
<script type="text/javascript" src="JS/use.js"></script>
</html>