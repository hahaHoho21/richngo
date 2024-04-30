<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리치앤고 문의하기</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css">

</head>
<body>
	<!--------------- TODO 메인에서 모달로 띄울 예정 ----------------------->
	<div id="wrap">
		<header> </header>
		<div id="wrap-main">
			<div>
				<h1 class="title">문의하기</h1>
				<div class="boardList">
					<div class="board-header">
						<button type="button" class="req-btn" id="btn-open-modal">1:1
							문의하기</button>
					</div>
					<hr>
					<div class="board-body">
						<div class="board-area">
							<!--  1:1문의 내역이 없습니다. -->
							<div class="board-grid">
								<div class="grid-area">게시번호</div>
								<div class="grid-area">작성일</div>
								<div class="grid-area">아이디</div>
								<div class="grid-area">유형</div>
								<div class="grid-area">제목</div>
								<div class="grid-area">상태</div>
								<div class="grid-area">완료일</div>
								<div class="grid-area">상세보기</div>

								<c:forEach items="${dtolist }" var="dto">
									<div class="grid-content">${dto.boardId }</div>
									<div class="grid-content">${dto.writeTime }</div>
									<div class="grid-content">${dto.memEmail }</div>
									<div class="grid-content">${dto.qnatype }</div>
									<div class="grid-content">${dto.qnacontent }</div>
									<div class="grid-content">${dto.processingStatus }</div>
									<div class="grid-content">${dto.completeTime }</div>
									<div class="grid-content">
										<button type=button id="open-content">문서보기</button>
									</div>
								</c:forEach>
							</div>
							<div class="subject">${dto.qnatitle }</div>
							<div>${dto.qnacontent }</div>
							<div></div>
							<div class="reply-wrap"></div>
						</div>
					</div>
					<div class="board-footer">
						<hr>
						<div>답변이 완료되면 고객님의 이메일로 답변이 완료되었음을 알려 드립니다.</div>
						<div>현재 1:1 문의가 많아 답변이 지연될 수 있습니다.</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="modal" style="z-index: 3; display: none;">
		<div class="modal-bg" style="z-index: 4"></div>
		<div class="wrap-modal" style="z-index: 4">
			<div class="modal-header" style="z-index: 5"></div>
			<div class="modal-title">1:1 문의하기</div>
			<button type="button" class="close" id="btn-close-modal"></button>
			<hr class="modal-hr">
			<div class="modal-body" style="z-index: 5">
				<div class="board-grid">
					<div class="qna-modal-title">접수일</div>
					<div class="qna-modal-content"></div>
					<div class="qna-modal-title">처리일</div>
					<div class="qna-modal-content"></div>
				</div>
				<div class="board-grid">
					<div class="qna-modal-title">게시물 번호</div>
					<div class="qna-modal-content"></div>
					<div class="qna-modal-title">상태</div>
					<div class="qna-modal-content"></div>
				</div>
				<div class="board-grid">
					<div class="qna-modal-title">이메일</div>
					<div class="qna-modal-content">
						<input type="email" class="qna-email">
					</div>
					<div class="qna-modal-title">질문 유형</div>
					<div class="qna-modal-content">
						<div class="dropdown">
							<button class="dropbtn">선택하세요.</button>
							<div class="dropdown-content">
								<a class="dropdown-item" href="#">회원정보</a>
								<a class="dropdown-item" href="#">사업자</a>
								<a class="dropdown-item" href="#">지도</a>
								<a class="dropdown-item" href="#">부동산정보</a>
								<a class="dropdown-item" href="#">기타</a>
							</div>
						</div>
					</div>
					<hr class="modal-hr">
					<div class="board-grid">
						<div class="qna-modal-title">제목</div>
						<div class="qna-modal-Lcontent">회원가입 어떻게하나요?</div>
					</div>
					<div class="board-grid">
						<div class="qna-modal-title">내용</div>
						<div class="qna-modal-Lcontent">알려주세요~</div>
					</div>
					<hr class="modal-hr">
					<div class="board-grid2">
						<div class="qna-modal-LLtitle">답변내용</div>
						<div class="qna-modal-LLcontent">안녕하세요. 부동산 공간정보 리치앤고입니다.
							홈페이지 우측 상단의 signup을 클릭하신 후 ~~~~~~~~~...</div>
					</div>
				</div>
				<div class="modal-footer" style="z-index: 5"></div>
			</div>
		</div>
		<script>
const openModal = document.querySelector('.modal');
const btnOpenModal=document.querySelector('#btn-open-modal');
btnOpenModal.addEventListener("click", ()=>{
modal.style.display="flex";
});

const closeModal = document.querySelector('.modal');
const btnCloseModal=document.querySelector('#btn-close-modal');
btnCloseModal.addEventListener("click", ()=> {
modal.style.display = "none"
});

const contentOpenModal = document.querySelector('.board-grid');
const btnQnaOpenModal = document.querySelector('#open-content');
btnQnaOpenModal.addEventListener("click", ()=>{
modal.style.display="flex";
});

const contentCloseModal = document.querySelector('.board-grid');
const btnQnaCloseModal=document.querySelector('#btn-close-modal');
btnCloseModal.addEventListener("click", ()=> {
modal.style.display = "none"
});


     
$(loadedHandler);
function loadedHandler() {
	//event 등록
	$(".btn.write").on("click", btnWriteClickHandler);
}

function btnWriteClickHandler() {
	//Login 페이지로 이동
	if (checkLogin("로그인되어야 글쓰기가 가능합니다.\n로그인페이지로 이동하시겠습니까?", "write")) {
		return;
	}
	location.href = "${pageContext.request.contextPath}/board";
}

function ajaxErrorHandler(request, status, error) {
	alert("code: " + request.status + "\n" + "message: "
			+ request.responseText + "\n" + "error: " + error);
}

function alertMsg(msg) {
	if (msg) {
		alert(msg);
	}
}

const dropdownElementList = document.querySelectorAll('.dropdown-toggle')
const dropdownList = [...dropdownElementList].map(dropdownToggleEl => new bootstrap.Dropdown(dropdownToggleEl))
</script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
</html>