<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% // Controller 로부터 결과 데이터 받음
	ProductDTO [] arr = (ProductDTO [])request.getAttribute("list");
%>
<!-- 메인 페이지  -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	<h1>쇼핑</h1>
	<br>
	<div class="bbbbb">
	<%
		if(session.getAttribute("c_num") != null){
			int c_num = Integer.parseInt(((String)session.getAttribute("c_num")));
			if(c_num == 3){
	%>
			<button class="editBt" onclick="location.href = 'shopWrite.do'" style="font-size: 10px;  padding:10px 10px; float: right;">글 작성</button>
	<%
			} else {

			}
		}
	%>
	</div>
	<br>
	
	<!-- 컨텐츠B -->
	<div class="conshop">

<%
	if(arr != null){
		for(int i = 0; i < arr.length; i++){
%>
				<div class="item<%=i%>"><img src="img/<%=arr[i].getPro_name() %>.jpg"><br>
					종류 : <%=arr[i].getPro_kind() %><br>
					가격 : <%=arr[i].getPro_price() %><br>
					재고 : <%=arr[i].getPro_cnt() %><br>
					 <button onclick="openC()">구매하기</button></div>
					 <!-- 
					 "window.open('shopBuy.jsp','장바구니','width=430,height=500,location=no,status=no,scrollbars=yes');
					  -->
				<form name = "shopBuy" id="shopBuy" method=post">
				<input type='hidden' id='pKind' name="pKind" value='<%=arr[i].getPro_kind()%>'>
				<input type='hidden' id='price' name="price" value='<%=arr[i].getPro_price()%>'>
				</form>

<%			
		} // end for
	} // end if
%>

	</div>

	
	
		
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>

</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc2df8359ac0dd02633bb7bf5a6a5456"></script>
<script type="text/javascript" src="JS/use.js"></script>
<script type="text/javascript" src="JS/shop.js"></script>

</html>




