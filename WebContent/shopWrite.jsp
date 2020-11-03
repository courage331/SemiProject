<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1103영재 작성 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 작성</title>
</head>
<script>
function chkSubmit(){
	frm = document.forms["frm"];
	
	
	var pName = frm["pName"].value.trim(); //상품이름
	var pKind = frm["pKind"].value.trim(); //상품종류
	var price = frm["price"].value.trim(); //상품가격
	var pCnt = frm["pCnt"].value.trim(); //재고수량
	
	if(pName == ""){
		alert("상품명은 반드시 입력해야 합니다");
		frm["pName"].focus();
		return false;
	}
	
	if(pKind == ""){
		alert("상품종류 반드시 작성해야 합니다");
		frm["pKind"].focus();
		return false;
	}
	
	if(price == ""){
		alert("가격은 반드시 작성해야 합니다");
		frm["price"].focus();
		return false;
	}
	
	if(pCnt == ""){
		alert("상품수량은 반드시 작성해야 합니다");
		frm["pCnt"].focus();
		return false;
	}
	
	return true;	
} // end chkSubmit()
</script>
<body>
<h2>상품작성</h2>
<form name="frm" action="shopWriteOk.do" method="post" onsubmit="return chkSubmit()"
	encType="Multipart/form-data">
상품이름:
<input type="text" name="pName"/><br>
상품종류:
<input type="text" name="pKind"/><br>
상품가격:
<input type="number" name="price"/><br>
재고수량:
<input type="number" name="pCnt"/><br>
<br><br>

<%-- 첨부파일 --%>
<div style="background-color:beige; padding: 2px 10px; 
	margin-bottom: 5px; border: 1px solid black;">
	
	<h4>첨부파일</h4>
	<button type="button" id="btnAdd">추가</button>
	<div id="files"></div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
var i = 0;
$("#btnAdd").click(function(){
	$("#files").append("<div><input type='file' name='upfile" + i + "'><button type='button' onclick='$(this).parent().remove()'>삭제</button></div>");              
	i++;
})

</script>


<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='shop.do'">돌아가기</button>
</body>
</html>











