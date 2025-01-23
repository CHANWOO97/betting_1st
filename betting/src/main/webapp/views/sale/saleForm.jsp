<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구매페이지</title>
<!-- 부트스트랩 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    	function sale(saleId, userid, gameid) {
    		point = $('#pointInput_'+saleId).val()
    		// 최소값과 최대값을 체크하여 값을 제한
		    if (point < 5000 || point > 100000) {
		        alert('포인트는 5000 이상 100000 이하로 입력해야 합니다.');
		        return false; // 유효하지 않으면 함수 종료
   			}
    		location.href='/betting/views/sale/pay.ys?&point='+point+'&userid='+userid+'&saleid='+saleId+'&gameid='+gameid;
		}
    </script>
</head>

<body class="bg-light">
	<!-- Main Container -->
	<div class="container py-5">
		<!-- Header -->
		<div class="text-center mb-4">
			<h2 class="text-primary">장바구니</h2>
			<p class="text-muted">현재 구매하려는 경기 내역을 확인하세요.</p>
		</div>

		<!-- 구매 내역 -->
		<div class="row g-4">
			<c:if test="${empty list }">
				<div class="col-12">
					<div class="alert alert-warning text-center" role="alert">
						구매할 경기가 없습니다.</div>
				</div>
			</c:if>

			<c:if test="${not empty list }">
				<!-- 경기 목록 카드 -->
				<div class="card mb-4">
					<div class="card-body">
						<ul class="list-group">
							<c:forEach var="sale" items="${list}">
								<li	class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
									<span><strong>경기 코드:</strong> ${sale.gameid}</span> 
									<span><strong>경기 타입:</strong> ${sale.sporttype}</span> 
									<span><strong>경기 날짜:</strong>	${sale.gamedate}</span> 
									<span><strong>경기 시간:</strong>	${sale.gametime}</span> 
									<span> <strong>승 vs 패:</strong> <span class="text-primary">${sale.hometeam}</span> vs <span class="text-danger">${sale.awayteam}</span> </span> 
									<span> <strong>경기 예측:</strong> <span class="badge
						                <c:choose>
						                    <c:when test="${sale.userresult == '승'}">bg-success</c:when>
						                    <c:when test="${sale.userresult == '무'}">bg-secondary</c:when>
						                    <c:when test="${sale.userresult == '패'}">bg-danger</c:when>
						                </c:choose>">
												${sale.userresult} </span>
								</span> 
								<hr style="border: 1px solid #ddd; margin: 10px 0; width: 100%;">
									<!-- 포인트 입력 및 배당, 예상 포인트 -->
									<div class="text-end">
										<strong>구매 포인트:</strong> 
										<input type="number" id="pointInput_${sale.saleid}"
											name="point" max="100000" min="5000" value="5000"
											class="form-control d-inline-block" style="width: 100px;"
											oninput="updateExpectedPoints(${sale.saleid}, ${total})">
										<div class="small text-muted mt-1">5000~100000 포인트</div>							
										<div class="mt-2">
											<strong>배당:</strong> <span class="text-primary">x${total}</span>
										</div>
										<div>
											<strong>예상 포인트:</strong> <span
												id="calculatedPoints_${sale.saleid}" class="text-danger">
												5000 x ${total} = ${5000 * total} </span>
										</div>										
									</div>
									<hr style="border: 1px solid #ddd; margin: 10px 0; width: 100%;">
									<div class="d-flex justify-content-end w-100">
									 <!-- 구매하기 버튼 -->						
										<button class="btn btn-sm btn-outline-success ms-3"
											onclick="sale(${sale.saleid }, '${userid }', ${sale.gameid })">구매하기</button>										
										<button class="btn btn-sm btn-outline-danger ms-3"
											onclick="location.href='/betting/views/sale/saleDelete.ys?saleid=${sale.saleid}&gameid=${sale.gameid }'">
											경기 제거</button>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- 포인트 입력 및 예상 포인트 -->
				<div class="col-12 text-center">
					<!-- 현재 나의 포인트 -->
					<div class="mb-4">
						<div class="d-flex justify-content-center align-items-center">
							<strong class="text-info"
								style="font-size: 1.5rem; margin-right: 10px;">My 포인트</strong> <span
								class="font-weight-bold display-4 text-success"
								style="font-size: 2rem;"> <!-- 초기 계산값 --> ${mypoint }
							</span>
						</div>
					</div>
				</div>
			</c:if>
		</div>

		<!-- Pagination -->
		<nav class="mt-5">
			<ul class="pagination justify-content-center">
				<c:if test="${startPage > 1}">
					<li class="page-item">
						<button class="page-link"
							onclick="location.href='saleForm.ys?pageNum=${startPage - 1}'">이전</button>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item">
						<button class="page-link"
							onclick="location.href='saleForm.ys?pageNum=${i}'">${i}</button>
					</li>
				</c:forEach>
				<c:if test="${endPage < totalPage}">
					<li class="page-item">
						<button class="page-link"
							onclick="location.href='saleForm.ys?pageNum=${endPage + 1}'">다음</button>
					</li>
				</c:if>
			</ul>
		</nav>

	</div>

	<!-- 부트스트랩 JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- 포인트 계산 함수 -->
	<script>
        // 서버에서 전달받은 배당 값 (예시로 2를 사용)
        var total = ${total}; // 서버에서 전달받은 배당 값

        // 포인트가 변경될 때마다 호출되는 함수
        function updateExpectedPoints(saleId, total) {
		    var point = document.querySelector('#pointInput_' + saleId).value;
		    var expectedPoints = point * total;
		    document.querySelector('#calculatedPoints_' + saleId).textContent = point + ' x ' + total + ' = ' + expectedPoints;
		}
    </script>
</body>
</html>
