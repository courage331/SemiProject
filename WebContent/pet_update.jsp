<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/pet_update.css">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>반려견 상세보기</title>
</head>

<%
	PetDTO[] arr = (PetDTO[]) request.getAttribute("list");
String pet_name = request.getParameter("pet_name");
int pet_age = Integer.parseInt(request.getParameter("pet_age"));
int pet_weight = Integer.parseInt(request.getParameter("pet_weight"));
int pet_num = Integer.parseInt(request.getParameter("pet_num"));
int pet_image = Integer.parseInt(request.getParameter("pet_image"));
int pick = pet_image + 4;
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
	<!-- 컨텐츠A -->
	<section class="conA">
		<div class="container">
			<h3><%=pet_name%>의 상세 정보
			</h3>
			<img src="img/K-00<%=pick%>.png">
		</div>
	</section>
	<!-- 컨텐츠B -->
	<section class="conB">
		<div class="container">

			<form name="frm" id="contact-form"
				action="pet_modify.do?pet_num=<%=pet_num%>" method="post">
				<div id="content-header"></div>
				<div>
					<label>강아지 이름 :</label> <input class="form_input" type="text" name="pet_name"
						value=<%=pet_name%> placeholder=<%=pet_name%> />
				</div>
				<div>
					<label>강아지 나이 :</label> <input class="form_input" type="number" name="pet_age"
						value=<%=pet_age%> placeholder=<%=pet_age%> />
				</div>
				<div>
					<label>강아지 무게 :</label> <input class="form_input" type="number" name="pet_weight"
						value=<%=pet_weight%> placeholder=<%=pet_weight%> />
				</div>
				<div>
					<label>강아지 이미지 :<% %></label>
					<%
						
						for (int i = 1; i < 5; i++) {
							
						if (i != pet_image) {
					%>
					<img class="pet_img" id="pet_img<%=i%>"
						src="img/K-00<%=i%>.png">
					<input class="pet_image_list" type="radio" name="pet_image"
						value="<%=i%>">
					<%
						} else {
					%>
					<input class="pet_image_list" type="radio" name="pet_image"
						value="<%=pet_image%>" style="display: none" checked="checked">
					<%
						}
					}
					%>
				</div>
				<div class="btn_list">
				<input class="chkbtn" id="okbtn" type="submit" value="수정하기" /> 
				<input class="chkbtn" type="button" value="삭제" onClick="chkDelete(<%=pet_num%>)">
				</div>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="JS/pet_update.js"></script>
<script type="text/javascript" src="JS/pet.js"></script>
</html>