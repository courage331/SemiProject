<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>

<% // Controller 로부터 결과 데이터 받음
	String c_num = (String)session.getAttribute("c_num");
	ProductDTO [] arr = (ProductDTO [])request.getAttribute("list");
	
%>
    <!-- 1104 김영재 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<h1>구매하기 목록</h1>
<h2><%=c_num %></h2>


<button onclick="showData()">버튼</button>
<script>
	var frm = document.forms['shopBuy']
function showData(){
	
	alert(frm['pKind'].value);
}

function butCheck(){
	if(confirm("구매 하시겠습니까?")==true){
		
		alert("감사합니다");
		window.close();
		
	}else{
		return;
	}
}

</script>
<button onclick="butCheck()"></button>
<br><br><br>
</body>
</html>