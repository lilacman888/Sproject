<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>제목</td>
			<td>${board.board_subject}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${board.board_writer}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${board.board_content}</td>
		</tr>
		<tr>
			<td><input type="button" value="답글달기" onClick="location.href='${path}/insertForm/num/${board.board_num}/pageNum/${pageNum}'"></td>
			<!-- session.id가 같으면 수정 버튼 생성 -->
			<%-- <c:if test=""> --%>
			<%-- </c:if> --%>
			<td><input type="button" value="글 수정" onClick="location.href='${path}/updateForm/num/${board.board_num}/pageNum/${pageNum}'"></td>
			<td><input type="button" value="글 삭제" onClick="location.href='#'"></td>
			<td><input type="button" value="글 목록" onClick="history.go(-1)"></td>
		</tr>
		<tr>
			
		</tr>
	</table>
</body>
</html>