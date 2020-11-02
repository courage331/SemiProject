/* 예약 페이지에서 사용하는 js*/
/*오늘 날짜*/

var date = new Date();
date.setDate(date.getDate() + 1);

/*당일 예약은 안되니깐 기본값과 최소 예약 날짜는 오늘 다음 날짜*/
var rdate =date.getFullYear()+"-"+(date.getMonth()+1)+"-"
if(parseInt(date.getDate())<10){
	rdate+=("0"+(date.getDate()));
}else{
	rdate+=date.getDate();
}


/*예약의 최대값은 올해의 마지막 까지만*/
var maxdate = date.getFullYear()+"-12-31";

/*js에 있는 값들을 html의 form에다가 넣어주는 방법*/
document.rform.res_startdate.value=rdate;
document.rform.res_startdate.min=rdate;
document.rform.res_startdate.max=maxdate;


document.rform.res_lastdate.value=rdate;
document.rform.res_lastdate.min=rdate;
document.rform.res_lastdate.max=maxdate;




function chkDate(){
	frm = document.forms["rform"];

	if(frm['res_startdate'].value > frm['res_lastdate'].value){
		alert("예약 날짜가 예약 종료 날짜보다 빠를수 없습니다.");
		frm["res_startdate"].focus();
		return false;
	}else{
		alert("예약 성공");
		return true;	
	}
}

