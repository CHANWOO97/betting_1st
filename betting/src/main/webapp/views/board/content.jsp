<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){ 
	   	    // load = boardlist에 해당하는 목록을 뿌려주는데 테이블에 해당하는것만 뿌려주기, 그중에서 pageNum = 현재 해당하는 페이지만 뿌려주기
			// $('#disp').load('/betting/views/board/list.mj?pageNum=${pageNum} table')		
			$('#disp').load('/betting/views/board/list.mj?pageNum=${pageNum} table');
		});
	</script>
	<script type="text/javascript">
		function del(num,pageNum) {
			let bcf = confirm("게시글을 삭제하시겠습니까?")
			if(bcf) location.href="boarddelete.mj?num="+num+"&pageNum="+pageNum
			else alert("삭제가 취소 되었습니다.")
		}	
	</script>
</head>
<body>
	<div class="container text-center">
		<h2 class="text-primary">게시물 상세정보</h2>
		<table class="table table-striped">
			<tr><td>번호</td>	<td>${board.num }</td></tr>
			<tr><td>제목</td>	<td>${board.subject }</td></tr>
			<tr><td>내용</td>	<td><pre>${board.content }</pre></td></tr>
			<tr><td>작성자</td><td>${board.id }</td></tr>
			<tr><td>등록일</td><td>${board.reg_date }</td></tr>		
			<tr><td>조회수</td><td>${board.readcount }</td></tr>
			<tr><td colspan="2"><a class="btn btn-success" href="list.mj?pageNum=${pageNum}">목록</a>
				<c:if test="${board.id == userid }">
					<a class="btn btn-warning" href="updateform.mj?num=${board.num }&pageNum=${pageNum}">수정</a>
					<a onclick="del(${board.num },${pageNum })" class="btn btn-danger">삭제</a>
				</c:if>
			</td></tr>
		</table>
		<div id="disp"></div>
	</div>
</body>
</html>