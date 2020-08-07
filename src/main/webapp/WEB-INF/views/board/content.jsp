<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function deleteCheck(){
		if(confirm("정말 삭제하시겠습니까?")){
			alert("글이 삭제되었습니다.");
			location.href="${path}/delete/num/${board.board_num}/pageNum/${pageNum}";
		}else{
			return;
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
<form action="">
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
			<td>작성일</td>
			<td><fmt:formatDate value="${board.board_reg_date}" pattern="yy/MM/dd hh:mm:ss"/></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${board.board_readcount}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${board.board_content}</td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="button" value="답글달기" onClick="location.href='${path}/insertForm/num/${board.board_num}/pageNum/${pageNum}'">
				<c:if test="${sessionScope.id == board.board_writer}">
					<input type="button" value="글 수정" onClick="location.href='${path}/updateForm/num/${board.board_num}/pageNum/${pageNum}'">
					<input type="button" value="글 삭제" onClick="deleteCheck()">
				</c:if>
					<input type="button" value="글 목록" onClick="location.href='${path}/list/pageNum/${pageNum}'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>