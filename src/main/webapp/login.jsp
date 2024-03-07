<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
  <title>커피24 북카페</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <!--   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->
  <link rel="stylesheet" href="assets/css/main.css" />
 <link rel="stylesheet" href="css/layout.css" />
</head>
<body class="is-preload">
<div id="page-wrapper">
			<!-- Header -->
			<%@ include file="./layout/header-a.jsp" %>
		<div class="mycol-2" style="width:450px;">
			<img alt="" width="100%;" height="70%" style="object-fit:cover;align-content: right;" src="./images/bookcafe1.jpg">
		</div>
		<div class="mycol-2" style="width:600px;">				
				<div class="login">
				  <h2>회원 로그인</h2>
				  <label id="incorrect">계정 정보가 일치하지 않습니다.</label>
				  <form action="login" method="post">
				    <div class="mb-3">
				      <label for="userid">아이디:</label>
				      <input class="form-control" id="userid" placeholder="Enter id" type="text" name="userid" required>
				    </div>
				    <div class="mb-3">
				      <label for="pwd">패스워드:</label>
				      <input type="password" class="form-control" id="password" placeholder="Enter password" 
				      		name="password" required>
				    </div>
				    <div class="form-check mb-3">
				      <label class="form-check-label">
				        <input class="form-check-input" type="checkbox" name="remember"> Remember me
				      </label>
				    </div>
				    <button class="btn btn-primary">로그인</button>
				  <%--   <button type="button" class="btn btn-primary" 
				    		onclick="location.href='${pageContext.request.contextPath}'">HOME</button> --%>
				  </form>
				  <hr>
				  <a href="join" class="f-sm">아직 회원이 아니시면 회원 가입을 해주세요.</a><br>
            	  <a href="help" class="f-sm">😑 비밀번호 찾기가 필요하신가요?</a>
				</div>
		</div>
</div>
<script>
	/* 쿠키에 저장된 로그인 실패 정보 확인 : el 에 쿠키 객체 cookie 를 지원되므로 해당 쿠키이름 지정하여
		사용합니다.
	*/
	console.log('${cookie.incorrect}')
	if('${cookie.incorrect.value}'==='y') {
		document.getElementById('incorrect').style.display='inline-block';
		/* 쿠키삭제 */
		document.cookie = 'incorrect' + "=; expires=Thu, 01 Jan 1970 00:00:10 GMT; path=/;";
	}
	console.log('incorrect','${cookie.incorrect.value}')
</script>
  		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>
<!-- 계정 : wonder, minkr, chchch  패스워드 : thGH123!@4 -->
    