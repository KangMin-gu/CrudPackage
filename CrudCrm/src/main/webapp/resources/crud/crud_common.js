

	$('.custom-file-input').on('change', function() {
		   let fileName = $(this).val().split('\\').pop();
		   $(this).next('.custom-file-label').addClass("selected").html(fileName);
		}); 

    $('.resets').click(function(e){
    	e.preventDefault();
    	$('.reset').val('');
    });
    
    $('.delete').click(function(e){
    	var bool = $('.icheckbox_square-green').hasClass('checked');
    	if(!bool){
    		e.preventDefault();
    		alert("삭제할 항목이 정해지지 않았습니다.");
    		return false;
    	}else{
    		return true;
    	}
    	return true;
    });
    
	//checkbox 전체 선택/해제 이벤트
	$('#icheckAll').on('ifChecked', function(event){
		$('.chksquare').iCheck('check'); 
	});
	$('#icheckAll').on('ifUnchecked', function(event){
		$('.chksquare').iCheck('uncheck'); 
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
    
    // 탭이 존재하면 무조건 가장앞에있는 탭 클릭시킴
    if($('.tabs-container').length > 0){
    	setTimeout(function(){
    		$('a[href="#tab1"]').click();
    	},500);
    }
    
        
	$('.owner').click(function(e){
		//openNewWindow('담당자','/common/user',e.target.id,650,700);
		openNewWindow('담당자','/popowner',e.currentTarget.id,600,600);
	});
	//거래처팝업
	$('.cli').click(function(e){
		openNewWindow('거래처','/popclient',e.currentTarget.id,650,700);
	});
	// 고객 팝업
	$('.cust').click(function(e){
		openNewWindow('고객','/popcust',e.currentTarget.id,650,700);
	});
/******************************************************************/	
	/*fileupload 필수값 싱글 sFile / 멀티 mFile
	 * 부모창에 fileSearchKey  hidden으로 input 생성
	 * <div class="input-group poplogo">//핵심
       <input class="form-control" type="text" id="filename" name="filename" disabled />
       <button type="button" id="searchKey" class="btn btn-light btn-xs">로고 등록</button>
       <input type="hidden" id="fileSearchKey" name="fileSearchKey" />
       </div> 
	 * 
	 * 자식창에 싱글업로드일경우 sFile 멀티업로드일경우 mFile 추후 등록후 라벨에 씌여지는 파일이름을 부모창에 전달
	 * <input id="sFile" name="sFile" type="file" class="custom-file-input">
	   <label id="sFileName" for="sFile" class="custom-file-label">파일 선택...</label>
	   <input type="hidden" name="fileSearchKey" id="fileSearchKey" />	   	   	 //필수
	   멀티파일
	*  <input id=mFile" name="mFile" type="file" class="custom-file-input">
	   <label id="mFileName" for="mFile" class="custom-file-label">파일 선택...</label>
	   <input type="hidden" name="fileSearchKey" id="fileSearchKey" />	   	   	 //필수
	*/
	//오류시 리로드 파일서치키 바인딩
	/*
	$(document).ready(function(){
		var fsk = $.getURLParam("fsk");
		if(fileSearchKey != null && fileSearchKey != undefined){
			$('#fileSearchKey').val(fsk);	
		}
	});
	*/
	//로고등록 팝업띄우면서 filesearchkey 부모와 자식창에 입력
	$('.poplogo').click(function(e){
		var fileSearchKey = $.makeFileSearchKey();
		$('#fileSearchKey').val(fileSearchKey);
		openFileWindow('로고','/poplogo',fileSearchKey,400,180);
	});
	//싱글파일창
	$('.singleFile').click(function(e){
		var fileSearchKey = $.makeFileSearchKey();
		$('#fileSearchKey').val(fileSearchKey);
		openFileWindow('파일업로드','/singlefile',fileSearchKey,400,180);
	});
	//멀티파일창
	$('.multiFile').click(function(e){
		var fileSearchKey = $.makeFileSearchKey();
		$('#fileSearchKey').val(fileSearchKey);
		openFileWindow('파일업로드','/multifile',fileSearchKey,400,180);
	});
	//싱글파일이름 부모값에 바인딩
	$('#sFile').change(function(){
		var sFileName = $("form [for=sFile]").text();
		window.opener.$("#filename").val(sFileName);
	});
	//멀티파일이름 부모값에 바인딩
	$('#mFile').change(function(){
		var sFileName = $("form [for=mFile]").text();
		window.opener.$("#filename").val(sFileName);
	});	
/******************************************************************/		
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
	
	//파일서치키 팝업으로전달
	function openFileWindow(name,url,fileSearchKey,x,y){
		// specs -> 팝업창의 설정들을 정의해 둔 부분
		var specs= "menubar=no,status=no,toolbar=no,Width="+x+",Height="+y;
		// window.open 함수를 통해서 팝업창 호출
		newWindow = window.open(url, name, specs);
		// window Popup이 되고 난후에 바로 실행시키면 inpu창이 만들어지지 않아서 1초의 시간을 지연시킴
		setTimeout(function(){
			newWindow.document.getElementById("fileSearchKey").value = fileSearchKey;
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
		opener.$('[name="'+parentid+'"]').next().val(tr.getAttribute("value"));
		// tr.children.userName.textContent -> tr하위에있는 td 값중 userName의 text값을 가지고옴 => 여기서는 영업담당자의 이름을 의미
		// 버튼을 눌렀을때의 id 값을 실제로 넣음. 
		opener.$('[name="'+parentid+'"]').val(tr.children.username.textContent).trigger('keyup');
		opener.$('#'+parentid).trigger('keyup');
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
		var id = tr.getAttribute("value");
		opener.$('[name="'+parentid+'"]').next().val(id);		
		opener.$('[name="'+parentid+'"]').val(tr.children.cliname.textContent).trigger('keyup');		
		
		popClientClick(id);

		setTimeout(function(){
			window.close();
		},300);
	}
	
	function parentCustname(tr){	
		var parentid = $('#parentid').val();	
		var id = tr.getAttribute("value");
		opener.$('[name="'+parentid+'"]').next().val(id);		
		opener.$('[name="'+parentid+'"]').val(tr.children.cstname.textContent);
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
    
 // step 강제 클릭 함수
    function stepClick(hash){	
    	$(hash).click();
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
		var msg = "정상적인 날짜 범위가 아닙니다. 다시 선택해 주세요";
		if(date1val !='' && date2val !=''){
			if(date1val > date2val){
				$('#showMsg').empty();
				$('#showMsg').append(msg);
				$('#msgDiv').show();//숨김 처리 되었던 에러 div 활성화
				alert(msg);
				$('.date01 input').val('');
				$('.date01 input').focus();
			}else{
				$('#showMsg').empty();
				$('#msgDiv').hide();
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
	function popClientClick(id){
		$.ajax({
	        url: "/popclient/"+id,
	        method: "GET",
	        dataType: "json",
	        success: function (data) {
	        	var TEL = data.MOBILE1 +'-'+ data.MOBILE2 +'-'+data.MOBILE3
	        	opener.$('#bsno').val('');
	        	opener.$('#incno').val('');
	        	opener.$('#prsdname').val('');
	        	opener.$('#clitelno').val('');
	        	opener.$('#homepage').val('');
	        	
	        	opener.$('#bsno').val(data.BSNO);
	        	opener.$('#incno').val(data.CORP_SN);
	        	opener.$('#prsdname').val(data.PRSDNAME);
	        	opener.$('#clitelno').val(TEL);
	        	opener.$('#homepage').val(data.HOMEPAGE);
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
	}
/********************************************************************/	
	//파일서치키 생성
	jQuery.extend({
		makeFileSearchKey: function(){
			var Now = new Date();
			var yyyy = Now.getFullYear().toString(); 
			var MM = (Now.getMonth()+1).toString(); 
			var dd = Now.getDate().toString(); 
			var HH = Now.getHours().toString(); 
			var mm = Now.getMinutes().toString(); 
			var ss = Now.getSeconds().toString(); 
			var SSS = Now.getMilliseconds().toString();
			
			var fileSearchKey = yyyy+MM+dd+HH+mm+ss+SSS;
			
			return fileSearchKey;
		}
	});
	//jquery url 파리미터 추출
	/*
	* Returns get parameters.
	* @example value = $.getURLParam("paramName");
	*/ 
	jQuery.extend({
	getURLParam: function(strParamName){
		var strReturn = "";
		var strHref = window.location.href;
		var bFound=false;

		var cmpstring = strParamName + "=";
		var cmplen = cmpstring.length;

		if ( strHref.indexOf("?") > -1 ){
			var strQueryString = strHref.substr(strHref.indexOf("?")+1);
			var aQueryString = strQueryString.split("&");
				for ( var iParam = 0; iParam < aQueryString.length; iParam++ ){
					if (aQueryString[iParam].substr(0,cmplen)==cmpstring){
						var aParam = aQueryString[iParam].split("=");
						strReturn = aParam[1];
						bFound=true;
						break;
					}

				}
			}
		
		if (bFound==false) return null;
		return strReturn;
		}
	});
/********************************************************************/
