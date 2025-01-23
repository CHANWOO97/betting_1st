<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  
  <!-- 성공 조건 (result > 0) -->
  <c:if test="${result1 > 0 || result2 > 0}">
    <!-- 알림 메시지 (alert-success) -->
    <div class="alert alert-success" role="alert">
      <strong>경기 선택 성공!</strong><br><br>
      <span>선택한 <span class="text-danger font-weight-bold">${gameid }</span> 경기를 구매페이지로 이동하였습니다.</span>
    </div>

    <div class="mb-3">
      <p>추가로 구매할 경기가 있다면 아래 버튼을 이용하세요.</p>
    </div>

    <!-- 버튼 배치: 메인페이지 / 구매페이지 이동 -->
    <div class="d-flex gap-2">
      <button class="btn btn-primary" onclick="location.href='/betting/views/sale/saleForm.ys'">
        구매페이지
      </button>
      <button class="btn btn-success" onclick="location.href='/betting/views/sale/payForm.ys'">
        구매내역
      </button>
    </div>
  </c:if>

  <!-- 실패 조건 (result == -1) -->
  <c:if test="${result1 == 0 || result2 == 0}">
    <!-- 알림 메시지 (alert-danger) -->
    <div class="alert alert-danger mt-3" role="alert">
      <strong>경기 구매 실패</strong> - 다시 시도해주세요.
    </div>

    <script type="text/javascript">
      	alert("경기 구매하기 실패하였습니다.");
      	history.back();
    </script>
  </c:if>

</div>
</body>
</html>