<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>경기 수정</title>
<link rel="stylesheet" href="/betting/css/adminGameManage.css">
</head>
<body>
<div class="game-management-container">
	<div class="add-game-form">
		<h2>경기 수정 및 게임 승패 관리</h2>
		<form action="gameUpdate.do" method="post">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<input type="hidden" name="gameid" value="${game.gameid }">
			<div class="form-group">
				<label for="hometeam">홈 팀:</label> <input type="text" id="hometeam"
					name="hometeam" value="${game.hometeam }" required>
			</div>
			<div class="form-group">
				<label for="awayteam">원정 팀:</label> <input type="text"
					id="awayteam" name="awayteam" value="${game.awayteam }" required>
			</div>
			<div class="form-group">
				<label for="gamedate">경기 날짜:</label> <input type="date"
					id="gamedate" name="gamedate" value="${game.gamedate }" required>
			</div>
			<div class="form-group">
				<label for="gametime">경기 시간:</label> <input type="time"
					id="gametime" name="gametime" value="${game.gametime }" required>
			</div>
			<div class="form-group">
				<label for="sporttype">종목:</label> <input type="text"
					id="sporttype" name="sporttype" value="${game.sporttype }" required>
			</div>
			<div class="form-group">
				<label for="gameresult">경기 결과: </label> <select id="gameresult"
					name="gameresult">
					<option value="">선택안함</option>
					<option value="승" ${game.gameresult == '승' ? 'selected' : ''}>승</option>
					<option value="무" ${game.gameresult == '무' ? 'selected' : ''}>무</option>
					<option value="패" ${game.gameresult == '패' ? 'selected' : ''}>패</option>
				</select>
			</div>
				<button type="submit">경기 수정</button>
		</form>
	</div>	
</div>
</body>
</html>