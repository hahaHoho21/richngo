<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="login-box divtest1">
		<a href="http://192.168.10.40:8080/myrich/go" target="_self">
			<button class="close"></button>
		</a>
		<div class=login-box-body>
			<div class="body-header">
				<div>이용약관</div>
			</div>
			<div class="body-form">
				<form id="frm-login">
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
						<a href=http://192.168.10.40:8080/myrich/login target="_self">
							<button type="button" class="signup-btn">로그인</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>