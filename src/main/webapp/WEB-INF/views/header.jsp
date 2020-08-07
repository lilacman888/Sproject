<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<script src="${path}/js/test1.js"></script>
<script src="${path}/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${path}/js/jQuery.form.min.js"></script>

<script>
	function init() {
		document.getElementById("path").value = location.pathname
				+ location.search;
	}
</script>
<hr>
<body onload="init()">
	<form method="get">
		<input type="hidden" name="path" id="path" />
		<c:if test="${empty sessionScope.id}">
			<input type="submit" value="login" formaction="${path}/user/login">
		</c:if>
		<c:if test="${not empty sessionScope.id}">
			<input type="submit" value="logout" formaction="${path}/user/logout">
			<span>${id}님 환영합니다</span>
		</c:if>
	</form>
	<input type="button" value="path test"
		onClick="alert(location.pathname + location.search)"/><br />
	<input type="button" value="home" onClick="location.href='${path}/home'"/>
</body>
<hr>
