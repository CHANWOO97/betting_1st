<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/sessionChk.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스포츠토토 - 베팅 페이지</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/betting/css/betMain.css">
    <script src="/betting/js/betMain.js"></script>
</head>

<body>
    <!-- Header -->    
    <div id="banner" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#banner" data-bs-slide-to="0"
				class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="1"
				aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="2"
				aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active b-item" data-bs-interval="3000">
				<img
					src="/betting/images/001.png"
					class="d-block w-100 b-img" alt="...">
				<div class="carousel-caption d-none d-md-block">
				</div>
			</div>
			<div class="carousel-item b-item" data-bs-interval="3000">
				<img
					src="/betting/images/002.png"
					class="d-block w-100 b-img" alt="...">
				<div class="carousel-caption d-none d-md-block">					
				</div>
			</div>
			<div class="carousel-item b-item" data-bs-interval="3000">
				<img
					src="/betting/images/003.png"
					class="d-block w-100 b-img" alt="...">
				<div class="carousel-caption d-none d-md-block">					
				</div>
			</div>
		</div>


		<button class="carousel-control-prev" type="button"
			data-bs-target="#banner" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#banner" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div><p />
    
    
   <!--  <header class="bg-secondary text-center py-4 mb-4">
        <h1 class="text-warning">스포츠토토</h1>
        <p class="text-light">오늘의 경기 리스트를 확인하고 베팅을 시작하세요!</p>
    </header> -->

    <!-- Main Container -->
    <main class="container">
        <!-- 경기 리스트 -->
        <section class="game-list-section mb-5">
            <h2 class="text-center text-light mb-4">경기 리스트</h2>
            <div class="row g-4">
                <c:if test="${empty list}">
                    <p class="text-center text-muted">현재 경기가 없습니다.</p>
                </c:if>
                <c:if test="${not empty list}">
                    <c:forEach var="game" items="${list}">
                        <div class="col-md-6 col-lg-4">
                            <div class="card bg-dark border-light shadow">
                                <div class="card-body">
                                    <!-- 경기 날짜와 시간 상단으로 이동 -->
                                    <p class="card-text text-muted fw-bold mb-2">${game.gamedate} ${game.gametime}</p>
                                    <h5 class="card-title text-info">${game.sporttype}</h5>
                                    <p class="card-text text-white-50 fw-bold">${game.hometeam} vs ${game.awayteam}</p>
                                    <c:choose>
                                        <c:when test="${game.del == 'y'}">
                                            <p class="text-danger">관리자 권한으로 취소된 경기입니다.</p>
                                        </c:when>
                                        <c:when test="${game.status == 'completed'}">
                                            <p class="text-danger">종료된 경기입니다.</p>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="d-grid gap-2">
                                                <button class="btn btn-outline-success btn-sm" onclick="purchase('${game.gameid}', '승', '${userid}')">승 (2.0)</button>
                                                <button class="btn btn-outline-warning btn-sm" onclick="purchase('${game.gameid}', '무', '${userid}')">무 (2.0)</button>
                                                <button class="btn btn-outline-danger btn-sm" onclick="purchase('${game.gameid}', '패', '${userid}')">패 (2.0)</button>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </section>

        <!-- Pagination -->
        <ul class="pagination justify-content-center" >
		<!-- startPage pagePerBlock보다 크면 -->
	<c:if test="${startPage > pagePerBlock }">
		<li class="page-item"><a class="fs-2 page-link" href="betMain.do?pageNum=${startPage -1 }">이전</a></li>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage}">
		<c:if test="${pageNum == i }">
			<li class="page-item"><a class="fs-2 page-link active" href="betMain.do?pageNum=${i}">${i }</a></li>
		</c:if>
		<c:if test="${pageNum != i }">
			<li class="page-item"><a class="fs-2 page-link" href="betMain.do?pageNum=${i}">${i }</a></li>
		</c:if>
	</c:forEach>
	<!-- 보여줄께 남아 있으면 다음 -->
	<c:if test="${endPage < totalPage }">
		<li class="page-item"><a class="fs-2 page-link" href="betMain.do?pageNum=${endPage +1 }">다음</a></li>
	</c:if>
</ul>
      
    </main>
    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
