<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% // Controller 로부터 결과 데이터 받음
	ReviewDTO [] arr = (ReviewDTO []) request.getAttribute("list");
	int num = Integer.parseInt(request.getParameter("num"));
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
	String subject = arr[0].getSubject();
	String content = arr[0].getContent();
	String regdate = arr[0].getRegDate();
	int star = arr[0].getStar();
	int c_num = arr[0].getC_num();
	String astar = "";
	String bstar = "";
	String cstar = "";
	String dstar = "";
	String estar = "";
	if(star == 1){
		astar = "checked";
		bstar = "";
		cstar = "";
		dstar = "";
		estar = "";
	} else if(star == 2){
		astar = "";
		bstar = "checked";
		cstar = "";
		dstar = "";
		estar = "";
	} else if(star == 3){
		astar = "";
		bstar = "";
		cstar = "checked";
		dstar = "";
		estar = "";
	} else if(star == 4){
		astar = "";
		bstar = "";
		cstar = "";
		dstar = "checked";
		estar = "";
	} else if(star == 5){
		astar = "";
		bstar = "";
		cstar = "";
		dstar = "";
		estar = "checked";
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/update.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>왈왈 호텔</title>
<script src="ckeditor/ckeditor.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
	<script type="text/javascript" src="JS/update.js"></script>
	<section class="conA">
		<div class="containerA">
		<br>
		<br>
			<h1>Post correction<br>(글 수정)</h1>
		</div>
	</section>
		<section class="conB">
		<div class="container">
	<form name="frm" action="updateOk.do" method="post" onsubmit="return chkSubmit()">
	<input type="hidden" name="num" value="<%= num %>">
	제목:
	<input type="text" name="subject" value="<%= subject%>"><br>
	<br>
	평점:<br>
	<input type="radio" name="star" value="1" <%= astar%>>★☆☆☆☆<br>
	<input type="radio" name="star" value="2" <%= bstar%>>★★☆☆☆<br>
	<input type="radio" name="star" value="3" <%= cstar%>>★★★☆☆<br>
	<input type="radio" name="star" value="4" <%= dstar%>>★★★★☆<br>
	<input type="radio" name="star" value="5" <%= estar%>>★★★★★<br>
	<br>
	<br>
	내용:<br>
	<textarea name="content" id="editor1"><%= content %></textarea>
	<script>
		CKEDITOR.replace('editor1',{
			allowedContent: true,    // HTML 태그 자동 삭제 방지 설정
			width: '100%px',       //  최초 너비, 높이 지정 가능
			height: '400px'
		});
	</script>
	<input type="hidden" name="c_num" value="<%= c_num%>">
	<br><br>
	<input type="submit" value="수정하기"/>
		<div class="containerH">
			<button onclick="history.back()">◀◀이전으로</button>
			<button onclick="location.href='review.do?page=1'">목록보기</button>
		</div>
	</form>
			</div>

	</section>
	
	
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>








