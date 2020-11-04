<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/pet_update.css">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>반려견 상세보기</title>
</head>

<%
	PetDTO[] arr = (PetDTO[]) request.getAttribute("list");
	String pet_name = request.getParameter("pet_name");
	int pet_age = Integer.parseInt(request.getParameter("pet_age"));
	int pet_weight = Integer.parseInt(request.getParameter("pet_weight"));
%>
<body>

	<!-- 헤더 -->
	<header>
		<div class="container">
			<i class="fas fa-dog"></i>
			<h2>예약 현황</h2>
			<input type="button" value="X" onClick="self.close();">
		</div>
	</header>


	<%=pet_name %>
	<%=pet_age %>
	<%=pet_weight %>
	<!-- 푸터 -->
	<footer>
		<div class="container">
			<button class="bacc" id="bacc" onclick='byebye()'>
				<h2>돌아가기</h2>
			</button>
		</div>
	</footer>
</body>
</html>