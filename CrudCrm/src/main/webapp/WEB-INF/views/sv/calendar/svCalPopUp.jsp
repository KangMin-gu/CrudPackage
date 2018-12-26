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
							<a class="btn btn-primary" id="submitBtn" onclick="modeDetail();">서비스 상세로 이동</a>
						</div>
						<div class="box1 col-lg-12 col-xl-4 p-0">
							<table class="table table-bordered mb-0">
								<colgroup>
									<col style="width: 110px; background: #fafafa;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>서비스명</th>
										<td>${serviceInfo.SERVICENAME }</td>
									</tr>
									
									<tr>
										<th>진행 단계</th>
										<td>${serviceInfo.SERVICESTEP_ }</td>
									</tr>								
									<tr>
										<th>접수자</th>
										<td>${serviceInfo.SERVICEOWNER_ }</td>
									</tr>							
									<tr>
										<th>담당자</th>
										<td>${serviceInfo.OWNER_ }</td>
									</tr>
									<tr>
										<th>비고</th>
										 <td><textarea name="servicedesc" id="servicedesc"  class="form-control" style="resize:none;" rows="4" readonly>${serviceInfo.SERVICEDESC }</textarea></td>
										 <input type="hidden" name="no" id="no" value="${serviceInfo.SERVICENO }"/>
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
	<script src="${pageContext.request.contextPath}/resources/crud/crud_sv.js"></script>

</body>
</html>