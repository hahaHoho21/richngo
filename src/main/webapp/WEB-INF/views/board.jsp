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
<%-- 
<jsp:include page="/WEB-INF/views/join.jsp"/>
 --%>
</head>
<body>

<%-- 
	<img
		src="${pageContext.request.contextPath}/resources/images/office-buildings.jpg"
		width="100%" height="100%">
<div id="div-agree">
	<div class="login-box-bg"></div>
	<div class="login-box">
		<a href="${pageContext.request.contextPath}/go" target="_self">
			<button class="close"></button>
		</a>
		<div class=login-box-body>
			<div class="body-header">
				<div>이용약관</div>
			</div>
			<div class="body-form">
				<form id="frm-agree">
					<button type="button" class="agree_all" onclick="nextDisable()">
						<div>√ 모두 확인, 동의합니다.</div>
					</button>
					<div>
					<input type="checkbox" class="checkbox" onclick="myFunction()">
					<button type="button" class="agree-btn">리치앤고 서비스 이용약관 동의 <span class="require-span"> (필수)</span></button>
					</div>
					<div>
					<input type="checkbox" class="checkbox" onclick="myFunction()">
					<button type="button" class="agree-btn">위치기반 서비스 이용약관 동의 <span class="require-span"> (필수)</span></button>
					</div>
					<div>
					<input type="checkbox" class="checkbox" onclick="myFunction()">
					<button type="button" class="agree-btn">개인정보처리방침 동의 <span class="require-span"> (필수)</span></button>
					</div>
					<div>
					<input type="checkbox" class="checkbox" onclick="myFunction()">
					<button type="button" class="agree-btn">만 14세 이상 <span class="require-span"> (필수)</span></button>
					</div>
					<div>
						<button type="button" value=다음 class="btn submit" id="disable" disabled  onclick='btnActive()'>다음</button>
					</div>
				</form>
				<div class="signup">
					<div class="text"> * 이미 계정이 있으신가요? 
						<a href="${pageContext.request.contextPath}/login" target="_self">
							<button type="button" class="signup-btn">로그인</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

 --%>
</body>
<!-- 
	<script>
	$(function(){
		$("#div-agree").show();
		$("#div-join").hide();
	});
	function nextDisable() {
		const nextEleTarget = document.getElementById('disable');
		nextEleTarget.disabled = false;
	}
	function btnActive() {
		$("#div-agree").hide();
		$("#div-join").show();
		//location.href="${pageContext.request.contextPath}/join"; 
	}
	</script>
	 -->
</html>
