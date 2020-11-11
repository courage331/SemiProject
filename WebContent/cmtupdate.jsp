<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/cmtupdate.css">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>댓글 수정</title>
</head>

<%
int cmt_num = Integer.parseInt(request.getParameter("cmt_num"));
System.out.println("CCC:" + cmt_num);
int num = Integer.parseInt(request.getParameter("num"));
System.out.println("CCC:" + num);
String id = request.getParameter("id");
System.out.println("CCC:" + id);
String content = request.getParameter("content");
System.out.println("CCC:" + content);
%>
<body>

	<!-- 헤더 -->
	<header>
		<div class="container">
			<i class="fas fa-dog"></i>
			<h2>댓글 수정</h2>
			<input type="button" value="X" onClick="self.close();">
		</div>
	</header>
	<!-- 컨텐츠A -->
	<section class="conA">
		<div class="container">
		</div>
	</section>
	<!-- 컨텐츠B -->
	<section class="conB">
		<div class="container">

			<form name="frm" id="contact-form"
				action="cmtupdateOk.do" method="post" onsubmit="return chkSubmit()">
				<div id="content-header"></div>
				<div>
					<label>작성자: </label><%= id%>
					<input type="hidden" name="cmt_num" value="<%= cmt_num%>"/>
					<input type="hidden" name="num" value="<%= num %>"/>
				</div>
				<div>
					<label>내용 :</label> <input class="form_input" type="text" name="content"
						value="<%=content%>"/>
				</div>
				<div class="btn_list">
				<input class="chkbtn" id="okbtn" type="submit" value="수정하기" /> 
				</div>
			</form>
		</div>
	</section>

	<!-- 푸터 -->
	<footer>
		<div class="container">
			<button class="bacc" id="bacc" onclick='self.close()'>
				<h2>돌아가기</h2>
			</button>
		</div>
	</footer>
</body>
<script type="text/javascript" src="JS/cmtupdate.js"></script>
</html>