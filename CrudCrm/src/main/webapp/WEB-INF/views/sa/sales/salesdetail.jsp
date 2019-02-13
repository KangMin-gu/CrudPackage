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
					<h2>영업 관리</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><a href="/sales">목록</a></li>
						<li class="breadcrumb-item active"><strong>상세 정보</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<!-- S: 영업관리 상세 -->
			<div class="wrapper wrapper-content  animated fadeInRight article">
				<div class="row justify-content-md-center">
					<div class="col-lg-12">
						<div class="ibox">
							<div class="ibox-title row border-0">
								<h4>기본 정보</h4>
							</div>
							<div class="ibox-content row">
							
								<div class="box col-12 tooltip-demo" style="padding-left: 0px;padding-right: 0px;">
									<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
										<!-- <a href="/sales" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="목록"><i class="fa fa-list"></i></a> -->
	                              		<a href="#" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="내부통지"><i class="fa fa-envelope"></i></a>
	                              		<a href="#" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="SMS" style="padding-top: 5px;padding-bottom: 5px;height: 33px;width: 39px;"><i class="fa fa-mobile" style="font-size:20px;"></i></a>												
	                          		</div>													
									<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
										<a href="/sales/post/${salesDetail.SALESNO }" class="btn btn-primary">수정</a>
										<c:if test="${sessionScope.CHKAUTH eq 30 || sessionScope.CHKAUTH eq 20 || sessionScope.USERNO eq salesDetail.OWNER }">  
										<a href="/sales/del/${salesDetail.SALESNO }" class="btn btn-primary">삭제</a> 
										<a href="/sales" class="btn btn-primary">목록</a>
										</c:if>
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
												<th>영업건명</th>
												<td>${salesDetail.SALENAME }</td>
											</tr>
											<tr>
												<th>현단계</th>
												<td>
													<c:choose>
														<c:when test="${salesDetail.SALESTATE eq 1 }">계약성공종료</c:when>
														<c:when test="${salesDetail.SALESTATE eq 2 }">계약중</c:when>
														<c:when test="${salesDetail.SALESTATE eq 3 }">제안서제출</c:when>
														<c:when test="${salesDetail.SALESTATE eq 4 }">접촉중</c:when>
														<c:when test="${salesDetail.SALESTATE eq 5 }">문의</c:when>
														<c:when test="${salesDetail.SALESTATE eq 6 }">중도포기</c:when>
														<c:when test="${salesDetail.SALESTATE eq 7 }">경쟁실패</c:when>
													</c:choose>
												</td>
											</tr>
											<tr>
												<th>예상수주일</th>
												<td>${salesDetail.FORDDATE }</td>
											</tr>
											<tr>
												<th>제품명</th>
												<td>${salesDetail.PRDNAME }</td>
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
												<th>영업담당자</th>
												<td>${salesDetail.USERNAME }</td>
											</tr>
											<tr>
												<th>현단계진입일</th>
												<td>${salesDetail.STATEDATE }</td>
											</tr>
											<tr>
												<th>예상수주액 (&#8361;)</th>
												<td id="fordamount_">
												<input type="hidden" id="fordamount" value="${salesDetail.FORDAMOUNT }">
												
												</td>
											</tr>
											<tr>
												<th>실수주일</th>
												<td>${salesDetail.RORDDATE }</td>
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
												<th>거래처명</th>
												<td>${salesDetail.CLINAME }</td>
											</tr>
											<tr>
												<th>확률 (&#37;)</th>
												<td>${salesDetail.PROB }</td>
											</tr>
											<tr>
												<th>영업건구분</th>
												<td>${salesDetail.CATEGORY }</td>
											</tr>
											<tr>
												<th>실수주액 (&#8361;)</th>
												<td id="rordamount_">
												<input type="hidden" id="rordamount" value="${salesDetail.RORDAMOUNT }">
												</td>
											</tr>
											
										</tbody>
									</table>
								</div>
							</div>
							<div class="ibox-title row">
								<h4>부가 정보</h4>
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
													<textarea name="textNote" id="textNote" class="form-control" style="resize: none;" rows="4" readOnly>${salesDetail.NEED }</textarea>
												</td>
											</tr>
											<tr>
												<th>고객사메모</th>
												<td>
													<textarea name="textNote" id="textNote" class="form-control" style="resize: none;" rows="4" readOnly>${salesDetail.CUSTMEMO }</textarea>
												</td>
											</tr>
											<tr>
												<th>거절사유</th>
												<td>
													<textarea name="textNote" id="textNote" class="form-control" style="resize: none;" rows="4" readOnly>${salesDetail.REFUSAL }</textarea>
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
													<textarea name="textNote" id="textNote" class="form-control" style="resize: none;" rows="4" readOnly>${salesDetail.SOLUTION }</textarea>
												</td>
											</tr>
											<tr>
												<th>영업메모</th>
												<td>
													<textarea name="textNote" id="textNote" class="form-control" style="resize: none;" rows="4" readOnly>${salesDetail.SALESMEMO }</textarea>
												</td>
											</tr>
											<tr>
												<th>극복방안</th>
												<td>
													<textarea name="textNote" id="textNote" class="form-control" style="resize: none;" rows="4" readOnly>${salesDetail.SURMOUNT }</textarea>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="ibox-content border-top-0 pt-lg-0"
								style="margin-left: -15px; margin-right: -15px;">
								<div class="tabs-container">
									<ul class="nav nav-tabs" role="tablist">
										<li><a class="nav-link active" data-toggle="tab" href="#tab1">관련고객</a></li>
										<li><a class="nav-link" onClick="javascript:tabTargetState(1);" data-toggle="tab" href="#tab2" >영업단계</a></li>
										<li><a class="nav-link"  onClick="javascript:tabTargetContect(1);"  data-toggle="tab" href="#tab3">고객접촉</a></li>
									</ul>
									<div class="tab-content">
																				<!-- 관련고객 -->
										<div role="tabpanel" id="tab1" class="tab-pane active">
											<div class="panel-body table-responsive">
												
												<div class="box col-12 tooltip-demo" style="padding-left: 0px; padding-right: 0px;"> <br>
													<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height: 2.00rem; padding-left: 0px;">
														
                                						<div class="form-group  row"><label class="col-sm-2 col-form-label" style="padding-top: 3px;padding-left:20px;"><strong>고객명</strong></label>
                            								<div class="col-sm-7">
                                								<input type="text" class="form-control" style="height: 27px;" name="custname" id="custname"  value="${searchVal.custname}"> 
                            								</div>                                
															<div class="col-sm-3 w-100" style="padding-left: 0px;">
																<a href="#" onClick="salesCustSearch(${salesDetail.SALESNO});" class="btn btn-primary" style="padding-top: 2px;">검색 </a> 
															</div>			
														</div>		
                                						
													</div>
													<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
										 				<Button class="btn btn-primary relcustBtn" id="salesno" value= "${salesDetail.SALESNO }">추가</Button>
													</div>
												</div>
																						
												<table class="table table-bordered" style="border-top: 1px solid #e7eaec;">
													<colgroup>
														<col style="width: 150px;" />
														<col style="width: 200px;" />
														<col style="width: 150px;" />
														<col style="width: 150px;" />
														<col style="width: 150px;" />
														<col style="width: 150px;" />
													</colgroup>
													<thead>
														<tr>
															<th>고객명</th>
															<th>직장명</th>
															<th>직책</th>
															<th>키맨여부</th>
															<th>역할</th>
															<th>메모</th>
														</tr>
													</thead>
													<tbody>
													
													<c:forEach var ="custList" items="${salesCustList }">
													<tr>
														<td><a href="#" onclick="window.open('/popsalescust/view/${custList.SALESCUSTNO}', '', 'width=600, height=500, scrollbars=yes, resizable'); return false;">${custList.CUSTNAME }</a></td>
														<td>${custList.CLINAME }</td>
														<td>${custList.DUTY }</td>
														<td>
															<c:choose>
																<c:when test="${custList.KEYMAN eq 1 }">O</c:when>
																<c:when test="${custList.KEYMAN eq 2 }">X</c:when>
															</c:choose>
														</td>
														<td>${custList.ROLENAME }</td>
														<td>${custList.MEMO }</td>
													</tr>
													</c:forEach>	
													</tbody>
												</table>
											
											
												<div class="m-auto" style="float:center;"> 
													<c:if test="${fn:length(salesCustList) ne 0 }"> 
													<ul class="pagination">
														<c:choose>
															<c:when test="${page.startPageNum ne 1 }">
																<li class="footable-page-arrow disabled">	
																	<a href='/sales/view/${salesDetail.SALESNO}?custname=${searchVal.custname }&pageNum=${page.startPageNum-1 }' >&laquo;</a>													
																</li>
															</c:when>
															<c:otherwise>
																<li class="disabled"><a href="javascript:">&laquo;</a>
																</li>
															</c:otherwise>
														</c:choose>
								
														<c:forEach var="i" begin="${page.startPageNum }" end="${page.endPageNum }">
															<c:choose>
																<c:when test="${i eq page.pageNum }">
																	<li class="footable-page active">
																		<a href = '/sales/view/${salesDetail.SALESNO}?custname=${searchVal.custname }&pageNum=${i }'>${i }</a>
																	</li>
																</c:when>
																<c:otherwise>
																	<li>
																		<a href = '/sales/view/${salesDetail.SALESNO}?custname=${searchVal.custname }&pageNum=${i }'>${i }</a>
																	</li>
																</c:otherwise>
															</c:choose>
														</c:forEach>
										
														<c:choose>
															<c:when test="${page.endPageNum lt page.totalPageCount }">
																<li>
																	<a href = '/sales/view/${salesDetail.SALESNO}?custname=${searchVal.custname }&pageNum=${page.endPageNum+1 }'>&raquo;</a>
																</li>
															</c:when>
															<c:otherwise>
																<li class="disabled"><a href="javascript:">&raquo;</a></li>
															</c:otherwise>
														</c:choose>
													</ul>
													</c:if> 
												</div> 
											
											</div>									
										</div>
										<div role="tabpanel" id="tab2" class="tab-pane ">
											<div class="panel-body table-responsive">
											
												<div class="box col-12 tooltip-demo" style="padding-left: 0px; padding-right: 0px;"> <br>
													<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height: 2.00rem; padding-left: 0px;">
														
                                						<div class="form-group  row"><label class="col-sm-2 col-form-label" style="padding-top: 3px;padding-left:20px;"><strong>변경단계</strong></label>
                            								<div class="col-sm-7">
                                								
																<select class="form-control required validate allV" style="height: 23px;" id="state" name="state">
																	<option label="선택" value="0">
																<c:forEach var="state" items="${STATE }">
                                                      				<c:choose>
                                                         				<c:when test="${searchVal.state eq state.codeval}">
                                                            				<option selected label="${state.codename }" value="${state.codeval }"/>
                                                         				</c:when>
                                                         				<c:otherwise>
                                                            				<option label="${state.codename }" value="${state.codeval }"/>
                                                         				</c:otherwise>
                                                      				</c:choose>
                                                   				</c:forEach>
																</select>	
																
                            								</div>                                
															<div class="col-sm-3 w-100" style="padding-left: 0px;">
																<a href="#" onClick="tabTargetState(1);" class="btn btn-primary" style="padding-top: 2px;padding-top: 2px;height: 24px;">검색 </a> 
															</div>			
														</div>		
                                						
													</div>
													<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
										 				<a href="#" class="btn btn-primary" id="saleStateBtn" onclick="saleStateInsert(${salesDetail.SALESNO },${salesDetail.SALESTATE });">추가</a>
													</div>
												</div>
											
											
												<table class="table table-bordered" style="border-top: 1px solid #e7eaec;">
													<colgroup>
														<col style="width: 200px;" />
														<col style="width: 200px;" />
														<col style="width: 150px;" />
														<col style="width: 300px;" />
														<col style="width: 200px;" />
													</colgroup>
													<thead>
														<tr>
															<th>변경일</th>
															<th>이전단계</th>
															<th>변경단계</th>
															<th>변경사유</th>
															<th>확률</th>
															<th>등록자</th>
														</tr>
													</thead>
													<tbody></tbody>
												</table>
												<div class="m-auto" style="float:center;">
													<ul class="pagination"></ul>
												</div>	
											</div>
										</div>
										
										<div role="tabpanel" id="tab3" class="tab-pane">
											<div class="panel-body table-responsive">
												

												<div class="box col-12 tooltip-demo" style="padding-left: 0px; padding-right: 0px;"> <br>
													<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height: 2.00rem; padding-left: 0px;">
                                						<div class="form-group  row"><label class="col-sm-2 col-form-label" style="padding-top: 3px;padding-left:20px;"><strong>고객명</strong></label>
                            								<div class="col-sm-7">
                                								<input type="text" class="form-control" style="height: 27px;" name="contcustname" id="contcustname"  value="${searchVal.contcustname}"> 
                            								</div>                                
															<div class="col-sm-3 w-100" style="padding-left: 0px;">
																<a href="#" onClick="tabTargetContect(1)" class="btn btn-primary" style="padding-top: 2px;">검색 </a> 
															</div>			
														</div>		
													</div>
												</div>

											
												<table class="table table-bordered" style="border-top: 1px solid #e7eaec;">
													<colgroup>
														<col style="width: 200px;" />
														<col style="width: 150px;" />
														<col style="width: 150px;" />
														<col style="width: 150px;" />
														<col style="width: 300px;" />
													</colgroup>
													<thead>
														<tr>
															<th>고객명</th>
															<th>접촉자</th>
															<th>접촉일</th>
															<th>접촉매체</th>
															<th>접촉메모</th>
														</tr>
													</thead>
													<tbody></tbody>
												</table>
												<div class="m-auto" style="float:center;">
												<ul class="pagination"></ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<!-- E: 영업관리 상세 -->
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
	
	</div>
	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_sa.js"></script>
	<script>
	$(document).ready(function(){
		$('#fordamount_').text( numberWithCommas($('#fordamount').val() ) );//금액 콤마 추가해서 보여주기
		$('#rordamount_').text( numberWithCommas($('#rordamount').val() ) );
	});
		
	</script>
</body>
</html>
