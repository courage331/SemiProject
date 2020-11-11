<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 1103영재 작성  + 이호인-->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="CSS/shopwrite.css">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>상품 추가</title>
<script src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="JS/shopwrite.js"></script>
</head>
<script>
	
</script>
<body>

	<jsp:include page="common/header.jsp"></jsp:include>
<body>
	<section class="conA">
		<div class="container">
			<br> <br>
			<h1>상품 추가</h1>
			<br> <br>
		</div>
	</section>
	<section class="conB">
		<div class="container">
			<form name="frm" action="shopWriteOk.do" method="post" onsubmit="return chkSubmit()">
				상품이름: <input type="text" name="pName" /><br>
				<br>
				상품종류: 
				<label><input type="radio" name="pKind" value="rice"/>사료</label>
				<label><input type="radio" name="pKind" value="shampoo"/>샴푸</label>
				<label><input type="radio" name="pKind" value="snack"/>간식</label>
				<label><input type="radio" name="pKind" value="etc"/>기타</label><br>
				<br>
				상품가격: <input type="number" name="pPrice"/><br>
				<br>
				재고수량: <input type="number" name="pCnt"/><br>
				<br>
				사진첨부: (<img src="img/imgpush.png">)클릭!<br>
			<textarea name="pCtt" id="editor1"></textarea>
			<script>
			CKEDITOR.replace('editor1', {
				allowedContent: true,    // HTML 태그 자동 삭제 방지 설정
				width: '100%px',       //  최초 너비, 높이 지정 가능
				height: '400px',
				filebrowserUploadUrl: '${pageContext.request.contextPath}/fileUpload.do'
			});
			</script>	
			<br>
				<input type="submit" value="등록" />
			</form>
		</div>
	</section>
	<br>
		<section class="btnA">
		<div class="container">
			<button type="button" onclick="history.back()">돌아가기</button>
		</div>
	</section>
		<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>











