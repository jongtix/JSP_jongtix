// 초기화
var indicator = document.querySelectorAll('.indicator button');
var lightbox = document.querySelector('#lightbox');
var block = document.querySelector('#block');

// 라이트박스 표시
function lightbox_open(num) {
	lightbox.setAttribute('class', 'active'); // id가 lightbox인 요소에 active 속성 추가
	block.setAttribute('class', 'active');

	change_img(num);
	indicator[num - 1].focus(); // button 배열을 처리 배열은 0부터이므로 받은 num - 1
}

// 이미지 전환 표시
function change_img(val) {
	var imgs = document.querySelectorAll('figure > img');

	for (var i = 0; i < imgs.length; i++) {
		imgs[i].removeAttribute('class');
	}
	imgs[val - 1].setAttribute('class', 'active');
}

// 라이트박스 닫기
function lightbox_close() {
	lightbox.removeAttribute('class');
	block.removeAttribute('class');
}