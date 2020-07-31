function timeBefore(targetDate){
	/* 작성일 */
    const writeDay = new Date(targetDate);
	
	const sec = 60;
	const min = 3600;
	const day = 86400;
	const month = 2592000;
	const year = 31536000;
	
	/* 현재 - 작성일 */
	const gap = Math.floor((new Date().getTime() - writeDay.getTime()) / 1000);
	
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
		return interval + '분 전';
	}
	return '방금 전';
}
/* document.getElementById("target").innerHTML = timeBefore('${targetDate}'); */
//	document.getElementById("<c:out value='${board.board_num}'/>").innerHTML = timeBefore("<c:out value='${targetDate}'/>");
