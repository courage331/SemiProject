<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page import="com.lec.beans.*"%>
<!DOCTYPE html>
<%
	CustomerDTO[] crr = (CustomerDTO[]) request.getAttribute("clist");
	ProductDTO[] prr = (ProductDTO[])request.getAttribute("plist");
	String c_num = (String) session.getAttribute("c_num");
	String pName = prr[0].getPro_name();
	String pKind = prr[0].getPro_kind();
	String content = prr[0].getPro_content();
	int pCnt = prr[0].getPro_cnt();
	int pNum = prr[0].getPro_num();
	int price = prr[0].getPro_price();
	int c_money = crr[0].getCus_money();
	int sSum = price;
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
			<h2>구 매</h2>
			<!--  <input type="button" value="X" onClick="">-->
		</div>
	</header>
	<!-- 컨텐츠 A  -->
	<div class="containerA">
		<div class="c_money">
			보유 뼈다귀 :
			<%=c_money%>
			<i class="fas fa-bone"></i>
		</div>
		<section class="conA">
			<div class="deco">
			<form name="frm" method="post">
				<div class="content">
					<%=content%>
					<div class="ctext">
						<p class="pname"><%=pName%></p><br><br>
						<br> 가격 :
						<%=price%>
						<i class="fas fa-bone"></i><br> 
						구매 수량 : <input type="text" name="counting" id="counting" value="1" style="width:50px;" readonly/>
						<button class="cnt" type="button" onclick="form_btn(1)">▲</button>
						<button class="cnt" type="button" onclick="form_btn(-1)">▼</button>
						<script>
						 function form_btn(n){
							    
							    var text = document.getElementById("counting"); // 폼 선택
							    var price = <%=price%>;
							    var p_txt =  document.getElementById("price");
							    var s_txt = document.getElementById("sSum");
							    
							    
							    text_val = parseInt(text.value); // 폼 값을 숫자열로 변환
							    text_val += n; // 계산
							    
							    var sum = price * text_val; //가격을 가져와서 증가 수량 만큼 합산
							    
							    
							    text.value = text_val; // 계산된 값을 value에 적용
							    
							    if(text_val <= 0){
							       document.getElementById("sSum").innerHTML = price;
							       p_txt.value = price;
							       text.value = 1;   // 만약 값이 0 이하면 1로 되돌려준다, 1보다 작은 수는 나타나지 않게하기 위해   
								    console.log(p_txt.value);
							    }else{
							    	document.getElementById("sSum").innerHTML = sum;
								    $(".p1").val(p_txt.value);
								    p_txt.value = sum; // submit할 값에 넣어둠
								    console.log(p_txt.value);
								    
							    }
							    
							    }
							
						
						</script>

					</div>
				</div>
			</div>
		</section>
		<!-- 컨텐츠 C  -->
		
			<input type="hidden" name="pName" value="<%=pName%>" /> 
			<input type="hidden" name="price" id="price" value="<%=price %>" /> 
			<input type="hidden" name="sSum" value="<%=sSum%>" />
			<input type="hidden" name="pNum" value="<%=pNum%>" /> 
			<input type="hidden" name="c_money" value="<%=c_money %>"/>
			<input type="hidden" name="c_num" value="<%= a %>"><br>
			<div class="sum">
				총 결제 금액 : <span id="sSum"><%=price %></span><i class="fas fa-bone"></i>
				
				
				
			</div>
				
			
	</div>
	<script>
	
	</script>
	<!-- 푸터 -->
	
	<script>
	function checkSubmit(){
		var c_money = parseInt(document.forms.frm.c_money.value);
		var price = parseInt(document.forms.frm.price.value);
		submit2(c_money,price);
		//alert(c_num);
		//alert(price);
		
	}
	</script>
	
	<footer>
		<div class="container">
			<button type="submit" onclick="checkSubmit()">
				<h2>구매하기</h2>
			</button>
		</div>
	</footer>
</form>


</body>
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="JS/shopping.js"></script>
</html>