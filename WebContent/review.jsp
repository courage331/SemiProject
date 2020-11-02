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
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>왈왈 호텔</title>
<style>
table {width: 80%;}
table, th, td {
	border : 0.5px solid black;
	border-collapse: collapse;
	text-align: center;
	margin-left: 10%;
	border-left-style: none;
	border-right-style: none;
}
/* 이호인-----------------------*/
a#akak {
	text-decoration: none;
}

a#akak:link { /* 기본상태 스타일 */
	color: black;
	background-color: transparent;
	text-decoration: none;
}

a#akak:visited { /* 방문한 상태 스타일 */
	color: green;
	background-color: transparent;
	text-decoration: none;
}

a#akak:hover { /* 마우스가 올라간 상태 스타일 */
	color: red;
	background-color: transparent;
	text-decoration: underline;
}

a#akak:active { /* 마우스가 눌린 상태 스타일 */
	color: blue;
	background-color: transparent;
	text-decoration: underline;
}
/* 이호인-----------------------*/
</style>
</head>
<body>
	<!-- 호인 11/02 수정 -->
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
		<hr>
		<section class="conA">
			<div class="container">
				<h1 style="text-align: center;"><span style="color: #3f3f3f;">리뷰&amp후기</span></h1>
			</div>
		</section>
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
			<tr class="table-warning">
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
	<section class="conC">
		<div class="container">
	<%
		if(session.getAttribute("c_num") != null){
	%>
		<button  class="btn btn-warning" onclick="location.href = 'write.do'" style="font-size: 20px;  padding:10px 10px; float: right;">글 작성</button>
	<%
		} else {
	%>
		<button class="btn btn-warning" onclick="location.href = 'test_login.jsp'" style="font-size: 20px;  padding:10px 10px; float: right;">글 작성</button>
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
	<!-- 10/31 정호 -->
	<footer>
		<div class="container">
			<div class="footer_">
				<div class="footer_logo">
					<i class="fas fa-dog"></i>
				</div>
				<div class="footer_main">
					<div class="footer_leader">
						<h4>(주) 왈왈호텔 역삼 지점</h4>
						<span class="footer_text">대표이사 : 성연철좌</span>
						<span class="footer_text">사업자번호 : 321-123-77777</span>
						<span class="footer_text">주소 : 서울 강남구 테헤란로 146 왈왈 호텔</span>
						<span class="footer_text">전화 : 1111-2222</span>
					</div>
					<div class="footer_cosat">
						<h4>(주) COSAT </h4>
						<span class="footer_text">팀장 : 김지민</span>
						<span class="footer_text">팀원 : 이호인</span>
						<span class="footer_text">팀원 : 이주혁</span>
						<span class="footer_text">팀원 : 장정호</span>
						<span class="footer_text">팀원 : 김영재</span>
					</div>
				</div>
			</div>
		</div>
	</footer>

</body>
<!-- 정호 : 10/30 -->
<script src="JS/index.js" type="text/javascript"></script>
</html>








