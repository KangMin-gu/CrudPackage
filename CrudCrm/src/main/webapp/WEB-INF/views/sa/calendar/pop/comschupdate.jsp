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
<!-- colorPicker -->
<link href="/resources/css/plugins/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet">

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
				<h2>일정수정</h2>
			</div>
		</div>


		<div class="wrapper wrapper-content  animated fadeInRight article">

			<div class="col-lg-12">
				<div class="ibox">

					<div class="ibox-content row">
					
						
						<div class="w-100 text-right mb-3">
							<Button class="btn btn-primary" onclick="formSubmit('/sales/cal/com/view/post/${schUpdate.COMSCHNO }','');">저장</Button>
						</div>
						<div class="box1 col-lg-12 col-xl-4 p-0">
							<table class="table table-bordered mb-0">
								<colgroup>
									<col style="width: 110px; background: #fafafa;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
								<form:form action="/sales/cal/com/view/post/${schUpdate.COMSCHNO }" method="post" id="comSchForm" onsubmit="return false;">	
									<tr>
										<th>스케쥴명</th>
										<td><input type="text" class="form-control" id="schname" name="schname" value="${schUpdate.SCHNAME }"></td>
									</tr>
									
									<tr>
										<th>영업명</th>
										<td>
											<div class="input-group sales" id="salename">
												<input type="text" class="form-control" autocomplete="off" name="salename" value="${schUpdate.SALENAME }" readonly>
                                                <input type="hidden" name="salesno" id="salesno" value="${schUpdate.SALESNO }">
                                                <span class="input-group-addon">
                                                    <a><i class="fa fa-search"></i></a>
                                                </span>
											</div>
										</td>
									</tr>								
																		
									<tr>
										<th>색상</th>
										<td><input type="text" class="form-control colorPicker" id="color" name="color" value="${schUpdate.COLOR }"/></td>
									</tr>
									
									<tr>
										<th>메모</th>
										 <td><textarea name="memo" id="memo"  class="form-control" style="resize:none;" rows="4">${schUpdate.MEMO }</textarea></td>
									</tr>
								</form:form>	
								</tbody>
							</table>
						</div>			
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	 <!-- Color picker -->
    <script src="/resources/js/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>

	<script>
	
	
			
	function formSubmit(fromUrl,toUrl){
		debugger;
		var form = new FormData(document.getElementById('comSchForm'));
				
		$.ajax({
		    url: fromUrl,
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
	});
	
	</script>

</body>
</html>