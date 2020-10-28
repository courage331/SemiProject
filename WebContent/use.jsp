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
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>이용 안내</title>
</head>
<body>
	<!-- 헤더 -->
	<header>
		<div class="container">
			<a href="index.jsp" class="headA">로고</a>
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
			<div id="tel">
				<h3>운영시간</h3>
				<p>매일 10:30 ~ 21:00
			</div>
			<table>
				<tr>
					<td>왈왈호텔은 연중 무휴로 운영됩니다.</td>
				</tr>
				<tr>
					<td>독파크를 제외한 모든 서비스는 100% 예약제로 운영됩니다.</td>
				</tr>
				<tr>
					<td>호텔과 유친원은 사전예약 시 8시부터 입실이 가능합니다. (사전예약 필수)</td>
				</tr>
				<tr>
					<td>사전입실 시 개인 상담이 어려우니 양해해 주시기 바랍니다.</td>
				</tr>
			</table>
			<div id="time">
				<h3>상담문의</h3>
				<p>예약 및 상담시간 08:00 ~ 20:00
			</div>
			<table>
				<tr>
					<td>왈왈 호텔 서울 지점 1111-2222</td>
				</tr>
				<tr>
					<td>왈왈 호텔 서울 지점 1111-2222</td>
				</tr>
				<tr>
					<td>왈왈 호텔 서울 지점 1111-2222</td>
				</tr>
			</table>
			<div id="announce">
				<h3>안내사항</h3>
				<p>이용 시 주의사항
			</div>
			<table>
				<tr>
					<td>1년 이내 5가지 접종(종합, 코로나, 켄넬코프, 신종 인플루엔자, 광견병) 받지 않은 반려견은 입실이
						제한됩니다.<br> * 접종기록은 접종병원명이 꼭 필요하므로 증빙 자료는 미리 준비해주세요.
					</td>
				</tr>
				<tr>
					<td>1살 미만의 반려견인 경우 항체 검사가 필수 입니다.<br> (단, 1살 이상 시 재접종 기록
						확인)
					</td>
				</tr>
				<tr>
					<td>생리,건강문제 또는 공격성이 강해 타 고객의 이용에 피해가 되는 반려견 일 경우 입실이 제한됩니다.</td>
				</tr>
			</table>
			<div id="route">
				<h3>오시는 길</h3>
				<p>왈왈호텔 위치
			</div>
			<table>
				<tr>
					<td>역삼~~~~~~~~~~~~ 호텔 <br> * 주차안내 ~~~
					</td>
				</tr>
				<tr>
					<td>지하철 이용 시 <br> <br> 어쩌구저쩌구
					</td>
				</tr>
				<tr>
					<td>버스 이용시 <br> <br> 어쩌구저쩌구
					</td>
				</tr>
			</table>
		</div>
	</section>
	<hr>
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