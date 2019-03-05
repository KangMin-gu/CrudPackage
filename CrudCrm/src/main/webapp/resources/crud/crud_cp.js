

$('#sendtype').change(function(e){
	var data = $('#sendtype').val();
	sendtype(data);
});

function sendtype(data){	
	if(data == '1'){
		$('.direct').hide();
		$('.days').hide();
		$('.term').hide();
	}else if(data =='2'){
		$('.direct').show();
		$('.days').hide();
		$('.term').hide();
		
	}else if(data =='3'){
		$('.direct').hide();
		$('.days').show();
		$('.term').hide();
		
	}else if(data == '4'){
		$('.direct').hide();
		$('.days').hide();
		$('.term').show();
	}else{
		$('.direct').hide();
		$('.days').hide();
		$('.term').hide();
	}
}
// 캠페인 테스트 발송
function testSend(){	
	var id = $('#campno').val();
	var returnmail= $("#returnmail").attr('value');
    var testmail = $("#testmail").attr('value');
    var title = $("#title").attr('value');
    var senddesc = $("#senddesc").attr('value');
    
    var param = {"returnmail":returnmail,"testmail":testmail,"senddesc":senddesc,"title":title};
	
	$.ajax({
        url: "/campaign/test/"+id,
        method: "POST",
        dataType: "json",
        data:param,
        success: function (data) {
        	alert("테스트 발송이 되었습니다.");
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}


$('.contents').click(function(e){
	openNewWindow('서식','/popcontents',e.target.id,650,700);
});

$('.camptarget').click(function(e){
	openNewWindow('추출내용','/poptarget',e.target.id,650,700);
})

// 대상추출에서 click 이벤트
function tabHistory(){
	var id = $('#campno').val();
    $.ajax({
        url: "/tab/targetHistory/"+id,
        method: "GET",
        dataType: "json",
        cache: false,
        success: function (data) {
        	$('#tab2 tbody tr').remove();
        	var length = data.length;
        	var html ="";
        	for (var i = 0; i < length; i++) {
        		html = '<tr><td>' + data[i].regdate + '</td><td>' + data[i].history + '</td>';
        		$('#tab2 tbody').append(html);
        	}
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function tabTargetCust(pageNum){
	var id = $('#campno').val();
	var custname = $('#custname').val();
    $.ajax({
        url: '/tab/targetCust/'+id+'?pageNum='+pageNum+'&custname='+encodeURI(custname) ,
        method: "GET",
        dataType: "json",
        cache: false,
        success: function (data) {
        	$('#tab1 tbody tr').remove();
        	$('#tab1 .pagination li').remove();
        	$('#tab1 .m-auto h4').remove();
        	var length = data.tabCust.length;
        	var html ="";
        	for (var i = 0; i < length; i++) {
        		html = '<tr><td>' + data.tabCust[i].CUSTNAME + '</td><td>' + data.tabCust[i].CUSTID + '</td><td>' + data.tabCust[i].MOBILENO + '</td><td>' + data.tabCust[i].EMAIL + '</td><td>' + data.tabCust[i].INFOAGREE_ + '</td><td>' + data.tabCust[i].CUSTGUBUN_ + '</td><td>' + data.tabCust[i].CUSTGRADE_ + '</td><td>' + data.tabCust[i].ADDR_ + '</td></tr>';
        		$('#tab1 tbody').append(html);
        	}
        	var html2= "";
        	
        	if (data.page.startPageNum != 1) {
                html2 += '<li class="footable-page-arrow disabled"><a onclick="tabTargetCust(' + eval(data.page.startPageNum - 1) + ')" >&laquo;</a></li>'
            } else {
                html2 += '<li class="disabled"><a href="javascript:">&laquo;</a></li>'
            }
            for (var i = data.page.startPageNum; i <= data.page.endPageNum; i++) {
                if (i == data.page.pageNum) {
                    html2 += '<li class="footable-page active"><a onclick="tabTargetCust(' + i + ')">'+i+'</a></li>'
                } else {
                    html2 += '<li><a onclick="tabTargetCust(' + i + ')">'+i+'</a></li>'
                }
            }
            if (data.page.endPageNum < data.page.totalPageCount) {
                html2 += '<li><a onclick="tabTargetCust(' + eval(data.page.endPageNum + 1)+')">&raquo;</a></li>'
            } else {
                html2 += '<li class="disabled"><a href="javascript:">&raquo;</a></li>'
            }
            html3 = '<h4 class="float-right">&middot; 총 자료수 : ' +data.totalRows +'건</h4>';
            
            $('#tab1 .pagination').append(html2);
            $('#tab1 .m-auto').prepend(html3);
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}	
	// 대상추출에서 추가를 클릭했을때 동작시키는 함수
	function addAddr(Obj){
		var lastDisPlay = $('.addr:eq(3)').css('display');
		if(lastDisPlay =='block'){
			alert('4개 이상 추가할수 없습니다.');
		}
		var display = Obj.parents('table').parent().next().css('display');
		if(display == 'none'){
			Obj.parents('table').parent().next().css('display','block');
		}
	}
	
	function parentContents(tr){

		var parentid = $('#parentid').val();

		opener.$("#"+parentid).next().val(tr.getAttribute("value"));
		opener.$("#"+parentid).val(tr.children.title.textContent).trigger('keyup');
		opener.$("#senddesc").text(tr.children.content.textContent).trigger('keyup');

		opener.tinymce.activeEditor.setContent(tr.children.content.textContent);
		window.close();
	}
	
	function parentTarget(tr){
		
		var parentid = $('#parentid').val();
		var id = tr.getAttribute("value");
		
		$.ajax({
	        url: "/poptarget/"+id,
	        method: "GET",
	        dataType: "json",
	        success: function (data) {
	        	
	        	var length = data.length;
	        	
	        	for(i = 0; i < length; i++){
	        		opener.$('#'+data[i].NAME).val(data[i].VALUE);
	        	}
	        	
	        	opener.$("#"+parentid).val(tr.children.campname.textContent).trigger('keyup');
	        	window.close();
	        	
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
			
		});

	}
	
	function campContents(hash,url){
		var menuType;
		if(url.indexOf('voc') > 0){
			menuType = 1;
		}else if(url.indexOf('campaign') > 0){
			menuType = 2;
		}
		$.ajax({
			 url: "/campContents?formType="+hash+"&menuType="+menuType,
		        method: "GET",
		        dataType: "json",
		        success: function (data) {
		        	var length = data.length;
		        	var html="";
		        	for(i = 0; i < length; i++){
		        		html = '<div class="panel panel-default"><div class="panel-heading"><h5 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse'+i+'"class="collapsed" aria-expanded="false">'+data[i].TITLE+'</a></h5></div>';						
		        		html += '<div id="collapse'+i+'" class="panel-collapse in collapse" style=""><div class="panel-body">'+data[i].CONTENT+'</div></div></div>';
		        		$('.panel-group').append(html);
		        	}
		        },
		        error: function (request, status, error) {
		            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		        }
		});
	}
	
	$('.panel-body').click(function(e){
		var accordion = $(e.currentTarget).children().attr('id');
		if(accordion == 'accordion'){
			var text = e.target.parentElement.innerHTML;
			tinymce.activeEditor.setContent(text);
			//ibox-tools 클릭 ( 화살표 모양 클릭해서 접음)
			$(e.currentTarget).parent().parent().children('.ibox-title').children('.ibox-tools').children().click();
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
			// event.start로 하면 UTC 시간으로 나옴..
			if(event.end == null){
				event.end = event.start;
				event.end._i = event.start._i;
			}
			
	          element.popover({
	        	  placement:'top',
	              animation:true,
	              delay: 100,
	              content: '<b>캠페인명</b>:'+event.title+"<b>캠페인 일정</b>:"+event.start._i+" ~ "+event.end._i,
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
		var href = "/campaign/" + no;
		
		opener.window.location.href = href;
		self.close();
	}
	
	
	