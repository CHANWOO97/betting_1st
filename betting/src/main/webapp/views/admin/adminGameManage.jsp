<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 관리</title>
<link rel="stylesheet" href="/betting/css/adminGameManage.css">
</head>
<body>
	<div class="game-management-container">
		<h1>경기 관리</h1>

		<!-- 이전 페이지 버튼 -->
		<div class="navigation">
			<button type="button" onclick="history.go(-1)">이전 페이지</button>
			<button type="button"
				onclick="location.href='/betting/views/display/betMain.do'">메인페이지</button>
		</div>

		<!-- 경기 추가 폼 -->
		<div class="add-game-form">
			<h2>경기 추가</h2>
			<form action="adminAddGame.do" method="post">
				<div class="form-group">
					<label for="hometeam">홈 팀:</label> <input type="text" id="hometeam"
						name="hometeam" required>
				</div>
				<div class="form-group">
					<label for="awayteam">원정 팀:</label> <input type="text"
						id="awayteam" name="awayteam" required>
				</div>
				<div class="form-group">
					<label for="gamedate">경기 날짜:</label> <input type="date"
						id="gamedate" name="gamedate" required>
				</div>
				<div class="form-group">
					<label for="gametime">경기 시간:</label> <input type="time"
						id="gametime" name="gametime" required>
				</div>
				<div class="form-group">
					<label for="sporttype">종목:</label> <input type="text"
						id="sporttype" name="sporttype" required>
				</div>
				<button type="submit">경기 추가</button>
			</form>
		</div>

		<!-- 경기 목록 -->
		<div class="game-list">
			<h2>경기 목록</h2>
			<table>
				<thead>
					<tr>
						<th>경기 ID</th>
						<th>홈 팀</th>
						<th>원정 팀</th>
						<th>날짜</th>
						<th>시간</th>
						<th>종목</th>
						<th>경기결과</th>
						<th>작업</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="game" items="${list}">
							<tr>
								<td>${game.gameid}</td>
								<td>${game.hometeam}</td>
								<td>${game.awayteam}</td>
								<td>${game.gamedate}</td>
								<td>${game.gametime}</td>
								<td>${game.sporttype}</td>
								<c:if test="${empty game.gameresult }">
									<td>관리자는 게임 결과 확인 후 수정해주세요.</td>
								</c:if>
								<c:if test="${not empty game.gameresult }">
									<td>${game.gameresult }</td>
								</c:if>
								<c:if test="${game.del != 'y' }">								
									<td>
										<button
											onclick="location.href='gameUpdateForm.do?gameid=${game.gameid}&pageNum=${pageNum }'">수정</button>
										<button
											onclick="location.href='gameDeleteForm.do?gameid=${game.gameid }&pageNum=${pageNum }'">삭제</button>
									</td>
								</c:if>
								<c:if test="${game.del == 'y' }">
									<td>관리자 권한으로 취소된 경기 입니다.</td>
								</c:if>							
							</tr>				
					</c:forEach>			
				</tbody>
			</table>

			<!-- 페이지네이션 -->
			<div class="pagination">
				<c:if test="${startPage > 1}">
					<button class="pagination-btn"
						onclick="location.href='adminGameManage.do?pageNum=${startPage - 1}'">이전</button>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<button class="pagination-btn"
						onclick="location.href='adminGameManage.do?pageNum=${i}'">${i}
						페이지</button>
				</c:forEach>
				<c:if test="${endPage < totalPage}">
					<button class="pagination-btn"
						onclick="location.href='adminGameManage.do?pageNum=${endPage + 1}'">다음</button>
				</c:if>
			</div>
		</div>
	</div>

	<script>
        function deleteGame(gameid) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                location.href = `deleteGame.do?gameid=${gameid}`;
            }
        }
    </script>
</body>
</html>
