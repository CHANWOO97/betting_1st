<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/패스워드 찾기</title>
<link rel="stylesheet" href="/betting/css/joinForm.css">
</head>
<body>
	<div class="form-container">
		<h1>아이디 찾기</h1>
		<form action="mailToId.do" method="post">
			<div class="form-group">
				<label for="name">이름</label> <input type="text" name="name"
					required="required">
			</div>
			<p></p>
			<div class="form-group">
				<label for="tel">전화</label> <input type="tel" name="tel"
					required="required" placeholder="010-1111-1234"
					pattern="010-\d{3,4}-\d{4}" title="전화 형식은 010-1111-1234 입니다.">
			</div>
			<button type="submit">아이디 찾기</button>
		</form>
	</div>
</body>
</html>