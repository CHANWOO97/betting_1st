<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>경기 취소</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("관리자 권한으로 경기 취소하였습니다.")
			location.href="adminGameManage.do?pageNum=${pageNum}";
		</script>
	</c:if>		
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("관리자 권한 경기 취소 실패하였습니다.")
			history.back()
		</script>
	</c:if>
	<c:if test="${result < 0 }">
		<script type="text/javascript">
			alert("관리자 암호 확인 해주세요.")
			history.back()
		</script>
	</c:if>
</body>
</html>