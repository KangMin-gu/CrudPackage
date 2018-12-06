<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html>
<head>



<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/plugins/fullcalendar/fullcalendar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/fullcalendar/fullcalendar.print.css" rel='stylesheet' media='print'>

<!-- link includ -->
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>





</head>




<body>
	<div id="wrapper">

		<!-- leftside -->
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
		<!-- Top -->
		<div id="page-wrapper" class="gray-bg">
			<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>



			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-8">
					<h2>영업일정</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><strong>목록</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>



			<div class="wrapper wrapper-content">
				<div class="row animated fadeInDown">
					<div class="col-lg-3">
						<div class="ibox ">
							<div class="ibox-title">
								<h5>Draggable Events</h5>
							</div>
							<div class="ibox-content">
								<div id='external-events'>
									<p>Drag a event and drop into callendar.</p>
									<div class='external-event navy-bg' >테스트 스케쥴</div>
									<div class='external-event navy-bg' id='test'>Go to shop
										and buy some products.</div>
									<div class='external-event navy-bg'>Check the new CI from
										Corporation.</div>
									<div class='external-event navy-bg'>Send documents to
										John.</div>
									<div class='external-event navy-bg'>Phone to Sandra.</div>
									<div class='external-event navy-bg'>Chat with Michael.</div>
									<p class="m-t">
										<input type='checkbox' id='drop-remove' class="i-checks"
											checked /> <label for='drop-remove'>remove after
											drop</label>
										<button class="btn btn-primary float-right" id="testBtn">버튼</button>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="ibox ">
							<div class="ibox-title">
								<h5>Striped Table</h5>
							</div>
							<div class="ibox-content">
								<div id="calendar"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- foot -->
			<div class="footer">
				<%@ include file="/WEB-INF/views/template/menu/foot.jsp"%>
			</div>
		</div>
		<!-- right side -->
		<div id="right-sidebar">
			<%@ include file="/WEB-INF/views/template/menu/rightside.jsp"%>
		</div>
	</div>

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>

	<!-- Mainly scripts -->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/fullcalendar/moment.min.js"></script>

	<!-- jQuery UI  -->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>

	<!-- iCheck -->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script>

	<!-- Full Calendar -->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/fullcalendar/fullcalendar.min.js"></script>

	<script>

    $(document).ready(function() {
		
    	 $('#testBtn').click(function(){
         	debugger;
  //       	var test = {'hahaha':'kk','kkk':'hahaha'};
         	
         	$.ajax({
     		    url: '/sales/cal/event',
    // 		    data: test,
     		    dataType: 'json', 
     		    type: 'GET', 
     		    processData: false, 
     		    contentType: false, 
     		    
     		    success: function(response){ 
     		    alert('ajax ok');        	
     		    
     		    },
     		    error:function(){
     		    alert('fail');	
     		    }
     		});         	
         });
    	
    	
    	
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green'
        });

        /* initialize the external events
         -----------------------------------------------------------------*/
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
        $('#calendar').fullCalendar({
            
        	header: {//캘린더 프레임 헤더설정
                left: 'prev,next today',//저번달, 다음달, 오늘로이동
                center: 'title',
                right: 'month,agendaWeek,agendaDay' //월,주,일별 보기 
            },
            
            editable: true, //false - 일정 수정 안됨. 
            
            droppable: false, // false - 드래그 박스의 일정 캘린더로 이동이 안됨.  
            
            drop: function() { //드래그 박스의 일정 캘린더로 드랍시 발생 function 
            	console.log('drop the div');
                
                if ($('#drop-remove').is(':checked')) { //드래그박스에서 삭제버튼이 체크 되어있다면                     
                    $(this).remove(); //캘린더에 일정 드랍 후 드래그 박스 목록에서 삭제.
                }
            },
            
            dayClick: function() {//캘린더 day 클릭
            	
            	
            	
            	
        	},
        	 
        	eventClick: function(event, element) {//캘린더 이벤트 클릭시
        		event.title = "CLICKED!"; 
        		$('#calendar').fullCalendar('updateEvent', event);
        	},
        	
        	eventSources: [
			{
        		events: [ // put the array in the `events` property
        			{
        			title  : '테스트케이스1'
        			,start: new Date('2018-12-01')
        			,color: 'black'     // an option!
                	,textColor: 'yellow' // an option!
        			}
        			,{
        			title  : '테스트이벤트'
            		,start: new Date('2018-12-05')
            		}
        		
        		]
        	
			
			}
			// any other event sources...
			
			]
        		    
         
        });//캘린더의끝
		
        
   		

    });

</script>
</body>

</html>
