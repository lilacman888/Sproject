
function timeBefore(targetDate){
	/* 작성일 */
    const writeDay = new Date(targetDate);
	
	const sec = 60;
	const hour = 3600;
	const day = 86400;
	const month = 2592000;
	const year = 31536000;
	
	/* 현재 - 작성일 */
	const gap = Math.floor((new Date().getTime() - writeDay.getTime()) / 1000);
	console.log("new Date.getTime = " + new Date().getTime());
	console.log("writeDay = " + writeDay.getTime());
	console.log("gap = " + gap);
	var interval = Math.floor(gap/year);
	if(interval >= 1){
		return interval + '년 전';
	} else {
		interval = Math.floor(gap/month);
		if(interval >= 1){
			return interval + '달 전';
		} else {
			interval = Math.floor(gap/day);
			if(interval >= 1){
				return interval + '일 전';
			} else {
				interval = Math.floor(gap/hour);
				if(interval >= 1){
					return interval + '시간 전';
				} else {
					interval = Math.floor(gap/sec);
					if(interval >= 1){
						return interval + '분 전';
					} else{
						interval = sec;
						return '방금 전';
					}
				}
			}
		}
	}
	
}
