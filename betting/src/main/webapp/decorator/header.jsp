<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<c:set var="id" value='${sessionScope.user_role}'></c:set>
<head>
<meta charset="UTF-8">
<title>가상 베팅 사이트</title>
<!-- 부트스트랩 CDN 추가 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="/betting/css/header-style.css"> -->
</head>
<body>
    <div class="header-container">
        <div class="header-content">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">             
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <c:if test="${id != 'admin'}">
                            <li class="nav-item">
                                <a class="nav-link" href="/betting/views/user/logout.do">로그아웃</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/betting/views/display/betMain.do">메인페이지</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/betting/views/user/mypageForm.jsp">마이페이지</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/betting/views/board/list.mj">게시판</a>
                            </li>
                        </c:if>
                        <c:if test="${id == 'admin'}">
                            <li class="nav-item">
                                <a class="nav-link" href="/betting/views/user/logout.do">로그아웃</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/betting/views/display/betMain.do">메인페이지</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/betting/views/admin/adminMain.jsp">관리자페이지</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </nav>
        </div>
    </div>

    <!-- 부트스트랩 JS 파일 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>