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
					<form:form action="/popclicust/post/${cliCustUpdate.CLICUSTNO}" method="POST" id="command" onsubmit="return false;">
						<input type="hidden" id="parentid" name="parentid" >
						<input type="hidden" id="clino" name="clino" value="${cliCustUpdate.CLINO}">
						
						<div class="w-100 text-right mb-3">
							<Button class="btn btn-primary" onclick="formSubmit(${cliCustUpdate.CLICUSTNO});" >저장</Button>
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
											<div class="input-group" id="custname">
												<input type="text" class="form-control validate required nameV" autocomplete="off" name="custname"  readonly value="${cliCustUpdate.CUSTNAME}">
                                                <input type="hidden" name="custno" id="custno" value="${cliCustUpdate.CUSTNO}">
                                                <!-- <span class="input-group-addon">
                                                   <a><i class="fa fa-search"></i></a> 
                                                </span>고객명은 수정불가-->
											</div>
										</td>
									</tr>								
									<tr>
										<th>역할명</th>
										<td><input type="text" class="form-control validate allV" id="rolename" name="rolename" value="${cliCustUpdate.ROLENAME}"></td>
									</tr>
									<tr>
										<th>키맨여부</th>
										<td><select class="form-control" style="height: 23px;" id="keyman" name="keyman">
												<option value="0" ${cliCustUpdate.KEYMAN eq "0" ? "selected" :""}>선택</option>
												<option value="1" ${cliCustUpdate.KEYMAN eq "1" ? "selected" :""}>O</option>
												<option value="2" ${cliCustUpdate.KEYMAN eq "2" ? "selected" :""}>X</option>
										</select></td>
									</tr>
									
									<tr>
										<th>우호도</th>
										<td>
											<select class="form-control" style="height: 23px;" id="chksupport" name="chksupport">
												<option value="0" ${cliCustUpdate.CHKSUPPORT eq "0" ? "selected" :""}>선택</option>
												<option value="1" ${cliCustUpdate.CHKSUPPORT eq "1" ? "selected" :""}>우호</option>
												<option value="2" ${cliCustUpdate.CHKSUPPORT eq "2" ? "selected" :""}>중립</option>
												<option value="3" ${cliCustUpdate.CHKSUPPORT eq "3" ? "selected" :""}>적대</option>
											</select>
										</td>
									</tr>
									
									<tr>
										<th>메모</th>
										<td><textarea name="memo" id="memo"  class="form-control" style="resize:none;" rows="4">${cliCustUpdate.MEMO}</textarea></td>
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
	
	function formSubmit(prm){
		
		var urlStr = '/popclicust/post/'+prm; 
		var form = new FormData(document.getElementById('command'));
		
		$.ajax({
		    url: urlStr,
		    data: form,
		    dataType: 'json', 
		    processData: false, 
		    contentType: false, 
		    type: 'POST', 
		    
		    success: function(response){ 
		            	
		    opener.window.location.reload();
		    window.location.href = "/popclicust/view/"+prm;
		    }
		});
	}
	
	</script>

</body>
</html>