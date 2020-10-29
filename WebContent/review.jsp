<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 이호인 리뷰 화면   -->
<%@ page import="com.lec.beans.*" %>

<% // Controller 로부터 결과 데이터 받음
	ReviewDTO [] arr = (ReviewDTO [])request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>왈왈 호텔</title>
<style>
table {width: 80%;}
table, th, td {
	border : 1px solid black;
	border-collapse: collapse;
	text-align: center;
	margin-left: 10%;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<header>
		<div class="container">
			<!-- 정호 : 로고 추가 (10/29) -->
			<a href="index.jsp" class="headA"><i class="fas fa-dog"></i></a>
			<nav class="headN">
				<ul>
					<li><a href="reservation.jsp"><div>예약하기</div></a></li>
					<li><a href="use.jsp"><div>이용안내</div></a></li>
					<li><a href="shop.jsp"><div>쇼핑</div></a></li>
					<li><a href="review.jsp"><div>후기</div></a></li>
					<li><a href="test_login.jsp"><div>로그인</div></a></li>
				</ul>
			</nav>
		</div>
	</header>
		<hr>
		<br>
		<br>
		<h2 style="text-align: center;">후기 리스트</h2>
		<br>
		<br>
		<table>
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<!-- <th>작성자</th>-->
				<th>별점</th>
				<th>등록일</th>
			</tr>
<%
	if(arr != null){
		for(int i = 0; i < arr.length; i++){
%>
			<tr>
				<td><a href="view.do?num=<%= arr[i].getNum()%>"><%= arr[i].getNum() %></a></td>
				<td><a href="view.do?num=<%= arr[i].getNum()%>"><%= arr[i].getSubject() %></a></td>
				<!--<td><%= arr[i].getSubject() %></td>-->
				<td><a href="view.do?num=<%= arr[i].getNum()%>"><%= arr[i].getStar() %></a></td>
				<td><a href="view.do?num=<%= arr[i].getNum()%>"><%= arr[i].getRegDate() %></a></td>
			</tr>
<%			
		} // end for
	} // end if
%>
		</table>
		<br>
	<%
		if(session.getAttribute("c_num") != null){
	%>
		<button onclick="location.href = 'write.do'" style="font-size: 20px;  padding:10px 10px; float: right;">글 작성</button>
	<%
		} else {
	%>
		<button onclick="location.href = 'test_login.jsp'" style="font-size: 20px;  padding:10px 10px; float: right;">글 작성</button>
	<%
		}
	%>
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








