<!-- 로그인페이지, 이주혁 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 메인 페이지  -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/index.css">
<link rel="stylesheet" href="CSS/login.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script>
	function checkLoginStatus(){
		var loginBtn = document.querySelector('#loginBtn');
		var nameTxt = document.querySelector('#name');
    	if(gauth.isSignedIn.get()){
    		console.log('logined');
    		loginBtn.value = 'Logout';
    		var profile = gauth.currentUser.get().getBasicProfile();
    		console.log(profile.getName());
    		console.log(profile.getId());
    		console.log(profile.getEmail());
    		nameTxt.innerHTML = 'Welcome <strong>'+profile.getName()+'</strong> ';
    		//insert되어있으면
    		//location.href = "googleloginOk.do?c_id="+profile.getId().substring(0,15)+"&c_pw=1234"
    		//insert안되어있으면
    		gauth.signOut();
    		location.href = "googleloginOk.do?c_id="+profile.getId().substring(0,15)+"&c_pw=1234&c_name="+profile.getName()+"&c_phone=010-0000-0000&c_email="+profile.getEmail();
    	} else {
    		console.log('logouted');
    		loginBtn.value = 'Login';
    		nameTxt.innerHTML = '';
    	}
	}
	function init() {
		  console.log('init');
		  gapi.load('auth2', function() {
		    console.log('auth2');
		    window.gauth = gapi.auth2.init({
		    	client_id:'147019076427-3regscr3mak8nai0q7hm42n8237vv253.apps.googleusercontent.com'
		    })
		    gauth.then(function(){
		    	console.log('googleAuth success');
		    	checkLoginStatus();
		    }, function(){
		    	console.log('googleAuth fail');
		    })
		  });
		}
	</script>
<title>LOGIN</title>
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>

	<section class="conA">
		<div class="container">

			<form name="frm" id="contact-form" action="loginOk.do" method="post"
				onsubmit="return chkSubmit()">
				<div id="content-header">
					<h3>로그인</h3>
				</div>
				<div>
					<label>ID :</label> <input type="text" name="c_id"
						placeholder="아이디를 입력해 주세요." />
				</div>
				<div>
					<label>PW :</label> <input type="password" name="c_pw"
						placeholder="비밀번호를 입력해 주세요." />
				</div>
				<div class="clearfix"></div>

				<input type="submit" id="logbtn" class="hc vc" value="LOGIN" />
				<div id="form_bottom">
					<input type="button" class="navyBtn" value="회원가입"
						onClick="location.href='signUp.jsp'"> <input type="button"
						class="navyBtn" value="아이디 찾기"
						onClick="location.href='find_id.jsp'"> <input
						type="button" class="navyBtn" value="비밀번호 찾기"
						onClick="location.href='find_pw.jsp'">
				</div>
				<span id="name"></span><input type="button" id="loginBtn" value="checking..." onclick="
					if(this.value == 'Login'){
						gauth.signIn().then(function(){
							console.log('gauth.signIn()');
							checkLoginStatus();
						});
						//parmeter로 가지고 loginOk.do로 쏘자
						
					} else {
						gauth.signOut().then(function(){
							console.log('gauth.signOut()');
							checkLoginStatus();
						});
					}
				">
			</form>

		</div>
	</section>
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

<script src="JS/index.js" type="text/javascript"></script>
<script type="text/javascript" src="JS/login.js"></script>
</html>