<%@page import="oracle.net.aso.i"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/betting/css/common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head><body>
<table border="1"><caption>게시글 목록</caption>
	<tr><th>번호</th><th>제목</th><th>작성자 id</th><th>작성일</th><th>조회수</th></tr>
<c:if test="${empty list }">
	<tr><th colspan="5">게시글이 없습니다</th></tr>
</c:if>
<c:if test="${not empty list }">
	<c:forEach var="board" items="${list }">
		<tr><td>${num} <c:set var="num" value="${num - 1 }"></c:set></td>
			<c:if test="${board.del == 'y' }">
				<th colspan="4">삭제된 글입니다</th>
			</c:if>
			<c:if test="${board.del != 'y' }">
				<td title="${board.content }">
					<a href="content.mj?num=${board.num }&pageNum=${currentPage}">${board.subject }</a>
					<c:if test="${board.readcount > 50 }">
						<img alt="" src="images/hot.gif">
					</c:if>	
				</td>
				<td>${board.id }</td>
				<td>${board.reg_date}</td>
				<td>${board.readcount }</td>
			</c:if>
			</tr>
	</c:forEach>
</c:if>
</table>
<div align="center">
<!-- 앞에 보여줄 것이 있어 -->
<c:if test="${startPage > PAGE_PER_BLOCK }">
	<button onclick="location.href='list.mj?pageNum=${startPage-1}'">이전</button>		
</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<button onclick="location.href='list.mj?pageNum=${i}'">${i }</button>
	</c:forEach>
<c:if test="${endPage < totalPage }">
	<button onclick="location.href='list.mj?pageNum=${endPage+1}'">다음</button>		
</c:if>
</div><br>
<div align="center">
	<button onclick="location.href='writeForm.mj?num=0&pageNum=1'">글 쓰기</button>
</div>
</body>
</html>