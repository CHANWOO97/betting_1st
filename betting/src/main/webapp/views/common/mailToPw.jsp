<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<c:if test="${result > 0}">
    <div class="alert alert-success text-center">
        이메일이 성공적으로 전송되었습니다.<br />
        <button type="button" class="btn btn-success mt-3" onclick="location.href='/betting/views/user/loginForm.do'">
            로그인 페이지 이동
        </button>
    </div>
</c:if>
<c:if test="${result == 0}">
    <div class="alert alert-danger text-center">
        비밀번호 초기화 또는 이메일 전송에 실패했습니다. 다시 시도해 주세요.
    </div>
    <div class="text-center mt-3">
        <button type="button" class="btn btn-secondary" onclick="history.back();">이전 페이지로 돌아가기</button>
    </div>
</c:if>
</body>
</html>