<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>게임 추가</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("경기 추가하였습니다.")
			location.href="adminGameManage.do?pageNum=${pageNum}";
		</script>
	</c:if>		
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("경기 추가 실패하였습니다.")
			history.back()
		</script>
	</c:if>
</body>
</html>