// 구매 함수
function purchase(gameid, bettype, userid) {
    const odds = 2.0; // 고정 배당값
    // 쿼리 스트링 생성
	if ('${user.user_role}' === 'admin') {
		alert('관리자는 경기 구매 권한 없음.')
	    return false; // 클릭을 막습니다.
	 }
	let para = 'userid='+userid+'&gameid='+gameid+'&bettype='+bettype+'&odds='+odds;
	const url = '/betting/views/sale/saleTable.ys?'+para;
	// 서버로 이동
	location.href = url;
}