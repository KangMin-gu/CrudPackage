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
		<!-- Top -->
		<div id="page-wrapper" class="gray-bg">
			<div class="wrapper wrapper-content">
				<div class="row animated fadeInDown">
					<div class="col-lg-12">
						<div class="ibox ">
							<div class="ibox-title">
								<h5>AS 기사 일정 관리</h5>
							</div>
							<div class="ibox-content">
								<input type="hidden" id="schList" name="schList" value='${schList }'/>
								<div id="calendar"></div>
							</div>
						</div>
					</div>
				</div>
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
	<script src="${pageContext.request.contextPath}/resources/crud/crud_sv.js"></script>
	
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