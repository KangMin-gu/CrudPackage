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
<title>IDEA CRM</title>
<!-- link includ -->
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>

<!-- S: 추가 CSS-->
<!-- Toastr style -->
<link href="/resources/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">
<!--radioBox-->
<link href="/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<!--datePicker-->
<link href="/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<!-- clockPicker -->
<link href="/resources/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">

<style>
body {
	background-color: #f3f3f4;
}
</style>



</head>
<body>
	<div class="wrapper">
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>접촉추가</h2>

			</div>

		</div>
	
		<div class="wrapper wrapper-content  animated fadeInRight article">

			<div class="col-lg-12">
				<div class="ibox">

					<div class="ibox-content row">
					<form:form action="/sales/cont/post" method="post" id="command" onsubmit="return false;">
						
						<div class="w-100 text-right mb-3">
							<Button class="btn btn-primary" onclick="addContect();">추가</Button>
							<input type="hidden" id="schno" name="schno" value="${schDetail.SCHNO }">
						</div>
						<div class="box1 col-lg-12 col-xl-4 p-0">
							<table class="table table-bordered mb-0">
								<colgroup>
									<col style="width: 110px; background: #fafafa;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									
									<tr>
										<th>영업명</th>
										<td>
											<input type="text" class="form-control" id="salename" name="salename" value="${schDetail.SALENAME }" readonly>
											<input type="hidden" id="salesno" name="salesno" value="${schDetail.SALESNO }">
										</td>
									</tr>
									
									<tr>
										<th>접촉자명</th>
										<td>
											<div class="input-group owner" id="ownername">
												<input type="text" class="form-control" autocomplete="off" name="ownername"  value="${schDetail.USERNAME }"readonly>
                                                <input type="hidden" name="cttuser" id="cttuser" value="${schDetail.OWNER }">
                                                <span class="input-group-addon">
                                                    <a><i class="fa fa-search"></i></a>
                                                </span>
											</div>
										</td>
									</tr>
									
									<tr>
										<th>고객명<b>&#42;</b></th>
										<td>
											<div class="input-group cust" id="custname">
												<input type="text" class="form-control validate error required nameV" autocomplete="off" name="custname" readonly>
                                                <input type="hidden" name="custno" id="custno" value="0">
                                                <span class="input-group-addon">
                                                    <a><i class="fa fa-search"></i></a>
                                                </span>
											</div>
										</td>
									</tr>								
																		
									<tr>
										<th>접촉일정</th>
										<td>
											<div class="input-group">
                                    			<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    			<input type="text" class="form-control" id="cttdate" name="cttdate" value="${schDetail.STARTDATE }" readonly >
                                			</div>
                                				
                                			<div class="input-group clockpicker" data-autoclose="true">
                                				<span class="input-group-addon" style="width: 39px;"><i class="fa fa-clock-o"></i></span>
                                				<input type="text" class="form-control" id="ctttime" name="ctttime" value="${schDetail.STARTTIME }" >
                            				</div>
										</td>
									</tr>
																	
									<tr>
										<th>접촉장소</th>
										<td>
											<input type="text" class="form-control" id="cttlocation" name="cttlocation">
											<input type="hidden" id="cttchannel" name="cttchannel" value="1"><!--영업스케쥴접촉 -->
										</td>
									</tr>
									
									<tr>
										<th>메모</th>
										 <td><textarea name="memo" id="memo"  class="form-control" style="resize:none;" rows="4">${schDetail.memo }</textarea></td>
									</tr>
									
								</tbody>
							</table>
						</div>
					</form:form>




					</div>
				</div>

			</div>

		</div>
	</div>

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<!-- Data picker -->
    <script src="/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <!-- Clock picker -->
    <script src="/resources/js/plugins/clockpicker/clockpicker.js"></script>
    <!-- 유효성 -->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_validate.js"></script>

	<script>			
	
	$(document).ready(function () {
		
		$('.clockpicker').clockpicker();
		
		$('.date').datepicker({
			keyboardNavigation:false,
			forceParse:false,
			autoclose:true
		});
	});
	
	function addContect(){
		debugger;
		var form = new FormData(document.getElementById('command'));
				
		$.ajax({
		    url: '/sales/cont/post',
		    data: form,
		    dataType: 'json', 
		    processData: false, 
		    contentType: false, 
		    type: 'POST', 
		    
		    success: function(response){       	
		    opener.window.location.reload();
		    window.close();
		    }
		});
	}
	
	</script>

</body>
</html>