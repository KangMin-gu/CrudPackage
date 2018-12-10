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

<!-- S: 추가 CSS-->
<!-- Toastr style -->
<link href="/resources/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">
<!--radioBox-->
<link href="/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<!--datePicker-->
<link href="/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<!-- colorPicker -->
<link href="/resources/css/plugins/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet">
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
				<h2>일정추가</h2>

			</div>

		</div>

		<!-- S: 고객 목록 ppt p01-->
		<div class="wrapper wrapper-content  animated fadeInRight article">

			<div class="col-lg-12">
				<div class="ibox">

					<div class="ibox-content row">
					<form:form action="/popsalescust/post" method="post" id="command" onsubmit="return false;">
						
						<div class="w-100 text-right mb-3">
							<Button class="btn btn-primary" id="submitBtn" onclick="formSubmit();">추가</Button>
						</div>
						<div class="box1 col-lg-12 col-xl-4 p-0">
							<table class="table table-bordered mb-0">
								<colgroup>
									<col style="width: 110px; background: #fafafa;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									
									<tr>
										<th>스케쥴명</th>
										<td><input type="text" class="form-control" id="schname" name="schname"></td>
									</tr>
									
									<tr>
										<th>영업명</th>
										<td>
											<div class="input-group cust">
												<input type="text" class="form-control" autocomplete="off" name="salename" id="salename" readonly>
                                                <input type="hidden" name="salesno" id="salesno" value="0">
                                                <span class="input-group-addon">
                                                    <a><i class="fa fa-search"></i></a>
                                                </span>
											</div>
										</td>
									</tr>								
									
						
									
									<tr>
										<th>사용자명</th>
										<td>
											<div class="input-group owner">
												<input type="text" class="form-control" autocomplete="off" name="ownername" id="ownername"  value="${username }"readonly>
                                                <input type="hidden" name="owner" id="owner" value="${userno }">
                                                <span class="input-group-addon">
                                                    <a><i class="fa fa-search"></i></a>
                                                </span>
											</div>
										</td>
									</tr>
																		
									<tr>
										<th>시작일정</th>
										<td>
											<div class="input-group">
                                    			<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    			<input type="text" class="form-control" id="startdate" name="startdate" value="${startdate }" readonly >
                                			</div>
                                				
                                			<div class="input-group clockpicker" data-autoclose="true">
                                				<span class="input-group-addon" style="width: 39px;"><i class="fa fa-clock-o"></i></span>
                                				<input type="text" class="form-control" id="starttime" name="starttime" value="10:00" >
                            				</div>
                            
										</td>
									</tr>
									
									<tr>
										<th>종료일정</th>
										<td>
											<div class="input-group date">
                                    			<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    			<input type="text" class="form-control" id="enddate" name="enddate" >
                                			</div>
                                				
                                			<div class="input-group clockpicker" data-autoclose="true">
                                				<span class="input-group-addon" style="width: 42px;"><i class="fa fa-clock-o"></i></span>
                                				<input type="text" class="form-control" id="endtime" name="endtime" value="" >
                            				</div>
										</td>
									</tr>
									
									<tr>
										<th>스케쥴보안</th>
										<td>
											<select class="form-control" name="private" id="private">
												<option value="0">공유</option>
												<option value="1">혼자보기</option>
											</select>
										</td>
									</tr>
									
									<tr>
										<th>색상</th>
										<td><input type="text" class="form-control colorPicker" id="color" name="color" autocomplete="off"/></td>
									</tr>
									
									<tr>
										<th>메모</th>
										 <td><textarea name="memo" id="memo"  class="form-control" style="resize:none;" rows="4"></textarea></td>
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
	 <!-- Color picker -->
    <script src="/resources/js/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
    <!-- Clock picker -->
    <script src="/resources/js/plugins/clockpicker/clockpicker.js"></script>

	<script>
	
	
			
	function formSubmit(fromUrl,toUrl){
		
		var form = new FormData(document.getElementById('command'));
				
		$.ajax({
		    url: '/sales/cal/post',
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
	
	$(document).ready(function () {
		$('.colorPicker').colorpicker();
		
		$('.clockpicker').clockpicker();
		
		$('.date').datepicker({
			keyboardNavigation:false,
			forceParse:false,
			autoclose:true
		});
	});
	
	</script>

</body>
</html>