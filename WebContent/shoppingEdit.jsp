<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page import="com.lec.beans.*"%>
<!DOCTYPE html>
<%
	ProductDTO [] arr = (ProductDTO [])request.getAttribute("list");
	int pNum = arr[0].getPro_num();
	String pKind = arr[0].getPro_kind();
	int price = arr[0].getPro_price();
	int pCnt = arr[0].getPro_cnt();
	String pName = arr[0].getPro_name();
	String pCtt = arr[0].getPro_content();
%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/b95da9d126.js"
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="CSS/shoppingEdit.css">
<title>상품관리</title>
</head>
<body>
   <!-- 헤더 -->
   <header>
      <div class="container">
         <i class="fas fa-dog"></i>
         <h2> 상품관리</h2>
         <!--  <input type="button" value="X" onClick="">-->
      </div>
   </header>
   <form name="frm" method="post"><br>
   <!-- 컨텐츠 A  -->
   <section class="conA">
      <div class="content">
   	   <%=pCtt%><br>
      </div>
    	<input type="hidden" name="pName" value="<%=pName%>"/><br>
      	<input type="hidden" name="pNum" value="<%=pNum%>"/><br>
      	<input type="hidden" name="pKind" value="<%=pKind%>"/><br>
      <div class="ctext">
     	<span>종류 : <%=pKind%><br>
      	가격 : <input type="text" name="price" value="<%=price%>"/><br>
      	수량 : <input type="text" name="pCnt" value="<%=pCnt%>"/><br>
      	</span>
      </div>
   
   </section>
   <!-- 컨텐츠 C  -->
      <div class="container">
      </div>
   <!-- 푸터 -->
   <footer>
      <div class="container">
         <button class="ed_btn" type="submit" value="update" onclick='btn_click("update");'">
            <h2>수정하기</h2>
         </button>
         <button class="del_btn" type="submit" value="delete" onclick='btn_click("delete");'">
         <h2>삭제하기</h2>
         </button>
      </div>
   </footer>
   </form>
 

</body>
<script type="text/javascript" src="JS/shoppingEdit.js"></script>
</html>