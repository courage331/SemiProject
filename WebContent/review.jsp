<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 이호인 리뷰 화면   -->
<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% // Controller 로부터 결과 데이터 받음
	ReviewDTO [] arr = (ReviewDTO [])request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/review.css">
<title>왈왈 호텔</title>
<style>
</style>
</head>
<body>
	<!-- 호인 11/02 수정 -->
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
	<br>
	<br>
		<section class="conA">
			<div class="container">
				<h1><span style="color: #3f3f3f;">리뷰&amp후기</span></h1>
			</div>
		</section>
		<br>
		<br>
		<section class="conB">
<%
	int number = 0; // 총 글 갯수
	int ak = 0; // 글 갯수 파악 
		if(arr != null){
			for(ak = 0; ak < arr.length; ak++){
				number++;
			}
		}
%>
		<div class="container">
		<table>
		<thead>
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<!-- <th>작성자</th>-->
				<th>별점</th>
				<th>등록일</th>
			</tr>
		</thead>
<%
	if(arr != null){
		for(int i = 0; i < arr.length; i++){
%>
		<tbody>
			<tr>
				<td><a id="akak" href="view.do?num=<%= arr[i].getNum()%>"><%= number %></a></td>
				<td style="text-align: left;"><a id="akak" href="view.do?num=<%= arr[i].getNum()%>"><%= arr[i].getSubject() %></a></td>
				<!--<td><%= arr[i].getSubject() %></td>-->
				<td><a id="akak" href="view.do?num=<%= arr[i].getNum()%>"><%
						if(arr[i].getStar() == 1){%>
						★☆☆☆☆
						<% } else if(arr[i].getStar() == 2) {%>
						★★☆☆☆
						<% } else if(arr[i].getStar() == 3) {%>
						★★★☆☆
						<% } else if(arr[i].getStar() == 4) {%>
						★★★★☆
						<% } else if(arr[i].getStar() == 5) {%>
						★★★★★
						<% } %>
				</a></td>
				<td><a id="akak" href="view.do?num=<%= arr[i].getNum()%>"><%= arr[i].getRegDate() %></a></td>
			</tr>
		</tbody>
<%			
		number--;
		} // end for
	} // end if
%>
		</table>
		</div>
		</section>
		<br>
	<section class="btnA">
		<div class="container">
	<%
		if(session.getAttribute("c_num") != null){
	%>
		<button onclick="location.href = 'write.do'">글 작성</button>
	<%
		} else {
	%>
		<button onclick="location.href = 'login.jsp'">글 작성</button>
	<%
		}
	%>
		</div>
	</section>
	<!-- 컨텐츠C -->
	<section class="conC">
		<div class="container">
		</div>
	</section>
	<!-- 푸터  -->
	<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>








