

	$('.custom-file-input').on('change', function() {
		   let fileName = $(this).val().split('\\').pop();
		   $(this).next('.custom-file-label').addClass("selected").html(fileName);
		}); 

    $('.resets').click(function(e){
    	e.preventDefault();
    	$('.reset').val('');
    });


    

    $('thead .i-checks').on('ifChecked',function(event){
    	$('tbody .i-checks').parent().addClass('checked');
    });
    //i-check 해제 이벤트
    $('thead .i-checks').on('ifUnchecked',function(event){
    	$('tbody .i-checks').parent().removeClass('checked');
    });
    
  	//주소 받아오기
    $('.daumzip').click(function(e){ //이벤트를 걸 인풋,버튼에 daumzip 클래스 추가 
			 
		     new daum.Postcode({
		         oncomplete: function(data) {
		      		
		        	var clickId = e.currentTarget.id;//클릭한 id값 을 받아온다
		        	var head = clickId.substr(0,clickId.indexOf('addr'));//id의 헤더만 잘라낸다. ex)homaddr1-> hom
	        	//addr1 : 우편번호 , addr2 : 도로명 , addr3 : 건물명 +사용자입력  
		        	$("#"+head+"addr1").val(data.zonecode);	
	        	$("#"+head+"addr2").val(data.roadAddress);
	        	$("#"+head+"addr3").val(data.buildingName);
          
		         }
		     }).open();
		 });
    
        
	$('.owner').click(function(e){
		//openNewWindow('담당자','/common/user',e.target.id,650,700);
		openNewWindow('담당자','/popowner',e.target.id,650,700);
	});
	
	//거래처팝업
	$('.cli').click(function(e){
		openNewWindow('거래처','/popclient',e.target.id,650,700);
	});
	// 고객 팝업
	$('.cust').click(function(e){
		openNewWindow('고객','/popcust',e.target.id,650,700);
	});

	//********필수 값 실시간 체크*********************************        	      
	$('.required').keyup(function(e){
		var res = checkVal(e.target.id);
		enableSubmit();
	});

	$('.required').change(function(e){
		var res = checkVal(e.target.id);
		enableSubmit();
	});
	
	//유효성검사
	$('.submit').click(function(){
		debugger;
		var validate = $('.validate'); //validate 선언한 클래스 배열
		var length = validate.length; //배열 사이즈 
		var id; //배열의 id값
		var value; // 배열의 value 값 
		
		for(var i=0; i<length ; i++){//validate 클래스의 배열만큼 반복문
			id = $('.validate:eq('+i+')' ).attr('id'); 
			value = $('#'+id).val(); 
			
			if( $('#'+id).hasClass('required') ){//필수값이면 무조건 유효성검사 
				if(!checkVal(id)){// 유효성 통과 실패시 아래 행 실행
					$('#msgDiv').show();//숨김 처리 되었던 에러 div 활성화
        			$('#'+id).focus();//에러난 위치로 마우스 포인터 이동
        			return false;//메서드 종료
				}
			}else{//필수값이 아니라면 
				if( value ==''){//값이 없을때 유효성 검사 하지 않음. 
					$('#'+id).removeClass('error');//에러 태두리 삭제      				
				}else{//값이 있다면 유효성체크 
					if(!checkVal(id)){
						$('#msgDiv').show();//숨김 처리 되었던 에러 div 활성화
						$('#'+id).focus();//에러난 위치로 마우스 포인터 이동
						return false;//메서드 종료
					}
				}
			}

		}
		     		
		$('#msgDiv').hide();//div창숨기기
		$('#showMsg').empty();//메시지 삭제
	
		$('#command').submit();//전송
		
	});
	
	
	
	var newWindow = null;
    // 부모 window 가 실행

	
	function openNewWindow(name,url,target,x,y){
		// specs -> 팝업창의 설정들을 정의해 둔 부분
		var specs= "menubar=no,status=no,toolbar=no,Width="+x+",Height="+y;
		// window.open 함수를 통해서 팝업창 호출
		newWindow = window.open(url, name, specs);
		// window Popup이 되고 난후에 바로 실행시키면 inpu창이 만들어지지 않아서 1초의 시간을 지연시킴
		setTimeout(function(){
			newWindow.document.getElementById("parentid").value = target;
		},1000);
	}
	
	
	
	// 자식 window가 실행
	// 영업 담당자 및 담당자 가지고옴
	//tr -> 실제로 클릭한 tr 자체
	function parentOwnerUser(tr){
		// 접수자, 담당자가 겹치는 경우에 발생할 것 같아서 한번에 처리 할수 있게 수정작업함..
		// parentid => 버튼을 눌렀을때의 id 값
		var parentid = $('#parentid').val();
		// opener -> 부모의 window를 의미함.
		// tr.getAttribute("value") -> tr 값에 value를 넣어두었는데 해당 value 값을 가지고옴 => 여기서는 영업담당자의 키값(USERNO)
		// 버튼을 눌렀을때의 id 값의 next값 즉 Owner_ 옆의 Owner 값(DB에 들어갈값)
		opener.$("#"+parentid).next().val(tr.getAttribute("value"));
		// tr.children.userName.textContent -> tr하위에있는 td 값중 userName의 text값을 가지고옴 => 여기서는 영업담당자의 이름을 의미
		// 버튼을 눌렀을때의 id 값을 실제로 넣음. 
		opener.$("#"+parentid).val(tr.children.username.textContent);
		// window 창을 종료 -> 담당자 팝업을 종료함.
		window.close();
	}
	function parentCode(tr){
		// 접수자, 담당자가 겹치는 경우에 발생할 것 같아서 한번에 처리 할수 있게 수정작업함..
		// parentid => 버튼을 눌렀을때의 id 값
		var parentid = $('#parentid').val();
		// opener -> 부모의 window를 의미함.
		// tr.getAttribute("value") -> tr 값에 value를 넣어두었는데 해당 value 값을 가지고옴 => 여기서는 영업담당자의 키값(USERNO)
		// 버튼을 눌렀을때의 id 값의 next값 즉 Owner_ 옆의 Owner 값(DB에 들어갈값)
		opener.$("#"+parentid).next().val(tr.getAttribute("value"));
		// tr.children.userName.textContent -> tr하위에있는 td 값중 userName의 text값을 가지고옴 => 여기서는 영업담당자의 이름을 의미
		// 버튼을 눌렀을때의 id 값을 실제로 넣음. 
		opener.$("#"+parentid).val(tr.children.username.textContent);
		// window 창을 종료 -> 담당자 팝업을 종료함.
		window.close();
	}
	
	//팝업 거래처 이름 선택.
	function parentCliname(tr){	
		var parentid = $('#parentid').val();	
		opener.$("#"+parentid).next().val(tr.getAttribute("value"));		
		opener.$("#"+parentid).val(tr.children.cliname.textContent);		
		window.close();
	}
	
	function parentCustname(tr){	
		var parentid = $('#parentid').val();	
		var id = tr.getAttribute("value");
		opener.$("#"+parentid).next().val(id);		
		opener.$("#"+parentid).val(tr.children.cstname.textContent);
		popCustClick(id);
		
		setTimeout(function(){
			window.close();
		},300);
	}
    
    function paging(prm){
    	//파라미터로 클릭한 페이지 번호를 받아온다
        var htmlStr = '<input type="hidden" id="pageNum" name="pageNum" value="'+prm+'">';
        // 첫번쨰 form:form 가져옴.
        var form = $('form:eq(0)');

        //form 안에 생성해둔 <span id ='selectpage'> 에 위의 값을 히든으로 넘긴다.

        form.children().append(htmlStr);
        // 폼 submit
        form.submit();
     }

    function today(){
    	var today = new Date();
    	var dd = today.getDate();
    	var mm = today.getMonth()+1; //January is 0!
    	var yyyy = today.getFullYear();
    	if(dd<10) {
    	    dd='0'+dd
    	} 
    	if(mm<10) {
    	    mm='0'+mm
    	} 
    	today = yyyy+'-' + mm+'-'+dd;
    	
    	return today;
    }
    
    //id값이 들어오면 유효성 검사 후 true false를 반환하고 false면 인풋창에 빨간 테두리 생성
	function checkVal(id){  
		//유효성 검사
		var namePattern = /^[가-힣a-zA-Z]{2,30}[\d]{0,5}$/; //한글 영문 2~30글자 + 숫자0~5자리까지허용
		var simplePattern = /^[s가-힣a-zA-Z]{0,30}$/; //공백허용 한글 영문 0~30글자
		var stringPattern = /^[s가-힣a-zA-Z0-9!@#$%*\&()-_=+,.?]{1,300}$/; //공백 미허용 문자열
		var addrPattern = /^[가-힣a-zA-Z0-9!@#$%*\&()-_=+,.?\s]{0,30}$/; //한글 영문 숫자 기호 0~30자리
		var numberPattern = /^[1-9]{1,2}$/; // 0을 제외한 1~2자리숫자
		var checkPattern = /^[0-9]{1}$/; // 0을 포함한 1자리 숫자
		var phone1Pattern = /^[\d]{2,3}$/; //2~3자리 숫자
		var phone2Pattern = /^[\d]{3,4}$/; //3~4자리숫자 일반 전화번호
		var phone3Pattern = /^[\d]{4}$/; //4자리숫자 일반 전화번호
		var domainPattern =/^[^((http(s?))\:\/\/)]([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/ //http 포함하면 안됨 
		var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //email 정규표현식
		
		var res;//true or false
		var value = $('#'+id).val();
		var msg;
		if( $('#'+id).hasClass('name') ){ //id에 name 이라는 클래스가 있으면 
			res = namePattern.test(value);// namePattern 매칭. 유효성검사 실행 
			msg = '한글,영어 2 글자 이상을 입력해 주세요.( + 숫자 0~5 자리 )';//이 문구 출력
		
		}else if( $('#'+id).hasClass('phone1') ){
			res = phone1Pattern.test(value);
			msg = '숫자 2~3 자리를 입력해 주세요.';//이 문구 출력	
			
		}else if( $('#'+id).hasClass('phone2') ){
			res = phone2Pattern.test(value);
			msg = '숫자 3~4 자리를 입력해 주세요.';//이 문구 출력
			
		}else if( $('#'+id).hasClass('phone3') ){
			res = phone3Pattern.test(value);
			msg = '숫자 4 자리를 입력해 주세요.';//이 문구 출력	
			
		}else if( $('#'+id).hasClass('addr') ){
			res = addrPattern.test(value);
			msg = '한글,영어,숫자, 기호로 입력해 주세요.(특수문자x)';//이 문구 출력
			
		}else if( $('#'+id).hasClass('url') ){
			res = domainPattern.test(value);
			msg = 'http(s):// 를 제외한 url 형식으로 입력해 주세요 ex) www.crudsystem.co.kr ';//이 문구 출력
			
		}else if( $('#'+id).hasClass('email') ){
			res = emailPattern.test(value);
			msg = 'email 형식에 맞게 입력해 주세요 ex) sdw@crudsystem.co.kr ';//이 문구 출력
			
		}else if( $('#'+id).hasClass('simple') ){
			res = simplePattern.test(value);
			msg = '한글,영어,숫자로 입력해 주세요.';//이 문구 출력	
		}else if( $('#'+id).hasClass('number') ){
			res = numberPattern.test(value);
			msg = '숫자로 입력해 주세요.';//이 문구 출력	
		}else if( $('#'+id).hasClass('string') ){
			res = stringPattern.test(value);
			msg = '잘못된 문자열이 입력되었습니다. 학인해주세요';//이 문구 출력	
		}else if( $('#'+id).hasClass('check') ){
			res = checkPattern.test(value);
			msg = '사용여부 확인 부탁드립니다.';//이 문구 출력	
		}
		
		msg = $('#'+id).parent().prev().text()+ " : " + msg;//에러 메시지에 필드명 추가
		
		if(res){
			$('#'+id).removeClass('error');//빨간 테두리 삭제
		}else{
			$('#showMsg').empty();
			$('#showMsg').append(msg);
			$('#'+id).addClass('error');//빨간 테두리 생성 
			
			if( $('#'+id).hasClass('required') ){ //required 클래스가 있다면 (필수 값이라면) 유효성 실패시
				$('.submit').prop("disabled",true);//submit 버튼 비활성화 	
			}
		}
		return res;
	}
	
	

	function enableSubmit(){//필수값이 모두 정상이라면 submit버튼을 활성화 시킨다.
		
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
		}
	}
	

	// datepicker 앞의 값이 변했을때
	$('.date01').change(function(e){
		check_date();
	});
	// datepicker 뒤의 값이 변했을때
	$('.date02').change(function(e){
		check_date();
	});
	// datepicker 앞, 뒤의 값을 확인해서 앞의 값이 뒤의 값보다 크면 alert 처리하고 초기화
	function check_date(){
		
		var date1val = $('.date01 input').val();
		var date2val = $('.date02 input').val();
		var msg = "정상적인 날자 범위가 아닙니다. 다시 선택해 주세요";
		if(date1val !='' && date2val !=''){
			if(date1val > date2val){
				$('#showMsg').empty();
				$('#showMsg').append(msg);
				$('#msgDiv').show();//숨김 처리 되었던 에러 div 활성화
				alert(msg);
				$('.date01 input').val('');
				$('.date01 input').focus();
			}
		}
	}
	function popCustClick(id){
		$.ajax({
	        url: "/popcust/"+id,
	        method: "GET",
	        dataType: "json",
	        success: function (data) {
	        	var addr = data.HOMADDR1 + data.HOMADDR2 + data.HOMADDR3;
	        	opener.$('#company').val('');
	        	opener.$('#duty').val('');
	        	opener.$('#custaddress').val('');
	        	opener.$('#mobile').val('');
	        	opener.$('#email').val('');
	        	
	        	opener.$('#company').val(data.COMPANY);
	        	opener.$('#duty').val(data.DUTY);
	        	opener.$('#custaddress').val(addr);
	        	opener.$('#mobile').val(data.MOBILE);
	        	opener.$('#email').val(data.EMAIL);
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });

		
	}