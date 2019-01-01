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
					<h2>영업관리</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><a href="/sales">목록</a></li>
						<li class="breadcrumb-item active"><strong>추가</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<!-- S: 영업관리 추가/수정 -->
			<div class="wrapper wrapper-content  animated fadeInRight article">
				<form:form id="command" action="/sales/post" method="POST">
					<div class="row justify-content-md-center">
						<div class="col-lg-12">
							<div class="ibox">
								<div class="ibox-title row border-0">
									<h4>기본정보</h4>
								</div>
								<div class="ibox-content row">
															
									<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
										<div class="col-xl-8 col-lg-12 float-left alert alert-info w-100" id="reqMsgDiv" style="height:2.00rem;padding-top: 6px;overflow:hidden;" >
											<span id="reqDefaultMsg" >
												<strong class='text-danger'>필수 입력값을 확인해 주세요. </strong>
											</span>
											<span id="reqSuccessMsg" style="display:none;"><Strong>필수값이 정상적으로 입력 되었습니다.</Strong></span>				
	                          			</div>
										<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
											<Strong><span id="showMsg"></span></Strong>				
	                          			</div>													
										<div class="w-100 text-right mb-3">
											<Button type="submit" class="btn btn-primary submit" id="submit">저장</Button>
											<a href="/sales" class="btn btn-primary">목록</a>
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
													<th>영업건명&nbsp;<b>&#42;</b></th>
													<td>
														<input type="text" class="form-control error validate required allV" id="salename" name="salename"></td>
												</tr>
												<tr>
													<th>현단계&nbsp;<b>&#42;</b></th>
													<td>
														<select class="form-control required validate allV" style="height: 23px;" id="salestate" name="salestate">
                                                			<c:forEach var="code" items="${STATE }">
                                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                                   			</c:forEach>
                                                		</select>	
													</td>
												</tr>
												<tr>
													<th>예상수주일</th>
													<td>
														<div class="input-group p-0">
															<div class="input-group date date01">
																<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
																<input type="text" class="form-control validate dateV" id="forddate" name="forddate" data-mask="9999-99-99">
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th>제품명</th>
													<td>
														<input type="text" class="form-control validate stringV" id="prdname" name="prdname">
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
													<th>영업담당자&nbsp;<b>&#42;</b></th>
													<td>
														<div class="input-group owner" id="owner_">
															<input type="text" class="form-control validate required allV" autocomplete="off" name="owner_"  value="${salesInsert.USERNAME }" readonly>
															<input type="hidden" name="owner" id="owner" value="${salesInsert.USERNO }">
															<span class="input-group-addon"> <a><i class="fa fa-search"></i></a> </span>
														</div>
													</td>
												</tr>
												<tr>
													<th>현단계진입일</th>
													<td>
														<div class="input-group p-0">
															<div class="input-group date date01">
																<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
																<input type="text" class="form-control validate dateV beforeV" id="statedate" name="statedate" data-mask="9999-99-99">
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th>예상수주액 (&#8361;)</th>
													<td>
													<input type="text" class="form-control validate costV" id="fordamount_" name="fordamount_" placeholder="0 ~ 10,000,000,000">
													<input type="hidden" id="fordamount" name="fordamount">
													</td>
												</tr>
												<tr>
													<th>실수주일</th>
													<td>
														<div class="input-group p-0">
															<div class="input-group date date01">
																<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
																<input type="text" class="form-control validate dateV" id="rorddate" name="rorddate" data-mask="9999-99-99">
															</div>
														</div>
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
													<th>거래처명&nbsp;<b>&#42;</b></th>
													<td>
														<div class="input-group cli" id="cliname">
															<input type="text" class="form-control error validate required allV"  name="cliname" readonly> 
															<input type="hidden" id="clino" name="clino"> 
															<span class="input-group-addon">
																<a href="javascript:void(0);"><i class="fa fa-search cli"></i></a>
															</span>
														</div>
													</td>
												</tr>
												<tr>
													<th>확률 (&#37;)</th>
													<td>
														<select class="form-control required validate percentV" style="height: 23px;" id="prob" name="prob">
                                                			<c:forEach var="code" items="${PROB }">
                                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                                   			</c:forEach>
                                                		</select>
													</td>
												</tr>
												<tr>
													<th>영업건구분</th>
													<td>
														<input type="text" class="form-control validate stringV" id="category" name="category">
													</td>
												</tr>
												<tr>
													<th>실수주액 (&#8361;)</th>
													<td>
														<input type="text" class="form-control validate costV" id="rordamount_" name="rordamount_" placeholder="0 ~ 10,000,000,000">
														<input type="hidden" id="rordamount" name="rordamount">
													</td>
												</tr>
												
											</tbody>
										</table>
									</div>
								</div>
								<div class="ibox-title row">
									<h4>부가사항</h4>
								</div>
								<div class="ibox-content row">
									<div class="box1 col-lg-12 col-xl-6 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 110px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th>요구사항</th>
													<td>
														<textarea name="need" id="need" class="form-control" style="resize: none;" rows="4"></textarea>
													</td>
												</tr>
												<tr>
													<th>고객사메모</th>
													<td>
														<textarea name="custmemo" id="custmemo" class="form-control" style="resize: none;" rows="4"></textarea>
														</td>
												</tr>
												<tr>
													<th>거절사유</th>
													<td>
														<textarea name="refusal" id="refusal" class="form-control" style="resize: none;" rows="4"></textarea>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box1 col-lg-12 col-xl-6 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 110px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th>해결방안</th>
													<td>
														<textarea class="form-control" style="resize: none;" rows="4" id="solution" name="solution"></textarea>
													</td>
												</tr>
												<tr>
													<th>영업메모</th>
													<td>
														<textarea  class="form-control" style="resize: none;" rows="4" id="salesmemo" name="salesmemo"></textarea>
													</td>
												</tr>
												<tr>
													<th>극복방안</th>
													<td>
														<textarea name="surmount" id="surmount" class="form-control" style="resize: none;" rows="4"></textarea>
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
			<!-- E: 영업관리 추가/수정 -->

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
	<!-- datePicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<!-- 유효성 -->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_validate.js"></script>
	<!-- Input Mask-->
    <script src="${pageContext.request.contextPath}/resources/js/plugins/jasny/jasny-bootstrap.min.js"></script>
    <!-- sales JS -->
    <script src="${pageContext.request.contextPath}/resources/crud/crud_sa.js"></script>
    
    
	<script>
	 $(document).ready(function(){
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
</body>
</html>
