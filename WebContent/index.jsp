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
				<img class="item_img" src="img/dog_1.gif">
				<div class="item_text">
					<h1>가족을 생각하는 마음으로 만들어졌습니다.</h1>
					<h2>아이들과 같은 순수한 마음의 자세로 보호자가 반려동물과 더불어 함께 즐겁게 뛰어 놀고 편안하게 쉴 수
						있는 확 트인 넓은 공간</h2>
				</div>
			</div>
			<div class="item">
				<img class="item_img" src="img/dog_2.gif">
				<div class="item_text">
					<h1>Hello</h1>
				</div>
			</div>
			<div class="item">
				<img class="item_img" src="img/dog_3.gif">
				<div class="item_text">
					<h1>Hello</h1>
				</div>
			</div>
			<div class="item">
				<img class="item_img" src="img/dog_4.gif">
				<div class="item_text">
					<h1>Hello</h1>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 컨텐츠B -->
	<section class="conB">
	    <div class="container">
	        <!-- 개요 (이이콘 + 텍스트) -->
	        <div class="text">
	            <span class="fas fa-home icon"></span>
	            <h2>예약하기란?</h2>
	            <p>반려견과 보호자를 위한 안전하고 편리한 맞춤형 서비스와 엄선된 전문가들의 신뢰 높은 토탈케어 서비스를 제공합니다.</p>
	            <c:choose>
					<c:when test="${not empty sessionScope.userid }">
						<a href="reservation.do">MORE...<span class="fa fa-chevron-right"></span></a>
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
	            <a href="use.jsp">MORE...
	            <span class="fa fa-chevron-right"></span>
	            </a>
	        </div>
	
	        
	        <div class="text">
	            <span class="fa fa-bone icon"></span>
	            <h2>쇼핑하기</h2>
	            <p>강아지에게 최상의 상품을 제공합니다.</p>
	            <a href="shop.do">MORE...
	                <span class="fa fa-chevron-right"></span>
	            </a>    
	        </div>
	        
	        <div class="text">
	            <span class="fa fa-clipboard-list icon"></span>
	            <h2>후기 게시판</h2>
	            <p>다른 사람들과 왈왈호텔 이용후기를 공유해보세요.</p>
	            <a href="review.do?page=1">MORE...
	                <span class="fa fa-chevron-right"></span>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="JS/index.js"></script>
</body>
</html>





