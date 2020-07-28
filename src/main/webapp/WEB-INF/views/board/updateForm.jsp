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
	<form action="${path}/update/pageNum/${pageNum}" method="post">
		<input type="hidden" name="board_num" value="${board.board_num}">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="board_subject" required="required" value="${board.board_subject}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="board_writer" required="required" value="${board.board_writer}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="board_content" required="required" value="${board.board_content}"></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="button" value="취소" onClick="history.go(-1)"></td>
			</tr>
		</table>
	</form>
</body>
</html>