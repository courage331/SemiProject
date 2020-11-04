<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="CSS/reserve_update.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>예약 보기</title>
</head>
<%@ page import="com.lec.beans.*"%>
<%
	ReservationDTO [] rarr  = (ReservationDTO[])request.getAttribute("rlist");
	String pet_name=request.getParameter("pet_name");
	String state="";
	//String url= "reserve_modify.do?pet_name="+pet_name+"&num="+rarr[0].getRes_num();
	String url= "reserve_modify.do";

	switch(rarr[0].getRes_state()){
	case 0:
		state="예약 종료";
		break;
	case 1:
		state="예약 변경가능";
		break;
	case 2:
		state="투숙 중";
		break;
	}
%>

<body>
	<!-- 헤더 -->
	<header>
		<div class="container">
			<i class="fas fa-dog"></i>
			<h2>예약 현황</h2>
			<input type="button" value="X" onClick="self.close();">
		</div>
	</header>

	<section class="conA">
<div class="container">

<form name="frm"  id="contact-form" action="loginOk.do" method="post">
	<div id="content-header">
		<h3><%=pet_name %>의 예약 내용</h3>
	</div>
	<div>
		<label>예약 상태 : <%=state %></label>
	</div>
	<div>
		<label>예약 날짜 :</label>
		<label><%=rarr[0].getRes_startdate() %> ~ <%=rarr[0].getRes_lastdate() %></label>
	</div>
	<div>
		<label>예약 내용 :</label>
		<label><%=rarr[0].getRes_sinfo() %></label>
	</div>
	<div>
		<label>건의 사항 :</label>
		<label><%=rarr[0].getRes_message() %></label>
	</div>

	<div class="clearfix"></div>
	<%
		if(rarr[0].getRes_state()==0){
	%>		
			<input type="button" class="navyBtn" value="리뷰남기기" onClick="goReview()">
	<% 	
		}else if(rarr[0].getRes_state()==1){
	%>	
			<input type="button" class="navyBtn" value="예약변경" onClick="goModify(<%=rarr[0].getRes_num()%>,<%=rarr[0].getPet_num()%>)"/>
			<input type="button" class="navyBtn" value="예약취소" onClick="chkDelete(<%=rarr[0].getRes_num()%>,<%=rarr[0].getPet_num() %>)"/>
	<% 
	}else{
	}
	%>
	
</form>
</div>
</section>	
	<!-- 푸터 -->
	<footer>
		<div class="container">
			<button class="bacc" id="bacc" onclick='byebye()'>
				<h2>돌아가기</h2>
			</button>
		</div>
	</footer>
</body>
<script type="text/javascript" src="JS/reserve_update.js"></script>
</html>