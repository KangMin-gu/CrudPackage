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
<link href="/resources/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">

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
				<h2>관련고객</h2>

			</div>

		</div>

		<!-- S: 고객 목록 ppt p01-->
		<div class="wrapper wrapper-content  animated fadeInRight article">

			<div class="col-lg-12">
				<div class="ibox">

					<div class="ibox-content row">
					<form:form action="/popsalescust/post" method="post" id="command" onsubmit="return false;">
						<input type="hidden" id="parentid" name="parentid" >
						<input type="hidden" id="clino" name="clino" value="${clino }">
						<div class="w-100 text-right mb-3">
							<Button class="btn btn-primary" id="submitBtn" onclick="formSubmit();">저장</Button>
						</div>
						<div class="box1 col-lg-12 col-xl-4 p-0">
							<table class="table table-bordered mb-0">
								<colgroup>
									<col style="width: 110px; background: #fafafa;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>고객명&nbsp;<b>&#42;</b></th>
										<td>
											<div class="input-group cust" id="custname">
												<input type="text" class="form-control validate required nameV" autocomplete="off" name="custname" readonly>
                                                <input type="hidden" name="custno" id="custno" value="0">
                                                <span class="input-group-addon">
                                                    <a><i class="fa fa-search"></i></a>
                                                </span>
											</div>
										</td>
									</tr>								
									<tr>
										<th>역할명</th>
										<td><input type="text" class="form-control validate allV" id="rolename" name="rolename"></td>
									</tr>
									<tr>
										<th>키맨여부</th>
										<td><select class="form-control" style="height: 23px;" id="keyman" name="keyman">
												<option value="0">선택</option>
												<option value="1">O</option>
												<option value="2">X</option>
										</select></td>
									</tr>
									
									<tr>
										<th>우호도</th>
										<td>
											<select class="form-control" style="height: 23px;" id="chksupport" name="chksupport">
												<option value="0">선택</option>
												<option value="1">우호</option>
												<option value="2">중립</option>
												<option value="3">적대</option>
											</select>
										</td>
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
	<!-- 유효성 -->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_validate.js"></script>
	<!-- sales JS -->
    <script src="${pageContext.request.contextPath}/resources/crud/crud_sa.js"></script>
	<script>
		
			
	function formSubmit(){
				
		var form = new FormData(document.getElementById('command'));
		
		$.ajax({
		    url: '/popclicust/post',
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