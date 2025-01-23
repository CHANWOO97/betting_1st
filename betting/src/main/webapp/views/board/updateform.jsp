<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container text-center">
	<h2 class="text-primary">게시글 수정</h2>
	<form action="update.mj" name="frm" method="post">
		<input type="hidden" name="num" value="${board.num }">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<table class="table table-info">			
			<tr><th>제목</th><td><input type="text" name="subject" required="required" class="form-control" value="${board.subject }"></td></tr>
			<tr><th>내용</th><td><pre><textarea rows="5" name="content" required="required" class="form-control">${board.content}</textarea></pre></td></tr>
			<tr><th colspan="2"><input type="submit" value="수정완료" class="btn btn-success">
		</table>
	</form>
	</div>
</body>
</html>