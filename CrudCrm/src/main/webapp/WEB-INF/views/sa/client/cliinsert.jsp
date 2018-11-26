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
<link
	href="${pageContext.request.contextPath}/resources/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">
<!-- S: 추가 CSS-->
<link
	href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<!--radioBox-->
<link
	href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<!--datePicker-->

</head>

<body>

	<div id="wrapper">

		<!-- leftside -->
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
		<!-- Top -->
		<div id="page-wrapper" class="gray-bg">
			<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>



			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>고객관리</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><strong>목록</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<!-- S: 거래처관리 추가/수정 -->
			<div class="wrapper wrapper-content  animated fadeInRight article">
				<div class="row justify-content-md-center">
					<div class="col-lg-12">
						<div class="ibox">
							<div class="ibox-content row">
								<div class="w-100 text-right mb-3 mt-3">
									<a href="javascript:void(0);" class="btn btn-primary">저장</a> <a
										href="javascript:void(0);" class="btn btn-primary">목록</a>
								</div>
								<div class="box1 col-lg-12 col-xl-4 p-0">
									<table class="table table-bordered mb-0">
										<colgroup>
											<col style="width: 110px; background: #fafafa;">
											<col style="width: auto;">
										</colgroup>
										<tbody>
											<tr>
												<th>거래처명<sup>*</sup></th>
												<td><input type="text" class="form-control"></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="box1 col-lg-12 col-xl-4 p-0">
									<table class="table table-bordered mb-0">
										<colgroup>
											<col style="width: 110px; background: #fafafa;">
											<col style="width: auto;">
										</colgroup>
										<tbody>
											<tr>
												<th>거래처호칭<sup>*</sup></th>
												<td><input type="text" class="form-control"></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="box2 col-lg-12 col-xl-4 p-0">
									<table class="table table-bordered mb-0">
										<colgroup>
											<col style="width: 110px; background: #fafafa;">
											<col style="width: auto;">
										</colgroup>
										<tbody>
											<tr>
												<th>영업담당자</th>
												<td>
													<div class="input-group">
														<input type="text" class="form-control"> <span
															class="input-group-addon"> <a
															href="javascript:void(0);"><i class="fa fa-search"></i></a>
														</span>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="box2 col-lg-12 col-xl-8 p-0">
									<table class="table table-bordered mb-0 border-top-0">
										<colgroup>
											<col style="width: 110px; background: #fafafa;">
											<col style="width: auto;">
										</colgroup>
										<tbody>
											<tr>
												<th class="border-top-0">주소</th>
												<td class="border-top-0">
													<div class="input-group col-lg-3 pl-0 float-left">
														<input type="text" class="form-control"> <span
															class="input-group-addon"> <a
															href="javascript:void(0);"><i class="fa fa-search"></i></a>
														</span>
													</div> <input type="text"
													class="form-control col-lg-4 float-left mr-3 mt-sx-1">
													<input type="text"
													class="form-control float-left col-lg-4 mt-sx-1">
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="box2 col-lg-12 col-xl-4 p-0">
									<table class="table table-bordered mb-0 border-top-0">
										<colgroup>
											<col style="width: 110px; background: #fafafa;">
											<col style="width: auto;">
										</colgroup>
										<tbody>
											<tr>
												<th class="border-top-0">중요도</th>
												<td class="border-top-0"><select class="form-control"
													style="height: 23px;">
														<option>A</option>
														<option>B</option>
														<option>C</option>
														<option>D</option>
														<option>E</option>
												</select></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="box2 col-lg-12 col-xl-4 p-0">
									<table class="table table-bordered mb-0 border-top-0">
										<colgroup>
											<col style="width: 110px; background: #fafafa;">
											<col style="width: auto;">
										</colgroup>
										<tbody>
											<tr>
												<th class="border-top-0">법인번호</th>
												<td class="border-top-0"><input type="text"
													class="form-control"></td>
											</tr>
											<tr>
												<th>대표전화</th>
												<td><input type="text" class="form-control"></td>
											</tr>
											<tr>
												<th>업태</th>
												<td><input type="text" class="form-control"></td>
											</tr>
											<tr>
												<th>회사규모</th>
												<td><select class="form-control" style="height: 23px;">
														<option>대기업</option>
														<option>중견기업</option>
														<option>중소기업</option>
														<option>소기업</option>
														<option>소상공인</option>
												</select></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="box2 col-lg-12 col-xl-4 p-0">
									<table class="table table-bordered mb-0 border-top-0">
										<colgroup>
											<col style="width: 110px; background: #fafafa;">
											<col style="width: auto;">
										</colgroup>
										<tbody>
											<tr>
												<th class="border-top-0">사업자번호</th>
												<td class="border-top-0"><input type="text"
													class="form-control"></td>
											</tr>
											<tr>
												<th>팩스번호</th>
												<td><input type="text" class="form-control"></td>
											</tr>
											<tr>
												<th>업종</th>
												<td><input type="text" class="form-control"></td>
											</tr>
											<tr>
												<th>밀착도</th>
												<td><select class="form-control" style="height: 23px;">
														<option>A</option>
														<option>B</option>
														<option>C</option>
														<option>D</option>
														<option>E</option>
												</select></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="box2 col-lg-12 col-xl-4 p-0">
									<table class="table table-bordered mb-0 border-top-0">
										<colgroup>
											<col style="width: 110px; background: #fafafa;">
											<col style="width: auto;">
										</colgroup>
										<tbody>
											<tr>
												<th class="border-top-0">대표자명</th>
												<td class="border-top-0"><input type="text"
													class="form-control"></td>
											</tr>
											<tr>
												<th>핸드폰</th>
												<td><select class="form-control col-3 float-left mr-2"
													style="height: 23px;">
														<option>010</option>
														<option>010</option>
														<option>010</option>
														<option>010</option>
												</select> <input type="text"
													class="form-control col-3 float-left mr-2"> <input
													type="text" class="form-control col-3 float-left">
												</td>
											</tr>
											<tr>
												<th>종목</th>
												<td><input type="text" class="form-control"></td>
											</tr>
											<tr>
												<th>국내/국외</th>
												<td><select class="form-control" style="height: 23px;">
														<option>국내</option>
														<option>국외</option>
												</select></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="box2 col-12 p-0">
									<table class="table table-bordered mb-0 border-top-0">
										<colgroup>
											<col style="width: 110px; background: #fafafa;">
											<col style="width: auto;">
										</colgroup>
										<tbody>
											<tr>
												<th class="border-top-0">메모</th>
												<td class="border-top-0"><textarea name="textNote"
														id="textNote" class="form-control"
														style="resize: none; height: 8em;"></textarea></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- E: 거래처관리 추가/수정 -->




			<!-- foot -->
			<div class="footer">
				<%@ include file="/WEB-INF/views/template/menu/foot.jsp"%>
			</div>
		</div>
		<!-- right side -->
		<div id="right-sidebar">
			<%@ include file="/WEB-INF/views/template/menu/rightside.jsp"%>
		</div>
	</div>

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<!-- S: 추가 js-->
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script>
	<!-- radioBox-->
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<!-- datePicker-->
	<script>
        $(document).ready(function () {
            // radioBox
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });

            // datePicker
            $('.date.date01, .date.date02').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true
            });
        });
    </script>
	<!-- E: 추가 js -->
</body>
</html>
