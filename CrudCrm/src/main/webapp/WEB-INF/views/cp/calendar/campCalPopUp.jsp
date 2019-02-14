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
							<a class="btn btn-primary" id="submitBtn" onclick="javascript:moveDetail();">캠페인 상세로 이동</a>
						</div>
						<div class="box1 col-lg-12 col-xl-4 p-0">
							<table class="table table-bordered mb-0">
								<colgroup>
									<col style="width: 110px; background: #fafafa;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									
									<tr>
										<th>캠페인명</th>
										<td>${campInfo.CAMPNAME }</td>
									</tr>
									
									<tr>
										<th>발송매체</th>
										<td>${campInfo.SENDTYPE_ }</td>
									</tr>								
									<tr>
										<th>담당자</th>
										<td>${campInfo.OWNER_ }</td>
									</tr>							
									<tr>
										<th>시작일정</th>
										<td>${campInfo.STARTDATE }</td>
									</tr>
									
									<tr>
										<th>종료일정</th>
										<td>${campInfo.ENDDATE }</td>
									</tr>
									<tr>
										<th>비고</th>
										 <td><textarea name="memo" id="memo"  class="form-control" style="resize:none;" rows="4" readonly>${campInfo.CAMPDESC }</textarea></td>
									</tr>
									<input type="hidden" id="no" name="no" value="${campInfo.CAMPNO }"/>
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
	<script src="${pageContext.request.contextPath}/resources/crud/crud_cp.js"></script>


</body>
</html>