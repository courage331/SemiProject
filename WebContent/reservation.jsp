<!-- 예약페이지, 김지민 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="com.lec.beans.*" %>

<%
		// 현재 로그인 상태인지, 즉 로그인 세션 (name이 'userid'인 세션값)이 있는지 확인
		if(session.getAttribute("userid") != null){	
			System.out.println(session.getAttribute("c_num"));
	%>		
		<h2>로그인 상태입니다 </h2>
	<%
		String userid = (String)session.getAttribute("userid"); //userid;
		
		} else {
		// 로그인 상태가 아니라면 ... 
	%>
	<script>
		location.href="test_login.jsp";		
	</script>
<%}%>

<% // Controller 로부터 결과 데이터 받음

	PetDTO [] arr = (PetDTO [])request.getAttribute("list");
	
	if(arr == null){
		
	}else{
		System.out.println("pet : " + arr[0].getPet_name());
	}
	
	
	String url ="reservation.do";
	String c_num = request.getParameter("c_num");
%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/reservation.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>예약 페이지</title>
</head>
<body>
	<!-- 헤더 -->
	<!-- 정호 10/30 수정 -->
	<header>
		<div class="container">
			<a href="index.jsp" class="headA"><i class="fas fa-dog"></i></a>
			<nav class="headN">
				<ul>
					<li><a href="reservation.jsp"><div>예약하기</div></a></li>
					<li><a href="use.jsp"><div>이용안내</div></a></li>
					<li><a href="shop.jsp"><div>쇼핑</div></a></li>
					<li><a href="review.do"><div>후기</div></a></li>
					<li><a href="test_login.jsp?url=<%=url %>" ><div>로그인</div></a></li>
					<c:choose>
						<c:when test="${not empty sessionScope.userid }">
							<li><a class="mainmenu" href="reservation.do"><div>예약하기</div></a></li>
						</c:when>
						<c:when test="${empty sessionScope.userid }">
							<li><a class="mainmenu" href="test_login.jsp"><div>예약하기</div></a></li>
						</c:when>
					</c:choose>
					<li><a class="mainmenu" href="use.jsp"><div>이용안내</div></a></li>
					<li><a class="mainmenu" href="shop.jsp"><div>쇼핑</div></a></li>
					<li><a class="mainmenu" href="review.do"><div>후기</div></a></li>
					<c:choose>
						<c:when test="${not empty sessionScope.userid }">
							<li class="submenu"><a class="mainmenu" href="mypage.jsp"><div>내정보</div></a>
								<ul class="submenulist" style="display: none;">
									<li><a href="#"><div>마이 페이지</div></a></li>
									<li><a href="#"><div>내 정보관리</div></a></li>
									<li><a href="#"><div>애완견 정보관리</div></a></li>
									<li><a href="test_logout.jsp"><div>로그아웃</div></a></li>
								</ul></li>
						</c:when>
						<c:when test="${empty sessionScope.userid }">
							<li><a class="mainmenu" href="test_login.jsp"><div>로그인</div></a></li>
						</c:when>
					</c:choose>
				</ul>
			</nav>
		</div>
	</header>
	<!-- 컨텐츠A -->
	<section class="conA">
		<div class="container">
			<h4>어떤 서비스를 받아야 할 지 고민이신가요?</h4>
			<h3>상담 신청해 주시면 영업일 기준 1~2일 이내로 전화 드립니다.</h3>
		</div>
	</section>

	<!-- 컨텐츠B -->
	<section class="conB">
		<div class="container2">
			<!-- 좌측 -->
			<div class="menu1">
				<div id="tel">
	                <h3>호텔 왈왈 역삼역 캠퍼스</h3>
	                <br>
	                <p>02-1234-1234<p>
           		 </div>
				
				<br><br><br>
				
				<div id="time">
		            <h3>예약 및 상담 시간</h3>
		            <br>
	                <p>08:00 ~ 20:00<p>
           		 </div>
				
				<br><br><br>
				
				<div id="friend">
	                <h3>플러스 친구</h3>
	                <br>
	                <p>[왈왈호텔]로 검색<p>
           		 </div>
				
				<br><br><br>
				
				<div id="announce">
	                <h3>안내사항</h3>
	                <br>
	                <p>왈왈호텔 이용 시 주의사항<p>
           		 </div>
				
				<br><br><br><br><br>
				<table>
					<tr>
						<td>
							1년 이내 5가지 접종(종합, 코로나, 켄넬코프, 신종 인플루엔자, 광견병) 받지 않은 반려견은 입실이 제한됩니다.
							* 접종기록은 접종병원명이 꼭 필요하므로 증빙 자료는 미리 준비해주세요
						</td>
					</tr>
					<tr>
						<td>
							1살 미만의 반려견인 경우 항체 검사가 필수 입니다.
							(단, 1살 이상 시 재접종 기록 확인)
						</td>
					</tr>
					<tr>
						<td>
							생리,건강문제 또는 공격성이 강해 타 고객의 이용에 피해가 되는 반려견 일 경우 입실이 제한됩니다.
						</td>
					</tr>
					
				</table>
			</div>

			<!-- 우측 -->        
        	<div class="menu2">
        		<form name="rform" action="reserveOk.do?cus_num=<%=c_num %>" method="post" onsubmit="return chkDate()">
					반려견 선택하기:<br>
					<select name="select_pet"> 
					<!-- select_pet에 value값이 담겨서 간다. -->
						<%
							for(int i=0; i<arr.length; i++){
								
						%>
							<option value="<%= arr[i].getPet_num() %>"><%= arr[i].getPet_name() %></option>
						<%
						}
						%>
					    
					</select>
					<br><br><br>
					희망서비스:<br>
					<select name=res_sinfo>
					    <option value="academy">아카데미</option>
					    <option value="dogpark">독파크</option>
					    <option value="medicalcenter" >메디컬센터</option>
					    <option value="kindergarten" >유치원</option>
					    <option value="grooming" >그루밍</option>
					    <option value="specialcare" >스페셜케어</option>
					    <option value="hotel" selected>호텔 &데이케어</option>
					    <!-- 기본적으로 보여주고 싶은것은 selected를 넣어준다. -->
					</select> 
					<br><br><br>
					체크인:<br>
					<input type="date" name="res_startdate" value="" min="" max="";><br><br><br>
					체크아웃:<br>
					<input type="date" name="res_lastdate" value="" min="" max="";><br><br><br>
					기타(요청사항):<br>
					<textarea placeholder="효과적인 서비스를 위해 중성화 여부, 문제행동 등 자세한 사항을 적어주세요." name="message" ></textarea>
					<br><br>					
					<!--<input type="submit" class="s_button" value="예약하기"/>-->
					<input type="submit" value="예약하기"/>
					<!--  <input type="button" value="제출"  onclick="chkSubmit()">-->
				</form>
				<br>
        	</div>
        
        </div>   
	</section>
	<!-- 푸터 -->	
	<footer>
		<div class="container">
			<h3>푸터</h3>
		</div>
	</footer>
	<script type="text/javascript" src="JS/reservation.js"></script>
</body>
<!-- 정호 : 10/30 -->
<script src="JS/index.js" type="text/javascript"></script>
</html>