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
<link rel="stylesheet" href="CSS/view.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>왈왈 호텔</title>
</head>
<body>
	<!-- 호인 11/02 수정 -->
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
	<script type="text/javascript" src="JS/view.js"></script>
	<br>
	<section class="conA">
		<div class="container">
			<h1 class="h1h1"><span>리뷰&amp후기</span></h1>
		</div>
	</section>
	<br>
	<br>
	<section class="conB">
		<div class="container">
			<h3 class="h3h3"><span>제목: <%= subject %></span></h3>
		</div>
	</section>
	<br>
	<br>
	<br>
	<section class="conB">
		<div class="container"> 
			<div class="col-12">
				글 번호 : <%= num%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				제목: <%= subject %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 평점: <%= star %>점</div>
			<div class="col-12"><br></div>
			<div class="col-12">등록일: <%= regdate %></div>
		</div>
	</section>
	<section class="conB">
		<div class="container">
			<div class="containerT">
				<br> 내용:
				<hr>
				<div>
					<br>
					<%=content%>
					<br>
				</div>
				<hr>
			</div>
		</div>
	</section>
	<br>
	<section class="conC">
		<div class="container">
		<% if(cus_num == c_num) {%>
			<button onclick="location.href='update.do?num=<%= num%>'">수정하기</button>
		<%} else {%> 
			<button onclick="userChk()">수정하기</button>
		<% } %>
		<button onclick="location.href='review.do?page=1'">목록보기</button>
		<% if(cus_num == c_num) {%>
			<button onclick="chkDelete(<%= num%>)">삭제하기</button>
		<%} else {%> 
			<button onclick="deleteChk()">삭제하기</button>
		<%} %>
		<%if(cus_num != 0){ %>
		<button onclick="location.href='write.do'">새글작성</button>
		<%} else {%> 
		<button onclick="location.href='login.jsp'">새글작성</button>
		<%} %>
		</div>
	</section>
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>








