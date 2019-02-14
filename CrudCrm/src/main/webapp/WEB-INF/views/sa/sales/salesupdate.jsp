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
						<li class="breadcrumb-item active"><a href="/sales/view/${salesUpdate.SALESNO }">상세정보</a></li>
						<li class="breadcrumb-item active"><strong>수정</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<!-- S: 영업관리 추가/수정 -->
			<div class="wrapper wrapper-content  animated fadeInRight article">
				<form:form id="command" action="/sales/post/${salesUpdate.SALESNO }"
					method="POST">
					<div class="row justify-content-md-center">
						<div class="col-lg-12">
							<div class="ibox">
								<div class="ibox-title row border-0">
									<h4>기본정보</h4>
								</div>
								<div class="ibox-content row">
									
									<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
										<div class="col-xl-8 col-lg-12 float-left alert alert-info w-100" id="reqMsgDiv" style="height:2.00rem;padding-top: 6px;overflow:hidden;display:none;" >
											<span id="reqDefaultMsg" >
												<strong class='text-danger'>필수 입력값을 확인해 주세요. </strong>
											</span>
											<span id="reqSuccessMsg" style="display:none;"><Strong>필수값이 정상적으로 입력 되었습니다.</Strong></span>				
	                          			</div>
										<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
											<Strong><span id="showMsg"></span></Strong>				
	                          			</div>													
										<div class="w-100 text-right mb-3">
											<Button type="submit" class="btn btn-primary" id="submit">저장</Button>
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
														<input type="text" class="form-control validate required stringV" id="salename" name="salename" value="${salesUpdate.SALENAME }">
													</td>
												</tr>
												<tr>
													<th>현단계&nbsp;<b>&#42;</b></th>
													<td>
														<select class="form-control required validate allV" style="height: 23px;" id="salestate" name="salestate">
														
															<c:forEach var="state" items="${STATE }">
                                                      			<c:choose>
                                                         			<c:when test="${salesUpdate.SALESTATE eq state.codeval}">
                                                            			<option selected label="${state.codename }" value="${state.codeval }"/>
                                                         			</c:when>
                                                         			<c:otherwise>
                                                            			<option label="${state.codename }" value="${state.codeval }"/>
                                                         			</c:otherwise>
                                                      			</c:choose>
                                                   			</c:forEach>
														
														</select>
													</td>
												</tr>
												<tr>
													<th>예상수주일</th>
													<td>
														<div class="input-group p-0">
															<div class="input-group date date01">
																<span class="input-group-addon">
																	<i class="fa fa-calendar"></i>
																</span> 
																<input type="text" class="form-control validate dateV" id="forddate" name="forddate" value="${salesUpdate.FORDDATE }" data-mask="9999-99-99">
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th>제품명</th>
													<td>
														<input type="text" class="form-control validate stringV" id="prdname" name="prdname" value="${salesUpdate.PRDNAME }">
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
													<th>영업담당자<b>&#42;</b></th>
													<td>
														<div class="input-group owner" id="username">
															<input type="text" class="form-control required validate nameV" autocomplete="off" name="username"  value="${salesUpdate.USERNAME }" readonly> 
															<input type="hidden" name="owner" id="owner" value="${salesUpdate.OWNER }"> 
															<span class="input-group-addon"> 
																<a><i class="fa fa-search"></i></a>
															</span>
														</div>
													</td>
												</tr>
												<tr>
													<th>현단계진입일</th>
													<td>
														<div class="input-group p-0">
															<div class="input-group date date01">
																<span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
																<input type="text" class="form-control validate dateV beforeV" id="statedate" name="statedate" value="${salesUpdate.STATEDATE }" data-mask="9999-99-99">
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th>예상수주액</th>
													<td>
														<input type="text" class="form-control validate costV" id="fordamount_" name="fordamount_" placeholder="0 ~ 10,000,000,000" >
														<input type="hidden" id="fordamount" name="fordamount" value="${salesUpdate.FORDAMOUNT }">
													</td>
												</tr>
												<tr>
													<th>실수주일</th>
													<td>
														<div class="input-group p-0">
															<div class="input-group date date01">
																<span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
																<input type="text" class="form-control validate dateV" id="rorddate" name="rorddate" value="${salesUpdate.RORDDATE }" data-mask="9999-99-99">
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
														<div class="input-group">
															<input type="text" class="form-control cli validate required allV" id="cliname" name="cliname" value="${salesUpdate.CLINAME }" readonly>
															<input type="hidden" id="clino" name="clino" value="${salesUpdate.CLINO }"> 
															<span class="input-group-addon"> 
																<a href="javascript:void(0);"><i class="fa fa-search cli"></i></a>
															</span>
														</div>
													</td>
												</tr>
												<tr>
													<th>확률 (&#37;)</th>
													<td>
														<select class="form-control validate percentV" style="height: 23px;" id="prob" name="prob">
														<c:forEach var="prob" items="${PROB }">
                                                      		<c:choose>
                                                         		<c:when test="${salesUpdate.PROB eq prob.codeval}">
                                                            		<option selected label="${prob.codename }" value="${prob.codeval }"/>
                                                         		</c:when>
                                                         		<c:otherwise>
                                                            	<option label="${prob.codename }" value="${prob.codeval }"/>
                                                         		</c:otherwise>
                                                      		</c:choose>
                                                   		</c:forEach>
                                                   		</select>
													</td>
												</tr>
												<tr>
													<th>영업건구분</th>
													<td>
														<input type="text" class="form-control validate stringV" id="category" name="category" value="${salesUpdate.CATEGORY }">
													</td>
												</tr>
												<tr>
													<th>실수주액</th>
													<td>
														<input type="text" class="form-control validate costV" id="rordamount_" name="rordamount_" placeholder="0 ~ 10,000,000,000" >
														<input type="hidden" id="rordamount" name="rordamount" value="${salesUpdate.RORDAMOUNT }">
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
														<textarea name="need" id="need" class="form-control" style="resize: none;" rows="4">${salesUpdate.NEED }</textarea>
													</td>
												</tr>
												<tr>
													<th>고객사메모</th>
													<td>
														<textarea name="custmemo" id="custmemo" class="form-control" style="resize: none;" rows="4">${salesUpdate.CUSTMEMO }</textarea>
													</td>
												</tr>
												<tr>
													<th>거절사유</th>
													<td>
														<textarea name="refusal" id="refusal" class="form-control" style="resize: none;" rows="4">${salesUpdate.REFUSAL }</textarea>
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
														<textarea class="form-control" style="resize: none;" rows="4" id="solution" name="solution">${salesUpdate.SOLUTION }</textarea>
													</td>
												</tr>
												<tr>
													<th>영업메모</th>
													<td>
														<textarea class="form-control" style="resize: none;" rows="4" id="salesmemo" name="salesmemo">${salesUpdate.SALESMEMO }</textarea>
													</td>
												</tr>
												<tr>
													<th>극복방안</th>
													<td>
														<textarea name="surmount" id="surmount" class="form-control" style="resize: none;" rows="4">${salesUpdate.SURMOUNT }</textarea>
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
		 
         $('#fordamount_').val( numberWithCommas($('#fordamount').val() ) );
         $('#rordamount_').val( numberWithCommas($('#rordamount').val() ) );
	 });
	 </script>
</body>
</html>
