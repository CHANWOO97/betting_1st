<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
                         <li class="nav-item">
                             <a class="nav-link" href="/betting/views/display/betMain.do">메인페이지</a>
                         </li>
                         <li class="nav-item">
                             <a class="nav-link" href="/betting/views/user/mypageForm.jsp">마이페이지</a>
                         </li>
                         <li class="nav-item">
                             <a class="nav-link" href="/betting/views/sale/payForm.ys">구매내역</a>
                         </li>
                    </ul>
                </div>			  
            </nav>
            <div class="bg-secondary text-center py-4 mb-4">
			        <h1 class="text-warning">스포츠토토</h1>
			        <p class="text-light">오늘의 경기 리스트를 확인하고 베팅을 시작하세요!</p>
			</div>
        </div>
    </div>
<!-- 부트스트랩 JS 파일 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>