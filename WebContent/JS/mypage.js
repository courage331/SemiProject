/**
 * 
 */
function chkReserve(url){
	newPage=window.open(url,'info','width=500,height=800,left=650,location=no,status=no,scrollbars=no,resizable=no');
}

var date = new Date();
var rdate =date.getFullYear()+"-"+(date.getMonth()+1)+"-"
if(parseInt(date.getDate())<10){
	rdate+=("0"+(date.getDate()));
}else{
	rdate+=date.getDate();
}


$(function(){
	alert($('.startdate').text());
});