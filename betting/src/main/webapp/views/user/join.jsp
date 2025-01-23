<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>인생은 베팅</title>
</head>
<body>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("중복된 ID 가 존재합니다.")
		history.back();
	</script>
</c:if>
<c:if test="${result > 0 }">	
	<script type="text/javascript">
		alert("회원가입을 축하합니다.")
		location.href="/betting/views/user/loginForm.do"
	</script>
</c:if>		
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("회원가입을 실패하였습니다.")
		history.back()
	</script>	
</c:if>
</body>
</html>