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



<link
	href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/css/plugins/fullcalendar/fullcalendar.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/plugins/fullcalendar/fullcalendar.print.css"
	rel='stylesheet' media='print'>

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
										<button class="btn btn-primary float-right">버튼</button>
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
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/fullcalendar/moment.min.js"></script>

	<!-- jQuery UI  -->
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>

	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script>

	<!-- Full Calendar -->
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/fullcalendar/fullcalendar.min.js"></script>

	<script>

    $(document).ready(function() {

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
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
		
        var test = new Date();
        var yyyy = '2001-01-01'.get
        
        
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar
            drop: function() {
                // is the "remove after drop" checkbox checked?
                if ($('#drop-remove').is(':checked')) {
                    // if so, remove the element from the "Draggable Events" list
                    $(this).remove();
                }
            },
            events: [
            	 {
                     title: '이벤트테스트',
                     start: new Date(y, m, 1)
                 },
                {
                    title: 'All Day Event',
                    start: new Date(y, m, 1)
                },
                {
                    title: 'Long Event',
                    start: new Date(y, m, d-5),
                    end: new Date(y, m, d-2)
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: new Date(y, m, d-3, 16, 0),
                    allDay: false
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: new Date(y, m, d+4, 16, 0),
                    allDay: false
                },
                {
                    title: 'Meeting',
                    start: new Date(y, m, d, 10, 30),
                    allDay: false
                },
                {
                    title: 'Lunch',
                    start: new Date(y, m, d, 12, 0),
                    end: new Date(y, m, d, 14, 0),
                    allDay: false
                },
                {
                    title: 'Birthday Party',
                    start: new Date(y, m, d+1, 19, 0),
                    end: new Date(y, m, d+1, 22, 30),
                    allDay: false
                },
                {
                    title: 'Click for Google',
                    start: new Date(y, m, 28),
                    end: new Date(y, m, 29),
                    url: 'http://google.com/'
                }
            ]
        });


    });

</script>
</body>

</html>
