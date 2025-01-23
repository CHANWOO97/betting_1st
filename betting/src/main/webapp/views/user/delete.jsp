<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>진짜 탈퇴 잘가라</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("'${userid }' 아이디 회원은 탈퇴 되었습니다.")
		location.href="/betting/views/display/betMain.do";
	</script>
</c:if>	
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("탈퇴 실패.. 이유는?")
		history.back();
	</script>
</c:if>	
</body>
</html>