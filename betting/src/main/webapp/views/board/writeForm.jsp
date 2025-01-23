<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 작성</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">게시글 작성</h2>

    <form action="write.mj" method="post" name="frm">
        <input type="hidden" name="pageNum" value="${pageNum}"> <!-- paging용 -->

        <div class="form-group">
            <label for="subject">제목</label>
            <input type="text" class="form-control" name="subject" id="subject" required="required" autofocus="autofocus">
        </div>

        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" name="content" id="content" rows="5" required="required"></textarea>
        </div>

        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary">작성 완료</button>
        </div>
    </form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
