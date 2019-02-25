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
				<h2>영업단계</h2>

			</div>

		</div>

		<!-- S: 고객 목록 ppt p01-->
		<div class="wrapper wrapper-content  animated fadeInRight article">

			<div class="col-lg-12">
				<div class="ibox">

					<div class="ibox-content row">
					<form:form action="/popsalestate/post" method="post" id="command" onsubmit="return false;">
						<input type="hidden" id="parentid" name="parentid" >
						<input type="hidden" id="salesno" name="salesno" value="${salesno }">
						<input type="hidden" id="prestate" name="prestate" value="${salestate }">
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
										<th>변경단계</th>
										<td>
											<select class="form-control" style="height: 23px;" id="state" name="state">
												<option value="1" >계약성공종료</option>
												<option value="2" >계약중</option>
												<option value="3" >제안서제출</option>
												<option value="4" >접촉중</option>
												<option value="5" >문의</option>
												<option value="6" >중도포기</option>
												<option value="7" >경쟁실패</option>
											</select>
										</td>
									</tr>								
									<tr>
										<th>변경사유</th>
										<td>
											<select class="form-control" style="height: 23px;" id="modreason" name="modreason">
												<option value="1" >영업진행</option>
												<option value="2" >업무중단</option>
												<option value="3" >폐업</option>
												<option value="4" >거래처요청</option>
												<option value="5" >기타</option>
											</select>
										</td>
									</tr>
									
									<tr>
										<th>확률</th>
										<td>
											<select class="form-control required validate percentV" style="height: 23px;" id="prob" name="prob">
                                                <c:forEach var="code" items="${PROB }">
                                                	<option label="${code.codename }" value="${code.codeval }"/>
                                            	</c:forEach>
                                            </select>
										</td>
									</tr>
									
									<tr>
										<th>비고</th>
										 <td><textarea name="ssdesc" id="ssdesc"  class="form-control" style="resize:none;" rows="4"></textarea></td>
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
		
			
	function formSubmit(){
				
		var form = new FormData(document.getElementById('command')); 
		
		$.ajax({
		    url: '/popsalestate/post',
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