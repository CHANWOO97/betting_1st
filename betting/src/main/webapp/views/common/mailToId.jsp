<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<c:if test="${result > 0}">
    <div class="alert alert-success text-center">
        <strong>당신의 아이디는:</strong> <span>${userid}</span> 입니다.
      	<br />
      	<button type="button" class="btn btn-success mt-3" onclick="location.href='/betting/views/user/loginForm.do'">
            로그인 페이지 이동
        </button>
    </div>
</c:if>
<c:if test="${result == 0}">
    <div class="alert alert-danger text-center">
        <script type="text/javascript">
            alert('없는 아이디 입니다.');
            alert('성함과 전화번호를 다시 입력해주세요.');
            history.back();
        </script>
        <strong>아이디가 존재하지 않습니다.</strong><br />
        <span>성함과 전화번호를 다시 입력해주세요.</span>
    </div>
</c:if>
</body>
</html>