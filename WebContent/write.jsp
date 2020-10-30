<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 이호인 리뷰 화면   -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>왈왈 호텔</title>
<script src="ckeditor/ckeditor.js"></script>
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
							<li><a href="reservation.do"><div>예약하기</div></a></li>
						</c:when>
						<c:when test="${empty sessionScope.userid }">
							<li><a href="test_login.jsp"><div>예약하기</div></a></li>
						</c:when>
					</c:choose>
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
	<script>
	function chkSubmit(){
		frm = document.forms["frm"];
		
		var subject = frm["subject"].value.trim();
		var star = "";
		
		for (i = 0; i < frm["star"].length; i++) {
			if(frm["star"][i].checked){
				star = frm["star"][i].value;
				break;
			}
		}
		
		if(subject == ""){
			alert("제목은 반드시 작성해야 합니다");
			frm["subject"].focus();
			return false;
		}
		
		if(star == ""){
			alert("별점을 골라주세요!");
			return false;
		}
		
		return true;	
	} // end chkSubmit()
	</script>
	<body>
	<section class="conA">
		<div class="container">
			<h2>글작성</h2>
		</div>
	</section>
	<section class="conB">
		<div class="container">
		<form name="frm" action="writeOk.do" method="post" onsubmit="return chkSubmit()"><br>
		<!--  작성자:-->
		<!-- <input type="text" name="name"/><br>-->
		제목:
		<input type="text" name="subject"/><br>
		<br>
		평점:<br>
		<input type="radio" name="star" value="1">★☆☆☆☆<br>
		<input type="radio" name="star" value="2">★★☆☆☆<br>
		<input type="radio" name="star" value="3">★★★☆☆<br>
		<input type="radio" name="star" value="4">★★★★☆<br>
		<input type="radio" name="star" value="5">★★★★★<br>
		<br>
		내용:<br>
		<textarea name="content" id="editor1"></textarea>
		<script>
		CKEDITOR.replace('editor1', {
			allowedContent: true,    // HTML 태그 자동 삭제 방지 설정
			width: '100%px',       //  최초 너비, 높이 지정 가능
			height: '400px',
			filebrowserUploadUrl: '${pageContext.request.contextPath}/fileUpload.do'
		});
		</script>	
		<%
		String name;
		int a;
		if(session.getAttribute("c_num") != null){
			name = (String)session.getAttribute("c_num");
			a = Integer.parseInt(name);
		}else{
			name = null;
			a = 0;
		}
	%>
	<input type="hidden" name="c_num" value="<%= a %>"><br>
	<br><br>
	<input type="submit" value="등록하기"/>
	</form>
			</div>
	</section>
	<br>
	<section class="conC">
		<div class="container">
			<button type="button" onclick="location.href='review.do'">목록으로</button>
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








