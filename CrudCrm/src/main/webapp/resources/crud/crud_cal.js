
	var schList= $('#schList').val();//hidden value에 담겨있는 스케쥴 리스트를 받아온다.(json String) 
	
	$('#external-events div.external-event').each(function() {

		// store data so the calendar knows to render an event upon drop
		$(this).data('event', {
			
			title: $.trim($(this).text()), // use the element's text as the event title
			stick: true // maintain when user navigates (see docs on the renderEvent method)
		});

		// make the event draggable using jQuery UI
		$(this).draggable({

			zIndex: 1111999,
			revert: true,      // will cause the event to go back to its
			revertDuration: 0  //  original position after the drag
		});

	});
	/* initialize the calendar
         -----------------------------------------------------------------*/            
	
	 var date = new Date();
	 var d = date.getDate();
	 var m = date.getMonth();
	 var y = date.getFullYear();
	 var url = window.location.pathname;
	$('#calendar').fullCalendar({
		
		header: {//캘린더 프레임 헤더설정
			left: 'prev,next today',//저번달, 다음달, 오늘로이동
			center: 'title',
			right: 'month,agendaWeek,agendaDay' //월,주,일별 보기 
		},

		editable: true, //false - 일정 수정 안됨. 

		droppable: true, // false - 드래그 박스의 일정 캘린더로 이동이 안됨.  

		drop: function(a,b,c,d) { //드래그 박스의 일정 캘린더로 드랍시 발생 function 
			 
			if ($('#drop-remove').is(':checked')) { //드래그박스에서 삭제버튼이 체크 되어있다면                     
				$(this).remove(); //캘린더에 일정 드랍 후 드래그 박스 목록에서 삭제.
			}
		},
		eventReceive: function(event){
			debugger;
			var test = event;
		},
		
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

		dayClick: function(e) {//캘린더 day 클릭 e._d => 클릭한 날짜
			
			var tempDay = e.calendar(' ');
			var yyyy = tempDay.substr(6,4);
			var mm = tempDay.substr(0,2);
			var dd = tempDay.substr(3,2);
			var startDate = yyyy+'-'+mm+'-'+dd; //클릭한 날짜를 yyyy-mm-dd형식으로 변환
			
			openNewWindow("캘린더추가",url+"/post?startdate="+startDate,"",600,700);//팝업호출
	
		},

		eventClick: function(event, element) {//캘린더 이벤트 클릭시
			var id = event.id;
			var campUrl = url.substring(0,9);
			if(campUrl = '/campaign'){
				window.location.href = campUrl+"/"+id;
			}else {
				openNewWindow("캘린더상세",url+"/view/"+id,"",600,700);	
			}
		},
		
		eventDrop: function(event, delta, revertFunc) {
			
			if (!confirm("일정을 변경하시겠습니까?")) {
				revertFunc();//취소 버튼 클릭 시 이벤트 원위치
			}else{
				
				var obj = new Object();
				var id = event.id;
				var startdate = event.start.format().substr(0,10);
				var enddate = event.end;
				
				if(enddate != null || enddate != undefined){
					enddate = event.end.format().substr(0,10);
					obj.enddate = enddate;
				}else{
					enddate = null;
				}
				
				obj.schno = id;
				obj.startdate = startdate;
				
				var jsonData = JSON.stringify(obj);
							
				$.ajax({
					url: url+'/post/'+id+'?startdate='+startdate+'&enddate='+enddate,
					type: 'get',
					dataType: 'json',
					//data: test,
					processData: false, 
					contentType: false, 

					success: function(result){         		    
						console.log(result);
					},
					error:function(){
						alert('fail');	
					}
				});
				
				
				
			}
			
		},

		eventSources: [
			{				
				events:  JSON.parse(schList)//json String객체를 json객체로 변환해준다  -> 스케쥴 리스트 달력에 표시됨				
			}
		// any other event sources...

			]


	});//캘린더의끝