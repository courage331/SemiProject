<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 이호인 리뷰 화면   -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/write.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>왈왈 호텔</title>
<script src="ckeditor/ckeditor.js"></script>

</head>
<body>
	<!-- 호인 11/02 include -->
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
	<script type="text/javascript" src="JS/write.js"></script>
	<body>
	<section class="conA">
		<div class="container">
		<br>
		<br>
			<h1>글 작성</h1>
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
	<section class="btnA">
		<div class="container">
			<button type="button" onclick="location.href='review.do'">목록으로</button>
		</div>
	</section>
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>








