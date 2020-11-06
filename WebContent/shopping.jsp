<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.lec.beans.*"%>
<!DOCTYPE html>
<%
	ProductDTO[] arr = (ProductDTO[]) request.getAttribute("list");
	CustomerDTO[] crr= (CustomerDTO[]) request.getAttribute("clist");
	String c_num = (String)session.getAttribute("c_num");
	String pName = request.getParameter("nn");
	String pKind = request.getParameter("kind");
	String price = request.getParameter("price");
	int c_money = crr[0].getCus_money();
%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="CSS/shopping.css">
<title>물품 구매</title>
<script>
	alert(<%=pName%>);
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

	<form name="frm" action="shoppingOk.do" method="post"><br>
		<input type="hidden" name="pName" value="<%=pName%>"/><br>
		<input type="hidden" name="price" value="<%=price%>"/><br>

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
	<!-- 
	
	 -->
	<input type="hidden" name="c_num" value="<%= a %>"><br>
	<br><br>
	
	
	</a>

	<!-- 컨텐츠 A  -->
	<section class="conA">
		<div class="container">
			<%=a %>
		<div class="content">
			 	  <img src="img/<%=pName%>.jpg"><br>
		</div>
			 	  <div class="ctext"></div>
			종류 : <%=pKind %> <br>
			가격 : <%=price %><br>
	</section>
	결제 금액 : <%=price %>
	보유 금액 : <%=c_money %>
	<script>
	alert(<%=a%>)
	</script>

	<!-- 컨텐츠 C  -->
	<section class="conC">
		<div class="container">
		</div>
	</section>
	<!-- 푸터 -->
	<footer>
		<div class="container">
			<button class="cashok" onclick="submit1()">
				<h2>구매하기</h2>
			</button>
		</div>
	</footer>
	<!-- 
	
	<input type="submit" value="등록하기"/>
	 -->
	</form>

</body>
<script type="text/javascript" src="JS/shopping.js"></script>
</html>