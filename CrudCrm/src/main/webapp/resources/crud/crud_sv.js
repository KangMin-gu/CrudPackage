if($('.summernote').length > 0){
	$('#servicedesc').summernote({
		height : 200,
		dialogsInBody: true
	});
				
	$('#ractdesc').summernote({
		height:200,
		dialogsInBody: true
	});
	$('#rewarddesc').summernote({
		height:200,
		dialogsInBody: true
	});
}

if($('.date').length > 0){
	$('.date').datepicker({
		keyboardNavigation:false,
		forceParse:false,
		autoclose:true
	});
}
if($('.select2').length > 0){
	$('.select2').select2();
}
if($('.clockpicker').length > 0){
	$('.clockpicker').clockpicker();	
}

//icheck css
if($('.i-checks').length >0){
	$('.i-checks').iCheck({
		checkboxClass: 'icheckbox_square-green',
    	radioClass: 'iradio_square-green',
	});			
}

$('#servicecode1').change(function(){
	 upperCode('servicecode1'); 
});

var date = today();
$('#receptiondate').val(date);
$('#receptiondate_').val(date);

// 서비스 처리 이력 탭
$(".tabRact").click(function(e){
	var id = $('#serviceno').val();
    $.ajax({
        url: "/tab/ract/"+id,
        method: "GET",
        dataType: "json",
        cache: false,
        success: function (data) {
        	$('#tab1 tbody tr').remove();
        	var length = data.length;
        	for (var i = 0; i < length; i++) {
        		var html = '<tr><td>' + data[i].RACTDATE_ + '</td><td>' + data[i].RACTCODE_ + '</td><td>' + data[i].OWNER_ + '</td><td>' + data[i].RACTDESC + '</td><td>' + data[i].SENDYN_ + '</tr>';
        		$('#tab1 tbody').append(html);
        	}
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
});
//서비스 이관 이력 탭
$(".tabConvey").click(function(e){
	var id = $('#serviceno').val();
    $.ajax({
        url: "/tab/convey/"+id,
        method: "GET",
        dataType: "json",
        cache: false,
        success: function (data) {
        	$('#tab2 tbody tr').remove();
        	var length = data.length;
        	var html = '';
        	for (var i = 0; i < length; i++) {
        		 html = '<tr><td>' + data[i].CONVEYDATE + '</td><td>' + data[i].CONVEYREASON_ + '</td><td>' + data[i].PREVOWNER_ + '</td><td>' + data[i].NEXTOWNER_ + '</td><td>' + data[i].CONVEYDESC + '</td></tr>';
        		$('#tab2 tbody').append(html);
        	}
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
});

// 이관 팝업
$('.servicenext').click(function(e){
	var name = '담당자이관'
	var id = $('#serviceno').val();
	var url = '/convey/'+id;
	var x = '1232';
	var y = '370';
	
	openNewWindow(name,url,e,x,y);
	
});
// 이관 팝업에서 저장버튼 눌렀을때 동작
$('#svSave').click(function(e){
	debugger;
	var	url= "/convey";	
	var serviceno = $('#serviceno').val();
    var conveydate= $("#conveydate").val();
    var conveyreason = $("#conveyreason").val();
    var nextowner = $("#nextowner").val();
    var conveydesc = $('#conveydesc').val();
    var param = {"serviceno":serviceno,"conveydate":conveydate,"conveyreason":conveyreason,"nextowner":nextowner,"conveydesc":conveydesc};
    
    $.ajax({
        url: url,
        method: "POST",
        dataType: "json",
        data:param,
        success: function () {
            alert("저장되었습니다.");
            window.opener.location.reload();
            window.close();
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });

});

$('.serviceself').click(function(e){
	
	var serviceowner_ = $('#serviceowner_').val();
	var serviceowner = $('#serviceowner').val();
	
	$('[name="owner_"]').val(serviceowner_).trigger('keyup');
	$('[name="owner"]').val(serviceowner);
	e.stopPropagation();
});

$('.ractself').click(function(e){
	
	var owner_ = $('[name="owner_"]').val();
	var owner = $('[name="owner"]').val();
	
	$('[name="ractowner_"]').val(owner_).trigger('keyup');
	$('[name="ractowner"]').val(owner);
	e.stopPropagation();
});



$('#rewardSame').click(function(e){
	
	e.preventDefault();
	var receptionDate = $('#receptiondate').val();
	var owner_ = $('[name="owner_"]').val();
	var owner = $('[name="owner"]').val();
	var serviceDesc = $('#servicedesc').val();
	
	$('#visitdate').val(receptionDate);
	$('#rewarddesc').summernote('code',serviceDesc);
	$('[name="rewardowner_"]').val(owner_);
	$('[name="rewardowner"]').val(owner);

});

$('#ractSame').click(function(e){
	e.preventDefault();
	var receptionDate = $('#receptiondate').val();
	var owner_ = $('[name="owner_"]').val();
	var owner = $('[name="owner"]').val();
	var serviceDesc = $('#servicedesc').val();
	
	$('#ractdate').val(receptionDate);
	$('#ractdesc').summernote('code',serviceDesc);
	$('[name="ractowner_"]').val(owner_);
	$('[name="ractowner"]').val(owner);
});

$('.complete').click(function(e){
	
	var result =confirm('정말로 종결 처리하시겠습니까?');
	
	if(result){
		var serviceno = $('#serviceno').val();
		var param = {"serviceno":serviceno};
		$.ajax({
	        url: "/service/complete/"+serviceno,
	        method: "POST",
	        dataType: "json",
	        data:param,
	        success: function () {
	            alert("종결처리 되었습니다.");
	            window.location.reload();
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
		
		
	}else{
		return false;
	}
	
});


$('.i-checks').on('ifChecked', function(event){
	var value = event.target.value;
	var name = event.target.name;
	if(name=="addrsame"){
		$('#visitaddr1').val($('#homaddr1').val());
		$('#visitaddr2').val($('#homaddr2').val());
		$('#visitaddr3').val($('#homaddr3').val());
	}
});


if($('#calendar').length > 0){
	var schList= $('#schList').val();//hidden value에 담겨있는 스케쥴 리스트를 받아온다.(json String) 
/* initialize the calendar
     -----------------------------------------------------------------*/            
 	var url = window.location.pathname;

 	$('#calendar').fullCalendar({
 		
		header: {//캘린더 프레임 헤더설정
			left: 'prev,next today',//저번달, 다음달, 오늘로이동
			center: 'title',
			right: 'month,agendaWeek,agendaDay' //월,주,일별 보기 
		},

		editable: false, //false - 일정 수정 안됨. 

		droppable: false, // false - 드래그 박스의 일정 캘린더로 이동이 안됨.  
	
		//한글화
		monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		dayNamesShort: ["일","월","화","수","목","금","토"],
		buttonText: {
			today : "오늘",
			month : "월별",
			week : "주별",
			day : "일별",
		},
		timeFormat : "HH:mm",

		eventRender: function(event, element){
			debugger;
			if(event.end == null){
				event.end = event.start;
				event.end._i = event.start._i;
			}
		
          	element.popover({
        	  	placement:'top',
              	animation:true,
              	delay: 100,
              	content: '<b>서비스명</b>:'+event.title+"<b>서비스 일자</b>:"+event.start._i,
              	trigger: 'hover',
              	html : true
          	});
        	},
	
        eventClick: function(event, element) {//캘린더 이벤트 클릭시
        	//window.location.href = campUrl+"/"+id;
			openNewWindow("캘린더상세",url+"/"+event.id,"",600,700);
		},
		eventSources: [
			{				
				events:  JSON.parse(schList)//json String객체를 json객체로 변환해준다  -> 스케쥴 리스트 달력에 표시됨				
			}
		]
	});//캘린더의끝

}

function moveDetail(){
	var no = $('#no').val();
	var href = "/service/" + no;

	opener.window.location.href = href;
	self.close();
}

$('[name*=product]').change(function(){
	 upperProduct(this); 
});

