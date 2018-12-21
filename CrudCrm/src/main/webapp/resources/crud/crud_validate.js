/***********************************************************************************************************************************  
 * 유효성체크
 * 작업일시:2018-11-28
 * 작업자:신동우
 * 
 * TODO. 
 * -유효성 검증식 보강.
 * -기능별 메서드 분화.
 * -전화번호 연결 이벤트 처리 보강. 
 * -팝업 필수값에 대한 제어
***********************************************************************************************************************************/

	//id값이 들어오면 유효성 검사 후 true false를 반환하고 false면 인풋창에 빨간 테두리 생성
	function checkVal(id){  
		//유효성 검사
		var namePattern = /^[가-힣a-zA-Z]{2,30}[\d]{0,5}$/; //한글 영문 2~30글자 + 숫자0~5자리까지허용
		var stringPattern = /^[s가-힣a-zA-Z0-9!@#$%*\&()-_=+,.?]{1,300}$/; //공백 미허용 문자열
		var simplePattern = /^[가-힣a-zA-Z0-9!@#$%*\&()~{}'"\[\]-_=+,.?\s]{1,30}$/; //한글 영문 숫자 기호 1~30자리
		var numberPattern = /^[1-9]{1,2}$/; // 0을 제외한 1~2자리숫자
		var longnumberPattern = /^[0-9]{1,10}$/; // 0을 포함한 10자리숫자
		var checkPattern = /^[0-9]{1,2}$/; // 0을 포함한 1자리 숫자
		var phone1Pattern = /^[\d]{2,3}$/; //2~3자리 숫자
		var phone2Pattern = /^[\d]{3,4}$/; //3~4자리숫자 일반 전화번호
		var phone3Pattern = /^[\d]{4}$/; //4자리숫자 일반 전화번호
		var domainPattern =/^[^((http(s?))\:\/\/)]([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/ //http 포함하면 안됨 
		var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //email 정규표현식
		var corpnoPattern = /^[\d]{12}$/; //법인번호 숫자 12자리 차후 검증식 필요
		var bsnoPattern = /^[\d]{10}$/; //사업자번호 숫자 10자리 
		var costPattern = /^[\d]{1,15}$/;//최대 15자리 숫자
		var percentPattern = /^[0-9]{1}$|^[1-9]{1}[0-9]{1}$|^100$/; //0~100까지의 정수
		var addrPattern = /^[가-힣a-zA-Z0-9!@#$%*\&()~{}'"\[\]-_=+,.?\s]{1,30}$/;
		//내정보 비밀번호 
		var passwordPattern = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;	//숫자,특수문자 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상입력
	
			
		
		var res;//true or false
		var value = $('[name="'+id+'"]').val();
		var length = $('[name="'+id+'"]').length;
		var check;
		// license 부분에서 검색 조건과 데이터 저장하는 body 부분과 name 값이 동일해서 해당 부분 확인해서 check 하는 걸로 변경..
		for(i = 0 ; i < length ; i++){
			check = $('[name="'+id+'"]:eq('+i+')').hasClass("validate");
			if(check){
				value = $('[name="'+id+'"]:eq('+i+')').val();
			}
		}
		var msg;
		if( $('[name="'+id+'"]').hasClass('name') ){ //id에 name 이라는 클래스가 있으면 
			res = namePattern.test(value);// namePattern 매칭. 유효성검사 실행 
			msg = '<한글,영어 2 글자 이상을 입력해 주세요.( + 숫자 0~5 자리 )';//이 문구 출력
		
		}else if( $('[name="'+id+'"]').hasClass('phone1') ){
			res = phone1Pattern.test(value);
			msg = '숫자 2~3 자리를 입력해 주세요.';//이 문구 출력	
			
		}else if( $('[name="'+id+'"]').hasClass('phone2') ){
			res = phone2Pattern.test(value);
			msg = '숫자 3~4 자리를 입력해 주세요.';//이 문구 출력
			
		}else if( $('[name="'+id+'"]').hasClass('phone3') ){
			res = phone3Pattern.test(value);
			msg = '숫자 4 자리를 입력해 주세요.';//이 문구 출력	
			
		}else if( $('[name="'+id+'"]').hasClass('addr') ){
			res = addrPattern.test(value);
			msg = '한글,영어,숫자,기호로 입력해 주세요.(특수문자x)';//이 문구 출력
			
		}else if( $('[name="'+id+'"]').hasClass('url') ){
			res = domainPattern.test(value);
			msg = 'http(s):// 를 제외한 url 형식으로 입력해 주세요 ex) www.crudsystem.co.kr ';//이 문구 출력
			
		}else if( $('[name="'+id+'"]').hasClass('email') ){
			res = emailPattern.test(value);
			msg = 'email 형식에 맞게 입력해 주세요 ex) sdw@crudsystem.co.kr ';//이 문구 출력
			
		}else if( $('[name="'+id+'"]').hasClass('simple') ){
			res = simplePattern.test(value);
			msg = '한글,영어,숫자로 입력해 주세요.';//이 문구 출력	
		
		}else if( $('[name="'+id+'"]').hasClass('number') ){
			res = numberPattern.test(value);
			if(id=='idcheck'){
				msg = '중복된 ID 이거나 입력이 되지 않았습니다.';
			}else{
				msg = '숫자로 입력해 주세요.';//이 문구 출력	
			}
		}else if( $('[name="'+id+'"]').hasClass('longnumber') ){
			res = longnumberPattern.test(value);
			msg = '숫자로 입력해 주세요.';//이 문구 출력	
		
		}else if( $('[name="'+id+'"]').hasClass('string') ){
			res = stringPattern.test(value);
			msg = '잘못된 문자열이 입력되었습니다. 학인해주세요';//이 문구 출력	
		
		}else if( $('[name="'+id+'"]').hasClass('check') ){
			res = checkPattern.test(value);
			msg = '사용여부 확인 부탁드립니다.';//이 문구 출력	
		
		}else if( $('[name="'+id+'"]').hasClass('cost') ){
			res = costPattern.test(value);
			msg = '1~15자리의 숫자를 입력해주세요.';//이 문구 출력	
		
		}else if( $('[name="'+id+'"]').hasClass('percent') ){
			res = percentPattern.test(value);
			msg = '0~100까지의 정수를 입력해주세요';//이 문구 출력	
		
		}else if( $('[name="'+id+'"]').hasClass('corp') ){//법인번호는 999999-999999 형식  - 제거 후 유효성검사					
			if(value.length==13){ 
				var temp = value.replace('-','');
				value = temp;
			}		
			res = corpnoPattern.test(value);
			msg = '법인번호 12자리를 확인 해주세요';//이 문구 출력	
		}else if( $('[name="'+id+'"]').hasClass('bs') ){//사업자번호는 999-99-99999  형식  - 제거 후 유효성검사		
			if(value.length==12){ // - 제거
				var temp = value.replace(/\-/g,'');
				value = temp;
			
			}		
			res = bsnoPattern.test(value);
			msg = '사업자번호 10자리를 확인 해주세요';//이 문구 출력	
			
			
		}else if( $('[name="'+id+'"]').hasClass('userpassword')){		//내정보 비밀번호 		
	
			res = passwordPattern.test(value);
			if(value.length < 20){
			msg = '영문,숫자,특수문자를 포함하여 8자리이상 입력해주세요';//이 문구 출력
			}else if(value.length >= 20){
			msg = '20자리 이하로 입력해주세요.';	
			}
		}
		
		
		msg = $('[name="'+id+'"]').parent().prev().text()+ " : " + msg;//에러 메시지에 필드명 추가
		reqMsg = "<strong class='text-danger'> "+ msg.replace('*','') +"</strong>";//필수값 메시지 
		
		if(res){//유효성 통과시
			$('[name="'+id+'"]').removeClass('error');//빨간 테두리 삭제
			
		}else{//유효성 실패시
			$('[name="'+id+'"]').addClass('error');//빨간 테두리 생성
			$('#msgDiv').addClass(id);//에러 메시지에 현재 id 값을 기록한다.  
			if( $('[name="'+id+'"]').hasClass('required') ){ //필수 값이라면 유효성실패시 submit 버튼 비활성화
				
				$('#reqDefaultMsg').empty();
				$('#reqDefaultMsg').append(reqMsg);				
				
				$('.submit').prop("disabled",true);
			}else{			
				$('#showMsg').empty();
				$('#showMsg').append(msg);
				
			}				
			
		}
		return res;
	}
	
	//필수 값 실시간체크
	function changeDetection(id){
		var res;
		if( $('[name="'+id+'"]').hasClass('required') == true ){//필수값이면 무조건 유효성검사 + 서브밋 활성화 메서드실행
			checkVal(id);
			enableSubmit();
		
		}else{//필수값이 아니라면 공백값을 유효성 통과로 간주
			if ( $('[name="'+id+'"]').val() == '' ){
				res = true;
			
			}else{
				res = checkVal(id);//값이 있다면 유효성체크
			}			
			
			if(res == true){
				if( $('#msgDiv').hasClass(id) == true ){//에러메시지 삭제 (페이지에 활성화 되어있는 에러메시지 원인이 this.value 때문이 라면)  
					$('#msgDiv').removeClass(id);
					$('#msgDiv').hide();
				}
			}
		}		
	}

	function enableSubmit(){//필수값이 모두 정상이라면 submit버튼을 활성화 + alert 창 메시지 변경 
		
		var reqArray = $('.required'); //필수값 배열
		var length = reqArray.length; // 배열의 크기
		var reqId;
		var res=0;
		for(var i=0;i<length;i++){// 배열만큼 반복문
			reqId = $('.required:eq('+i+')' ).attr('id');//배열의 id값
			res += checkVal(reqId);//유효성검사 통과(true)  = 1 ,실패(false)= 0 
		}
		if (res == length){//통과수가 배열길이와 같다면.(즉, 모든 항목이 유효성 검사에 통과했다면)
			$('.submit').prop("disabled",false);//submit 활성화
			$('#reqDefaultMsg').hide();
			$('#reqSuccessMsg').show();
			$('#reqMsgDiv').removeClass("alert-info");
			$('#reqMsgDiv').addClass("alert-success");
			
			if ( $("#msgDiv").is(":visible") == true ) { // 필수값은 유효성 검사를 통과했지만  다른값들은 통과 하지 않은 상태라면 
				$('#reqMsgDiv').hide(); // 필수 값 입력성공 알림창 비활성화 
			}

		}else{
			$('#reqMsgDiv').show();//필수값 성공 div 활성화
			$('#reqSuccessMsg').hide();
			$('#reqDefaultMsg').show();
			$('#reqMsgDiv').removeClass("alert-success");
			$('#reqMsgDiv').addClass("alert-info");
		}
	}
	

//********필수 값 실시간 체크*********************************        	      	
	$('.validate').keyup(function(e){
		var id = e.target.name;
		changeDetection(id);
	});
	
	$('.validate').change(function(e){
		var id = e.target.name;
		changeDetection(id);
	});
//*********************************************************	


	//유효성검사
	$('.submit').click(function(){
		
		var validate = $('.validate'); //validate 선언한 클래스 배열
		var length = validate.length; //배열 사이즈 
		var id; //배열의 id값
		var value; // 배열의 value 값 
		
		for(var i=0; i<length ; i++){//validate 클래스의 배열만큼 반복문
			id = $('.validate:eq('+i+')' ).attr('id'); 
			value = $('[name="'+id+'"]').val(); 
			
			if( $('[name="'+id+'"]').hasClass('required') ){//필수값이면 무조건 유효성검사 
				if(!checkVal(id)){// 유효성 통과 실패시 아래 행 실행
					//$('#msgDiv').show();//숨김 처리 되었던 에러 div 활성화
        			$('[name="'+id+'"]').focus();//에러난 위치로 마우스 포인터 이동
        			return false;//메서드 종료
				}
			}else if( $('[name="'+id+'"]').hasClass('phone-group') ){//폰그룹-전화번호 유효성 			
				
				if( value == ''){
					$('[name="'+id+'"]').removeClass('error');
				}else{//값이 존재하면 아래 행 실행
					var temp = id.substr(0,id.length-1);// ex) mobile1 -> mobile 
					
					for(var j=1;j<=3;j++){// phone-group 으로 묶인 필드 모두검사
						if(!checkVal(temp+j)){
							$('#reqMsgDiv').hide();//필수값 성공 div 비활성화
							$('#msgDiv').show();//숨김 처리 되었던 에러 div 활성화
							$('#'+temp+j).focus();//에러난 위치로 마우스 포인터 이동
							return false;//메서드 종료
						}
					}
				}	
			}else{//필수값이 아니라면 
				if( value ==''){//값이 없을때 유효성 검사 하지 않음. 
					continue;			
				}else{//값이 있다면 유효성체크 
					if(!checkVal(id)){
						$('#reqMsgDiv').hide();//필수값 성공 div 비활성화
						$('#msgDiv').show();//숨김 처리 되었던 에러 div 활성화
						$('[name="'+id+'"]').focus();//에러난 위치로 마우스 포인터 이동
						return false;//메서드 종료
					}
				}
			}

		}
		     		
		$('#msgDiv').hide();//div창숨기기
		$('#showMsg').empty();//메시지 삭제
	
		
	});


