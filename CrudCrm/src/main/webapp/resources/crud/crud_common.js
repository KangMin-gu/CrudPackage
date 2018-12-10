

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
		openNewWindow('담당자','/popowner',e.target.id,600,600);
	});
	//거래처팝업
	$('.cli').click(function(e){
		openNewWindow('거래처','/popclient',e.target.id,650,700);
	});
	// 고객 팝업
	$('.cust').click(function(e){
		openNewWindow('고객','/popcust',e.target.id,650,700);
	});
	
	
	$('.poplogo').click(function(e){
		openNewWindow('로고','/poplogo',e.target.id,600,700);
	});
	
	
	var newWindow = null;
    // 부모 window 가 실행
	
	
	function openNewWindow(name,url,target,x,y){
		// specs -> 팝업창의 설정들을 정의해 둔 부분
		var specs= "menubar=no,status=no,toolbar=no,Width="+x+",Height="+y;
		// window.open 함수를 통해서 팝업창 호출
		newWindow = window.open(url, name, specs);
		// window Popup이 되고 난후에 바로 실행시키면 inpu창이 만들어지지 않아서 1초의 시간을 지연시킴
		if(target != ""){		
			setTimeout(function(){
				newWindow.document.getElementById("parentid").value = target;
			},1000);
		}
		
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
		opener.$("#"+parentid).val(tr.children.username.textContent).trigger('keyup');
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
		opener.$("#"+parentid).val(tr.children.codename.textContent).trigger('keyup');
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

	
    //로고 insertajax
    $('#logosubmit').click(function(){
    	var form = new FormData(document.getElementById('logoForm'));
    	$.ajax({
            url: '/poplogo',
            data: form,
            dataType: 'json', 
            processData: false, 
            contentType: false, 
            type: 'POST', 
            success: function(response){ 
            	opener.$('#filename').val(response.orgfilename);
            	opener.$('#sitelogo').val(response.img);
            	alert("로그 등록 완료");
            	window.close();
            }
        });
    });

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


