<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 게시판</title>
</head>
<body>
<input type="button" value="home" onClick="location.href='${path}/home'"/>
	<table>
		<tr>
			<th>No</th>
			<th>subject</th>
			<th>writer</th>
			<th>readcount</th>
			<th>date</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<th colspan="5">등록된 데이터가 없습니다.</th>
			</tr>		
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="board" items="${list}">
				<tr>
					<td>${board.board_num}</td>
					<c:if test="${board.board_del == 'y'}">
						<td colspan="4"> 삭제된 데이터입니다.</td>
					</c:if>
					<c:if test="${board.board_del != 'y'}">
						<td>
							<a href="${path}/content/num/${board.board_num}/pageNum/${pp.currentPage}" class="">
							<!-- <a href="#"> -->
								<c:if test="${board.board_re_level>0}">
<%-- 								<img alt="" src="${path }/images/level.gif" height="2" width="${board.re_level *5 }">
									<img alt="" src="${path }/images/re.gif"> --%>
									&nbsp;&nbsp;[re]:
								</c:if>
								${board.board_subject}
								<%-- <c:if test="${board.board_readcount>30}">
									<img alt="" src="${path }/images/hot.gif">
								</c:if> --%>
							</a>
						</td>
						<td>${board.board_writer}</td>
						<td>
							${board.board_readcount}
						</td>
						<td>
							<%-- ${board.board_reg_date} --%>
							<fmt:formatDate value="${board.board_reg_date}" pattern="yy/MM/dd hh:mm:ss"/>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<form action="${path}/list/pageNum/1">
		<select name="search">
			<option value="board_subject"
				<c:if test="${search=='board_subject'}">selected="selected"</c:if>>제목</option>
			<option value="board_content"
				<c:if test="${search=='board_content'}">selected="selected"</c:if>>내용</option>
			<option value="board_writer"
				<c:if test="${search=='board_writer'}">selected="selected"</c:if>>작성자</option>
				<!-- subcon -> xml파일에서 getTotal()로 적용 -->
			<option value="subcon"
				<c:if test="${search=='subcon'}">selected="selected"</c:if>>제목+내용</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>
	<ul>
		<c:if test="${not empty keyword}">
			<c:if test="${pp.startPage > pp.pagePerBlk}">
				<li><a href="${path}/list/pageNum${pp.startPage-1}?search=${search}&keyword=${keyword}">이전</a></li>
				startPage=${startPage}, endPage=${endPage}
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${endPage}">
				<li <c:if test="${pp.currentPage==i}"></c:if>>
				<a href="${path}/list/pageNum/${i}/?search=${search}&keyword=${keyword}">${i}</a></li>
			</c:forEach>
			<c:if test="${pp.startPage > pp.pagePerBlk}">
				<li><a href="${path}/list/pageNum${pp.endPage+1}?search=${search}&keyword=${keyword}">다음</a></li>
				startPage=${startPage}, endPage=${endPage}
			</c:if>
		</c:if>
		<c:if test="${empty keyword}">
			<c:if test="${pp.startPage > pp.pagePerBlk }">
				<li><a href="${path }/list/pageNum/${pp.startPage - 1}">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="${path }/list/pageNum/${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="${path }/list/pageNum/${pp.endPage + 1}">다음</a></li>
			</c:if>
		</c:if>
	</ul>
	<a href="${path}/insertForm">글 입력</a>
</body>
</html>