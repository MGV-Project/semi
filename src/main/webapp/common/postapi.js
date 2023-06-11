/**
 *  우편번호 찾기 api
 */
function daumApi() {	
	new daum.Postcode({
    	oncomplete: function(data) {
			console.log(data); 
			// 전체 주소 변수 설정
			let fullAddr = '';
			// 추가 주소 변수 설정
			let extraAddr = '';
			
			// userSelectedType이 'R'(도로명주소)를 클릭했을 때 도로명 주소를 입력받고
			if (data.userSelectedType === 'R') {
				fullAddr = data.roadAddress;
			} else { // userSelectedType이 'R'이 아닌 경우는 지번 주소를 넣는다.
				fullAddr = data.jibunAddress;
			}
			
			// userSelectedType이 'R'(도로명주소)일 때
			if (data.userSelectedType === 'R') {
				// 법정동이 비어 있지 않는 경우 
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				// 건물명이 비어 있지 않는 경우
				if (data.buildingName !== '') {
					// extraAddr이 비어있지 않으면 ,로 연결해주고 건물명 넣고
					// bname(법정동)이 없으면 건물명을 바로 넣어준다.
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				
				// extraAddr 이 비어있지 않으면 좌우 ()로 싸고 없으면 빈 값을 반환한다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ') ' : '');
			}

			// 입력창에 우편번호 넣기
			document.form.zipcode.value = data.zonecode;
			// 입력창에 전체 주소 넣기
			document.form.address1.value = fullAddr;
			// 우편번호, 전체주소 입력되면 상세주소로 커서 이동
			document.form.address2.focus();
    	}
    }).open();
}
