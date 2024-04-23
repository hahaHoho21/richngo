<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리치앤고 회원가입</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/agree.css">
</head>

<body>
	<img
		src="${pageContext.request.contextPath}/resources/images/office-buildings.jpg"
		width="100%" height="100%">
	<div class="login-box-bg"></div>
	<div class="login-box">
		<a href="http://192.168.10.40:8080/myrich/go" target="_self">
			<button class="close"></button>
		</a>
		<div class=login-box-body>
			<div class="body-header">
				<div>이용약관</div>
			</div>
			<div class="body-form">
				<form id="frm-login">
					<button class="agree_all">
						<div>√ 모두 확인, 동의합니다.</div>
					</button>
					<div>
					<input type="checkbox" class="checkbox">
					<button type="button" class="agree-btn">디스코 서비스 이용약관 동의 <span class="require-span"> (필수)</span></button>
					</div>
					<div>
					<input type="checkbox" class="checkbox">
					<button type="button" class="agree-btn">위치기반 서비스 이용약관 동의 <span class="require-span"> (필수)</span></button>
					</div>
					<div>
					<input type="checkbox" class="checkbox">
					<button type="button" class="agree-btn">개인정보처리방침 동의 <span class="require-span"> (필수)</span></button>
					</div>
					<div>
					<input type="checkbox" class="checkbox">
					<button type="button" class="agree-btn">만 14세 이상 <span class="require-span"> (필수)</span></button>
					</div>
						<div>
						<a href=http://192.168.10.40:8080/myrich/join target="_self">
							<button type="button" value=다음 class="btn submit">다음</button>
						</a>
					</div>
				</form>
				<div class="signup">
					<div class="text"> * 이미 계정이 있으신가요? 
						<a href=http://192.168.10.40:8080/myrich/login target="_self">
							<button type="button" class="signup-btn">로그인</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
