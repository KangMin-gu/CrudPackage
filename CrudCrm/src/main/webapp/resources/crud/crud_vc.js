// 선택 요소 초기화. 
// 2개의 대상 타겟이 동일한 div에 담겨 있어야 하며  네이밍 규칙이 다음과 같아야한다.
// XXXXname , XXXXno   ex) custname , custno  
$(".dataCancle").click(function(e){
	var viewTarget = e.target.offsetParent.id;//클릭한 div요소 id값 획득  
	var hiddenTarget = viewTarget.replace('name','no');//히든 값 id 획득
	$('[name='+viewTarget+']').val('');
	$('#'+hiddenTarget).val('0');
});

//인입 된 번호로 고객 검색.
function enterkey(event) {
	var id = event.id;
    if (window.event.keyCode == 13) {//입력 값이 enter 
    	if(id == 'phone'){
    		var searchPhoneNo = document.getElementById(id).value;
    		openNewWindow('voc','/vc/pop/cust?condition=phone&keyword='+searchPhoneNo,'voc',900,800);
    	}
    }
}

//고객 추가
function goCustInsert(){
	var urlStr = "/vc/cust/post";
	var custName = $("#custname").val();
	if(custName.trim() == ''){//입력 값이 없으면 기본값으로 설정.
		$("#custname").val('익명');
	}	
	
	var param={};
	param = custDataToJson(param);
	$.ajax({
        url: urlStr,
        method: "POST",
        dataType: "json",
        data: param,
        cache: false,
        success: function (data) {
        	$('#custno').val(data);
        	custFormActivation("update","voc");//수정 버튼으로 변경
        	alert("추가 되었습니다.");
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
	
}
//고객 수정
function goCustUpdate(){
	var custNo = $("#custno").val();
	var urlStr = "/vc/cust/post/"+custNo;			
	var param={};	
	param = custDataToJson(param);
	
	$.ajax({
        url: urlStr,
        method: "POST",
        dataType: "json",
        data:param,
        cache: false,
        success: function (data) {
        	alert("수정 되었습니다.");
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function custDataToJson(param){//고객 인풋 필드 데이터 json형식 변경.	
	var custData = $('.custInput');
	var custLength = custData.length;
    for(i=0; i<custLength;i++){
       var idVal = custData[i].id;
       param[idVal] = custData[i].value;
    }
    return param;
}


//********popup 관련************************************************************************************************* 

function vocCustSelected(tr){//tr이 클릭 이벤트
	var custno = tr.getAttribute("value");
	var urlStr = "/vc/pop/cust/"+custno;
	var urlServ = "/vc/pop/service/"+custno;
	var statusStr = 'update';
	vocGetCustInfo(urlStr);//정보획득 후 데이터 바인딩.
	vocGetServiceInfo(urlServ);
	setTimeout(function(){
		custFormActivation('update');//수정 버튼생성.
	},300);
}

//고객정보 획득 후 바인딩
function vocGetCustInfo(urlStr){
	$.ajax({
        url: urlStr,
        method: "GET",
        dataType: "json",
        cache: false,
        success: function (data) {
        	custInfoClear();//기존 입력 된 데이터 삭제
        	custInfoBinding(data);//바인딩
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

//최근 서비스 1건 획득 후 바인딩
function vocGetServiceInfo(urlServ){
	$.ajax({
        url: urlServ,
        method: "GET",
        dataType: "json",
        cache: false,
        success: function (data) {
        	serviceInfoBinding(data);//바인딩
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function custInfoClear(){//인풋 필드 초기화
	opener.$('#custname').val('');
	opener.$('#custno').val('0');
	opener.$('#custgubun').val('0');
	opener.$('#mobile1').val('');opener.$('#mobile2').val('');opener.$('#mobile3').val('');
	opener.$('#homtel1').val('');opener.$('#homtel2').val('');opener.$('#homtel3').val('');
	opener.$('#relcustname').val('');
	opener.$('#relcustno').val('0');
	opener.$('#email').val('');
	opener.$('#custgrade').val('0');
	opener.$('#homaddr1').val('');opener.$('#homaddr2').val('');opener.$('#homaddr3').val('');
}

function custInfoBinding(data){//인풋 필드 데이터 바인딩
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
	if(data.RELCUSTNO != null && data.RELCUSTNO != '' ){
		opener.$('#relcustno').val(data.RELCUSTNO);
	}
	opener.$('#email').val(data.EMAIL);
	opener.$('#custgrade').val(data.CUSTGRADE);
	opener.$('#homaddr1').val(data.HOMADDR1);
	opener.$('#homaddr2').val(data.HOMADDR2);
	opener.$('#homaddr3').val(data.HOMADDR3);
}

function serviceInfoBinding(data){
	opener.$('input:radio[name="servicetype"]').each(function(index){
		if(this.value == data.SERVICETYPE){
			opener.$('input:radio[name="servicetype"]:eq('+index+')').iCheck('check');
		}
	});
	opener.$('#servicecode1').val(data.SERVICECODE1);
	opener.$('#servicecode2').val(data.SERVICECODE2);
	opener.$('#servicename').val(data.SERVICENAME);
	opener.$('#servicedesc').val(data.SERVICEDESC);
	opener.$('#memo').val(data.MEMO);
	opener.$('input:radio[name="vocstep"]').each(function(index){
		if(this.value == data.SERVICESTEP){
			opener.$('input:radio[name="vocstep"]:eq('+index+')').iCheck('check');
		}
	});
	if(data.SERVICESTEP == 4){
		opener.$('#reservphone').val(data.reserv.MOBILENO);
		opener.$('#reservdate').val(formatDate(data.reserv.RESERVDATE));
		opener.$('#reservtimeto').val(data.reserv.RESERVTIMETO);
		opener.$('#reservtimefrom').val(data.reserv.RESERVTIMEFROM);
	}else if(data.SERVICESTEP == 5 || data.SERVICESTEP == 6){
		opener.$('#nextowner').val(data.convey.NEXTOWNER);
		opener.$('#nextowner_').val(data.convey.NEXTOWNER_);
		opener.$('#conveyreason').val(data.convey.CONVEYREASON);
		opener.$('#conveydesc').val(data.convey.CONVEYDESC);
	}
	
	
	opener.$('.voc').attr('readonly',true);
	opener.$('.voc').iCheck('disable');
	opener.$('.plus').hide();
	
}

//버튼 생성 메서드
//파라미터에 따라 insert/ update 버튼을 생성
function custFormActivation(statusStr,fromStr){
	var btnStr = "";
	if(statusStr == 'insert'){
		custInfoClear();
		btnStr = "<Button type='button' class='btn btn-primary' onClick='goCustInsert()'>고객 등록</Button>";
		var phoneNum = opener.$('#phone').val(); //인입된 전화번호
		splitPhoneNum(phoneNum);//3자리로 자른 후 핸드폰번호에 바인딩 
		
	}else if (statusStr == 'update'){
		btnStr = "<Button type='button' class='btn btn-primary' onClick='goCustUpdate()'>고객 수정</Button>";
	}
	if(fromStr == "voc"){//호출한 곳이 voc 페이지면
		$('#regDiv').empty();
		$('#regDiv').html(btnStr);
	}else{//팝업
		opener.$('#regDiv').empty();
		opener.$('#regDiv').html(btnStr);
	}
	window.close();
}

function splitPhoneNum(phoneNum){//01로 시작하면 휴대폰에 바인딩. 그 외 집전화에 바인딩
	phoneNum = phoneNum.replace(/\-/g,'');  // '-' 제거
	var len = phoneNum.length;
	var phone1;
	var phone2;
	var phone3;
	
	if( phoneNum.indexOf("01") == 0){
		phone1 = phoneNum.substr(0,3);
		phone2 = phoneNum.substr(3,4);
		phone3 = phoneNum.substr(7,4);
		
		opener.$('#mobile1').val(phone1);
		opener.$('#mobile2').val(phone2);
		opener.$('#mobile3').val(phone3);
		
	}else if(phoneNum.indexOf("02") == 0 ){
		if(len == 9){
			phone1 = phoneNum.substr(0,2);
			phone2 = phoneNum.substr(2,3);
			phone3 = phoneNum.substr(5,4);
		}else{
			phone1 = phoneNum.substr(0,3);
			phone2 = phoneNum.substr(2,4);
			phone3 = phoneNum.substr(6,4);
		}		
		opener.$('#homtel1').val(phone1);
		opener.$('#homtel2').val(phone2);
		opener.$('#homtel3').val(phone3);		
	}else{
		phone1 = phoneNum.substr(0,3);
		phone2 = phoneNum.substr(3,4);
		phone3 = phoneNum.substr(7,10);
		opener.$('#homtel1').val(phone1);
		opener.$('#homtel2').val(phone2);
		opener.$('#homtel3').val(phone3);
	}	
}

$('#create').click(function(){
	$('.voc').attr('readonly',false);
	$('.voc').iCheck('enable');
	$('.voc').val('');
	$('.i-checks').iCheck('uncheck');
	$('[name="vocstep"]:first').iCheck('check');
	$('[name="servicetype"]:first').iCheck('check');
});

$(".plus").click(function(){
	var cloneCount = $('.plus').length;
	var countP = cloneCount + 1;
    
    $('.select-area .select-box:last').clone(true).insertAfter('.select-area .select-box:last');
    $('.select-area .select-box:last').find('#goods'+cloneCount+1).attr('name','goods'+countP+1).attr('id','goods'+countP+1);
    $('.select-area .select-box:last').find('#goods'+cloneCount+2).attr('name','goods'+countP+2).attr('id','goods'+countP+2);
    $('.select-area .select-box:last').find('#goods'+cloneCount+3).attr('name','goods'+countP+3).attr('id','goods'+countP+3);
    $('.select-area .select-box:last').find('#goods'+cloneCount+3).next().clone(true).removeClass('plus').addClass('minus');
}); 