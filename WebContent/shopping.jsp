<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.lec.beans.*"%>
<!DOCTYPE html>
<%
	ProductDTO[] arr = (ProductDTO[]) request.getAttribute("list");
	String a = request.getParameter("nn");
	String b = request.getParameter("kind");
	String c = request.getParameter("cnt");
%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="CSS/shopping.css">
<title>물품 구매</title>
<script>
	alert(<%=a%>);
</script>

</head>
<body>
	<!-- 헤더 -->
	<header>
		<div class="container">
			<i class="fas fa-dog"></i>
			<h2> 구 매</h2>
			<!--  <input type="button" value="X" onClick="">-->
		</div>
	</header>

	<!-- 컨텐츠 A  -->
	<section class="conA">
		<div class="container">
			 	  <img src="img/<%=a%>.jpg"><br>
			종류 : <%=b %> <br>
			가격 : <%=c %><br>
		</div>
	</section>


	<!-- 컨텐츠 C  -->
	<section class="conC">
		<div class="container">
			
		</div>
	</section>

	<!-- 푸터 -->
	<footer>
		<div class="container">
			<button class="cashok">
				<h2>구매하기</h2>
			</button>
		</div>
	</footer>

</body>
<script type="text/javascript" src="JS/shopping.js"></script>
</html>