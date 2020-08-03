<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>date</title>
</head>
<body>
	<c:if test="${not empty list}">
		<c:forEach var="board" items="${list}">
    		<fmt:formatDate value="${board.board_reg_date}" var="targetDate" pattern="yyyy-MM-dd HH:mm:ss"/>
				<span id="${board.board_num}"></span>
    			<script type="text/javascript">
					document.getElementById("<c:out value='${board.board_num}'/>").innerHTML = timeBefore('<c:out value="${targetDate}"/>');
    			</script>
				<span>=<fmt:formatDate value="${board.board_reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/></span><br>
		</c:forEach>
	</c:if>
	<input type="button" value="home" onClick="location.href='${path}/home'"/>
</body>
</html>
