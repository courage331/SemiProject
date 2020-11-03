<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="CSS/charge.css">
<title>뼈다귀 충전하기</title>

</head>
<body>
	<!-- 헤더 -->
	<header>
		<div class="container">
			<i class="fas fa-dog"></i>
			<h2>충전</h2>
			<input type="button" value="X" onClick="window.close();">
		</div>
	</header>

	<!-- 컨텐츠 A  -->
	<section class="conA">
		<div class="container">
			<div class="input_cash">
				<div id="area">0원</div>
				<div>
					<button type="button" id="close_cash">X</button>
				</div>
			</div>
			<hr>
			<div class="select_cash">
				<div class="sel_box">
					<button type="button" class="price_btn" value="1000">+1천원</button>
				</div>
				<div class="sel_box">
					<button type="button" class="price_btn" value="5000">+5천원</button>
				</div>
				<div class="sel_box">
					<button type="button" class="price_btn" value="10000">+1만원</button>
				</div>
				<div class="sel_box">
					<button type="button" class="price_btn" value="1000000">+100만원</button>
				</div>
			</div>
			<div class="bone">
				<i class="fas fa-bone"></i>
				<p id="bone_rs">0</p>
			</div>
		</div>
	</section>

	<!-- 컨텐츠 B  -->
	<section class="conB">
		<div class="container">
			<h2>충전수단</h2>
			<div class="select_radio">
				<input type="radio" name="chk_cash" value="kakao" checked="checked">
				카카오 페이 <input type="radio" name="chk_cash" value="cash"> 무통장
				입금
			</div>
		</div>
	</section>

	<!-- 컨텐츠 C  -->
	<section class="conC">
		<div class="container">
			<h2>충전 후 결제시 혜택</h2>
			<p>- 충전 금액의 10% 적립
			<p>- 소득공제 혜택 적용 (현금 영수증 발행)
		</div>
	</section>

	<!-- 푸터 -->
	<footer>
		<div class="container">
			<button class="cashok">
				<h2>충전하기</h2>
			</button>
		</div>
	</footer>

</body>
<script type="text/javascript" src="JS/charge.js"></script>
</html>