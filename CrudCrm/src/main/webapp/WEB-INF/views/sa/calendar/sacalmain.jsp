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



<style id="test">
.fc-event,
.fc-agenda .fc-event-time,
.fc-event a {
  padding: 4px 6px;
  background-color: red;
  /* background color */
  border-color: #1ab394;
  /* border color */
}
</style>
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
								<h5>CUSTOM SCHEDULE</h5>
							</div>
							<div class="ibox-content">
								<div id='external-events'>	
																
									<input type="hidden" id="hiddenId" name="hiddenId" value="">
									<input type="hidden" id="hiddenColor" name="hiddenColor" value="">
									
									<c:forEach var="list" items="${comSchList}"  varStatus="status"> 
										<div class='external-event navy-bg' style="background-color: ${list.color}; position: relative;" id="status${status.index }"> 
											${list.title }   <a onclick='openNewWindow("공통스케쥴상세","/sales/cal/com/view/${list.id }","",600,500);'><i class="fa fa-search" ></i></a>
											<input type="hidden" id="id${status.index }" name="id${list.id }" value="${list.id }">
											<input type="hidden" id="color${status.index }" name="color${list.id}" value="${list.color}"/>
										</div>
										
									</c:forEach>
																
									<p class="m-t">
										<!--<input type='checkbox' id='drop-remove' class="i-checks" checked /> 
										 <label for='drop-remove'>remove after drop</label> -->
										<c:if test="${sessionScope.CHKAUTH ne 10 }">
											<a class="btn btn-default btn-lg float-right" onclick='openNewWindow("자주쓰는스케쥴","/sales/cal/com/post","",600,700);'>등록</a><br/>
										</c:if>
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
								<input type="hidden" id="schList" name="schList" value='${schList }'/>
								<input type="hidden" id="userno" name="userno" value="${userno }">
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
	<!-- 캘린더 이벤트 정의 -->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_cal.js"></script>
	
	<script>
	
	
	
    $(document).ready(function() {    	
        
    	$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green'
        });
        
       
    });
    
    
    
    

</script>
</body>

</html>
