<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매관리</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <h2 class="text-center mb-4">구매내역</h2>
        
        <!-- 구매내역 목록 -->
        <div class="row g-4">
            <c:forEach var="sale" items="${list}">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">구매 코드: ${sale.saleid}</h5>
                            <p><strong>구매한 유저:</strong> ${sale.userid}</p>
                            <p><strong>경기 코드:</strong> ${sale.gameid}</p>
                            <p><strong>경기 타입:</strong> (${sale.sporttype}) ${sale.hometeam} vs ${sale.awayteam}</p>
                            <p><strong>경기 날짜:</strong> ${sale.gamedate} <strong>경기 시간:</strong> ${sale.gametime}</p>
                            
                            <!-- 경기 예측 -->
                            <p><strong>경기 예측:</strong> 
                                <span class="badge 
                                    <c:choose>
                                        <c:when test="${sale.userresult == '승'}">bg-success</c:when>
                                        <c:when test="${sale.userresult == '무'}">bg-secondary</c:when>
                                        <c:when test="${sale.userresult == '패'}">bg-danger</c:when>
                                    </c:choose>">
                                    ${sale.userresult}
                                </span>
                            </p>                           
                            <!-- 경기 결과 -->
							<p>
								<strong>경기 결과:</strong>
								<c:if test="${empty sale.gameresult}">
									<div
										class="alert alert-warning d-flex justify-content-between align-items-center"
										role="alert">
										<span><strong>관리자는 결과 확인필요.</strong></span>
										<button class="btn btn-sm btn-outline-primary"
											onclick="location.href='gameUpdateForm.do?gameid=${sale.gameid}'">수정</button>
									</div>
								</c:if>
								<c:if test="${not empty sale.gameresult}">
									<div class="d-flex align-items-center">
										<span
											class="badge 
							                <c:choose>
							                    <c:when test="${sale.gameresult == '승'}">bg-success</c:when>
							                    <c:when test="${sale.gameresult == '무'}">bg-secondary</c:when>
							                    <c:when test="${sale.gameresult == '패'}">bg-danger</c:when>
							                </c:choose>">
											${sale.gameresult} </span> <span class="ms-2 text-muted">(경기
											결과)</span>
									</div>
								</c:if>
							</p>

							<p><strong>구매 포인트:</strong> ${sale.salepoint}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Pagination -->
        <nav class="mt-5">
            <ul class="pagination justify-content-center">
                <c:if test="${startPage > 1}">
                    <li class="page-item">
                        <button class="page-link" onclick="location.href='betMain.do?pageNum=${startPage - 1}'">이전</button>
                    </li>
                </c:if>
                
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <li class="page-item">
                        <button class="page-link" onclick="location.href='betMain.do?pageNum=${i}'">${i}</button>
                    </li>
                </c:forEach>
                
                <c:if test="${endPage < totalPage}">
                    <li class="page-item">
                        <button class="page-link" onclick="location.href='betMain.do?pageNum=${endPage + 1}'">다음</button>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>

    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
