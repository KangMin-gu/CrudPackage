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
		var allPattern = /^[가-힣a-zA-Z0-9!@#$%*\&()~{}'"\[\]-_=+,.?\s]{1,}$/;    // -> 문자 + 숫자 + 특문 + 띄어쓰기 자릿수 X
		var bsnoPattern = /^[\d]{10}$/;  //사업자번호
		var incnoPattern =  /^[\d]{12}$/;  //법인번호
		var emailPattern  = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; // 이메일
							
		var stringPattern = /^[가-힣a-zA-Z0-9\s]{1,}$/;    //-> 문자 + 숫자 + 띄어쓰기 
		var varcharPattern = /^[가-힣a-zA-Z0-9]{1,}$/; //공백 미허용 문자열-> 문자만
		var phone1Pattern = /^[\d]{2,4}$/; ///2~4자리
		var phone2Pattern = /^[\d]{3,4}$/; ///3~4자리
		var phone3Pattern = /^[\d]{4}$/; ///4자리
		var bsno1Pattern = /^[\d]{3}$/; ///3자리
		var bsno2Pattern = /^[\d]{2}$/; ///2자리
		var bsno3Pattern = /^[\d]{5}$/; ///5자리
		var incno1Pattern = /^[\d]{5}$/; ///5자리
		var incno2Pattern = /^[\d]{5}$/; ///5자리
		var checkPattern = /^[1-9]{1}[0-9]{0,}$/; //CheckBox용 0을 제외한 1자리 숫자
		var numberPattern = /^[0-9]+$/; // 숫자만 자릿수 X
		var datePattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;  //-> YYYY-MM-DD형식
		var idPattern = /^[가-힣a-zA-Z0-9!@#$%*\&()~{}'"\[\]-_=+,.?]{5,}$/; //    -> 영어 + 숫자 + 특문 5글자 이상 띄어쓰기 X
		var homepagePattern = /^[^((http(s?))\:\/\/)]([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/; //-> www.crudsystem.co.kr
		var percentPattern = /^[0-9]{1}$|^[1-9]{1}[0-9]{1}$|^100$/; // -> 0~100 정수. 
		var namePattern = /^[가-힣a-zA-Z]{2,30}[\d]{0,15}$/; //한글 영문 2~30글자 + 숫자0~29
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
		
				
		if( $('[name="'+id+'"]').hasClass('allV') ){ //파라미터로 들어온 해당 name 값에 name 이라는 클래스가 있으면 
			res = allPattern.test(value);// namePattern 매칭. 유효성검사 실행 
			msg = '한글,영어,숫자,기호  입력 가능 합니다.';//이 문구 출력		
			
		}else if( $('[name="'+id+'"]').hasClass('bsnoV') ){		
			if(value.length==12){ // - 제거
				var temp = value.replace(/\-/g,'');
				value = temp;			
			}
			res = bsnoPattern.test(value); 
			msg = '사업자번호 10자리를 입력해 주세요.';	
			
		}else if( $('[name="'+id+'"]').hasClass('incnoV') ){
			if(value.length==13){// - 제거 
				var temp = value.replace('-','');
				value = temp;
			}		
			res = incnoPattern.test(value); 
			msg = '법인번호 12자리를 입력해 주세요.';		
		
		}else if( $('[name="'+id+'"]').hasClass('emailV') ){ 
			res = emailPattern.test(value); 
			msg = 'email형식에 맞게 입력해 주세요.';		
		
		}else if( $('[name="'+id+'"]').hasClass('stringV') ){ 
			res = stringPattern.test(value); 
			msg = '한글,영어,숫자 입력 가능 합니다.';		
		
		}else if( $('[name="'+id+'"]').hasClass('varcharV') ){ 
			res = varcharPattern.test(value); 
			msg = '띄어쓰기 제외. 한글,영어,숫자 입력 가능 합니다.';		
		
		}else if( $('[name="'+id+'"]').hasClass('phone1V') ){ 
			res = phone1Pattern.test(value); 
			msg = '2~4자리의 숫자를 입력해 주세요';		
		
		}else if( $('[name="'+id+'"]').hasClass('phone2V') ){ 
			res = phone2Pattern.test(value); 
			msg = '3~4자리의 숫자를 입력해 주세요';		
		
		}else if( $('[name="'+id+'"]').hasClass('phone3V') ){ 
			res = phone3Pattern.test(value); 
			msg = '4자리의 숫자를 입력해 주세요';		
		
		}else if( $('[name="'+id+'"]').hasClass('bsno1V') ){ 
			res = bsno1Pattern.test(value); 
			msg = '3자리의 숫자를 입력해 주세요';		
		
		}else if( $('[name="'+id+'"]').hasClass('bsno2V') ){ 
			res = bsno2Pattern.test(value); 
			msg = '2자리의 숫자를 입력해 주세요';		
		
		}else if( $('[name="'+id+'"]').hasClass('bsno3V') ){ 
			res = bsno3Pattern.test(value); 
			msg = '5자리의 숫자를 입력해 주세요';		
		
		}else if( $('[name="'+id+'"]').hasClass('incno1V') ){ 
			res = incno1Pattern.test(value); 
			msg = '5자리의 숫자를 입력해 주세요';		
		
		}else if( $('[name="'+id+'"]').hasClass('incno2V') ){ 
			res = incno2Pattern.test(value); 
			msg = '5자리의 숫자를 입력해 주세요';		
		
		}else if( $('[name="'+id+'"]').hasClass('checkV') ){ 
			res = checkPattern.test(value); 
			msg = '체크박스를 선택해 주세요.';		
		
		}else if( $('[name="'+id+'"]').hasClass('numberV') ){ 
			res = numberPattern.test(value); 
			msg = '숫자만 입력 가능합니다.';		
		
		}else if( $('[name="'+id+'"]').hasClass('idV') ){ 
			res = idPattern.test(value); 
			msg = '한글,영어,숫자,기호 5글자 이상의 문자를 입력해 주세요. ';		
		
		}else if( $('[name="'+id+'"]').hasClass('dateV') ){
			res = datePattern.test(value); 
			msg = 'datePattern';		
			if($('[name="'+id+'"]').hasClass('beforeV')){
				var today = new Date();
				var beforeDay = new Date(value);
				res = today >= beforeDay;
				msg = '해당 필드는 현재일 보다 미래로 설정 할 수 없습니다.';
			}
		
		}else if( $('[name="'+id+'"]').hasClass('homepageV') ){ 
			res = homepagePattern.test(value); 
			msg = 'http://, https:// 제외한 주소를 입력해 주세요.';		
		
		}else if( $('[name="'+id+'"]').hasClass('percentV') ){ 
			res = percentPattern.test(value); 
			msg = '0~100까지의 정수를 입력해 주세요.';		
		
		}else if( $('[name="'+id+'"]').hasClass('nameV') ){ 
			res = namePattern.test(value); 
			msg = '띄어쓰기를 제외한 한글,영문,숫자 입력 가능합니다.';		
		
		}else if( $('[name="'+id+'"]').hasClass('passwordV')){		//내정보 비밀번호 			
			res = passwordPattern.test(value);
			if(value.length < 20){
			msg = '영문,숫자,특수문자를 포함하여 8자리이상 입력해주세요';//이 문구 출력
			}else if(value.length >= 20){
			msg = '20자리 이하로 입력해주세요.';	
			}
		}else if( $('[name="'+id+'"]').hasClass('costV') ){ 			
			value = delCommas(value);//콤마 제거한 값으로 유효성검사.			
			res = numberPattern.test(value); 			
			msg = '숫자만 입력 가능합니다.';			
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
			reqId = $('.required:eq('+i+')' ).attr('name');//배열의 name값
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
		debugger;
		var validate = $('.validate'); //validate 선언한 클래스 배열
		var length = validate.length; //배열 사이즈 
		var id; //배열의 id값
		var value; // 배열의 value 값 
		
		for(var i=0; i<length ; i++){//validate 클래스의 배열만큼 반복문
			id = $('.validate:eq('+i+')' ).attr('name'); 
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
			}else if( $('[name="'+id+'"]').hasClass('bsno-group') ){//사업자번호유효성 			
				
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
			}else if( $('[name="'+id+'"]').hasClass('incno-group') ){//법인번호유효성 			
				
				if( value == ''){
					$('[name="'+id+'"]').removeClass('error');
				}else{//값이 존재하면 아래 행 실행
					var temp = id.substr(0,id.length-1);// ex) mobile1 -> mobile 
					
					for(var j=1;j<=2;j++){// phone-group 으로 묶인 필드 모두검사
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
	//******************************금액에  ',' 삽입-제거 ***********************************************************************
	// 사용예시  
	// DB에 매핑할 id,name을 hidden 값 으로 설정.  
	// 화면에 보여질값은 id,name 말미에 '_'추가.   
	// 화면에 보여질 input창에 'costV' 클래스 추가.
	// ex) <input type="hidden" id="ex" name="ex" /> <input type="text" class="costV" id="ex_" name="ex_">
	
	$('.costV').keyup(function(e){
		
		 var thisId = e.target.id;//보여지는 인풋 id
		 var inputId = thisId.substring( 0,thisId.length-1 ); //_를 제거한 id값. 실제 입력 될 hidden id.   
		 var thisVal = e.target.value;//인풋의 value
		 thisVal = delCommas(thisVal);//콤마 제거 후
		 var commaVal = numberWithCommas(thisVal);//다시 콤마 삽입. 
		 
		 $('#'+inputId).val(thisVal);//hidden값에는 콤마 제거한 값 입력. 
		 $('#'+thisId).val(commaVal);//보여지는 input창에는 콤마 표시.		 			 			 
	 });
		
	//,제거
	function delCommas(x){
		//debugger;
		x = x+"";//숫자일 경우 문자타입으로 변경
		x = jQuery.trim(x);//공백제거
		x = x.replace(/[^0-9]+/g, "");  //숫자를 제외한 문자 제거.
		var numPattern = /^[1-9]$/;//하단 for문 사용 될 패턴 비교식.
		var tempX = x;
		var xLen = x.length;
		var maxCost = 10000000000;//최대금액설정
		var maxCostStr = '입력 금액의 최대치는 '+numberWithCommas(maxCost)+' 입니다.';//표시될 경고문구.
				
		if( xLen > 0 ){					
			for(var i=0 ; i < xLen ; i++){//첫번째 자리수가 0 못들어오게 
				if( numPattern.test(tempX.substring(0,1)) == false ){
					tempX = tempX.substring(1);
				}else{
					break;
				}
			}
		}
		x = tempX;
		if(x > maxCost ){//최대금액을 초과하면 마지막 입력 문자를 지우고 경고창  
			x = x.substring(0, maxCost.toString().length-1 );	
		}
		return x;// , 제거		
	}	
	//,삽입
	function numberWithCommas(x) {		
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");//3번째자리에 , 삽입 
	}
	