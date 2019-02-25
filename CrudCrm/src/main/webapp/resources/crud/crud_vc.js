//String Buffer------------------------------------
var StringBuffer = function() {
    this.buffer = new Array();
}
StringBuffer.prototype.append = function(obj) {
     this.buffer.push(obj);
}
StringBuffer.prototype.toString = function(){
     return this.buffer.join("");
}
//-------------------------------------------------

// 선택 요소 초기화. 
// 2개의 대상 타겟이 동일한 div에 담겨 있어야 하며  네이밍 규칙이 다음과 같아야한다.
// XXXXname , XXXXno   ex) custname , custno  
$(".dataCancle").click(function(e) {
	var viewTarget = e.target.offsetParent.id;// 클릭한 div요소 id값 획득
	var hiddenTarget = viewTarget.replace('name', 'no');// 히든 값 id 획득
	$('[name=' + viewTarget + ']').val('');
	$('#' + hiddenTarget).val('0');
});

$("#custRegBtn").click(function(e) {
	custFormActivation('insert');// 버튼 변경 이벤트
	opener.$('#addBlackSpan').hide();// 강성고객 관련 버튼 제어
	opener.$('#cancleBlackSpan').hide();
//	opener.$('#blackDiv').hide();
	opener.$('#custname').css({"background-color":"#ffffff"});
	window.close();
});

// 인입 된 번호로 고객 검색.
function enterkey(event) {
    if (window.event.keyCode == 13) {//입력 값이 enter 
    	popVocCust();
    }
}

function popVocCust(){
	var searchPhoneNo = document.getElementById('phone').value;
	openNewWindow('voc','/vc/pop/cust?condition=phone&keyword='+searchPhoneNo,'voc',1260,800);
}

// 고객 추가
function goCustInsert() {

	var urlStr = "/vc/cust/post";
	var custName = $("#custname").val();
	//핸드폰 번호 입력값이 없다면 경고 
	if( $('#mobile1').val().length < 2 || $('#mobile2').val().length < 3 || $('#mobile3').val().length < 3  ){
		alert('휴대전화 입력 값을 확인해 주세요');
		return;
	}
	if(custName.trim() == ''){//입력 값이 없으면 핸드폰 번호를 기본값으로 설정.
		var recieveNo = $('#mobile1').val() + $('#mobile2').val() + $('#mobile3').val() ;
		$("#custname").val(recieveNo);
	}
		
	var param={};
	param = custDataToJson();
	$.ajax({
		url : urlStr,
		method : "POST",
		dataType : "json",
		data : param,
		cache : false,
		success : function(data) {
			$('#custno').val(data);
			custFormActivation("update", "voc");// 수정 버튼으로 변경
			$('#addBlackSpan').show()
			alert("추가 되었습니다.");
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});

}
// 고객 수정
function goCustUpdate() {
	var custNo = $("#custno").val();
	var urlStr = "/vc/cust/post/"+custNo;				
	var param = custDataToJson(param);
	$.ajax({
		url : urlStr,
		method : "POST",
		dataType : "json",
		data : param,
		cache : false,
		success : function(data) {
			alert("수정 되었습니다.");
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
}

function custDataToJson(){//고객 인풋 필드 데이터 json형식 변경. 
	var param={};
	var custData = $('.custInput');
	var custLength = custData.length;
	
    for(i=0; i<custLength;i++){
       var idVal = custData[i].id;
           
       if(idVal.substring(0,4) =='deny' ){ // 수신거부 체크박스 항목일 경우 
    	   if($('#'+idVal).prop('checked') == true){
    		   param[idVal] = custData[i].value;//체크 되었으면 값 바인딩
    	   }else{
    		   param[idVal] = 0; // 체크 해제 되었다면 0 
    	   }
    	   
       }else{
    	   param[idVal] = custData[i].value; 
       }
    }
    return param;
}

function vocCustDetail(){//VOC 고객 상세정보(팝업) 
	custNo = $('#custno').val();
	if(custNo == 0 || custNo == '' ){
		alert('고객이 선택되지 않았습니다.');
		return;
	}
	openNewWindow('voc','/vc/cust/view/'+custNo,'voc',1200,700);
 }

//블랙추가 - 블랙리스트 추가 팝업 페이지 호출
function addBlack(){
	 var custno = $('#custno').val();
	 if(custno > 0 ){
		 openNewWindow('voc','/vc/black/post','voc',700,480); 
	 }else{
	 	alert('대상이 선택되지 않았습니다.');
	 }
}

//블랙해제
function cancleBlack(){
	 var custno = $('#custno').val();
	 var urlStr = '/vc/black/del/'+custno;
	 $.ajax({
	        url: urlStr,
	        method: "GET",
	        dataType: "json",
	        cache: false,
	        success: function (data) {
	        	$('#blackcnt').val(0);
	        	$('#addBlackSpan').show();
				$('#cancleBlackSpan').hide();
				//$('#blackDiv').hide();
				$('#custname').css({"background-color":"#ffffff"});
				alert("해제 되었습니다.");
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
};
//팝업 - 블랙 추가 실행
function blackSubmit(fromUrl) {

	var custno = $('#custno').val();
	var receiveno = $('#receiveno').val();
	var blacktype = $('#blacktype').val();
	var memo = $('#memo').val();
	var jsonPrm = {"custno":custno, "receiveno":receiveno, "blacktype":blacktype, "memo":memo };
	
	$.ajax({
		url: fromUrl,
        method: "POST",
        dataType: "json",
        data: jsonPrm,
        cache: false,

		success : function(response) {
			alert('등록 되었습니다.');
			opener.$('#bcustno').val(response);
			opener.$('#addBlackSpan').hide();
			opener.$('#cancleBlackSpan').show();
			//opener.$('#blackDiv').show();
			opener.$('#custname').css({"background-color":"#f8d7da"});
			window.close();
		}
	});
}
//********좌측 탭 *************************************************************************************************
function setTableSize(tableId,colWidthArray){//테이블 해더 고정. 
	
	var tab = $('#'+tableId);
	var colLen = tab.find('th').length;
	var tdLen = tab.find('td').length; 
	var rowLen = tdLen/colLen;
	
	for (var i=0;i<rowLen;i++ ){	//모든 th td 에 각각 css적용 
		for(var j=0;j<colLen;j++){
			if(i==0){//th 라인설정
				tab.find('th').eq(colLen*i+j).css('border-top','1px solid #EBEBEB');
				tab.find('th').eq(colLen*i+j).attr("width",colWidthArray[j]);
			}
			tab.find('td').eq(colLen*i+j).css('border-top','0px');
			tab.find('td').eq(colLen*i+j).attr("width",colWidthArray[j]);
		}
	}			
}


function tabTargetVocService(pageNum){//서비스탭
	
	var custNo = $('#custno').val();
	var urlStr = '/vc/tab/sv?custno='+custNo+'&pageNum='+pageNum;
	
	var svLinkStr = '<a href="${pagecontext.request.contextpath}/service/${svList.SERVICENO }">' ;
	
	if(custNo != 0 ){
		$.ajax({
	        url: urlStr,
	        method: "GET",
	        dataType: "json",
	        cache: false,
	        success: function (data) {
	        	
	        	$('#tab1 tbody tr').remove();
	        	$('#tab1 .pagination li').remove();
	        	
	        	var length = data.svList.length;
	        	var html ="";
	        	for (var i = 0; i < length; i++) {
	        		html = '<tr><td title="'+data.svList[i].SERVICENAME+'"><a onClick="openNewWindow('+"'voc','/vc/service/"+data.svList[i].SERVICENO+"','voc',1200,700);"+'">'+ data.svList[i].SERVICENAME_ + '</a></td><td>' + data.svList[i].RECEPTIONDATE_ + '</td><td>' + data.svList[i].SERVICECHANNEL_ + '</td><td>' + data.svList[i].OWNER_ + '</td><td>' + data.svList[i].CUSTNAME_ + '</td><td>'+  '</td><td>' + data.svList[i].SERVICEOWNER_ + '</td></tr>';
	        		$('#tab1 tbody').append(html);
	        	}
	        	var html2= "";
	        	
	        	if (data.page.startPageNum != 1) {
	                html2 += '<li class="footable-page-arrow disabled"><a onclick="tabTargetVocService(' + eval(data.page.startPageNum - 1) + ')" >&laquo;</a></li>'
	            } else {
	                html2 += '<li class="disabled"><a href="javascript:">&laquo;</a></li>'
	            }
	            for (var i = data.page.startPageNum; i <= data.page.endPageNum; i++) {
	                if (i == data.page.pageNum) {
	                    html2 += '<li class="footable-page active"><a onclick="tabTargetVocService(' + i + ')">'+i+'</a></li>'
	                } else {
	                    html2 += '<li><a onclick="tabTargetVocService(' + i + ')">'+i+'</a></li>'
	                }
	            }
	            if (data.page.endPageNum < data.page.totalPageCount) {
	                html2 += '<li><a onclick="tabTargetVocService(' + eval(data.page.endPageNum + 1)+')">&raquo;</a></li>'
	            } else {
	                html2 += '<li class="disabled"><a href="javascript:">&raquo;</a></li>'
	            }
	            
	            if(length != 0){
	            	$('#tab1 .pagination').append(html2);
	            }
	            //테이블 헤더 고정 설정
	            var tableId = 'svTabTable';
	            var colWidthArray = [180,120,80,80,80,80,80];
	            setTableSize(tableId,colWidthArray);
	            //$('#'+tableId+' tbody').css('display','block');	            
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
	}
}

function tabTargetBlackHistory(pageNum){//강성고객이력탭
	
	var custNo = $('#custno').val();
	var urlStr = '/vc/tab/black?custno='+custNo+'&pageNum='+pageNum;
	
	if(custNo != 0 ){
		$.ajax({
	        url: urlStr,
	        method: "GET",
	        dataType: "json",
	        cache: false,
	        success: function (data) {
	        	
	        	$('#tab2 tbody tr').remove();
	        	$('#tab2 .pagination li').remove();
	        	
	        	var length = data.blackHistList.length;
	        	var html ="";
	        	for (var i = 0; i < length; i++) {
	        		html = '<tr><td>'+data.blackHistList[i].REGDATE_+'</td><td>'+ data.blackHistList[i].BLACKTYPE_ + '</td><td title="'+data.blackHistList[i].MEMO+'">' + data.blackHistList[i].MEMO_ + '</td><td>' + data.blackHistList[i].USERNAME + '</td><td>' + data.blackHistList[i].ISDELETE_ +  '</td></tr>';
	        		$('#tab2 tbody').append(html);
	        	}
	        	var html2= "";
	        	
	        	if (data.page.startPageNum != 1) {
	                html2 += '<li class="footable-page-arrow disabled"><a onclick="tabTargetBlackHistory(' + eval(data.page.startPageNum - 1) + ')" >&laquo;</a></li>'
	            } else {
	                html2 += '<li class="disabled"><a href="javascript:">&laquo;</a></li>'
	            }
	            for (var i = data.page.startPageNum; i <= data.page.endPageNum; i++) {
	                if (i == data.page.pageNum) {
	                    html2 += '<li class="footable-page active"><a onclick="tabTargetBlackHistory(' + i + ')">'+i+'</a></li>'
	                } else {
	                    html2 += '<li><a onclick="tabTargetBlackHistory(' + i + ')">'+i+'</a></li>'
	                }
	            }
	            if (data.page.endPageNum < data.page.totalPageCount) {
	                html2 += '<li><a onclick="tabTargetBlackHistory(' + eval(data.page.endPageNum + 1)+')">&raquo;</a></li>'
	            } else {
	                html2 += '<li class="disabled"><a href="javascript:">&raquo;</a></li>'
	            }
	            
	            if(length != 0){
	            	$('#tab2 .pagination').append(html2);
	            }
	            //테이블 헤더 고정 설정
	            var tableId = 'blackTabTable';
	            var colWidthArray = [80,40,150,70,100];  
	            setTableSize(tableId,colWidthArray);
	           //$('#'+tableId+' tbody').css('display','block');
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
	}
}

function tabTargetCallbackHistory(pageNum){//콜백이력탭
	
	var custno = $('#custno').val();
	var urlStr = '/vc/callback/history?custno='+custno+'&pageNum='+pageNum;
	if(custno != 0 ){
		$.ajax({
	        url: urlStr,
	        method: "GET",
	        dataType: "json",
	        cache: false,
	        success: function (data) {  
	        	
	        	$('#tab3 tbody tr').remove();
	        	$('#tab3 .pagination li').remove();
	        	
	        	var length = data.callBackHistList.length;
	        	var html ="";
	        	var sb = new StringBuffer();
	        	//todo. string buffer  코드로 변경        	
	        	for (var i = 0; i < length; i++) {
	        		sb.append('<tr><td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">'+data.callBackHistList[i].REGDATE_+'</td>');
	        		sb.append('<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">'+data.callBackHistList[i].CALLBACK+'</td>');
	        		sb.append('<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">' + data.callBackHistList[i].CALLER+'</td>'); 
	        		sb.append('<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">'+data.callBackHistList[i].USERNAME+'</td>');
	        		sb.append('<td title="'+data.callBackHistList[i].MEMO+'">'+data.callBackHistList[i].MEMO_+'</td>');
	        		sb.append('<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">'+data.callBackHistList[i].CALLSTATUS_);
	        		sb.append('<input type="hidden" id="callbachistkno'+i+'" value="'+data.callBackHistList[i].CALLBACKHISTNO+'"/>');
	        		sb.append('<input type="hidden" id="callbackcustno'+i+'" value="'+data.callBackHistList[i].CUSTNO+'"/>')
	        		sb.append('<input type="hidden" id="callcount'+i+'" value="'+data.callBackHistList[i].CALLCOUNT+'"/></td></tr>');
	        	}
	        	html = sb.toString();
	        	$('#tab3 tbody').append(html); 	
	        	var html2= "";
	        	
	        	if (data.page.startPageNum != 1) {
	                html2 += '<li class="footable-page-arrow disabled"><a onclick="tabTargetCallbackHistory(' + eval(data.page.startPageNum - 1) + ')" >&laquo;</a></li>'
	            } else {
	                html2 += '<li class="disabled"><a href="javascript:">&laquo;</a></li>'
	            }
	            for (var i = data.page.startPageNum; i <= data.page.endPageNum; i++) {
	                if (i == data.page.pageNum) {
	                    html2 += '<li class="footable-page active"><a onclick="tabTargetCallbackHistory(' + i + ')">'+i+'</a></li>'
	                } else {
	                    html2 += '<li><a onclick="tabTargetCallbackHistory(' + i + ')">'+i+'</a></li>'
	                }
	            }
	            if (data.page.endPageNum < data.page.totalPageCount) {
	                html2 += '<li><a onclick="tabTargetCallbackHistory(' + eval(data.page.endPageNum + 1)+')">&raquo;</a></li>'
	            } else {
	                html2 += '<li class="disabled"><a href="javascript:">&raquo;</a></li>'
	            }
	            
	            if(length != 0){
	            	$('#tab3 .pagination').append(html2);
	            }
	            //테이블 헤더 고정 설정
	            var tableId = 'callBackHisTabTable';
	            var colWidthArray = [100,80,80,80,150,80];
	            setTableSize(tableId,colWidthArray);
	            //$('#'+tableId+' tbody').css('display','block');
	            
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
	}
	
}

function tabTargetVocEmail(pageNum){//email 탭 

	var custNo = $('#custno').val();
	var urlStr = '/vc/tab/email?custno='+custNo+'&pageNum='+pageNum;
	
	if(custNo != 0){
		$.ajax({
	        url: urlStr,
	        method: "GET",
	        dataType: "json",
	        cache: false,
	        success: function (data) {
	        	
	        	$('#tab7 tbody tr').remove();
	        	$('#tab7 .pagination li').remove();
	        	var emailId = "";
	        	var length = data.emailList.length;
	        	var html ="";
	        	var hrefStr = '/vc/tab/email/view/';        	
	        	for (var i = 0; i < length; i++) {
	        		html = '<tr><td title="'+data.emailList[i].SUBJECT+'"><a onClick="openNewWindow('+"'voc','/vc/tab/email/view/"+data.emailList[i].EMAILLOGID+"','voc',960,500);"+'">'+ data.emailList[i].SUBJECT_ + '</a></td><td>' + data.emailList[i].TOEMAIL + '</td><td>' + data.emailList[i].FROMEMAIL + '</td><td>' + data.emailList[i].RLTDATE_ + '</td><td>' + data.emailList[i].MEDIATYPE + '</td></tr>';        		
	        		$('#tab7 tbody').append(html);
	        	}
	        	var html2= "";
	        	
	        	if (data.page.startPageNum != 1) {
	                html2 += '<li class="footable-page-arrow disabled"><a onclick="tabTargetVocEmail(' + eval(data.page.startPageNum - 1) + ')" >&laquo;</a></li>'
	            } else {
	                html2 += '<li class="disabled"><a href="javascript:">&laquo;</a></li>'
	            }
	            for (var i = data.page.startPageNum; i <= data.page.endPageNum; i++) {
	                if (i == data.page.pageNum) {
	                    html2 += '<li class="footable-page active"><a onclick="tabTargetVocEmail(' + i + ')">'+i+'</a></li>'
	                } else {
	                    html2 += '<li><a onclick="tabTargetVocEmail(' + i + ')">'+i+'</a></li>'
	                }
	            }
	            if (data.page.endPageNum < data.page.totalPageCount) {
	                html2 += '<li><a onclick="tabTargetVocEmail(' + eval(data.page.endPageNum + 1)+')">&raquo;</a></li>'
	            } else {
	                html2 += '<li class="disabled"><a href="javascript:">&raquo;</a></li>'
	            }
	            
	            if(length != 0){
	            	$('#tab7 .pagination').append(html2);
	            }
	            
	            //테이블 헤더 고정 설정
	            var tableId = 'emailTabTable';
	            var colWidthArray = [200,200,200,100,80];
	            setTableSize(tableId,colWidthArray);
	            //$('#'+tableId+' tbody').css('display','block');
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });

	}
}

//좌측 하단 콜백 탭 
function tabTargetCallbackList(pageNum){
	var ctitelno = $('#ctitelno').val();
	var urlStr = '/vc/callback?status=callback&ctitelno='+ctitelno+'&pageNum='+pageNum;
	
	$.ajax({
        url: urlStr,
        method: "GET",
        dataType: "json",
        cache: false,
        success: function (data) {  
        	
        	$('#callbackTab1 tbody tr').remove();
        	$('#callbackTab1 .pagination li').remove();
        	
        	var length = data.callBackList.length;
        	var html ="";
        	var sb = new StringBuffer();
          	
        	for (var i = 0; i < length; i++) {
        		sb.append('<tr><td><input type="hidden" id="callbackno'+i+'" value="'+data.callBackList[i].CALLBACKNO+'"/>'+data.callBackList[i].RECEIVEDATE_+'</td>');
        		sb.append('<td><a onclick="bindCallBackNo('+"'"+data.callBackList[i].CALLBACK+"'"+');">'+data.callBackList[i].CALLBACK+'</a></td>');
        		sb.append('<td>' + data.callBackList[i].CALLER+'</td>');
        		sb.append('<td><button class="btn btn-primary btn-sm dialingBtn"  onclick="callConfirm('+"'"+data.callBackList[i].CALLBACK+"'"+');">');
        		sb.append('<i class="fa fa-phone"></i></button>' +'&nbsp;&nbsp;');
        		sb.append('<button class="btn btn-danger btn-sm hangUpBtn" onclick="javascript:func_hangup();" disabled><i class="fa fa-phone"></i></button>'+'</td>'); 
        		sb.append('<td><input type="text" id="vocmemo'+i+'" maxlength="100">'+'</td>');
        		sb.append('<td><button class="btn btn-primary btn-sm" onclick="callBackMatching('+i+');">매칭</button>');
        		sb.append('&nbsp;&nbsp;<button class="btn btn-primary btn-sm" onclick="callBackConfirm('+i+',2);">완료</button>&nbsp;&nbsp;<button class="btn btn-danger btn-sm" onclick="callBackConfirm('+i+',3);">불통</button>');
        		sb.append('<input type="hidden" id="callbackcustno'+i+'" value="0"/>');
        		sb.append('<input type="hidden" id="trunk'+i+'" value="'+data.callBackList[i].TRUNK+'"> <input type="hidden" id="callcount'+i+'" value="'+data.callBackList[i].CALLCOUNT+'"/></td></tr>');     		        		
        		
        	}
        	html = sb.toString();
        	$('#callbackTab1 tbody').append(html); 	
        	var html2= "";
        	
        	if (data.page.startPageNum != 1) {
                html2 += '<li class="footable-page-arrow disabled"><a onclick="tabTargetCallbackList(' + eval(data.page.startPageNum - 1) + ')" >&laquo;</a></li>'
            } else {
                html2 += '<li class="disabled"><a href="javascript:">&laquo;</a></li>'
            }
            for (var i = data.page.startPageNum; i <= data.page.endPageNum; i++) {
                if (i == data.page.pageNum) {
                    html2 += '<li class="footable-page active"><a onclick="tabTargetCallbackList(' + i + ')">'+i+'</a></li>'
                } else {
                    html2 += '<li><a onclick="tabTargetCallbackList(' + i + ')">'+i+'</a></li>'
                }
            }
            if (data.page.endPageNum < data.page.totalPageCount) {
                html2 += '<li><a onclick="tabTargetCallbackList(' + eval(data.page.endPageNum + 1)+')">&raquo;</a></li>'
            } else {
                html2 += '<li class="disabled"><a href="javascript:">&raquo;</a></li>'
            }
            
            if(length != 0){
            	$('#callbackTab1 .pagination').append(html2);
            }
            
            //테이블 헤더 고정 설정
            var tableId = 'callBackTabTable';
            var colWidthArray = [150,100,100,85,190,170];
            setTableSize(tableId,colWidthArray);
            //$('#'+tableId+' tbody').css('display','block');            
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}







// ********고객 팝업
// 관련*************************************************************************************************

function vocCustSelected(tr) {// tr이 클릭 이벤트
	var custno = tr.getAttribute("value");
	var urlStr = "/vc/pop/cust/" + custno;
	var urlServ = "/vc/pop/service/" + custno;
	var statusStr = 'update';
	vocGetCustInfo(urlStr);// 정보획득 후 데이터 바인딩.
	vocGetServiceInfo(urlServ);
	custFormActivation('update');// 수정 버튼생성.

	setTimeout(function() {
		opener.$('#tab1Btn').trigger('click');
		window.close();
	}, 300);
}

// 고객정보 획득 후 바인딩
function vocGetCustInfo(urlStr) {
	$.ajax({
		url : urlStr,
		method : "GET",
		dataType : "json",
		cache : false,
		success : function(data) {
			custInfoClear();// 기존 입력 된 데이터 삭제
			custInfoBinding(data);// 바인딩

			var blackCnt = opener.$('#blackcnt').val();
			if (blackCnt > 0) { // 블랙리스트 관련 버튼 제어
				opener.$('#addBlackSpan').hide();
				opener.$('#cancleBlackSpan').show();
				//opener.$('#blackDiv').show();
				opener.$('#custname').css({"background-color":"#f8d7da"});
				alert('블랙리스트에 등록 되어있는 고객입니다.');
			} else {
				opener.$('#addBlackSpan').show();
				opener.$('#cancleBlackSpan').hide();
//				opener.$('#blackDiv').hide();
				opener.$('#custname').css({"background-color":"#ffffff"});
			}

		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
}

// 최근 서비스 1건 획득 후 바인딩
function vocGetServiceInfo(urlServ) {
	$.ajax({
		url : urlServ,
		method : "GET",
		dataType : "json",
		cache : false,
		success : function(data) {
			serviceInfoBinding(data);// 바인딩
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
}

function custInfoClear() {// 인풋 필드 초기화
	opener.$('#custname').val('');
	opener.$('#custno').val('0');
	opener.$('#custgubun').val('0');
	opener.$('#mobile1').val('');
	opener.$('#mobile2').val('');
	opener.$('#mobile3').val('');
	opener.$('#homtel1').val('');
	opener.$('#homtel2').val('');
	opener.$('#homtel3').val('');
	opener.$('[name="relcustname"]').val('');
	opener.$('#relcustno').val('0');
	opener.$('#email').val('');
	opener.$('#custgrade').val('0');
	opener.$('#homaddr1').val('');
	opener.$('#homaddr2').val('');
	opener.$('#homaddr3').val('');
	//체크박스 해제 
	opener.$('#denymailnomal').iCheck('uncheck');opener.$('#denymailsurvey').iCheck('uncheck');
	opener.$('#denysmsnomal').iCheck('uncheck');opener.$('#denysmssurvey').iCheck('uncheck');
	opener.$('#denydmnomal').iCheck('uncheck');opener.$('#denydmsurvey').iCheck('uncheck');
	
	$('#custname').css({"background-color":"#ffffff"});//블랙리스트로 변경 되었던 css 복구 
}

function custInfoBinding(data) {// 인풋 필드 데이터 바인딩
	opener.$('#custname').val(data.CUSTNAME);
	opener.$('#custno').val(data.CUSTNO);
	opener.$('#custgubun').val(data.CUSTGUBUN);
	opener.$('#mobile1').val(data.MOBILE1);
	opener.$('#mobile2').val(data.MOBILE2);
	opener.$('#mobile3').val(data.MOBILE3);
	opener.$('#homtel1').val(data.HOMTEL1);
	opener.$('#homtel2').val(data.HOMTEL2);
	opener.$('#homtel3').val(data.HOMTEL3);
	opener.$('[name="relcustname"]').val(data.RELCUSTNAME);
	if (data.RELCUSTNO != null && data.RELCUSTNO != '') {
		opener.$('#relcustno').val(data.RELCUSTNO);
	}
	opener.$('#email').val(data.EMAIL);
	opener.$('#custgrade').val(data.CUSTGRADE);
	opener.$('#homaddr1').val(data.HOMADDR1);
	opener.$('#homaddr2').val(data.HOMADDR2);
	opener.$('#homaddr3').val(data.HOMADDR3);
	opener.$('#blackcnt').val(data.BLACKCNT);
	
	//체크박스 제어
	if(data.DENYMAILNOMAL == 1){ //mail일반
		opener.$('#denymailnomal').iCheck('check'); 
	}else 
		opener.$('#denymailnomal').iCheck('uncheck'); 
	
	if(data.DENYMAILSURVEY == 1){ //mail해피콜
		opener.$('#denymailsurvey').iCheck('check'); 
	}else
		opener.$('#denymailsurvey').iCheck('uncheck'); 
	
	if(data.DENYSMSNOMAL == 1){ //sms일반
		opener.$('#denysmsnomal').iCheck('check'); 
	}else
		opener.$('#denysmsnomal').iCheck('uncheck'); 
	
	if(data.DENYSMSSURVEY == 1){ //sms해피콜
		opener.$('#denysmssurvey').iCheck('check'); 
	}else
		opener.$('#denysmssurvey').iCheck('uncheck'); 
		
	if(data.DENYDMNOMAL == 1){ //dm일반
		opener.$('#denydmnomal').iCheck('check'); 
	}else
		opener.$('#denydmnomal').iCheck('uncheck'); 
	
	if(data.DENYDMSURVEY == 1){ //dm해피콜
		opener.$('#denydmsurvey').iCheck('check'); 
	}else
		opener.$('#denydmsurvey').iCheck('uncheck'); 
		
}

function serviceInfoBinding(data) {
	opener.$('input:radio[name="servicetype"]').each(
			function(index) {
				if (this.value == data.SERVICETYPE) {
					opener.$('input:radio[name="servicetype"]:eq('+ index + ')').iCheck('check');
				}
			});
	opener.$('#servicecode1').val(data.SERVICECODE1);
	opener.$('#servicecode2').val(data.SERVICECODE2);
	opener.$('#servicename').val(data.SERVICENAME);
	opener.$('#servicedesc').val(data.SERVICEDESC);
	opener.$('#memo').val(data.MEMO);
	if (data.SERVICETYPE == 1) {

		opener.$('input:radio[name="vocstep"]').each(
				function(index) {
					if (this.value == data.SERVICESTEP) {
						opener.$('input:radio[name="vocstep"]:eq('+ index + ')').iCheck('check');
					}
				});
		if (data.SERVICESTEP == 5) {
			opener.$('#reservphone').val(data.reserv.MOBILENO);
			opener.$('#reservdate').val(formatDate(data.reserv.RESERVDATE));
			opener.$('#reservtimeto').val(data.reserv.RESERVTIMETO);
			opener.$('#reservtimefrom').val(data.reserv.RESERVTIMEFROM);
		} else if (data.SERVICESTEP == 6 || data.SERVICESTEP == 7) {
			opener.$('#nextowner').val(data.convey.NEXTOWNER);
			opener.$('#nextowner_').val(data.convey.NEXTOWNER_);
			opener.$('#conveyreason').val(data.convey.CONVEYREASON);
			opener.$('#conveydesc').val(data.convey.CONVEYDESC);
		}
	} else if (data.SERVICETYPE == 3) {
		opener.$('#visitdate').val(data.reward.VISITDATE);
		opener.$('#visitaddr1').val(data.reward.VISITADDR1);
		opener.$('#visitaddr2').val(data.reward.VISITADDR2);
		opener.$('#visitaddr3').val(data.reward.VISITADDR3);
		opener.$('[name="asowner_"]').val(data.reward.OWNER_);
		opener.$('[name="#asowner"]').val(data.reward.OWNER);
	}

	opener.$('.voc').attr('disabled', true);
	opener.$('.voc').iCheck('disable');
	opener.$('.plus').hide();

	opener.$('tbody .plus').attr('disabled', true);

	$.each(data.product, function(index, item) {
		if (index != 0) {
			procutPlus(index);
		}
		opener.$('#product' + parseInt(parseInt(index + 1) + '1')).empty();
		opener.$('#product' + parseInt(parseInt(index + 1) + '2')).empty();
		opener.$('#product' + parseInt(parseInt(index + 1) + '3')).empty();

		opener.$('#product' + parseInt(parseInt(index + 1) + '1')).append('<option label="' + item.PRODUCTBNAME + '" value="'+ item.PRODUCTB + '"/>');
		opener.$('#product' + parseInt(parseInt(index + 1) + '2')).append('<option label="' + item.PRODUCTMNAME + '" value="'+ item.PRODUCTM + '"/>');
		opener.$('#product' + parseInt(parseInt(index + 1) + '3')).append('<option label="' + item.PRODUCTSNAME + '" value="'+ item.PRODUCTS + '"/>');
		opener.$('#product' + parseInt(parseInt(index + 1) + '3')).next().remove();
	});

}

// 버튼 생성 메서드
// 파라미터에 따라 insert/ update 버튼을 생성
function custFormActivation(statusStr, fromStr) {
	var btnStr = "";
	if (statusStr == 'insert') {
		custInfoClear();
		btnStr = "<Button type='button' class='btn btn-primary btn-sm' onClick='goCustInsert()'>고객 등록</Button>";
		var phoneNum = opener.$('#phone').val(); // 인입된 전화번호
		splitPhoneNum(phoneNum);// 3자리로 자른 후 핸드폰번호에 바인딩

	} else if (statusStr == 'update') {
		btnStr = "<Button type='button' class='btn btn-primary btn-sm' onClick='goCustUpdate()'>고객 수정</Button>";
	}
	if (fromStr == "voc") {// 호출한 곳이 voc 페이지면
		$('#regSpan').empty();
		$('#regSpan').html(btnStr);
	} else {// 팝업
		opener.$('#regSpan').empty();
		opener.$('#regSpan').html(btnStr);
	}

}

function splitPhoneNum(phoneNum) {// 01로 시작하면 휴대폰에 바인딩. 그 외 집전화에 바인딩
	phoneNum = phoneNum.replace(/\-/g, ''); // '-' 제거
	var len = phoneNum.length;
	var phone1;
	var phone2;
	var phone3;

	if (phoneNum.indexOf("01") == 0) {
		if(len == 10){
			phone1 = phoneNum.substr(0, 3);
			phone2 = phoneNum.substr(3, 4);
			phone3 = phoneNum.substr(7, 4);
		}else{
			phone1 = phoneNum.substr(0, 3);
			phone2 = phoneNum.substr(3, 4);
			phone3 = phoneNum.substr(7, 4);
		}			
	} else if (phoneNum.indexOf("02") == 0) {
		if (len == 9) {
			phone1 = phoneNum.substr(0, 2);
			phone2 = phoneNum.substr(2, 3);
			phone3 = phoneNum.substr(5, 4);
		} else {
			phone1 = phoneNum.substr(0, 3);
			phone2 = phoneNum.substr(2, 4);
			phone3 = phoneNum.substr(6, 4);
		}		
	} else {
		phone1 = phoneNum.substr(0, 3);
		phone2 = phoneNum.substr(3, 4);
		phone3 = phoneNum.substr(7, 5);	
	}
	opener.$('#mobile1').val(phone1);
	opener.$('#mobile2').val(phone2);
	opener.$('#mobile3').val(phone3);

}

// ******************************************** 고객 팝업 끝
// ******************************

$('#create').click(function() {
	$('.voc').attr('disabled', false);
	$('.voc').iCheck('enable');
	$('.voc').val('');
	$('.i-checks').iCheck('uncheck');
	$('[name="vocstep"]:first').iCheck('check');
	$('[name="servicetype"]:first').iCheck('check');
	$('#create').hide();
	$('.product').not(':first').remove();
	$('.product:first select').empty();
	$('.product:first select').append('<option label="선택" value=""></option>');
	$('tbody .plus').attr('disabled', false);
	productB();

});

// 제품 추가를 눌렀을때
$(document).on('click', '.plus', function(e) {
	var productNum = $(e.target).prev().attr('id').substring(7, 8);
	productPlus(parseInt(productNum));
});
// 제품 삭제를 눌렀을때
	$(document).on('click','.minus',function(e) {
					$(e.target).parent().prev().find('select:last').after('<button class="plus btn btn-primary d-inline-block btn-sm mr-2">추가</button>');
					$(e.target).parent().remove();
	});

// 최근 한건을 가져올때 제품의 갯수를 늘려줌
function productPlus(length) {
	var countP = length + 1;
	var flag = window.location.pathname.indexOf('pop');
	// 팝업인지 아닌지 비교해서 팝업인경우에는 opener를 늘려주고 아니면 본인을 늘려줌
	if (flag == -1) {
		$('.product:last').clone(true).insertAfter(
				'.select-area .select-box:last');
		$('.product:last').find('#product' + length + 1).attr('name',
				'product' + countP + 1).attr('id', 'product' + countP + 1);
		$('.product:last').find('#product' + length + 2).attr('name',
				'product' + countP + 2).attr('id', 'product' + countP + 2);
		$('.product:last').find('#product' + length + 3).attr('name',
				'product' + countP + 3).attr('id', 'product' + countP + 3);
		$('.product:last').prev().find('.plus').remove();
		// 첫번째 인경우에는 삭제버튼만 있으면 되기 떄문
		if (length == 1) {
			$('.product:last')
					.append(
							'<button class="minus btn btn-primary d-inline-block btn-sm mr-2">삭제</button>');
		}
	} else {
		opener.$('.product:last').clone(true).insertAfter(
				'.select-area .select-box:last');
		opener.$('.product:last').find('#product' + length + 1).attr('name',
				'product' + countP + 1).attr('id', 'product' + countP + 1);
		opener.$('.product:last').find('#product' + length + 2).attr('name',
				'product' + countP + 2).attr('id', 'product' + countP + 2);
		opener.$('.product:last').find('#product' + length + 3).attr('name',
				'product' + countP + 3).attr('id', 'product' + countP + 3);
		opener.$('.product:last').prev().find('.plus').remove();
	}

}

$('.asowner').click(function(e) {
	var custName = $('#custname').val();
	if (custName == "") {
		e.preventDefault();
		alert("고객이 선택되지 않았습니다. 고객을 선택해주세요");
	} else {
		openNewWindow('AS기사', '/vc/voc/cal', e.currentTarget.id, 1200, 800);
	}

});

$('#save').click(
		function(e) {
			var servicetype = $('.servicetype .checked input').val();
			var servicename = $("#servicename").val();
			var servicedesc = $("#servicedesc").val();
			var vocstep = $('.check:checked').val();
			var nextowner = $('#nextowner').val();
			var conveyreason = $('#conveyreason').val();
			var conveydesc = $('#conveydesc').val();
			var reservphone = $('#reservphone').val();
			var reservdate = $('#reservdate').val();
			var reservtimeto = $('#reservtimeto').val();
			var reservtimefrom = $('#reservtimefrom').val();
			var nextadminowner = $('#nextadminowner').val();
			var servicecode1 = $('#servicecode1').val();
			var servicecode2 = $('#servicecode2').val();
			var memo = $('#memo').val();
			var custno = $('#custno').val();
			var asowner = $('#asowner').val();
			var visitdate = $('#visitdate').val();
			var visittime = $('#visittime').val();
			var visitaddr1 = $('#visitaddr1').val();
			var visitaddr2 = $('#visitaddr2').val();
			var visitaddr3 = $('#visitaddr3').val();

			var param = {
				"custno" : custno,
				"servicetype" : servicetype,
				"servicename" : servicename,
				"servicedesc" : servicedesc,
				"vocstep" : vocstep,
				"nextowner" : nextowner,
				"conveyreason" : conveyreason,
				"conveydesc" : conveydesc,
				"reservphone" : reservphone,
				"reservdate" : reservdate,
				"reservtimeto" : reservtimeto,
				"reservtimefrom" : reservtimefrom,
				"nextadminowner" : nextadminowner,
				"memo" : memo,
				"servicecode1" : servicecode1,
				"servicecode2" : servicecode2,
				"asowner" : asowner,
				"visitdate" : visitdate,
				"visittime" : visittime,
				"visitaddr1" : visitaddr1,
				"visitaddr2" : visitaddr2,
				"visitaddr3" : visitaddr3
			};

			var productNum = $('.plus:last').prev().attr('id').substring(7, 8);

			for (i = 1; i <= productNum; i++) {
				var products = $('[id*="product' + i + '1"]').attr('id');
				var products2 = $('[id*="product' + i + '2"]').attr('id');
				var products3 = $('[id*="product' + i + '3"]').attr('id');

				param[products] = $('[id*="product' + i + '1"]').val();
				param[products2] = $('[id*="product' + i + '2"]').val();
				param[products3] = $('[id*="product' + i + '3"]').val();
			}

			$.ajax({
				url : "/vc/voc/post",
				method : "POST",
				dataType : "json",
				data : param,
				cache : false,
				success : function(data) {
					if (data != 0) {
						alert("저장되었습니다.");
						// 데이터 전부 초기화
						$('.form-control').val('').keyup();
					}
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});

		});

$('.i-checks').on('ifChecked', function(event) {
	var value = event.target.value;
	var name = event.target.name;
	if (name == 'vocstep') {
		if (value == 6) {
			$('.convey').show();
			$('.adminconvey').hide();
			$('.reservation').hide();
		} else if (value == 7) {
			$('.convey').hide();
			$('.adminconvey').show();
			$('.reservation').hide();
		} else if (value == 5) {
			$('.convey').hide();
			$('.adminconvey').hide();
			$('.reservation').show();
		} else {
			$('.convey').hide();
			$('.adminconvey').hide();
			$('.reservation').hide();
		}
	} else if (name == "servicetype") {
		if (value == 1) {
			$('.result').show();
			$('.as').hide();
		} else if (value == 2) {
			$('.convey').hide();
			$('.adminconvey').hide();
			$('.reservation').hide();
			$('.result').hide();
			$('.as').show();
		}
	} else if (name == "addrsame") {
		$('#visitaddr1').val($('#homaddr1').val());
		$('#visitaddr2').val($('#homaddr2').val());
		$('#visitaddr3').val($('#homaddr3').val());
	}
});

function productB() {
	var urlServ = "/vc/productB";
	$.ajax({
		url : urlServ,
		method : "GET",
		dataType : "json",
		cache : false,
		success : function(data) {
		
			for (i = 0; i < data.length; i++) {
				$('.product select:first').append(
						'<option label="' + data[i].prdname + '" value="'
								+ data[i].prdno + '"/>');
			}
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
}

function vocContents(hash,url){
	
	var menuType;
	if(url.indexOf('voc') > 0){
		menuType = 1;
	}else if(url.indexOf('campaign') > 0){
		menuType = 2;
	}
	$.ajax({
		 url: "/vocContents?formType="+hash+"&menuType="+menuType,
	        method: "GET",
	        dataType: "json",
	        cache : false,
	        success: function (data) {
	        	var length = data.length;
	        	var html="";
	        	for(i = 0; i < length; i++){
	        		html = '<a class="content" value="'+data[i].CONTENTNO+'">'+data[i].TITLE +'</a>';  
	        		$("#servicedesc").parent().next().append(html);
	        	}
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	});
}

$(document).on('click', '.content', function(e) {
	var contentNo = $(e.target).attr('value');
	var url = "/voc/getContent/"+contentNo;
	$.ajax({
		
		url:url,
		method:"GET",
		dataType:"json",
		cache :false,
		success:function(data){
			$('#servicedesc').val(data.CONTENT);
			
		},
		error:function(request,status,error){
			alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
		
	});
});

function cti_test() {

	var url = "/cti/history";
	var param = {
		"custno" : custno,
		"servicetype" : servicetype
	};

	$.ajax({
		url : url,
		method : "POST",
		dataType : "json",
		cache : false,
		success : function(data) {
			serviceInfoBinding(data);// 바인딩
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
}

$('#asowner').change(
		function() {
			var asOwner = $(this).val();

			var url = "/vc/voc/cal/" + asOwner;

			$.ajax({
				url : url,
				method : "GET",
				dataType : "json",
				cache : false,
				success : function(data) {
					$('#calendar').fullCalendar('removeEvents');
					for (i = 0; i < data.svSchList.length; i++) {
						$('#calendar').fullCalendar('renderEvent',
								data.svSchList[i], true);
					}
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});

		});

// 타이머
var second = 0;
var min = 00;

function startInterval() {
	second = 1;
	vocTimer = setInterval(function() {
		// 0초면 초기화 후 이동되는 사이트
		if (second == 60) {
			second = 00;
			min = parseInt(min) + 1;
		}
		if (second < 10) {
			second = "0" + second;
		}
		var time = min + " : " + second;
		$('#timer').text(time);
		second = parseInt(second) + 1;// 카운트 증가
	}, 1000);
}

function stopInterval() {
	if (vocTimer != '') {
		clearInterval(vocTimer);
	}
}
//************************************콜백 관련 ***********************************************************


// 캘린더 시작
if ($('#calendar').length > 0) {
	var schList = $('#schList').val();// hidden value에 담겨있는 스케쥴 리스트를
										// 받아온다.(json String)
	/*
	 * initialize the calendar
	 * -----------------------------------------------------------------
	 */

	var url = window.location.pathname;

	$('#external-events div.external-event').each(function() {

		// store data so the calendar knows to render an event upon drop
		$(this).data('event', {
			title : $.trim($(this).text()), // use the element's text as the
											// event title
			stick : true
		// maintain when user navigates (see docs on the renderEvent method)
		});

		// make the event draggable using jQuery UI
		$(this).draggable({
			zIndex : 1111999,
			revert : true, // will cause the event to go back to its
			revertDuration : 0
		// original position after the drag
		});

	});

	$('#calendar').fullCalendar(
			{

				header : {// 캘린더 프레임 헤더설정
					left : 'prev,next today',// 저번달, 다음달, 오늘로이동
					center : 'title',
					right : 'month,agendaWeek,agendaDay' // 월,주,일별 보기
				},

				editable : true, // false - 일정 수정 안됨.

				droppable : true, // false - 드래그 박스의 일정 캘린더로 이동이 안됨.

				drop : function(event, a, b) { // 드래그 박스의 일정 캘린더로 드랍시 발생
												// function
				
					var name = $(b.helper).text().trim();
					var val1 = $(b.helper).children().val();
					var date = formatDate(event._d);
					var flag = confirm(name + " 기사님에게 배정하시겠습니까?");
					if (flag) {
						opener.$('[name="asowner_"]').val(name);
						opener.$('[name="asowner"]').val(val1);
						opener.$('#visitdate').val(date);
						alert("배정되었습니다.");
						self.close();
					} else {
						alert("취소되었습니다.");
					}

				},

				// 한글화
				monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
						"9월", "10월", "11월", "12월" ],
				monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
						"8월", "9월", "10월", "11월", "12월" ],
				dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
				dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
				buttonText : {
					today : "오늘",
					month : "월별",
					week : "주별",
					day : "일별",
				},
				timeFormat : "HH:mm",

				eventRender : function(event, element) {
					if (event.end == null) {
						event.end = event.start;
						event.end._i = event.start._i;
					}

					element.popover({
						placement : 'top',
						animation : true,
						delay : 100,
						content : '<b>서비스명</b>:' + event.title
								+ "<b>서비스 일자</b>:" + event.start._i,
						trigger : 'hover',
						html : true
					});
				},

				eventClick : function(event, element, func) {// 캘린더 이벤트 클릭시
					// window.location.href = campUrl+"/"+id;
					openNewWindow("AS기사 접수내용", "/vc/voc/owner/" + event.id
							+ "?visitdate=" + event.start._i, "", 600, 700);
				},
				eventSources : [ {
					events : JSON.parse(schList)
				// json String객체를 json객체로 변환해준다 -> 스케쥴 리스트 달력에 표시됨
				} ]
			});// 캘린더의끝

}

function bindCallBackNo(phoneNo){
	$('#makeCallNum').val(phoneNo);
	$('#phone').val(phoneNo);
	popVocCust();
}

function callConfirm(phoneNo){//콜백 목록 전화걸기전 확인 alert
	
	$('#makeCallNum').val(phoneNo);
	$('#phone').val(phoneNo);
	 swal({
         title: phoneNo,
         text: "번호를 확인해 주세요",
         showCancelButton: true,
         confirmButtonColor: "#DD6B55",
         confirmButtonText: "통 화",
         closeOnConfirm: false
     }, function () {
         swal.close();
         didCheckMakeCall();
     });
 }
 
function callConfirm(phoneNo){//콜백 목록 전화걸기전 확인 alert
	
	$('#makeCallNum').val(phoneNo);
	$('#phone').val(phoneNo);
	 swal({
         title: phoneNo,
         text: "번호를 확인해 주세요",
         showCancelButton: true,
         //confirmButtonColor: "#DD6B55",
         confirmButtonText: "통 화",
         closeOnConfirm: false
     }, function () {
         swal.close();
         didCheckMakeCall();
     });
 }
 
function callBackConfirm(idx,callstatus){//콜백 목록 처리
	
	var typeText;
	var titleText;
	var callcount = $('#callcount'+idx).val();
	
	if(callstatus == 2){//완료버튼 클릭시 
		titleText = "완료 처리 하시겠습니까?";
		typeText="success";
	}else if(callstatus == 3){//통화불가버튼 클릭시
		if(callcount > 2){//현재 콜 시도횟수가 3회 이상이라면
			titleText = "미해결 처리 하시겠습니까?"
		}else{
			titleText = "통화불가 처리 하시겠습니까?";	
		}
		typeText="warning";
	}
	
	 swal({
         title: titleText,
         text: "",
         showCancelButton: true,
         type: typeText,
         confirmButtonText: "완 료",
         closeOnConfirm: false
     }, function () {
    	 var callbackno = $('#callbackno'+idx).val();
    	 var custno = $('#callbackcustno'+idx).val();
    	 var memo = $('#vocmemo'+idx).val();
    	 var trunk = $('#trunk'+idx).val();
    	 if(callstatus == 3 && callcount > 2){//callcount가 3이상일때 불통 버튼 클릭 시 status = 4 미해결 
    		 callstatus = 4;
    	 }
    	 
    	 var jsonPrm = {"callbackno":callbackno, "custno":custno, "memo":memo, "callstatus":callstatus , "trunk":trunk};
    	 var urlStr = '/vc/callback/post/'+callbackno;
    	 
    	 $.ajax({
 	        url: urlStr,
 	        method: "POST",
 	        dataType: "json",
 	        data:jsonPrm,
 	        cache: false,
 	        success: function (data) {
 	        	$("#callbackTab1Btn").trigger("click");
 	        },
 	        error: function (request, status, error) {
 	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
 	        }
 	    });
    	 
    	 
         swal.close();         
     });
 }
 
function callBackMatching(idx){//매칭 버튼 클릭시 현재 바인딩 된 고객과 콜백 회원을 매칭시킨다. 
	var custname = $('#custname').val();
	var custno = $('#custno').val();
	var phoneNo = $('#mobile1').val()+'-'+$('#mobile2').val()+'-'+$('#mobile3').val();
		
	var textStr = "고객명 : "+custname+ " / 휴대폰 : "+phoneNo;	
	swal({
        title: "매칭 회원을 확인해주세요",
        text: textStr,
        showCancelButton: true,
        confirmButtonText: "완 료",
        closeOnConfirm: false
    }, function () {
    	$('#callbackcustno'+idx).val(custno);
    	swal.close(); 
    });
}
//***********************************************************************************************************

