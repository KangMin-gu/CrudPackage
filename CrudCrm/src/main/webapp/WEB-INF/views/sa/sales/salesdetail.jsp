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
						<li class="breadcrumb-item active"><strong>영업상세</strong></li>
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
								<h4>기본정보</h4>
							</div>
							<div class="ibox-content row">
								<div class="w-100 text-right mb-3">
									<a href="/sales/post/${salesDetail.SALESNO }" class="btn btn-primary">수정</a> 
									<a href="/sales/delete/${salesDetail.SALESNO }" class="btn btn-primary">삭제</a> 
									<a href="/sales" class="btn btn-primary">목록</a>
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
												<th>예상수주액</th>
												<td>${salesDetail.FORDAMOUNT }</td>
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
												<th>확률(%)</th>
												<td>${salesDetail.PROB }</td>
											</tr>
											<tr>
												<th>영업건구분</th>
												<td>${salesDetail.CATEGORY }</td>
											</tr>
											<tr>
												<th>실수주액</th>
												<td>${salesDetail.RORDAMOUNT }</td>
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
												<th>NEEDS</th>
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
												<th>SOULTION</th>
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
										<li><a class="nav-link" data-toggle="tab" href="#tab2">영업단계</a></li>
										<li><a class="nav-link" data-toggle="tab" href="#tab3">고객접촉</a></li>
									</ul>
									<div class="tab-content">
																				<!-- 관련고객 -->
										<div role="tabpanel" id="tab1" class="tab-pane active">
											<div class="panel-body table-responsive">
												
												<div class="w-100 text-right mb-2">
                                               	   <Button class="btn btn-primary relcustBtn" id="salesno" value= "${salesDetail.SALESNO }">추가</Button>
                                            	</div>				
																	
												<div class="box1 col-xl-3 p-0">	
													<div class="form-group row">
														<label class="col-sm-3 col-form-label" style="padding-top: 3px;"><strong>고객명</strong></label>
														<div class="col-sm-8">
                                        					<div class="input-group">                                        						
                                        						<input type="text" class="form-control" id="custname" name="custname" value="${searchVal.custname }"> 
                                        						<span class="input-group-append"> 
                                        							<a href="#" onClick="relCustSearch();" class="btn btn-primary" style="padding-top: 2px;">검색 </a> 
                                        						</span>
                                        					</div>
                                    					</div>
                                					</div>
												</div>		
												
												<table class="table table-bordered">
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
												</div> 
											
											</div>									
										</div>
										<div role="tabpanel" id="tab2" class="tab-pane ">
											<div class="panel-body table-responsive">
												<div class="w-100 text-right mb-2">
													<a href="#" class="btn btn-primary" id="saleStateBtn" onclick="saleStateInsert(${salesDetail.SALESNO },${salesDetail.SALESTATE });">추가</a>
												
												</div>
												<table class="table table-bordered">
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
													<tbody>
													
													<c:forEach var="stateList" items="${salesStateList }">
														<tr> 
															<td>${stateList.ENTDATE }</td>
															<td>
																<c:choose>
																	<c:when test="${stateList.PRESTATE eq 1 }">계약성공종료</c:when>
																	<c:when test="${stateList.PRESTATE eq 2 }">계약중</c:when>
																	<c:when test="${stateList.PRESTATE eq 3 }">제안서제출</c:when>
																	<c:when test="${stateList.PRESTATE eq 4 }">접촉중</c:when>
																	<c:when test="${stateList.PRESTATE eq 5 }">문의</c:when>
																	<c:when test="${stateList.PRESTATE eq 6 }">중도포기</c:when>
																	<c:when test="${stateList.PRESTATE eq 7 }">경쟁실패</c:when>
																</c:choose>
															</td>
															<td>
																<c:choose>
																	<c:when test="${stateList.STATE eq 1 }">계약성공종료</c:when>
																	<c:when test="${stateList.STATE eq 2 }">계약중</c:when>
																	<c:when test="${stateList.STATE eq 3 }">제안서제출</c:when>
																	<c:when test="${stateList.STATE eq 4 }">접촉중</c:when>
																	<c:when test="${stateList.STATE eq 5 }">문의</c:when>
																	<c:when test="${stateList.STATE eq 6 }">중도포기</c:when>
																	<c:when test="${stateList.STATE eq 7 }">경쟁실패</c:when>
																</c:choose>
															</td>
															<td>
																<c:choose>
																	<c:when test="${stateList.MODREASON eq 1 }">영업진행</c:when>
																	<c:when test="${stateList.MODREASON eq 2 }">업무중단</c:when>
																	<c:when test="${stateList.MODREASON eq 3 }">폐업</c:when>
																	<c:when test="${stateList.MODREASON eq 4 }">거래처요청</c:when>
																	<c:when test="${stateList.MODREASON eq 5 }">기타</c:when>
																</c:choose>
															</td>
															<td>${stateList.PROB }</td>
															<td>${stateList.REGUSER }</td>
														</tr>
													</c:forEach>
														
													</tbody>
												</table>
											</div>
										</div>
										<div role="tabpanel" id="tab3" class="tab-pane">
											<div class="panel-body table-responsive">
												<table class="table table-bordered">
													<colgroup>
														<col style="width: 200px;" />
														<col style="width: 150px;" />
														<col style="width: 150px;" />
														<col style="width: 150px;" />
														<col style="width: 300px;" />
													</colgroup>
													<thead>
														<tr>
															<th>접촉일</th>
															<th>접촉자</th>
															<th>고객명</th>
															<th>접촉매체</th>
															<th>접촉메모</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>2018-04-05</td>
															<td>접촉자</td>
															<td>고객명</td>
															<td>접촉매체</td>
															<td>메모입니다</td>
														</tr>
													</tbody>
												</table>
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

	<script>
	
	$('.relcustBtn').click(function(e){
		var value = e.target.value;
		var urlStr = '/popsalescust/'+value;
		openNewWindow('관련고객',urlStr,e.target.id,600,500);
	});
		
	function saleStateInsert(salesno,salestate){
		var urlStr = '/popsalesstate/'+salesno+'?salestate='+salestate;
		openNewWindow('영업단계',urlStr,'sales',600,500);
	}
	
	</script>	
</body>
</html>
