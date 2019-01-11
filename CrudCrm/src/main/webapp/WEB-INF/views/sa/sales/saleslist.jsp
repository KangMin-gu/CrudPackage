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
<!--datePicker-->
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<!-- Toastr style -->
<link href="${pageContext.request.contextPath}/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">
<!--radioBox-->
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<!-- Text spinners style -->
<link href="${pageContext.request.contextPath}/resources/css/plugins/textSpinners/spinners.css" rel="stylesheet">
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
						<li class="breadcrumb-item active"><strong>목록</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<!-- S: 영업관리 리스트-->
			<div class="wrapper wrapper-content  animated fadeInRight article">
				<div class="row justify-content-md-center">
					<div class="col-lg-12">
						<div class="ibox">
							<form:form id="command" action="/sales" method="GET">
							<div class="ibox-content row" style="padding-bottom: 0px;">

								<div class="w-100 text-right mb-3 mt-3">
									<Button type="submit" class="btn btn-primary">검색</Button>
									<a href="javascript:void(0);" class="btn btn-primary resets">초기화</a>
								</div>

								<div class="box1 col-lg-12 col-xl-6 p-0">
									<table class="table table-bordered mb-0">
										<colgroup>
											<col style="width: 110px; background: #fafafa;">
											<col style="width: auto;">
										</colgroup>
										<tbody>
											<tr>
												<th class="border-top-0">예상수주일</th>
												<td class="border-top-0" style="padding: 7px 8px;">
													<div class="input-group p-0">
														<div class="d-flex date date01 col-lg-5 col-md-5 p-0 col-5">
															<span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
															<input type="text"class="form-control reset" id="fromforddt" name="fromforddt" value="${searchVal.fromforddt }" autocomplete="off">
														</div>
														<h3 class="text-center col-lg-1 col-1 p-0">~</h3>
														<div class="d-flex date date02 col-lg-5 col-md-5 p-0 col-5">
															<span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
															<input type="text" class="form-control reset" id="toforddt" name="toforddt" value="${searchVal.toforddt }" autocomplete="off">
														</div>
														</div>
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
													<th class="border-top-0">실수주일</th>
													<td class="border-top-0" style="padding: 7px 8px;">
														<div class="input-group p-0">
															<div class="d-flex date date01 col-lg-5 col-md-5 p-0 col-5">
																<span class="input-group-addon"> <i class="fa fa-calendar"></i> </span> 
																<input type="text" class="form-control reset" id="fromrorddt" name="fromrorddt" value="${searchVal.fromrorddt }" autocomplete="off">
															</div>
															<h3 class="text-center col-lg-1 col-1 p-0">~</h3>
															<div class="d-flex date date02 col-lg-5 col-md-5 p-0 col-5">
																<span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
																<input type="text" class="form-control reset" id="tororddt" name="tororddt" value="${searchVal.tororddt }" autocomplete="off">
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box1 col-lg-12 col-xl-6 p-0">
										<table class="table table-bordered mb-0 border-top-0">
											<colgroup>
												<col style="width: 110px; background: #fafafa;">
												<col style="width: auto;">
												<col style="width: 110px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th class="border-top-0">영업건명</th>
													<td class="border-top-0">
														<input type="text" class="form-control reset" id="salename" name="salename" value="${searchVal.salename }"></td>
													<th class="border-top-0">영업담당자</th>
													<td class="border-top-0">
														<div class="input-group">
															<input type="text" class="form-control owner" name="username" id="username" value="${searchVal.username }" readonly> 
															<input class="reset" type="hidden" id="owner" name="owner" value="${searchVal.owner }" /> 
															<span class="input-group-addon"> <a><i class="fa fa-search owner"></i></a></span>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box1 col-lg-12 col-xl-6 p-0">
										<table class="table table-bordered mb-0 border-top-0">
											<colgroup>
												<col style="width: 110px; background: #fafafa;">
												<col style="width: auto;">
												<col style="width: 110px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th class="border-top-0">거래처명</th>
													<td class="border-top-0">
														<div class="input-group">
															<input type="text" class="form-control cli reset" name="cliname" id="cliname" value="${searchVal.cliname }" readonly> 
															<input class="reset" type="hidden" name="clino" id="clino" value="${searchVal.clino }"> 
															<span class="input-group-addon"> <a><i class="fa fa-search cli"></i></a></span>
														</div>
													</td>
													<th class="border-top-0">현단계</th>
													<td class="border-top-0">
														<select class="form-control reset" style="height: 23px;" id="salestate" name="salestate">
															<option value="0" ${searchVal.salestate eq "0" ? "selected" :""}>선택</option>
															<c:forEach var="state" items="${STATE }">
																<c:choose>
																	<c:when test="${searchVal.salestate eq state.codeval}">
																		<option selected label="${state.codename }" value="${state.codeval }" />
																	</c:when>
																	<c:otherwise>
																		<option label="${state.codename }" value="${state.codeval }" />
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</select>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									</form:form>

								<div class="box col-12 tooltip-demo" style="padding-left: 0px; padding-right: 0px;"> <br>
									<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height: 2.00rem; padding-left: 0px;">
										<button type="button" class="btn btn-default" data-toggle="modal" data-target="#exModal"  id="excelBtn" onClick ><i class="fa fa-file-excel-o" ></i></button>
                             			<input type="hidden" id="excelUrl" name="excelUrl" value="/salesexcel">
                             			<input type="hidden" id="searchFormId" name="searchFormId" value="command"> 
									</div>
									<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
										<a href="/sales/post" class="btn btn-primary">추가</a>
										<c:if test="${sessionScope.CHKAUTH eq 30 || sessionScope.CHKAUTH eq 20  }"> 
										<Button class="btn btn-primary" onClick="goSalesDel()">삭 제</Button> 
										</c:if>
									</div>
								</div>
							</div>
							
							<div class="modal inmodal" id="exModal" tabindex="-1" role="dialog"  aria-hidden="true" data-backdrop="static">
                                	<div class="modal-dialog" >
                                    	<div class="modal-content animated fadeIn">
                                        	<div class="modal-header">
                                            	<div class="h1 m-t-xs text-navy">
                                					<span class="loading hamburger"></span>
                            					</div>
                                        	</div>
                                        	<div class="modal-body" style="text-align:center">
                                        		<p><strong>엑셀 다운로드 중 입니다.</strong></p>
                                        	</div>
                                        	<div class="modal-footer">
                                            	<button type="button" class="btn btn-white" data-dismiss="modal" id="modalCloseBtn" style="display: none;">확인</button>
                                        	</div>
                                    	</div>
                                	</div>
                            	</div> 
							
							
							
						<div class="ibox-content row border-top-0 pt-lg-0">
							<div class="table-responsive">
								<form:form class="checkBoxForm" id="commandCheck" action="/sales/del" method="PUT">
								<table class="table table-bordered" style="border-top: 1px solid #e7eaec;">
								<colgroup>
									<col style="width: 40px;" />
									<col style="width: 250px" />
									<col style="width: 200px" />
									<col style="width: 120px" />
									<col style="width: 120px" />
									<col style="width: 120px" />
									<col style="width: 120px" />
								</colgroup>
								<thead>
									<tr>
										<th><input type="checkbox" class="i-checks" id="icheckAll" name="icheckAll"></th>
										<th>영업건명</th>
										<th>거래처명</th>
										<th>예상수주일</th>
										<th>실수주일</th>
										<th>현단계</th>
										<th>영업담당자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${salesList }">
										<tr>
											<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
												<input type="checkbox" class="i-checks chksquare" id="salesno" name="salesno" value="${list.SALESNO}">
											</td>
											<td><a href="/sales/view/${list.SALESNO }">${list.SALENAME }</a></td>
											<td>${list.CLINAME }</td>
											<td>${list.FORDDATE }</td>
											<td>${list.RORDDATE }</td>
											<td>
												<c:choose>
													<c:when test="${list.SALESTATE eq 1 }">계약성공종료</c:when>
													<c:when test="${list.SALESTATE eq 2 }">계약중</c:when>
													<c:when test="${list.SALESTATE eq 3 }">제안서제출</c:when>
													<c:when test="${list.SALESTATE eq 4 }">접촉중</c:when>
													<c:when test="${list.SALESTATE eq 5 }">문의</c:when>
													<c:when test="${list.SALESTATE eq 6 }">중도포기</c:when>
													<c:when test="${list.SALESTATE eq 7 }">경쟁실패</c:when>
												</c:choose>
											</td>
											<td>${list.USERNAME }</td>
										</tr>
									</c:forEach>
									</tbody>
									<tfoot>
								</table>
								</form:form>
							</div>

							<div class="m-auto">
							
								<ul class="pagination">
									<c:choose>
										<c:when test="${page.startPageNum ne 1 }">
											<li class="footable-page-arrow disabled"><a href='/sales?salename=${searchVal.salename }&clino=${searchVal.clino }&username=${searchVal.username }&owner=${searchVal.owner }&fromregdt=${searchVal.fromregdt}&toregdt=${searchVal.toregdt }&salestate=${searchVal.salestate }&pageNum=${page.startPageNum-1 }'>&laquo;</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a href="javascript:">&laquo;</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="i" begin="${page.startPageNum }" end="${page.endPageNum }">
										<c:choose>
											<c:when test="${i eq page.pageNum }">
												<li class="footable-page active">
													<a href='/sales?salename=${searchVal.salename }&clino=${searchVal.clino }&username=${searchVal.username }&owner=${searchVal.owner }&fromregdt=${searchVal.fromregdt}&toregdt=${searchVal.toregdt }&salestate=${searchVal.salestate }&pageNum=${i }'>${i }</a>
												</li>
											</c:when>
											<c:otherwise>
												<li>
													<a href='/sales?salename=${searchVal.salename }&clino=${searchVal.clino }&username=${searchVal.username }&owner=${searchVal.owner }&fromregdt=${searchVal.fromregdt}&toregdt=${searchVal.toregdt }&salestate=${searchVal.salestate }&pageNum=${i }'>${i }</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:choose>
										<c:when test="${page.endPageNum lt page.totalPageCount }">
											<li>
											<a href='/sales?salename=${searchVal.salename }&clino=${searchVal.clino }&username=${searchVal.username }&owner=${searchVal.owner }&fromregdt=${searchVal.fromregdt}&toregdt=${searchVal.toregdt }&salestate=${searchVal.salestate }&pageNum=${page.endPageNum+1 }'>&raquo;</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a href="javascript:">&raquo;</a></li>
										</c:otherwise>
									</c:choose>
								</ul>

							</div>
							<h4 class="float-right">&middot; 총 자료수 : ${page.totalRows }건</h4>
						</div>
					</div>
				</div>
			</div>
		</div>




	<!-- foot -->
		<div class="footer">
			<%@ include file="/WEB-INF/views/template/menu/foot.jsp"%>
		</div>
	</div>
	<!-- right side -->
	<div id="right-sidebar">
		<%@ include file="/WEB-INF/views/template/menu/rightside.jsp"%>
	</div>
	

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery-ui/jquery-ui.min.js"></script> 	
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datePicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script><!-- radioBox-->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_sa.js"></script><!-- 영업js -->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_file.js"></script>	<!-- file download -->
	<script>
			
		$(document).ready(function() {
			
			// icecks
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green'
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
</body>
</html>
