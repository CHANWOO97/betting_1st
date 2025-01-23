<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 목록</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<div class="container mt-4 text-center">
    <h2 class="text-center">게시글 목록</h2>
    
    <c:if test="${empty list }">
        <div class="alert alert-warning" role="alert">
            게시글이 없습니다.
        </div>
    </c:if>

    <c:if test="${not empty list }">
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자 id</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="board" items="${list}">
                    <tr>
                        <td>${num} <c:set var="num" value="${num - 1 }"></c:set></td>
                        <c:if test="${board.del == 'y' }">
                            <td colspan="4" class="text-center text-danger">삭제된 글입니다</td>
                        </c:if>
                        <c:if test="${board.del != 'y' }">
                            <td title="${board.content}">
                                <a href="content.mj?num=${board.num }&pageNum=${currentPage}" class="text-primary">
                                    ${board.subject}
                                </a>
                                <c:if test="${board.readcount > 50 }">
                                    <img alt="Hot" src="images/hot.gif" class="ml-2">
                                </c:if>
                            </td>
                            <td>${board.id }</td>
                            <td>${board.reg_date}</td>
                            <td>${board.readcount }</td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <div class="d-flex justify-content-center">
        <c:if test="${startPage > PAGE_PER_BLOCK }">
            <button onclick="location.href='list.mj?pageNum=${startPage-1}'" class="btn btn-secondary mr-2">이전</button>
        </c:if>
        
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
         
            <c:if test="${currentPage==i }">
               <a href="list.mj?pageNum=${i}" class="btn btn-outline-primary mr-2 active">${i}</a>
            </c:if>
             <c:if test="${currentPage!=i }">
            	   <a href="list.mj?pageNum=${i}" class="btn btn-outline-primary mr-2">${i}</a>
            </c:if>
        </c:forEach>

        <c:if test="${endPage < totalPage }">
            <button onclick="location.href='list.mj?pageNum=${endPage+1}'" class="btn btn-secondary ml-2">다음</button>
        </c:if>
    </div>

    <div class="text-center mt-4">
        <button onclick="location.href='writeForm.mj?num=0&pageNum=1'" class="btn btn-success">글 쓰기</button>
    </div>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
