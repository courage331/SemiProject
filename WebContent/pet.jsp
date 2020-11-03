<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lec.beans.*"%>
<%
	// Controller 로부터 결과 데이터 받음
PetDTO[] arr = (PetDTO[])request.getAttribute("list");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<title>애완견 정보 관리</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
	<!-- 컨텐츠A -->
	<section class="conA">
		<div class="container">
		<!-- for 문 돌려야됨 -->
			<h3>펫 들</h3>
			<h3><%=arr[0].getPet_name()%></h3>
			<h3><%=arr[0].getPet_age()%>살</h3>
			<h3><%=arr[0].getPet_weight()%>kg</h3>
		</div>
	</section>
	<hr>
	<hr>
	<!-- 컨텐츠B -->
	<section class="conB">
		<div class="container">
			<h3>펫 정보 추가</h3>
			<form name="frm" action="petOk.do" method="post" onsubmit="return chkSubmit()">
				강아지 이름<input type="text" name="p_name"><br> 
				강아지 나이<input type="text" name="p_age"><br> 
				강아지 무게<input type="text" name="p_weight"><br>
				<input type="submit" value="반려추" />
				<!--  바로 전 화면으로 가게하면 더 좋을듯// 가는게 아니라 submit이 되어야함// -->
			</form>
		</div>
	</section>
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>

<script type="text/javascript" src="JS/pet.js"></script>
</html>