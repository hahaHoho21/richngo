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
	<div class="login-box">
		<div>x</div>
		<div>
			<div>우리동네 부동산</div>
			<div>리치앤고</div>
			<form id="frm-login">
				<div><label>이메일</label></div>
				<div><input type="email" name="email"></div>
				<div><label>패스워드</label></div>
				<div><input type="password" name="pwd"></div>
				<div><button type="button" value="로그인" class="btn submit">로그인</button></div>
				<button type="button" class="forgot-pw-btn">비밀번호 찾기</button>
			
			</form>
		</div>
	</div>

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
									location.href = "${pageContext.request.contextPath}/main";
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
	</div>
</body>
</html>