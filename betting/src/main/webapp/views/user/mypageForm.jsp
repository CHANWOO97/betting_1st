<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/betting/css/adminMain.css">
<script type="text/javascript">
	let del = () => {
		let cf = confirm("정말로 탈퇴하시겠습니까?")
		if (cf) location.href="/betting/views/user/deleteForm.do"
		else alert("탈퇴가 취소되었습니다.")
	}	
</script>
</head>
<body>
	<header class="bg-secondary text-center py-4 mb-4">
        <h1 class="text-warning">스포츠토토</h1>
        <p class="text-light">오늘의 경기 리스트를 확인하고 베팅을 시작하세요!</p>
    </header>
	<div class="admin-main-container">
		<h1>마이 페이지</h1>
		<div class="mt-5 admin-menu">
			<button
				onclick="location.href='/betting/views/user/updateForm.do'"
				class="admin-btn">회원 정보 수정</button>
			<button
				onclick="location.href='/betting/views/sale/saleForm.ys'"
				class="admin-btn">장바구니/구매페이지</button>	
			<button
				onclick="location.href='/betting/views/sale/payForm.ys'"
				class="admin-btn">구매 내역</button>
			<button
				onclick="del()"
				class="admin-btn">회원 탈퇴</button>
		</div>
	</div>
</body>
</html>