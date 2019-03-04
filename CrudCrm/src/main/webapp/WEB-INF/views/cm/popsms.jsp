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
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">

	<style>
body {
	background-color: #f3f3f4;
}
</style>
</head>

<body>
	<div id="wrapper">
			<!-- Content -->
			<div class="wrapper wrapper-content">
				<div class="row">
					<div class="col-lg-12 animated fadeInRight article">
							<div class="mail-box-header">
								<div class="row">
									<div class="col-md-6 text-left">
										<h2>문자 발송</h2>
									</div>
								</div>
							</div>
							<form:form action="/sendSms" method="post">
							<div class="mail-box">
								<div class="mail-body">
									<!-- 받는이 -->
									<div class="form-group row" id="mysel">
										<label class="col-md-2 col-form-label" for="touser"><strong>발송유형</strong></label>
										 <div class="col-md-10 i-checks" style="padding-left: 15px;">
                                    		<label class="mr-2 mb-0"><input type="radio" value="0" id="sendtype" name="sendtype">즉시발송</label>
                                    		<label class="mr-2 mb-0"><input type="radio" value="1" id="sendtype" name="sendtype">예약발송</label>
										</div>
									</div>	
									<div class="form-group row reserv" id="mysel">
										<label class="col-md-2 col-form-label" for="touser"><strong>예약발송일시</strong></label>
										<div class="col-md-10">
											<div class="input-group p-0">
                                            	<div class="d-flex date date01 col-lg-4 col-md-4 p-0 col-4">
                                                	<span class="input-group-addon">
                                                		<i class="fa fa-calendar"></i>
                                                	</span>
                                                	<input type="text" name="senddate" id="senddate" class="form-control" value="">
                                                </div>
                                                <div class="d-flex clockpicker col-lg-4 col-md-4 p-0 col-4">
                                                	<span class="input-group-addon">
                                                		<i class="fa fa-clock-o"></i>
                                                	</span>
                                                	<input type="text" name="sendtime" autocomplete="off" id="sendtime" class="form-control" value="">
                                                </div>
											</div>
										</div>
									</div>	
									
									<div class="form-group row" id="mysel">
										<label class="col-md-2 col-form-label" for="touser">받는이:</label>
										<div class="col-md-10">
											<input id="mobile" name="mobile" type="text" class="form-control" value="">
										</div>
									</div>								
									<div class="form-group row">
										<label class="col-md-2 col-form-label" for="title">제목:</label>
										<div class="col-md-8">
											<input id="title" name="title" type="text"
												class="form-control" value="">
										</div>
									</div>
								</div>
								<div class="box6 col-lg-12 col-xl-12">
								<label class="col-md-2 col-form-label" for="senddesc">내용:</label>
									<textarea id="senddesc" name="senddesc" cols="65" rows="5"></textarea>
                                    <input type="hidden" id="lengthType" name="lengthType" value="0">
                                </div>
                                
								<div class="mail-body text-right tooltip-demo">
									<button class="btn btn-sm btn-primary" id="btn" data-toggle="tooltip" >
										<i class="fa fa-reply"></i> 발송
									</button>
									<a href="mailbox.html" class="btn btn-white btn-sm"
										data-toggle="tooltip"><i class="fa fa-times"></i> 취소</a>
								</div>
							</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
			<!-- Content End -->

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script><!-- radioBox-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/clockpicker/clockpicker.js"></script>
	<script>
	
	$(document).ready(function() {
		$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
		
		$('.date').datepicker({
			keyboardNavigation:false,
			forceParse:false,
			autoclose:true
		});
		
		$('.clockpicker').clockpicker();
		
		$('[name="sendtype"]:eq(0)').iCheck('check');
		
		var mobile = opener.$('#mobile1').val() + opener.$('#mobile2').val() + opener.$('#mobile3').val();
		$('#mobile').val(mobile);
	});
	
	$('#btn').click(function(e){
		//e.preventDefault();
		smsToLms('senddesc');
	});
	
	$('.i-checks').on('ifChecked', function(event) {
		var value = event.target.value;
		var name = event.target.name;
		if(name =='sendtype'){
			if(value == 0){
				$('.reserv').hide();
			}else{
				$('.reserv').show();
			}
		}
	});
</script>
</body>
</html>