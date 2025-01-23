<%@page import="oracle.net.aso.i"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/sessionChk.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>구매내역</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-light">
    <!-- Main Container -->
    <div class="container py-5">
        <!-- Header -->
        <div class="text-center mb-4">
            <h2 class="text-primary">구매내역</h2>
            <p class="text-muted">구매한 경기 내역을 확인하세요.</p>
        </div>

        <!-- 구매 내역 -->
        <div class="row g-4">
            <!-- 구매한 경기가 없는 경우 -->
            <c:if test="${empty list}">
                <div class="col-12">
                    <div class="alert alert-warning text-center" role="alert">
                        구매한 경기가 없습니다.
                    </div>
                </div>
            </c:if>
            <!-- 구매한 경기가 있는 경우 -->
            <c:if test="${not empty list}">
                <c:forEach var="sale" items="${list}">
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="card shadow-sm mb-4">
                            <div class="card-body">
                                <h5 class="card-title text-primary">구매 코드: ${sale.saleid}</h5>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">
                                        <strong>경기 코드:</strong> ${sale.gameid}
                                    </li>
                                    <li class="list-group-item">
                                        <strong>경기 타입:</strong> (${sale.sporttype}) ${sale.hometeam}vs${sale.awayteam}
                                    </li>
                                    <li class="list-group-item">
                                        <strong>경기 날짜:</strong> ${sale.gamedate}
                                    </li>
                                    <li class="list-group-item">
                                        <strong>경기 시간:</strong> ${sale.gametime}
                                    </li>
                                    <li class="list-group-item">
                                        <strong>경기 예측:</strong> 
                                        <span class="badge
                                            <c:choose>
                                                <c:when test="${sale.userresult == '승'}">bg-success</c:when>
                                                <c:when test="${sale.userresult == '무'}">bg-secondary</c:when>
                                                <c:when test="${sale.userresult == '패'}">bg-danger</c:when>
                                            </c:choose>">
                                            ${sale.userresult}
                                        </span>
                                    </li>
                                    <li class="list-group-item">
                                        <strong>구매 포인트:</strong> ${sale.salepoint} 포인트
                                    </li>
                                    <li class="list-group-item">
                                        <strong>적중 시 추가 포인트:</strong> ${sale.salepoint * 2} 포인트
                                    </li>
                                    <li class="list-group-item">
                                        <strong>경기 결과: </strong>
                                        <span class="badge
                                            <c:choose>
                                                <c:when test="${sale.gameresult == '승'}">bg-success</c:when>
                                                <c:when test="${sale.gameresult == '무'}">bg-secondary</c:when>
                                                <c:when test="${sale.gameresult == '패'}">bg-danger</c:when>
                                            </c:choose>">
                                            ${sale.gameresult}
                                        </span>                                        
                                        <c:choose>
                                            <c:when test="${empty sale.gameresult}">아직 발표되지 않음</c:when>
                                            <c:when test="${not empty sale.gameresult}">
                                                <c:choose>
                                                    <c:when test="${sale.gameresult == sale.userresult}">
                                                        <span class="text-success text-end">적중! 축하드립니다.</span>
                                                    </c:when>
                                                    <c:when test="${sale.gameresult != sale.userresult}">                                                                    	                                    	
                                                        <span class="text-danger text-end">아쉽지만 적중 실패!</span>                                                                                                               
                                                    </c:when>
                                                </c:choose>
                                            </c:when>
                                        </c:choose>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>

        <!-- 현재 나의 포인트 -->
        <div class="text-center mt-5">
            <h4 class="text-info">현재 나의 포인트</h4>
            <p class="display-4 text-success">${user.point} 포인트</p>
        </div>
    </div>
</body>
</html>
