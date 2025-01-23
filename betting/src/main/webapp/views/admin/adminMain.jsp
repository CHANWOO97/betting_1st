<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
<link rel="stylesheet" href="/betting/css/adminMain.css">
</head>
<body>
	<header class="bg-secondary text-center py-4 mb-4">
        <h1 class="text-warning">스포츠토토</h1>
        <p class="text-light">오늘의 경기 리스트를 확인하고 베팅을 시작하세요!</p>
    </header>
	<div class="admin-main-container">
		<h1>관리자 메인 페이지</h1>
		<div class="mt-5 admin-menu">
			<button
				onclick="location.href='/betting/views/admin/adminGameManage.do'"
				class="admin-btn">경기 관리</button>
			<button
				onclick="location.href='/betting/views/admin/adminUserManage.do'"
				class="admin-btn">회원 관리</button>
			<button
				onclick="location.href='/betting/views/admin/adminSaleManage.ys'"
				class="admin-btn">구매 관리</button>	
		</div>
	</div>
</body>
</html>