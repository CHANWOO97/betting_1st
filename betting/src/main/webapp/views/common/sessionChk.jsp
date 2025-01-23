<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<c:set var="userid" value="${sessionScope.userid }"></c:set>
<c:if test="${empty userid }">
	<script>
		location.href="/betting/views/user/loginForm.do"
	</script>
</c:if>
</head>