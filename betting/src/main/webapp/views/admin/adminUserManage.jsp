<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/betting/css/adminUserManage.css">
</head>
<body>
	<!-- Header -->
	<header>
		<h1>유저 목록</h1>
		<p>관리자는 규정을 위반한 유저에 대해 적절한 조치를 취해주세요.</p>
	</header>

	<!-- 유저 리스트 -->
	<div class="container">
		<h2>유저 리스트</h2>
		<div class="user-list">
			<c:if test="${empty list}">
				<p class="no-users">유저가 없습니다.</p>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="user" items="${list}">
					<div class="user-item">
						<div>
							<c:if test="${user.del != 'y'}">
								<div>
									<span>아이디 : ${user.userid}</span>
									<span>이름 : ${user.username}</span>
									<span>주소 : ${user.address }</span>
									<span>전화번호 : ${user.tel }</span>
									<span>이메일 : ${user.email }</span>
								</div>
							</c:if>
							<c:if test="${user.del == 'y'}">
								<div>
									<span class="deleted">${user.userid } 아이디는 회원 탈퇴한 유저입니다.</span>
								</div>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<!-- Pagination -->
		<div class="pagination">
			<c:if test="${startPage > 1}">
				<button onclick="location.href='adminUserManage.do?pageNum=${startPage - 1}'">이전</button>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<button onclick="location.href='adminUserManage.do?pageNum=${i}'">${i} page</button>
			</c:forEach>
			<c:if test="${endPage < totalPage}">
				<button onclick="location.href='adminUserManage.do?pageNum=${endPage + 1}'">다음</button>
			</c:if>
		</div>
	</div>
</body>
</html>