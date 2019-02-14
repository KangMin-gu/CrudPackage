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

<!-- Toastr style -->
<link href="/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">
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
				<h2>일정상세</h2>

			</div>

		</div>

		<!-- S: 고객 목록 ppt p01-->
		<div class="wrapper wrapper-content  animated fadeInRight article">

			<div class="col-lg-12">
				<div class="ibox">

					<div class="ibox-content row">
					
						<div class="w-100 text-right mb-3">
							<a class="btn btn-primary" href="/sales/cal/com/post/${schDetail.COMSCHNO }">수정</a>
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
										<td>${schDetail.SCHNAME }</td>
									</tr>
									
									<tr>
										<th>영업명</th>
										<td><a href="#" onclick="openNewWindow('영업','/sales/view/${schDetail.SALESNO }','','600','700');" >${schDetail.SALENAME }</a></td>
									</tr>								
																																
									<tr>
										<th>색상</th>
										<td><input type="text" class="form-control colorPicker" id="color" name="color" value="${schDetail.COLOR }" autocomplete="off" readonly/></td>
									</tr>
									
									<tr>
										<th>메모</th>
										 <td><textarea name="memo" id="memo"  class="form-control" style="resize:none;" rows="4" readonly>${schDetail.MEMO }</textarea></td>
									</tr>
									
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
    <script src="${pageContext.request.contextPath}/resources/js/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script>
	$(document).ready(function () {
		$('.colorPicker').colorpicker();
	});		
</script>		
</body>
</html>