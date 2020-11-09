<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page import="com.lec.beans.*"%>
<!DOCTYPE html>
<%
	CustomerDTO[] crr = (CustomerDTO[]) request.getAttribute("clist");
	String c_num = (String) session.getAttribute("c_num");
	String pName = request.getParameter("pName");
	String pKind = request.getParameter("kind");
	int pCnt = Integer.parseInt(request.getParameter("pCnt"));
	
	int pNum = Integer.parseInt(request.getParameter("pNum"));
	int price = Integer.parseInt(request.getParameter("price"));
	int c_money = crr[0].getCus_money();
	int sCnt = 1; // 현재 1개만 구매 가능 상태이므로 1로 고정
	int sSum = price * sCnt;
	String name;
    int a;
    if(session.getAttribute("c_num") != null){
       name = (String)session.getAttribute("c_num");
       a = Integer.parseInt(name);
    }else{
       name = null;
       a = 0;
    }
%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/b95da9d126.js"
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="CSS/shopping.css">
<title>물품 구매</title>
</head>
<body>
   <!-- 헤더 -->
   <header>
      <div class="container">
         <i class="fas fa-dog"></i>
         <h2> 구  매</h2>
         <!--  <input type="button" value="X" onClick="">-->
      </div>
   </header>
   <!-- 컨텐츠 A  -->
   <section class="conA">
   <div class = "deco">
    	<div class="content">
      	<img src="img/<%=pName%>.jpg"><br>
      <div class="ctext">
         종류     : <%=pKind %> <br>
         가격     : <%=price %><br>
 		 결제 금액 : <%=price %><br>
   		 보유 금액 : <%=c_money %>
   </div>
      </div>
      </div>
   </section>
   <!-- 컨텐츠 C  -->
   <form name="frm" method="post">
		<input type="hidden" name="pName" value="<%=pName%>"/>
      	<input type="hidden" name="price" value="<%=price%>"/>
     	<input type="hidden" name="sCnt" value="<%=sCnt%>"/>
   		<input type="hidden" name="sSum" value="<%=sSum%>"/>
   		<input type="hidden" name="pNum" value="<%=pNum%>"/>
 	  	<input type="hidden" name="c_num" value="<%= a %>"><br>
   <!-- 푸터 -->
   <footer>
      <div class="container">
         <button type="submit" onclick="submit2(<%=c_money%>,<%=price%>)">
            <h2>구매하기</h2>
         </button>
      </div>
   </footer>
 </form>
   

</body>
<script type="text/javascript" src="JS/shopping.js"></script>
</html>