<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lec.beans.*"%>

<%
	// Controller 로부터 결과 데이터 받음
CustomerDTO[] arr = (CustomerDTO[]) request.getAttribute("list");
ReservationDTO[] rarr = (ReservationDTO[]) request.getAttribute("rlist");
PetDTO[] parr = (PetDTO[]) request.getAttribute("plist");
Boolean chk = true;

String[] state = { "예약 종료", "예약 변경 가능", "투숙중" };
String color = "#c0c0c0";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/mypage.css">

<title>마이 페이지</title>
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
	<!-- 컨텐츠A -->
	<section class="conA">
		<div class="container">
			<div class="announce">
				<h3><%=arr[0].getCus_name()%>님의 정보
				</h3>
			</div>
			<table>
			</table>
		</div>
	</section>
	<!-- 컨텐츠B -->
	<section class="conB">
		<%
			int pageNum = Integer.parseInt(request.getParameter("page").trim());
		int number = 0; // 총 글 갯수
		int totalCnt = 0;
		int pg = 0;
		int ak = 0; // 글 갯수 파악 
		if (rarr != null) {
			for (ak = 0; ak < rarr.length; ak++) {
				number++;
			}
		}
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
		%>

		<div class="container">
			<table>
				<thead>
					<tr>
						<th>예약 날짜</th>
						<th>예약 종료 날짜</th>
						<th>강아지 이름</th>
						<th>예약 상태</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (rarr == null || rarr.length == 0) {
						chk = false;
					}
					%>

					<%
						if (chk) {

						String[] pet_name = new String[rarr.length];
						if (chk) {
							for (int i = 0; i < rarr.length; i++) {
						for (int j = 0; j < parr.length; j++) {
							if (rarr[i].getPet_num() == parr[j].getPet_num()) {
								pet_name[i] = parr[j].getPet_name();
								break;
							}
						}
							}
						}
						for (int i = startP; i < rarr.length; i++) {
					%>
					<%
						if (rarr[i].getRes_state() == 0) {
					%>
					<tr id="reserve_list" bgcolor=<%=color%>
						onclick="chkReserve('reserve_update.do?pet_name=<%=pet_name[i]%>&num=<%=rarr[i].getRes_num()%>')">
						<%
							} else {
						%>
					
					<tr id="reserve_list"
						onclick="chkReserve('reserve_update.do?pet_name=<%=pet_name[i]%>&num=<%=rarr[i].getRes_num()%>')">
						<%
							}
						%>

						<td id="akak"><%=rarr[i].getRes_startdate()%></td>
						<td id="akak"><%=rarr[i].getRes_lastdate()%></td>
						<td id="akak"><%=pet_name[i]%></td>
						<td id="akak"><%=state[rarr[i].getRes_state()]%></td>
					</tr>
					<%
						} // end for
					}
					%>
				</tbody>
			</table>

			<div class="pageBt">
				<%
					if (pageNum == 1) {

				} else {
				%>
				<button class="backBtn"
					onclick="location.href = 'mypage.do?page=<%=pageNum - 1%>'">&lt;</button>
				<%
					}
				for (int i = 1; i <= pg; i++) {
					if (pageNum == i) {
				%>
				<button class="pageBtn1"
					onclick="location.href = 'rmypage.do?page=<%=i%>'"><%=i%></button>
				<%
					} else {
				%>
				<button class="pageBtn"
					onclick="location.href = 'mypage.do?page=<%=i%>'"><%=i%></button>
				<%
					}
				}
				if (pageNum == pg) {
				%>
				<%
					} else {
				%>
				<button class="nextBtn"
					onclick="location.href = 'mypage.do?page=<%=pageNum + 1%>'">&gt;</button>
				<%
					}
				%>
			</div>
	</section>

	<!-- 컨텐츠C -->
	<section class="conC">
		<div class="container">

			<table>
				<tr>
					<td><h3>뼈다귀 현황</h3></td>
				</tr>
				<tr>
					<td>
						<h2>
							<%=arr[0].getCus_money()%><i class="fas fa-bone"></i>
						</h2>
					</td>
				</tr>
				<tr>
					<td><button id="cashbtn" onclick="chargeopen()">충전</button></td>
				</tr>
			</table>
		</div>
	</section>

	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="JS/charge.js"></script>
<script type="text/javascript" src="JS/mypage.js"></script>
</html>