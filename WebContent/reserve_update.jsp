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
<%
	String pet_name=request.getParameter("pet_name");
	String startdate=request.getParameter("startdate");
	String lastdate=request.getParameter("lastdate");
	String res_info=request.getParameter("res_info");
	String memo=request.getParameter("memo");
	int res_num = Integer.parseInt(request.getParameter("res_num")); 
	int pet_num = Integer.parseInt(request.getParameter("pet_num")); 
	String state="";


	switch(Integer.parseInt(request.getParameter("state"))){
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
		<label><%=startdate %> ~ <%=lastdate %></label>
	</div>
	<div>
		<label>예약 내용 :</label>
		<label><%=res_info %></label>
	</div>
	<div>
		<label>건의 사항 :</label>
		<label><%=memo %></label>
	</div>

	<div class="clearfix"></div>
	<%
		if(Integer.parseInt(request.getParameter("state"))==0){
	%>		
			<input type="button" class="navyBtn" value="리뷰남기기" onClick="window.open('review.do')">
	<% 	
		}else if(Integer.parseInt(request.getParameter("state"))==1){
	%>	
			<input type="button" class="navyBtn" value="예약변경" onClick="window.open('reservation.do')">
			<input type="button" class="navyBtn" value="예약취소" onClick="chkDelete(<%=res_num%>,<%=pet_num %>)">
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