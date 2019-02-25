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
					<form:form action="/popclicust/post" method="post" id="command" onsubmit="return false;">
						<input type="hidden" id="parentid" name="parentid" >

						<div class="w-100 text-right mb-3">
							<a class="btn btn-primary" href="/popclicust/post/${cliCustDetail.CLICUSTNO}">수정</a>
							<a class="btn btn-primary" onclick="goCliCustDel(${cliCustDetail.CLICUSTNO});">삭제</a>
							<a class="btn btn-primary" href="/cust/view/${cliCustDetail.CUSTNO}">고객상세이동</a>
						</div>
						<div class="box1 col-lg-12 col-xl-4 p-0">
							<table class="table table-bordered mb-0">
								<colgroup>
									<col style="width: 110px; background: #fafafa;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>고객명</th>
										<td>${cliCustDetail.CUSTNAME }</td>
									</tr>								
									<tr>
										<th>역할명</th>
										<td>${cliCustDetail.ROLENAME }</td>
									</tr>
									<tr>
										<th>키맨여부</th>
										<td>
											<c:choose>
												<c:when test="${cliCustDetail.KEYMAN eq 1 }">O</c:when>
												<c:when test="${cliCustDetail.KEYMAN eq 2 }">X</c:when>
											</c:choose>
										</td>
									</tr>
									
									<tr>
										<th>우호도</th>
										<td>
											<c:choose>
												<c:when test="${cliCustDetail.CHKSUPPORT eq 1 }">우호적</c:when>
												<c:when test="${cliCustDetail.CHKSUPPORT eq 2 }">중립</c:when>
												<c:when test="${cliCustDetail.CHKSUPPORT eq 3 }">적대적</c:when>
											</c:choose>
										</td>
									</tr>
									
									<tr>
										<th>메모</th>
										<td><textarea name="memo" id="memo"  class="form-control" style="resize:none;" rows="4" readonly>${cliCustDetail.MEMO }</textarea></td>
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

	<script>
	
	//관련고객 삭제 후 팝업 창 닫힘.
	function goCliCustDel(prm){
		
		var urlStr = "/popclicust/del/"+prm;
		
		$.ajax({
		    url: urlStr,
		    dataType: 'json', 
		    processData: false, 
		    contentType: false, 
		    type: 'GET', 
		    
		    success: function(response){ 
		            	
		    	opener.window.location.reload();
				window.close();	
		    }
		});		
	}
	
	</script>

</body>
</html>