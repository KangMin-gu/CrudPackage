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
<link href="${pageContext.request.contextPath}/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">
<!-- S: 추가 CSS-->
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<!--radioBox-->
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
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
					<h2>거래처추가</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><a href="/sales/client">목록</a></li>
						<li class="breadcrumb-item active"><strong>추가</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<!-- S: 거래처관리 추가/수정 -->
			<div class="wrapper wrapper-content  animated fadeInRight article">
				<form:form id="command" action="/sales/client/post" method="POST">
					<div class="row justify-content-md-center">
						<div class="col-lg-12">
							<div class="ibox">
								<div class="ibox-content row">
								
								
									<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
										<div class="col-xl-8 col-lg-12 float-left alert alert-info w-100" id="reqMsgDiv" style="height:2.00rem;padding-top: 6px;overflow:hidden;" >
											<span id="reqDefaultMsg" title="필수 입력값을 확인해 주세요.&nbsp;&nbsp;(거래처명,거래처호칭 : 한글,영문,숫자,기호) " >
												<strong class='text-danger'>필수 입력값을 확인해 주세요. </strong>
											</span>
											<span id="reqSuccessMsg" style="display:none;"><Strong>필수값이 정상적으로 입력 되었습니다.</Strong></span>				
	                          			</div>
										<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
											<Strong><span id="showMsg"></span></Strong>				
	                          			</div>													
										<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
											<Button type="submit" class="btn btn-primary submit">저장</Button>
											<a href="/sales/client" class="btn btn-primary">목록</a>
										</div>
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
													<td>
														<input type="text" class="form-control error required validate simple" id="cliname" name="cliname">
													</td>
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
													<td>
														<input type="text" class="form-control error required validate simple" id="callname" name="callname">
													</td>
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
													<th>영업담당자<sup>*</sup></th>
													<td class="border-top-0 border-bottom-0">
														<div class="input-group owner">
															<input type="text" class="form-control" name="owner_" id="owner_" value="${clientInsert.USERNAME }" readOnly>
															<input type="hidden" name="owner" id="owner" value="${clientInsert.USERNO }">
															<span class="input-group-addon"> 
																<a><i class="fa fa-search"></i></a>
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
															<input type="text" class="form-control daumzip" name="cliaddr1" id="cliaddr1" readonly> 
															<span class="input-group-addon"> 
																<a href="#"> <i class="fa fa-search daumzip" id="cliaddr1"></i></a>
															</span>
														</div> 
														<input type="text" class="form-control col-lg-4 float-left mr-3 mt-sx-1" name="cliaddr2" id="cliaddr2" readonly> 
														<input type="text" class="form-control float-left col-lg-4 mt-sx-1 validate simple" name="cliaddr3" id="cliaddr3">
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
													<td class="border-top-0">
														<select class="form-control" style="height: 23px;" id="importance" name="importance">
															<option value="0">선택</option>
															<option value="1">A</option>
															<option value="2">B</option>
															<option value="3">C</option>
															<option value="4">D</option>
															<option value="5">E</option>
														</select>
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
													<th class="border-top-0">법인번호</th>
													<td class="border-top-0">
														<input type="text" class="form-control validate corp" id="corp_sn" name="corp_sn" data-mask="999999-999999">
													</td>
												</tr>
												<tr>
													<th>대표전화</th>
													<td>
														<!-- form select 공통으로 변경 --> 
														<select class="form-control col-4 float-left mr-3 validate phone1 phone-group" style="height: 1.45rem" id="telno1" name="telno1">
															<option value="">선택</option>
															<option value="02">02</option>
															<option value="070">070</option>
															<option value="010">010</option>
														</select> 
														<input type="text" class="form-control col-3 float-left mr-2 validate phone2 phone-group" id="telno2" name="telno2" > 
														<input type="text" class="form-control col-3 float-left validate phone3 phone-group" id="telno3" name="telno3">
													</td>
												</tr>
												<tr>
													<th>업태</th>
													<td><input type="text" class="form-control validate simple" id="bscond" name="bscond"></td>
												</tr>
												<tr>
													<th>회사규모</th>
													<td>
														<select class="form-control" style="height: 23px;" id="companysize" name="companysize">
															<option value="0">선택</option>
															<option value="1">대기업</option>
															<option value="2">중견기업</option>
															<option value="3">중소기업</option>
															<option value="4">소기업</option>
															<option value="5">소상공인</option>
														</select>
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
													<th class="border-top-0">사업자번호</th>
													<td class="border-top-0">
														<input type="text" class="form-control validate bs" id="bsno" name="bsno" data-mask="999-99-99999" >
													</td>
												</tr>
												<tr>
													<th>팩스번호</th>
													<td>
														<select class="form-control col-4 float-left mr-3 validate phone1 phone-group" style="height: 1.45rem" id="faxtel1" name="faxtel1">
															<option value="">선택</option>
															<option value="02">02</option>
															<option value="070">070</option>
															<option value="010">010</option>
														</select> 
														<input type="text" class="form-control col-3 float-left mr-2 validate phone2 phone-group" id="faxtel2" name="faxtel2"> 
														<input type="text" class="form-control col-3 float-left validate phone3 phone-group" id="faxtel3" name="faxtel3">
													</td>
												</tr>
												<tr>
													<th>업종</th>
													<td><input type="text" class="form-control validate simple" id="bstype" name="bstype"></td>
												</tr>
												<tr>
													<th>밀착도</th>
													<td>
														<select class="form-control" style="height: 23px;" id="friendly" name="friendly">
															<option value="0">선택</option>
															<option value="1">A</option>
															<option value="2">B</option>
															<option value="3">C</option>
															<option value="4">D</option>
															<option value="5">E</option>
														</select>
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
													<th class="border-top-0">대표자명</th>
													<td class="border-top-0">
														<input type="text" class="form-control validate name" id="prsdname" name="prsdname">
													</td>
												</tr>
												<tr>
													<th>핸드폰</th>
													<td>
														<select class="form-control col-3 float-left mr-2 validate phone1 phone-group" style="height: 23px;" id="mobile1" name="mobile1">
															<option value=""></option>
															<option value="010">010</option>
															<option value="016">016</option>
															<option value="017">017</option>
														</select> 
														<input type="text" class="form-control col-3 float-left mr-2 validate phone2 phone-group" id="mobile2" name="mobile2"> 
														<input type="text" class="form-control col-3 float-left validate phone3 phone-group" id="mobile3" name="mobile3">
													</td>
												</tr>
												<tr>
													<th>종목</th>
													<td><input type="text" class="form-control validate simple" id="bscategory" name="bscategory"></td>
												</tr>
												<tr>
													<th>국내/국외</th>
													<td>
														<select class="form-control" style="height: 23px;" id="internal" name="internal">
															<oprtion value="0">선택</oprtion>
															<option value="1">국내</option>
															<option value="2">국외</option>
														</select>
													</td>
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
													<td class="border-top-0">
														<textarea name="memo" id="memo" class="form-control" style="resize: none; height: 8em;"></textarea>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form:form>
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
	<!-- radioBox-->
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script>
	<!-- datePicker-->
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<!-- daum 주소 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	 <!-- Input Mask-->
    <script src="${pageContext.request.contextPath}/resources/js/plugins/jasny/jasny-bootstrap.min.js"></script>
	<!-- 유효성 -->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_validate.js"></script>
	
	<script>
		$(document).ready(function() {
			// radioBox
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green',
			});

			// datePicker
			$('.date.date01, .date.date02').datepicker({
				todayBtn : "linked",
				keyboardNavigation : false,
				forceParse : false,
				calendarWeeks : true,
				autoclose : true
			});
		});
	</script>
	<!-- E: 추가 js -->
</body>
</html>
