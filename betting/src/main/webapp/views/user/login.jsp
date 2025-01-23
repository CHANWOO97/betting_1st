<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Login Check</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("로그인 되었습니다.")
		location.href="/betting/views/display/betMain.do"
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("비밀번호를 다시 입력해주세요.")
		history.back()
	</script>
</c:if>	
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("존재하지 않는 ID 입니다.")
		history.back()
	</script>
</c:if>
</body>
</html>