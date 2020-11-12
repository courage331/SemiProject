<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 이호인 리뷰 화면   -->
<%@ page import="com.lec.beans.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// Controller 로부터 결과 데이터 받음
ReviewDTO[] arr = (ReviewDTO[]) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/review.css">
<title>왈왈 호텔</title>
<style>
</style>
</head>
<body>
	<!-- 호인 11/02 수정 -->
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
	<br>
	<br>
	<section class="conA">
		<div class="container">
			<h1>
				<span style="color: #3f3f3f;">이용 후기</span>
			</h1>
		</div>
	</section>
	<br>
	<br>
	<section class="conG">
		<%
			int pageNum = Integer.parseInt(request.getParameter("page").trim());
		int number = 0; // 총 글 갯수
		double totalStar = 0;
		double tsSum = 0;
		int totalCnt = 0;
		int akkk = 0;
		int pg = 0;
		int ak = 0; // 글 갯수 파악 
		if (arr != null) {
			for (ak = 0; ak < arr.length; ak++) {
				number++;
			}
		}
		akkk = number;
		pg = number / 10 + 1;
		if (pg >= 1) {
			pg = number / 10 + 1;
			if (number % 10 == 0) {
				pg = number / 10;
			}
		} else if (pg < 1) {
			pg = 1;
		}
		if (pageNum > pg) {
			pageNum = pg;
		} else if (pageNum < 1) {
			pageNum = 1;
		}
		int startP = pageNum * 10 - 10;
		if (number < 10) {

		} else if (number >= 10) {
			number -= pageNum * 10 - 10;
		}
		System.out.println("PAGE: " + pageNum);
		if(arr != null){
			for(int i = 0; i < arr.length; i++){
				tsSum += arr[i].getStar();
			}
			totalStar = tsSum / akkk*100;
			tsSum = (int)totalStar;
			totalStar = (double)tsSum/100;
			System.out.println("TOTALSTAR: " + totalStar);
		}
		%>
		
		<div class="containerZ"> 평균 별점: <%= totalStar %>
		<%if(totalStar >= 0 && totalStar < 2.0){%>
			★☆☆☆☆
		<%}else if(totalStar >= 2.0 && totalStar < 3.0){%>
			★★☆☆☆
		<%}else if(totalStar >= 3.0 && totalStar < 4.0){%>
			★★★☆☆
		<%}else if(totalStar >= 4.0 && totalStar < 5.0){%>
			★★★★☆ 
		<%}else {%>
			★★★★★
		<%}%>
		
		</div>
		<br>
		<div class="containerG">
			<table>
				<thead>
					<tr>
						<th class="tbwid_15">글 번호</th>
						<th class="tbwid_35">제목</th>
						<th class="tbwid_15">별점</th>
						<th class="tbwid_35">등록일</th>
					</tr>
				</thead>
				<%
					if (arr != null) {
					for (int i = startP; i < arr.length; i++) {
				%>
				<tbody>
					<tr>
						<td><a id="akak" href="view.do?num=<%=arr[i].getNum()%>"><%=number%></a></td>
						<td style="text-align: left;"><a id="akak"
							href="view.do?num=<%=arr[i].getNum()%>"><%=arr[i].getSubject()%></a></td>
						<!--<tdarr[i].getSubject()t() %></td>-->
						<td><a id="akak" href="view.do?num=<%=arr[i].getNum()%>">
								<%
									if (arr[i].getStar() == 1) {
								%> ★☆☆☆☆ <%
									} else if (arr[i].getStar() == 2) {
								%>
								★★☆☆☆ <%
									} else if (arr[i].getStar() == 3) {
								%> ★★★☆☆ <%
									} else if (arr[i].getStar() == 4) {
								%>
								★★★★☆ <%
									} else if (arr[i].getStar() == 5) {
								%> ★★★★★ <%
									}
								%>
						</a></td>
						<td><a id="akak" href="view.do?num=<%=arr[i].getNum()%>"><%=arr[i].getRegDate()%></a></td>
					</tr>
				</tbody>
				<%
					number--;
				totalCnt++;
				if (totalCnt == 10) {
					break;
				}
				} // end for
				} // end if
				System.out.println("pg: " + pg);
				%>
			</table>
		</div>
	</section>
	<br>
	<div class="pageBt">
		<%
		if(pageNum == 1){
			
		} else {
		%>
		<button class="backBtn"
			onclick="location.href = 'review.do?page=<%=pageNum - 1%>'">&lt;</button>
		<%
		}
			for (int i = 1; i <= pg; i++) {
			if (pageNum == i) {
		%>
		<button class="pageBtn1"
			onclick="location.href = 'review.do?page=<%=i%>'"><%=i%></button>
		<%
			} else {
		%>
		<button class="pageBtn"
			onclick="location.href = 'review.do?page=<%=i%>'"><%=i%></button>
		<%
			}
		}
		if (pageNum == pg) {
		%>
		<%
			} else {
		%>
		<button class="nextBtn"
			onclick="location.href = 'review.do?page=<%=pageNum + 1%>'">&gt;</button>
		<%
			}
		%>
	</div>
	<section class="btnA">
		<div class="containerF" style="margin-bottom: 370px">
			<%
				if (session.getAttribute("c_num") != null) {
			%>
			<button onclick="location.href = 'write.do'">글 작성</button>
			<%
				} else {
			%>
			<button onclick="location.href = 'login.jsp'">글 작성</button>
			<%
				}
			%>
		</div>
	</section>
	<!-- 푸터  -->
	<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>








