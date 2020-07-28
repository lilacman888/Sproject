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
	<div>
		Date
	</div>
	<c:forEach var="board" items="${list}">
		<ul>
			<li>${board.board_reg_date}</li>
		</ul>
	</c:forEach>
</body>
</html>