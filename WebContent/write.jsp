<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 이호인 리뷰 화면   -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<title>왈왈 호텔</title>
<script src="ckeditor/ckeditor.js"></script>
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
					<li><a href="review.do"><div>후기</div></a></li>
					<li><a href="login.jsp"><div>로그인</div></a></li>
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
	<h2>글작성</h2>
	<form name="frm" action="writeOk.do" method="post" onsubmit="return chkSubmit()"><br>
	<!--  작성자:-->
	<!-- <input type="text" name="name"/><br>-->
	제목:
	<input type="text" name="subject"/><br>
	평점:<br>
	<input type="radio" name="star" value="1">1점<br>
	<input type="radio" name="star" value="2">2점<br>
	<input type="radio" name="star" value="3">3점<br>
	<input type="radio" name="star" value="4">4점<br>
	<input type="radio" name="star" value="5">5점<br>
	내용:<br>
	<textarea name="content" id="editor1"></textarea>
	<script>
	CKEDITOR.replace('editor1', {
		allowedContent: true,    // HTML 태그 자동 삭제 방지 설정
		width: '800px',       //  최초 너비, 높이 지정 가능
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
	<input type="submit" value="등록"/>
	</form>
	<br>
	<button type="button" onclick="location.href='review.do'">목록으로</button>
	
	<!-- 컨텐츠B -->
	<section class="conB">
		<div class="container">
		</div>
	</section>
	<!-- 컨텐츠C -->
	<section class="conC">
		<div class="container">
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








