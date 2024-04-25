<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<header>
	</header>
	<div id="wrap-main">
		<div>
			<h1>1:1 문의하기</h1>
			<div class="boardList">
				<div class="board-header">
					<button type="button" class="req-btn">1:1문의하기</button>
				</div>
				<hr>
				<div class="board-body">
					<div class="board-area">
					<c:choose>
					<!--  1:1문의 내역이 없습니다. -->
						<c:when test="${empty map.dtolist }"></c:when>
						<c:otherwise>
							<c:forEach items="${map.dtolist }" var="vo" varStatus="vs">
								<div>${vo.boardId }</div>
								<div><a href="${pageContext.request.contextPath }/board/read?id=${vo.boardId }">${vo.subject }</a></div>
								<div>${vo.writeTime }</div>
								<div>${vo.boardWriter }</div>
								<div>${vo.readCount }</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
				<hr>
				<div class="board-footer">
					<div>답변이 완료되면 고객님의 이메일로 답변이 완료되었음을 알려 드립니다.</div>
					<div>현재 1:1 문의가 많아 답변이 지연될 수 있습니다.</div>
				</div>
			</div>
		</div>
		
	</div>
	
</div>
<!--------------- TODO 메인에서 모달로 띄울 예정 ----------------------->



<%-- 
<div><button type="button" class="btn write" >글쓰기</button></div>
<div class="board grid">
<c:choose>
	<c:when test="${empty map.dtolist }">
	글 없어요.
	</c:when>
	<c:otherwise>
		<c:forEach items="${map.dtolist }" var="vo" varStatus="vs">
			<div>${vo.boardId }</div>
			<div><a href="${pageContext.request.contextPath }/board/read?id=${vo.boardId }">${vo.subject }</a></div>
			<div>${vo.writeTime }</div>
			<div>${vo.boardWriter }</div>
			<div>${vo.readCount }</div>
		</c:forEach>
	</c:otherwise>
</c:choose>
</div>

<div >
	<ul>
	<c:if test="${map.startPageNum > 1}">
		<li><a href="${pageContext.request.contextPath }/board/list?page=${map.startPageNum-1 }">  &lt;&lt; </a></li>
	</c:if>
	<c:forEach begin="${map.startPageNum }" end="${map.endPageNum }" var="page">
		<c:if test="${map.currentPageNum == page }">
		<li><strong>${page }</strong></li>
		</c:if>
		<c:if test="${map.currentPageNum != page }">
		<li><a href="${pageContext.request.contextPath }/board/list?page=${page }">${page }</a></li>
		</c:if>
	</c:forEach>
	<c:if test="${map.endPageNum < map.totalPageCount }">
		<li><a href="${pageContext.request.contextPath }/board/list?page=${map.endPageNum+1 }">  &gt;&gt; </a></li>
	</c:if>
	</ul>
</div>
 --%>
<script>
$(loadedHandler);
function loadedHandler(){
	//event 등록
	$(".btn.write").on("click", btnWriteClickHandler);
}

function btnWriteClickHandler(){
	//Login 페이지로 이동
	if(checkLogin("로그인되어야 글쓰기가 가능합니다.\n로그인페이지로 이동하시겠습니까?","write")){
		return;
	}
	
	location.href="${pageContext.request.contextPath}/board";
}

function ajaxErrorHandler (request, status, error){
	alert("code: "+request.status + "\n" + "message: " 
			+ request.responseText + "\n"
			+ "error: "+error);
}

function alertMsg(msg){
	if(msg){
		alert(msg);
	}
}
</script>
</html>