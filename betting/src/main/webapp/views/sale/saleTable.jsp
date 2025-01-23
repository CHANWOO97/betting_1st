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
  <c:if test="${result > 0}">
    <!-- 알림 메시지 (alert-success) -->
    <div class="alert alert-success" role="alert">
      <strong>경기 선택 성공!</strong><br><br>
      <span>선택한 <span class="text-danger font-weight-bold">${gameid }</span> 경기를 구매페이지로 이동하였습니다.</span>
    </div>

    <div class="mb-3">
      <script type="text/javascript">
        alert("경기 선택 성공");       
        let countdown = 2; // 초기 카운트 다운 시간을 설정        
        let countdownInterval = setInterval(function() {
			document.getElementById("countdown").innerHTML ="페이지가 " + countdown + "초 후에 이동합니다......";
			
			if(countdown === 0){
				clearInterval(countdownInterval); // 카운트 다운 중지
				location.href='/betting/views/sale/saleForm.ys'
			}			
	        countdown--;	        
		}, 1000); 
      </script>
      <p id="countdown">페이지가 2초 후에 이동합니다......</p>
    </div>
  </c:if>

  <!-- 실패 조건 (result == -1) -->
  <c:if test="${result == -1}">
    <!-- 알림 메시지 (alert-danger) -->
    <div class="alert alert-danger mt-3" role="alert">
      <strong>경기 구매 실패</strong> - 다시 시도해주세요.
    </div>

    <script type="text/javascript">
      	alert("이미 선택한 경기입니다.");
      	history.back();
    </script>
  </c:if>

</div>
</body>
</html>