<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html lang="ko"><head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/betting/css/loginForm.css">
</head>
<body>
    <!-- 배경 -->
    <div class="background">
        <!-- 로그인 카드 -->
        <div class="login-card">
            <h2 class="text-center mb-4">로그인</h2>
            <form action="login.do" method="post">
                <!-- 아이디 입력 -->
                <div class="mb-3">
                    <label for="id" class="form-label">아이디</label>
                    <input type="text" id="userid" name="userid" class="form-control" placeholder="아이디를 입력하세요" required>
                </div>
                <!-- 비밀번호 입력 -->
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요" required>
                </div>
                <!-- 로그인 및 회원가입 버튼 -->
                <div class="d-grid gap-2 mb-3">
                    <button type="submit" class="btn btn-primary">로그인</button>
                    <button type="button" class="btn btn-success" onclick="location.href='/betting/views/user/joinForm.do'">회원가입</button>
                </div>
                <!-- 아이디/비밀번호 찾기 링크 -->
                <div class="d-flex justify-content-between">
                    <a href="/betting/views/common/mailToIdForm.do" class="btn btn-link">아이디 찾기</a>
                    <a href="/betting/views/common/mailToPwForm.do" class="btn btn-link">비밀번호 찾기</a>
                </div>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>