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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>CRUD SYSTEM</title>
<!-- link includ -->
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
<!-- Toastr style -->
<link href="/resources/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">
<!-- DatePicker -->
<link href="/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">

<link href="/resources/css/animate.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div id="wrapper">
		<!-- leftside -->
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
		
		<!-- Top -->
		<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>

			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>회원 공지사항</h2> 					
				</div>
				<div class="col-lg-2">
				</div>
			</div>
			<!-- Content -->
			<div class="wrapper wrapper-content animated fadeIn">
				<div class="wrapper wrapper-content  animated fadeInRight article">
					<div class="row justify-content-md-center">
						<div class="col-lg-12" style="background: #ffffff;">
							<div class="ibox">
								<!-- title-row -->
								<div class="ibox-title row">
									<h5>기본정보</h5>									
								</div>
								<!-- conten-row -->
								<div class="ibox-content row">
									
						
								</div>
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
	<script src="/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	
	<script>
	
	</script>
	
	
</body>
</html>