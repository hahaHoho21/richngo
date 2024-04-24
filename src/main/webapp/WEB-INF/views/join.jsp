<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div  id="div-join" style="display:none;">
	<div class="login-box-bg"></div>
	<div class="login-box">
		<a href="${pageContext.request.contextPath}/go" target="_self">
			<button class="close"></button>
		</a>
		<div class=login-box-body>
			<div class="body-header-join">
				<div>회원가입</div>
			</div>
			<div class="body-form">
				<form id="frm-login">
					<div>
						<div class="label-text">이메일</div>
						<input type="email" name="email" autocomplete="" required=""
							placeholder="이메일을 입력해주세요.">
					</div>
					<div>
						<div class="label-text">비밀번호</div>
						<input type="password" name="pwd" autocomplete="" required=""
							placeholder="비밀번호를 입력해주세요.">
					</div>
					<div>
						<div class="label-text">비밀번호 확인</div>
						<input type="password" name="pwd" autocomplete="" required=""
							placeholder="비밀번호를 한번 더 입력해주세요.">
					</div>
					<div>
						<button type="button" value=회원가입 class="btn submit"
							id="btn-open-modal">회원가입</button>
					</div>
				</form>
				<div class="signup">
					<div class="text">
						* 이미 계정이 있으신가요? <a href="${pageContext.request.contextPath}/login"
							target="_self">
							<button type="button" class="signup-btn">로그인</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal" style="display:none;">
		<img
			src="${pageContext.request.contextPath}/resources/images/office-buildings.jpg"
			width="100%" height="100%" style="z-index: 3">
			<div class="login-box-bg" style="z-index: 4"></div>
			<div class="modal-body" style="z-index: 5">
				<div>환영합니다 :)</div>
				<div>
					회원가입이 성공적으로 <br> 완료되었습니다.
				</div>
				<div>리치앤고에서 유용한 정보 얻어가세요!</div>
				<div>
					<a href="${pageContext.request.contextPath}/go" target="_self">
						<button type="button" class="btn submit">확인</button>
					</a>
				</div>
			</div>
</div>
<script>
       const modal = document.querySelector('.modal');
       const btnOpenModal=document.querySelector('#btn-open-modal');
       btnOpenModal.addEventListener("click", ()=>{
       modal.style.display="flex";
       });
</script>
