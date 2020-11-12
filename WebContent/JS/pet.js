/**
 * 반려견 정보 추가 페이지
 */

// 펫 이미지
$('.pet_image_list').click(function() {

//	if ($('.pet_image_list').is(":checked")) {
//		var pet = parseInt(this.value) + 4;
//		$('#pet_img' + this.value).attr('src', 'img/K-00' + pet + '.png');
//	} else if ($('.pet_image_list').is(":unchecked")){
//		$('#pet_img' + this.value).attr('src', 'img/K-00' + this.value + '.png');
//	}
	
	if(this.value == 1) {
		$('#pet_img' + 1).attr('src', 'img/K-00' + 5 + '.png');
		$('#pet_img' + 2).attr('src', 'img/K-00' + 2 + '.png');
		$('#pet_img' + 3).attr('src', 'img/K-00' + 3 + '.png');
		$('#pet_img' + 4).attr('src', 'img/K-00' + 4 + '.png');
	}
	if(this.value == 2) {
		$('#pet_img' + 1).attr('src', 'img/K-00' + 1 + '.png');
		$('#pet_img' + 2).attr('src', 'img/K-00' + 6 + '.png');
		$('#pet_img' + 3).attr('src', 'img/K-00' + 3 + '.png');
		$('#pet_img' + 4).attr('src', 'img/K-00' + 4 + '.png');
	}
	if(this.value == 3) {
		$('#pet_img' + 1).attr('src', 'img/K-00' + 1 + '.png');
		$('#pet_img' + 2).attr('src', 'img/K-00' + 2 + '.png');
		$('#pet_img' + 3).attr('src', 'img/K-00' + 7 + '.png');
		$('#pet_img' + 4).attr('src', 'img/K-00' + 4 + '.png');
	}
	if(this.value == 4) {
		$('#pet_img' + 1).attr('src', 'img/K-00' + 1 + '.png');
		$('#pet_img' + 2).attr('src', 'img/K-00' + 2 + '.png');
		$('#pet_img' + 3).attr('src', 'img/K-00' + 3 + '.png');
		$('#pet_img' + 4).attr('src', 'img/K-00' + 8 + '.png');
	}
	
})

$('.btn').click(function() {
	frm = document.forms["frm"];

	var pet_name = frm["pet_name"].value.trim();
	var pet_age = frm["pet_age"].value.trim();
	var pet_weight = frm["pet_weight"].value.trim();
	var pet_image = $('.pet_image_list').is(":checked")
	
	if (pet_name == "") {
		alert("강아지 이름을 입력해주세요");
		frm["pet_name"].focus();
		return false;
	}

	if (pet_age == "") {
		alert("강아지 나이를 입력해주세요");
		frm["pet_age"].focus();
		return false;
	}

	if (pet_weight == "") {
		alert("강아지 무게를 입력해주세요");
		frm["pet_weight"].focus();
		return false;
	}
	
	if (!pet_image) {
		alert("강아지 이미지를 클릭해주세요");
		return false;
	}
	
	return true;
})

function petchk(url) {
	newPage = window
			.open(url, 'petinfo',
					'width=500,height=800,left=650,location=no,status=no,scrollbars=no');
}

function petopen() {
	myWindow = window.open("pet_update.jsp", "팝업창",
			"width = 500, height = 615, left = 650, top = 10")
}

