<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${path}/insert" method="post">
		<input type="hidden" name="board_num" value="${board_num}">
		<input type="hidden" name="board_ref" value="${board_ref}">
		<input type="hidden" name="board_re_step" value="${board_re_step}">
		<input type="hidden" name="board_re_level" value="${board_re_level}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject" required="required"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer" required="required"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="content" required="required"></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="button" value="취소" onClick="history.go(-1)"></td>
			</tr>
		</table>
	</form>
</body>
</html>