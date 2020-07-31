<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>date</title>
<script type="text/javascript">
function timeBefore(targetDate){
	/* 작성일 */
    const writeDay = new Date(targetDate);
	
	const sec = 60;
	const min = 3600;
	const day = 86400;
	const month = 2592000;
	const year = 31536000;
	
	/* 현재 - 작성일 */
	const gap = Math.floor((new Date().getTime() - writeDay) / 1000);
	const gap1 = Math.floor((new Date().getTime() - writeDay));
	
	var interval = Math.floor(gap/year);
	if(interval >= 1){
		return interval + '년 전';
	}
	var interval = Math.floor(gap/month);
	if(interval >= 1){
		return  interval + '달 전';
	}
	var interval = Math.floor(gap/day);
	if(interval >= 1){
		return interval + '일 전';
	}
	var interval = Math.floor(gap/min);
	if(interval >= 1){
/* 		console.log(new Date); */
		console.log(new Date().getTime());
		console.log(writeDay);
		console.log(new Date().getTime() - writeDay.getTime());
		console.log(gap);
		console.log(gap1);
		console.log(min);
		console.log(gap1/min);
		return interval + '분 전';
	}
	return '방금 전';
}
</script>

</head>
<body>
	<c:if test="${not empty list}">
		<c:forEach var="board" items="${list}">
    		<fmt:formatDate value="${board.board_reg_date}" var="targetDate" pattern="yyyy-MM-dd'T'HH:mm:ssZ"/>
    		
				<span id="${board.board_num}"></span>
				<span>=<fmt:formatDate value="${board.board_reg_date}" pattern="yyyy-MM-dd'T'HH:mm:ssZ"/></span><br>
				<script type="text/javascript">
					document.getElementById("<c:out value='${board.board_num}'/>").innerHTML = timeBefore("<c:out value='${targetDate}'/>");
				</script>
		</c:forEach>
	</c:if>
</body>
</html>
