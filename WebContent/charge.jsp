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
			<input type="button" value="X" onClick="self.close()">
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
				<form name="frm" action="chargeOk.do" method="post">
					<i class="fas fa-bone"></i> <input type="text" name="bone_rs"
						id="bone_rs" value="0" readonly>
				</form>
			</div>
		</div>
	</section>

	<!-- 컨텐츠 B  -->
	<section class="conB">
		<div class="container">
			<h2>충전수단</h2>
			<div class="select_radio">
				<input type="radio" name="chk_cash" value="kakao"> 카카오 페이 <input
					type="radio" name="chk_cash" value="cash" checked="checked">
				무통장 입금
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

			<form action="kakao.jsp">

				<p>
					<span>name:</span> <input name="name">


					<!-- 값 가져오기 -->
				</p>
				<p>
					<span>이메일:</span> <input name="email">
				</p>
				<span>폰넘버:</span>
				<p>
					<input type="text" name="phone">
				</p>
				<span>주소:</span>
				<p>
					<input name="address">
				</p>
				<span>총가격:</span>
				<p>
					<input name="totalPrice">
				</p>
				<input type="submit" value="결제하기"> <input type="reset"
					value="취소하기">
			</form>
		</div>
	</footer>

</body>
<script type="text/javascript" src="JS/charge.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</html>