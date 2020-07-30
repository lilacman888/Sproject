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
<script type="text/javascript">
function test(a){
	alert(a + 'test');
}
function timeBefore(reg_date){
    console.log(reg_date);
    // 현재시간
    var now = moment(); 
    console.log(now);
    // 글쓴 시간 '<c:out value="${board.board_reg_date}"/>'
    var reg_date = new Date("${reg_date}");
    var writeday = moment(reg_date);
    console.log(writeday);
    var minus;
	    if(now.get('year') > writeday.get('year')){
	        minus= now.get('year')-writeday.get('year');
	        console.log(minus+"년 전");
	        return (minus+"년 전");
	    }else if(now.get('month') > writeday.get('month')){
	        minus= now.get('month')-writeday.get('month');
	        return (minus+"달 전");
	    }else if(now.get('date') > writeday.get('date')){
	        minus= now.get('date')-writeday.get('date');
	        return (minus+"일 전");
	    }else if(now.get('date') == writeday.get('date')){
	        var nowTime = now.getTime();
	        var writeTime = writeday.getTime();
	        if(nowTime>writeTime){
	            sec = parseInt(nowTime - writeTime) / 1000;
	            day = parseInt(sec/60/60/24);
	            sec = (sec - (day * 60 * 60 * 24));
	            hour = parseInt(sec/60/60);
	            sec = (sec - (hour*60*60));
	            min = parseInt(sec/60);
	            sec = parseInt(sec-(min*60));
	            if(hour>0){
	            	return (hour+"시간 전");
	            }else if(min>0){
	            	return (min+"분 전");
	            }else if(sec>0){
	            	return (sec+"방금 전");
	            }
	        }
	    }
}
</script>
	<div>
		Date
		
	</div>
	<c:if test="${not empty list}">
		<c:forEach var="board" items="${list}">
    		<fmt:formatDate value="${board.board_reg_date}" var="reg_date" pattern="yyyy/MM/dd"/>
			<ul>
				<li>${reg_date}</li>
			</ul>
			<input type="button" onclick="timeBefore('${reg_date}')" value="button"/>
<%-- 			<input type="button" onclick="timeBefore(${reg_date})" value="button"/> --%>
		</c:forEach>
	</c:if>
		
</body>
</html>
