<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/betting/css/joinForm.css">
</head>
<body>
	<div class="form-container">
		<h1>본인 이메일로 전송 됩니다.</h1>
		<h2>아래 정보를 입력해주세요.</h2>
		<form action="mailToPw.do" method="post">
			<div class="form-group">
				<label for="id">아이디</label> <input type="text" name="userid"
					required="required" autofocus="autofocus">
			</div>
			<p></p>
			<div class="form-group">
				<label for="name">이름</label> <input type="text" name="name"
					required="required">
			</div>
			<div class="form-group">
			<label for="email">회원가입시 작성한 본인 이메일을 적어주세요</label> <input type="email" name="email"
				id="email" required="required" placeholder="example@example.com"
				pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
				title="이메일 형식은 example@example.com 입니다.">
			</div>
			<button type="submit">비밀번호 찾기</button>
		</form>
	</div>
</body>
</html>