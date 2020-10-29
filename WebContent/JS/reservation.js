/* 예약 페이지에서 사용하는 js*/

/*오늘 날짜*/
var today = new Date();

/*당일 예약은 안되니깐 기본값과 최소 예약 날짜는 오늘 다음 날짜*/
var rdate =today.getFullYear()+"-"+(today.getMonth()+1)+"-"+(today.getDate()+1);

/*예약의 마지막날은 rdate+1 하려 했지만 당일 예약 가능*/
/*var rdate2 =today.getFullYear()+"-"+(today.getMonth()+1)+"-"+(today.getDate()+2);*/

/*예약의 최대값은 올해의 마지막 까지만*/
var maxdate = today.getFullYear()+"-12-31";

/*js에 있는 값들을 html의 form에다가 넣어주는 방법*/
document.rform.startdate.value=rdate;
document.rform.startdate.min=rdate;
document.rform.startdate.max=maxdate;


document.rform.enddate.value=rdate;
document.rform.enddate.min=rdate;
document.rform.enddate.max=maxdate;


function chkDate(){
	frm = document.forms["rform"];

	//timestamp로 바꾸든 날짜로 바꾸든 하는것이 안전할것이다.
	//alert(typeof(frm['startdate'].value)); -> string이다.
	
	

	if(frm['startdate'].value > frm['enddate'].value){
		alert("예약 날짜가 예약 종료 날짜보다 빠를수 없습니다.");
		frm["startdate"].focus();
		return false;
	}else{
		alert("예약 성공");
		return true;	
	}
}

