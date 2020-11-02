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
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>쇼핑</title>
<link rel="stylesheet" href="CSS/shop.css">

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
	
	<!-- 컨텐츠B -->
	<section class="conA">
			<div class="container">
				<div class ="shopTitle"><h1>쇼핑</span></h1></div>
			</div>
			<section class="conC">
		<div class="container">
	<%
		if(session.getAttribute("c_num") != null){
	%>
		<button class="editBt" onclick="location.href = 'admin_write.do'" style="font-size: 10px;  padding:10px 10px; float: right;">글 작성</button>
	<%
		} else {
	%>
		<button class="editBt" onclick="location.href = 'test_login.jsp'" style="font-size: 10px;  padding:10px 10px; float: right;">글 작성</button>
	<%
		}
	%>
		</div>
	</section>
	<section class"=conB">
			<table>
			<tr>
				<th>제품</th>
				<th>내용</th>
				<th>가격</th>
				<th>구매</th>
			</tr>
			<tr>
				<th><img src="img/announce.jpg" width= 60 height =60></th>
				<th>유기농 사료</th>
				<th>3000원</th>
				<th>ㄴㄴㄴ</th>

			</tr>
			</table>
	</section>
	
	
		
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>

</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc2df8359ac0dd02633bb7bf5a6a5456"></script>
<script type="text/javascript" src="JS/use.js"></script>

</html>




