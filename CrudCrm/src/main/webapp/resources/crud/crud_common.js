
	function openNewWindow(url){
		var name= "영업담당자";
		// specs -> 팝업창의 설정들을 정의해 둔 부분
		var specs= "menubar=no,status=no,toolbar=no,innerWidth=1200,innerHeight=1000";
		// window.open 함수를 통해서 팝업창 호출
		newWindow = window.open(url, name, specs);
	}
	// 영업 담당자 및 담당자 가지고옴
	//tr -> 실제로 클릭한 tr 자체
	function parentUser(tr){
		// opener -> 부모의 window를 의미함.
		// tr.getAttribute("value") -> tr 값에 value를 넣어두었는데 해당 value 값을 가지고옴 => 여기서는 영업담당자의 키값(USERNO)
		opener.$("#owner").val(tr.getAttribute("value"));
		// tr.children.userName.textContent -> tr하위에있는 td 값중 userName의 text값을 가지고옴 => 여기서는 영업담당자의 이름을 의미
		opener.$("#owner_").val(tr.children.userName.textContent);
		// window 창을 종료 -> 담당자 팝업을 종료함.
		window.close();
		
	}