<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 이호인 리뷰 화면   -->
<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% // Controller 로부터 결과 데이터 받음
	ReviewDTO [] arr = (ReviewDTO [])request.getAttribute("list");
%>
<%
	if(arr == null || arr.length == 0){
%>
	<script>
		alert("해당 정보가 삭제되거나 없습니다");
		history.back();
	</script>
<%
		return;  //  ★더이상 JSP 프로세싱 하지 않고 종료
	}
%>
<%
	int num = arr[0].getNum();
	String subject = arr[0].getSubject();
	String content = arr[0].getContent();
	String regdate = arr[0].getRegDate();
	int star = arr[0].getStar();
	int c_num = arr[0].getC_num();  // 게시글의 cus_num
	
	String ca;
	int cus_num; // 로그인 한 사람의 cus_num
	if(session.getAttribute("c_num") != null){
		ca = (String)session.getAttribute("c_num");
		cus_num = Integer.parseInt(ca);
	}else {
		ca = null;
		cus_num = 0;
	}
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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>왈왈 호텔</title>
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
					<li><a href="review.do"><div>후기</div></a></li>
					<li><a href="test_login.jsp"><div>로그인</div></a></li>
				</ul>
			</nav>
		</div>
	</header>
	<script>
	function chkDelete(num){
		// 삭제 여부, 다시 확인하고 진행하기
		var r = confirm("삭제하시겠습니까?");
			
		if(r){
			location.href = 'deleteOk.do?num=' + num;
		}
	}
	function deleteChk(){
		alert('권한이 없습니다.');
	}
	</script>
	<br>
	<h1 style="text-align: center;"><span style="color: #3f3f3f;">리뷰&amp후기</span></h1>
	<br>
	<h2 style="text-algin: center;"><span style="color: #3f3f3f;">제목: <%= subject %></span></h2>
	<br>
	<br>
	<div class="row" style="font-size: 20px"> 
		<div  class="col-6 col-sm-3 col-lg-2" style="background-color:#F8F8FF;">글 번호 : <%= num%><br></div>
		<div class="col-6 col-sm-4 col-lg-6" style="background-color:#F8F8FF;">제목: <%= subject %><br></div>
		<div class="col-12 col-sm-12 col-lg-1" style="background-color:#F8F8FF;">평점: <%= star %>점<br></div>
		<div class="col-12 col-sm-5 col-lg-3" style="background-color:#F8F8FF;">등록일: <%= regdate %><br></div>
	</div>
	<br>
	내용:
	<hr>
	<div>
	<%= content %>
	</div>
	<hr>
	<br>
	<script>
	function userChk(){
		alert("권한이 없습니다.");
	}
	</script>
	<% if(cus_num == c_num) {%>
		<button class="btn btn-warning" onclick="location.href='update.do?num=<%= num%>'">수정하기</button>
	<%} else {%> 
		<button class="btn btn-warning" onclick="userChk()">수정하기</button>
	<% } %>
	<button class="btn btn-warning" onclick="location.href='review.do'">목록보기</button>
	<% if(cus_num == c_num) {%>
		<button class="btn btn-warning" onclick="chkDelete(<%= num%>)">삭제하기</button>
	<%} else {%> 
		<button class="btn btn-warning" onclick="deleteChk()">삭제하기</button>
	<%} %>
	<%if(cus_num != 0){ %>
	<button class="btn btn-warning" onclick="location.href='write.do'">새글작성</button>
	<%} else {%> 
	<button class="btn btn-warning" onclick="location.href='test_login.jsp'">새글작성</button>
	<%} %>
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








