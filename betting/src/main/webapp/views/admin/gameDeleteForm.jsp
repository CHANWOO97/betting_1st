<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/sessionChk.jsp"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/betting/views/admin/gameDelete.do">
	<input type="hidden" name="gameid" value="${gameid }">
	<input type="hidden" name="pageNum" value="${pageNum }">
<table border="1">
	<caption>경기 취소</caption>
	<tr><th>암호</th><td><input type="password" name="password" required="required"></td></tr>
	<tr><th colspan="2"><input type="submit" value="삭제"></th></tr>	
</table>
</form>
</body>
</html>