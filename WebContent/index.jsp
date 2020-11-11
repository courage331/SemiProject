<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 메인 페이지  -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/index.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<title>왈왈 호텔</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
	<!-- 메인 배너 -->
	<div class="mainbanner">
		<div class="slick-container">
			<div class="item">
				<img class="item_img" src="img/dog_2.gif">
				<div class="item_text">
					<h2>최고의 힐링 공간, 호텔&데이케어</h2>
					<br>
					<h3>반려견이 새로운 환경에도 쉽게 적응할 수 있도록 특성에 맞는 교육 서비스를 제공합니다.</h3>
				</div>
			</div>
			<div class="item">
				<img class="item_img" src="img/dog_4.gif">
				<div class="item_text">
					<h2>예뻐지는 힐링라이프, 그루밍&스파</h2>
					<br>
					<h3>트라우마, 심리적 요인들을 고려하여 반려견 특성에 맞는 그루밍 기법으로 스트레스를 최소화합니다.</h3>
				</div>
			</div>
			<div class="item">
				<img class="item_img" src="img/dog_3.gif">
				<div class="item_text">
					<h2>즐거운 교육 공간, 유치원</h2>
					<br>
					<h3>국제공인자격증을 갖춘 전문가들이 교육과 케어 서비스를 제공하는 프리미엄 유치원 입니다.</h3>
				</div>
			</div>
		</div>
	</div>
	<!-- 컨텐츠A -->
	<section class="conA">
		<div class="container">
			<div class="text">
				<h2>BEST SPACE FOR MY DOG</h2>
				<br> <br>
				<h3>
					모든 라이프 케어 서비스가 한 곳에 있는 <br>400평 규모의 프리미엄 펫케어 테마공간입니다.
				</h3>
			</div>
		</div>
	</section>
	<!-- 컨텐츠B -->
	<section class="conB">
		<div class="container">
			<!-- 개요 (이이콘 + 텍스트) -->
			<div class="text">
				<span class="fas fa-home icon"></span>
				<h2>예약하기란?</h2>
				<p>반려견과 보호자를 위한 안전하고 편리한 맞춤형 서비스와 엄선된 전문가들의 신뢰 높은 토탈케어 서비스를
					제공합니다.</p>
				<c:choose>
					<c:when test="${not empty sessionScope.userid }">
						<a href="reservation.do">MORE...<span
							class="fa fa-chevron-right"></span></a>
					</c:when>
					<c:when test="${empty sessionScope.userid }">
						<a href="login.do">MORE...<span class="fa fa-chevron-right"></span></a>
					</c:when>
				</c:choose>
			</div>

			<div class="text">
				<span class="fa fa-info-circle icon"></span>
				<h2>이용안내</h2>
				<p>이용안내를 읽고 언제라도 왈왈호텔 서비스를 이용 할 수 있습니다.</p>
				<a href="use.jsp">MORE... <span class="fa fa-chevron-right"></span>
				</a>
			</div>


			<div class="text">
				<span class="fa fa-bone icon"></span>
				<h2>쇼핑하기</h2>
				<p>강아지에게 최상의 상품을 제공합니다.</p>
				<a href="shop.do">MORE... <span class="fa fa-chevron-right"></span>
				</a>
			</div>

			<div class="text">
				<span class="fa fa-clipboard-list icon"></span>
				<h2>후기 게시판</h2>
				<p>다른 사람들과 왈왈호텔 이용후기를 공유해보세요.</p>
				<a href="review.do?page=1">MORE... <span
					class="fa fa-chevron-right"></span>
				</a>
			</div>

		</div>
	</section>

	<!-- 컨텐츠C -->
	<section class="conC">
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
	<jsp:include page="common/footer.jsp"></jsp:include>

</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="JS/index.js"></script>
</html>





