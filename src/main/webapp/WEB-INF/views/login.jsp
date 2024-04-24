<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리치앤고 로그인</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">
</head>

<body>
	<img src="${pageContext.request.contextPath}/resources/images/office-buildings.jpg"
		width="100%" height="100%">
	<div class="login-box-bg">
	</div>
	<div class="login-box">
		<a href="${pageContext.request.contextPath}/go" target="_self">
			<button class="close"></button>
		</a>
		<div class=login-box-body>
			<div class="body-header">
				<div>우리동네 부동산 </div>
				<div>리치앤고</div>
			</div>
			<div class="body-form">
				<form id="frm-login">
					<div>
						<div class="label-text">이메일</div>
						<input type="email" name="email" autocomplete="new-email" required=""
							placeholder="이메일을 입력해주세요.">
					</div>
					<div>
						<div class="label-text">비밀번호</div>
						<input type="password" name="pwd" autocomplete="" required=""
							placeholder="비밀번호를 입력해주세요.">
					</div>
					<div>
						<button type="button" value="로그인" class="btn submit">로그인</button>
					</div>
				</form>
				<div>
					<button type="button" class="forgot-pw-btn">비밀번호 찾기</button>
				</div>
				<div class="signup">
					<div class="text">
						* 아직 리치앤고에 계정이 없으신가요?
						<a href="${pageContext.request.contextPath}/agree" target="_self">
						<button type="button" class="signup-btn">회원가입</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

	<script>
			$(loadedHandler);
			function loadedHandler() {
				//event 등록
				$("#frm-login .btn.submit").on("click", frmClickHandler);
			}

			function frmClickHandler() {
				console.log("클릭");
				console.log($("#frm-login").serialize()); // query string 형태로 만들어줌.// id=sss&pwd=vvv
				$
						.ajax({
							url : "${pageContext.request.contextPath }/login",
							method : "post",
							data : $("#frm-login").serialize(),
							success : function(result) {
								console.log(result);
								if (result == 1) {
									alert("반갑습니다.");
									var prePage = "${prePage}";
									if (prePage == "write") {
										location.href = "${pageContext.request.contextPath}/board/write";
									}
									location.href = "${pageContext.request.contextPath}/go";
								} else {
									alert("아이디 또는 패스워드가 일치하지 않습니다.\n다시 확인하고 로그인해주세요.");
									$("[name=pwd]").val("");
								}
							},
							error : function(request, status, error) {
								alert("code: " + request.status + "\n"
										+ "message: " + request.responseText
										+ "\n" + "error: " + error);
							}
						});
			}
		</script>
</body>
</html>
