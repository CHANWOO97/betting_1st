<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/betting/css/common.css");</style>
</head><body>
<form action="write.mj" method="post" name="frm">
	<input type="hidden" name="pageNum" value="${pageNum}"> <!-- paging용 -->
<table><caption>게시글 작성</caption>
	<tr><th>제목</th><td><input type="text" name="subject" required="required"
		autofocus="autofocus"></td></tr>
	<tr><th>내용</th><td><textarea rows="5" cols="40" name="content" 
		required="required"></textarea></td></tr>
	<tr><th colspan="2"><input type="submit" value="작성 완료"></th></tr>
</table>
</form>
</body>
</html>