<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div>${board_num}</div>
		<div>${path}</div>
	<form action="${path}/insert" method="post">
		<input type="hidden" name="board_num" value="${board_num}">
		<input type="hidden" name="board_num" value="${board_writer}">
		<input type="hidden" name="board_ref" value="${board_ref}">
		<input type="hidden" name="board_re_step" value="${board_re_step}">
		<input type="hidden" name="board_re_level" value="${board_re_level}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="board_subject" required="required"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="board_writer" required="required"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="" cols="" name="board_content" required="required"></textarea>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="hidden" name="type" value="ajax"> 
					<input type="file" name="file" /> <input type="submit" value="ajax으로 제출" />
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="button" value="취소" onClick="history.go(-1)"></td>
			</tr>
		</table>
	</form>
</body>
</html>