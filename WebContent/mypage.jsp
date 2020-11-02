<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lec.beans.*"%>
<%
	// Controller 로부터 결과 데이터 받음
CustomerDTO[] arr = (CustomerDTO[])request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/mypage.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>마이 페이지</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
	<!-- 컨텐츠A -->
	<section class="conA">
		<div class="container">
			<div class="announce">
				<h3>${sessionScope.userid }님의 예약 현황</h3>
			</div>
			<table>

			</table>
		</div>
	</section>
	<!-- 컨텐츠B -->
	<section class="conB">
		<div class="container">
			<h3>${sessionScope.c_num }</h3>
			<h3>뼈다귀현황</h3>
			<h3><%=arr[0].getCus_money() %></h3>
		</div>
	</section>

	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>