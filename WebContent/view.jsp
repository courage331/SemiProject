<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 이호인 리뷰 화면   -->
<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% // Controller 로부터 결과 데이터 받음
	ReviewDTO [] arr = (ReviewDTO [])request.getAttribute("list");
	CmtDTO [] arr2 = (CmtDTO [])request.getAttribute("r_cmt");
	CustomerDTO[] arr3 = (CustomerDTO[]) request.getAttribute("c_list");
	System.out.println("arr2: " + arr2);
%>
<%
	if(arr == null || arr.length == 0){
%>
	<script>
		alert("해당 정보가 삭제되거나 없습니다");
		history.back();
	</script>
<%
		return;  //  ★더이상 JSP 프로세싱 하지 않고 종료
	}
%>
<%
	int num = arr[0].getNum();
	String subject = arr[0].getSubject();
	String content = arr[0].getContent();
	String regdate = arr[0].getRegDate();
	int star = arr[0].getStar();
	int c_num = arr[0].getC_num();  // 게시글의 cus_num
	
	String ca;
	int cus_num; // 로그인 한 사람의 cus_num
	if(session.getAttribute("c_num") != null){
		ca = (String)session.getAttribute("c_num");
		cus_num = Integer.parseInt(ca);
	}else {
		ca = null;
		cus_num = 0;
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/view.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>왈왈 호텔</title>
</head>
<body>
	<!-- 호인 11/02 수정 -->
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
	
	<br>
	<section class="conA">
		<div class="container">
			<h1 class="h1h1"><span>리뷰&amp후기</span></h1>
		</div>
	</section>
	<br>
	<br>
	<section class="conB">
		<div class="container">
			<h3 class="h3h3"><span>제목: <%= subject %></span></h3>
		</div>
	</section>
	<br>
	<br>
	<br>
	<section class="conB">
		<div class="container"> 
			<div class="col-12">
				글 번호 : <%= num%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				제목: <%= subject %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 평점: <%= star %>점</div>
			<div class="col-12"><br></div>
			<div class="col-12">등록일: <%= regdate %></div>
		</div>
	</section>
	<section class="conB">
		<div class="container">
			<div class="containerT">
				<br> 내용:
				<hr>
				<div>
					<br>
					<%=content%>
					<br>
				</div>
				<hr>
			</div>
		</div>
	</section>
	<br>
	<section class="conC">
		<div class="container">
		<% if(cus_num == c_num) {%>
			<button onclick="location.href='update.do?num=<%= num%>'">수정하기</button>
		<%} else {%> 
			<button onclick="userChk()">수정하기</button>
		<% } %>
		<button onclick="location.href='review.do?page=1'">목록보기</button>
		<% if(cus_num == c_num) {%>
			<button onclick="chkDelete(<%= num%>)">삭제하기</button>
		<%} else {%> 
			<button onclick="deleteChk()">삭제하기</button>
		<%} %>
		<%if(cus_num != 0){ %>
		<button onclick="location.href='write.do'">새글작성</button>
		<%} else {%> 
		<button onclick="location.href='login.jsp'">새글작성</button>
		<%} %>
		<button id="kakao-link-btn">공유하기</button>
		</div>
	</section>
	
	<section>
		<div id="emdfhr">
		<div class="cmt">COMMENT</div>
		<hr>
		<br>
		<%if (arr3 != null){ %>
			<form name="cmt" action="cmtOk.do" method="post" onsubmit="return chkSmt()" style="font-size:20px">
			작성자: <%= arr3[0].getCus_name() %><br><input type="hidden" name="id" value="<%=arr3[0].getCus_name()%>"/>
			<br>
			*내용 : <textarea name="content" style="width:80%; font-size:20px"></textarea>
			<input type="hidden" name="r_num" value="<%= num %>"/>
			<input type="hidden" name="c_num" value="<%= cus_num %>"/>
			<input type="submit" value="등록하기" style="	background-color: #FEC034;
	width: 180px;
	height: 50px;
	font-size: 30px;
	line-height: 50px;
	border:none;
	border-radius: 12px;
	float:right;
	color: #fff;"/>
			</form>
		<% } %>
		<br>
		</div>
	</section>
		<section class="conG">
		<div class="containerG">
			<table>
				<thead>
					<tr>
						<th class="tbwid_15">댓글 번호</th>
						<th class="tbwid_15">작성자</th>
						<th class="tbwid_35">내용</th>
						<th class="tbwid_35">등록일</th>
						<th class="tbwid">수정</th>
						<th class="tbwid">삭제</th>
					</tr>
				</thead>
				<%
					int cnt = 1;
					if (arr2 != null) {
					for (int i = 0; i < arr2.length; i++) {
				%>
				<tbody>
					<tr>
						<td><%= cnt %></td>
						<td><%= arr2[i].getId() %></td>
						<td><%= arr2[i].getContent() %></td>
						<td><%= arr2[i].getRegDate() %></td>
						<td>
						<%if(cus_num == arr2[i].getC_num()){ %>
						<button style="width:100px; height:40px; font-size: 15px"
						 onclick="datachk('cmtupdate.do?cmt_num=<%= arr2[i].getNum() %>&id=<%=arr2[i].getId() %>&content=<%= arr2[i].getContent() %>&num=<%= num %>')" >수정하기</button>
						<%} else { %>
						<button style="width:100px; height:40px; font-size: 15px" onclick="deleteChk()">수정하기</button>
						<%} %>
						</td>
						<td>
						<%if(cus_num == arr2[i].getC_num()){ %>
						<button style="width:100px; height:40px; font-size: 15px" onclick="cmtchkDelete(<%= arr2[i].getNum()%>)" value="<%=arr2[i].getNum()%>">삭제하기</button>
						<%} else { %>
						<button style="width:100px; height:40px; font-size: 15px" onclick="deleteChk()">삭제하기</button>
						<%} %>
						</td>
					</tr>
				</tbody>
				<%
				cnt++;
				} // end for
				}else{
				%>
				<td></td>
				<td></td>
				<td>댓글이 없습니다.</td>
				<td></td>
				<td></td>
				<td></td>
				<% }%>
			</table>
		</div>
	</section>
	<!--<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
		src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
		width="222" />
	</a>-->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type='text/javascript'>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('a16644188086a65e9093016403fb705e');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: '애견 호텔',
        description: '#애견호텔#이용후기#좋아해#왈왈호텔',
        imageUrl: 'https://imagescdn.gettyimagesbank.com/500/201904/jv11352787.jpg',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com'
        }
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'http://localhost:8080/SemiProject/view.do?num=<%= num%>',
            webUrl: 'http://localhost:8080/SemiProject/view.do?num=<%= num%>'
          }
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com'
          }
        }
      ]
    });
  //]]>
</script>
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>

</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>

// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('a16644188086a65e9093016403fb705e');

// SDK 초기화 여부를 판단합니다.
console.log(Kakao.isInitialized());
</script>
<script type="text/javascript" src="JS/view.js"></script>
	<script type="text/javascript" src="JS/cmt.js"></script>
	
</html>








