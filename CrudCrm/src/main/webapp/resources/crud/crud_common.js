

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
    			debugger;
    			var clickId = e.currentTarget.id;//클릭한 id값 을 받아온다\
    			if(clickId ==''){
    				clickId = $(e.currentTarget).parent().parent().prev().attr('id');
    			}
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
		openNewWindow('담당자','/popowner',e.currentTarget.id,600,500);
	});
	
	$('.adminowner').click(function(e){
		//openNewWindow('담당자','/common/user',e.target.id,650,700);
		openNewWindow('admin담당자','/popowner?chkauth=20',e.currentTarget.id,600,500);
	});
	//거래처팝업
	$('.cli').click(function(e){
		openNewWindow('거래처','/popclient',e.currentTarget.id,650,750);
	});
	// 고객 팝업
	$('.cust').click(function(e){debugger;
		if( e.target.classList.contains('dataCancle') == false ){
			openNewWindow('고객','/popcust',e.currentTarget.id,650,700);
		}
	});	
	//내부통지팝업
	$('.note').click(function(e){
		 openNewWindow('내부통지','/popnote',e.currentTarget.id,1280,850);	
	});
	
	$('.mail').click(function(e){
		 openNewWindow('메일발송','/popmail',e.currentTarget.id,1280,850);	
	});
	
	$('.sms').click(function(e){
		 openNewWindow('문자발송','/popsms',e.currentTarget.id,550,600);	
	});
	
	//영업팝업
	$('.sales').click(function(e){
		openNewWindow('영업','/popsales',e.currentTarget.id,650,750);
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
	// tinymce4 이미지 업로드
	 function minymceUploadFile(inp, editor) {
         var input = inp.get(0);
         var data = new FormData();
         data.append('files', input.files[0]);

         $.ajax({
           url: '${pageContext.request.contextPath}/tinyMCE',
           type: 'POST',
           data: data,
           cache:false,
           enctype: 'multipart/form-data',
           dataType : 'json',
           processData: false, // Don't process the files
           contentType: false, // Set content type to false as jQuery will tell the server its a query string request
           success: function(data, textStatus, jqXHR) {
             editor.insertContent('<img class="content-img" src="${pageContext.request.contextPath}' + data.location + '" data-mce-src="${pageContext.request.contextPath}' + data.location + '" />');
           },
           error: function(jqXHR, textStatus, errorThrown) {
             if(jqXHR.responseText) {
               errors = JSON.parse(jqXHR.responseText).errors
               alert('Error uploading image: ' + errors.join(", ") + '. Make sure the file is an image and has extension jpg/jpeg/png.');
             }
           }
         });
       }
	
	
	var newWindow = null;
    // 부모 window 가 실행
	
	function openNewWindow(name,url,target,x,y){
		// specs -> 팝업창의 설정들을 정의해 둔 부분
		var specs= "scrollbars=yes,menubar=no,status=no,toolbar=no,Width="+x+",Height="+y;
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
		debugger;
		var parentid = $('#parentid').val();	
		var id = tr.getAttribute("value");
		opener.$('[name="'+parentid+'"]').next().val(id);		
		opener.$('[name="'+parentid+'"]').val(tr.children.custname.textContent).trigger('keyup');
		
		if(parentid != "relcustname"){//관련 고객에서의 호출이 아니라면 아래행 실행
			popCustClick(id);
		}
		setTimeout(function(){
			window.close();
		},300);
	}
	
	//팝업 영업 이름 선택.
	function parentSalename(tr){	
		var parentid = $('#parentid').val();
		var id = tr.getAttribute("value");
		opener.$('[name="'+parentid+'"]').next().val(id);		
		opener.$('[name="'+parentid+'"]').val(tr.children.salename.textContent).trigger('keyup');		
		
		popClientClick(id);

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
	
	// clockpicker 앞의 값이 변했을때
	$('.clock01').change(function(e){
		check_time();
	});
	// clockpicker 뒤의 값이 변했을때
	$('.clock02').change(function(e){
		check_time();
	});
	
	function check_time(){
		var time1val = $('.clock01 input').val();
		var time2val = $('.clock02 input').val();
		var msg = "정상적인 날짜 범위가 아닙니다. 다시 선택해 주세요";
		
		if(time1val != '' && time2val !=''){
			if(time1val > time2val){
				alert(msg);
				$('.clock01 input').val('');
				$('.clock01 input').focus();
			}
		}
	}
	
	
	
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
	};
	
	function getTextLength(str) {
        var len = 0;
        for (var i = 0; i < str.length; i++) {
            if (escape(str.charAt(i)).length == 6) {
                len++;
            }
            len++;
        }
        return len;
    }
	
	
	//메세지 버튼 클릭시 
	$("#noteAlaram").click(function(){	
		$('#noteAlaramList li').remove();
		//ajax 메일 테이블 
		$.ajax({
			url:"/note/summary",
			type:"GET",
			success:function(data){
												
				for(var i = 0; i<data.length; i++){
					
					var title = data[i].TITLE;
					var sender = data[i].SENDER;
					var senddate = data[i].SENDDATE; 
					var noticeNo = data[i].NOTICEID;
					var readChk = data[i].READCHK;
					var summaryList = "";			
									
					///////////////////////
					summaryList += "<li>";
					summaryList += "<div class='dropdown-messages-box'>";				
					summaryList += "<div class='media-body'>";
					summaryList += "<small class='float-right text-navy'>"+sender+"</small>";
					summaryList += "<strong class='float-left'>"+"<a href='/note/inbox/"+noticeNo+"'>";
					summaryList += title;
					summaryList += "</a></strong></br>";
					summaryList += "<small class='float-right text-muted'>"+senddate+"</small>";
					summaryList += "</div>";
					summaryList += "</div>";
					summaryList += "</li>";
					
					summaryList += "<li class='dropdown-divider'></li>";
					
					$('#noteAlaramList').append(summaryList);
					
				}	
				
					var foot = "";
					foot += "<li>";
					foot += "<div class='text-center link-block'>";
					foot += "<a href='/note/inbox' class='dropdown-item'>";
					foot += " <i class='fa fa-envelope'></i> <strong>전체 내부 통지</strong>";
					foot += " </a>";
					foot += "</div></li>";
					
					$('#noteAlaramList').append(foot);
				
			},
			error : function(jqXHR,textStatus,errorThrown){
				alert("에러발생 관리자에게 문의하세요." + textStatus);
				
			}
		});	
	});
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
	
//엑셀-다운로드
    $("#excelBtn").on("click", function () {
    	
    	var $exModal = $("#exModal");
		var url = $('#excelUrl').val();//해당 페이지의 hidden값에서 url을 얻는다.
		var formId = $('#searchFormId').val();//해당 페이지의 검색 form id 값을 얻는다.
    	var searchPrm = $('#'+formId).serialize();//검색값 쿼리스트링 형태로 변환
    	url = url +'?'+ searchPrm; //url에 쿼리스트링추가
    	
        $exModal.dialog({ modal: true });//모달 작동
      	$('.ui-front').removeAttr('style');//불필요한 css 이미지삭제
      	
        $.fileDownload(url, {
            successCallback: function (url) {
            	$exModal.dialog('close');
            	$('#modalCloseBtn').trigger('click');  
            },
            failCallback: function (responseHtml, url) {
            	$exModal.dialog('close');
            	$('#modalCloseBtn').trigger('click');
            }
        });
    });	 
    
    function formatDate(date) {
    	var time = new Date(date);
    	var year = time.getFullYear();
    	var month = time.getMonth() +1;
    	if(month < 10){
    		month = '0'+month;
    	}
    	var day = time.getDate();
    	  return year+'-'+month+'-' + day;
    	}
    // 상위 코드 받아서 하위코드 매핑하기
    function upperCode(codeGrp){
   	 var code = $('#'+codeGrp).val();
   	 var id = $('#'+codeGrp).attr('id');
   	 var url = "/code/upper"
   	 $.ajax({
    		url: url+"?codegrp="+id+"&codeval="+code,
    		method: "GET",
    		dataType: "json",
    		cache: false,
    		success: function (data) {
    			var text = "";
    			$('[upper="'+codeGrp+'"] option').remove();
    			$('[upper="'+codeGrp+'"]').append('<option label="선택" value="0"/>');
    			for(i=0;i<data.length;i++){
    				text = '<option label="'+data[i].codename+'" value="'+data[i].codeval+'"/>';
    				$('[upper="'+codeGrp+'"]').append(text);
    			}
    		},
    		error: function (request, status, error) {
    			alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    		}
    	});
   }
 // 상위 코드 받아서 하위코드 매핑하기
    function upperProduct(product){
    	var productNo = $(product).val();
   	 	var url = "/product/upper/"+productNo;
   	 	var nextId = 'product'+ parseInt(parseInt(product.id.substring(7))+1);
   	 	$.ajax({
    		url: url,
    		method: "GET",
    		dataType: "json",
    		cache: false,
    		success: function (data) {
    			var text = "";
    			$('#'+nextId).find('option').remove();
    			$('#'+nextId).append('<option label="선택" value="0"/>');
    			for(i=0;i<data.length;i++){
    				text = '<option label="'+data[i].prdname+'" value="'+data[i].prdno+'"/>';
    				$('#'+nextId).append(text);
    			}
    		},
    		error: function (request, status, error) {
    			alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    		}
    	});
   } 
    
    
    //좌측 사이드바 접기상태 변경
    $("#sideBarStatus").click(function(){
    	var userId = $('#hiddenUserId').val();	   	
    	$.ajax({
			url:"/sidestate/"+userId,
			type:"GET",			
			success:function(data){
				var result =JSON.parse(data);
				$('hiddenSideStates').val(result);				
			}	
    	});    
    });
    //좌측사이드바 상태별 접기펴기
    $(document).ready(function(){   	
    	var sideState = $('#hiddenSideStates').val();
        if(sideState != 0){
    		$('body').removeClass('mini-navbar');
    		$('body').removeClass('pace-done');
    		$('body').addClass('pace-done');
    	}else{
    		$('body').removeClass('pace-done');
    		$('body').removeClass('mini-navbar');
    		$('body').addClass('mini-navbar');
    	}   	
    });
    
    function smsToLms(id){
		var str =  $('#'+id).val();
		var textLength = getTextLength(str);
		if(textLength > 80){
            var bool = confirm("80바이트이상 작성하여서 LMS로 자동 전환합니다.");
            if(bool){
            	$('#senddesc').val(str);
            	$('#lengthType').val(1);
            	alert("Lms로 전환되어 저장됩니다.");
            	return true;
            }else{
            	var limit = '80' //제한byte를 가져온다.
                var strLength = 0;
                var strTitle = "";
                var strPiece = "";
                var check = false;
                
                for (i = 0; i < textLength; i++){
                    var code = str.charCodeAt(i);
                    var ch = str.substr(i,1).toUpperCase();
                    //체크 하는 문자를 저장
                    strPiece = str.substr(i,1);
                     
                    code = parseInt(code);
                     
                    if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0))){
                        strLength = strLength + 2; //UTF-8 3byte 로 계산
                    }else{
                        strLength = strLength + 1;
                    }
                    if(strLength>limit){
                    	$('#lengthType').val(0);
                    	alert(limit+"byte 초과된 문자는 잘려서 입력 됩니다.");
                    	 $('#'+id).val(strTitle);
                    	 e.preventDefault();
                         return false;
                    }else{
                        strTitle = strTitle+strPiece; //제한길이 보다 작으면 자른 문자를 붙여준다.
                    }
                }
            }
        }
	}
	