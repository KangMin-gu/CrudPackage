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
				<h2>블랙 추가</h2>

			</div>

		</div>

		<!-- S: 고객 목록 ppt p01-->
		<div class="wrapper wrapper-content  animated fadeInRight article">

			<div class="col-lg-12">
				<div class="ibox">

					<div class="ibox-content row">
						<form:form method="post" id="command" onsubmit="return false;">
							<input type="hidden" id="parentid" name="parentid" value="">
							<div class="w-100 text-right mb-3">
								<Button class="btn btn-primary" type="submit" onclick="blackSubmit('/vc/black/post','');">추가</Button>
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
											<td><input type="text" class="form-control"
												id="custname" name="custname" readonly> <input
												type="hidden" id="custno" name="custno" value="0"></td>
										</tr>
										<tr>
											<th>수신번호</th>
											<td><input type="text" class="form-control"
												id="receiveno" name="receiveno" readonly></td>
										</tr>
										<tr>
											<th>타입</th>
											<td><select class="form-control" name="blacktype"
												id="blacktype">
													<option value="1">욕설</option>
													<option value="2">성희롱</option>
													<option value="3">기타</option>
											</select></td>
										</tr>

										<tr>
											<th>메모</th>
											<td><textarea name="memo" id="memo" class="form-control"
													style="resize: none;" rows="4"></textarea></td>
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
		$(document).ready(function() {
			$('#custname').val(opener.$('#custname').val());
			$('#custno').val(opener.$('#custno').val());
			$('#receiveno').val(opener.$('#phone').val());

		});

		function blackSubmit(fromUrl, toUrl) {
			debugger;
			var form = new FormData(document.getElementById('command'));
			var urlStr = 
			$.ajax({
				url : '/vc/black/post',
				data : form,
				dataType : 'json',
				processData : false,
				contentType : false,
				type : 'POST',

				success : function(response) {
					opener.window.location.reload();
					window.close();
				}
			});
		}
	</script>

</body>
</html>