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
					<h2>거래처상세</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><a href="/sales/client">목록</a></li>
						<li class="breadcrumb-item active"><strong>상세정보</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<!-- S: 거래처관리 상세-->
			<div class="wrapper wrapper-content  animated fadeInRight article">
				<div class="row justify-content-md-center">
					<div class="col-lg-12">
						<div class="ibox">
							<div class="ibox-content row">
								<div class="w-100 text-right mb-3 mt-3">
									<a href="/sales/client/post/${cliDetail.CLINO }" class="btn btn-primary">수정</a> 
									<a href="/sales/client/delete/${cliDetail.CLINO }" class="btn btn-primary">삭제</a> 
									<a href="/sales/client" class="btn btn-primary">목록</a>
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
												<td>${cliDetail.CLINAME }</td>
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
												<th>거래처호칭</th>
												<td>${cliDetail.CALLNAME }</td>
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
												<td>${cliDetail.USERNAME }</td>
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
												<td class="border-top-0">${cliDetail.CLIADDR1 }${cliDetail.CLIADDR2 }${cliDetail.CLIADDR3 }</td>
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
													<c:choose>
														<c:when test="${cliDetail.IMPORTANCE eq 1 }">A</c:when>
														<c:when test="${cliDetail.IMPORTANCE eq 2 }">B</c:when>
														<c:when test="${cliDetail.IMPORTANCE eq 3 }">C</c:when>
														<c:when test="${cliDetail.IMPORTANCE eq 4 }">D</c:when>
														<c:when test="${cliDetail.IMPORTANCE eq 5 }">E</c:when>
														<c:when test="${cliDetail.IMPORTANCE eq 6 }">F</c:when>
													</c:choose>
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
												<td class="border-top-0">${cliDetail.CORP_SN }</td>
											</tr>
											<tr>
												<th>대표전화</th>
												<td>${cliDetail.TELNO1 }${cliDetail.TELNO2 }${cliDetail.TELNO3 }</td>
											</tr>
											<tr>
												<th>업태</th>
												<td>${cliDetail.BSCOND }</td>
											</tr>
											<tr>
												<th>회사규모</th>
												<td>
													<c:choose>
														<c:when test="${cliDetail.COMPANYSIZE eq 1 }">대기업</c:when>
														<c:when test="${cliDetail.COMPANYSIZE eq 2 }">중견기업</c:when>
														<c:when test="${cliDetail.COMPANYSIZE eq 3 }">중소기업</c:when>
														<c:when test="${cliDetail.COMPANYSIZE eq 4 }">소기업</c:when>
														<c:when test="${cliDetail.COMPANYSIZE eq 5 }">소상공인</c:when>
													</c:choose>
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
												<td class="border-top-0">${cliDetail.BSNO }</td>
											</tr>
											<tr>
												<th>팩스번호</th>
												<td>${cliDetail.FAXTEL1 }${cliDetail.FAXTEL2 }${cliDetail.FAXTEL3 }</td>
											</tr>
											<tr>
												<th>업종</th>
												<td>${cliDetail.BSTYPE }</td>
											</tr>
											<tr>
												<th>밀착도</th>
												<td>
													<c:choose>
														<c:when test="${cliDetail.FRIENDLY eq 1 }">A</c:when>
														<c:when test="${cliDetail.FRIENDLY eq 2 }">B</c:when>
														<c:when test="${cliDetail.FRIENDLY eq 3 }">C</c:when>
														<c:when test="${cliDetail.FRIENDLY eq 4 }">D</c:when>
														<c:when test="${cliDetail.FRIENDLY eq 5 }">E</c:when>
														<c:when test="${cliDetail.FRIENDLY eq 6 }">F</c:when>
													</c:choose>
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
												<td class="border-top-0">${cliDetail.PRSDNAME }</td>
											</tr>
											<tr>
												<th>핸드폰</th>
												<td>${cliDetail.MOBILE1 }${cliDetail.MOBILE2 }${cliDetail.MOBILE3 }</td>
											</tr>
											<tr>
												<th>종목</th>
												<td>${cliDetail.BSCATEGORY }</td>
											</tr>
											<tr>
												<th>국내/국외</th>
												<td>
													<c:choose>
														<c:when test="${cliDetail.INTERNAL eq 1 }">국내</c:when>
														<c:when test="${cliDetail.INTERNAL eq 2 }">국외</c:when>
													</c:choose>
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
												<td class="border-top-0">${cliDetail.MEMO }</td>
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
										<li><a class="nav-link" data-toggle="tab" href="#tab2">영업</a></li>
										<li><a class="nav-link" data-toggle="tab" href="#tab3">고객접촉</a></li>
									</ul>
									<div class="tab-content">
									
										<!-- 관련고객 -->
										<div role="tabpanel" id="tab1" class="tab-pane active">
											<div class="panel-body table-responsive">
																	
												<div class="w-100 text-right mb-2">
                                               	   <Button class="btn btn-primary cliCustBtn" id="clino" value= "${cliDetail.CLINO }">추가</Button>
                                            	</div>								
																	
												<div class="box1 col-xl-3 p-0">	
													<div class="form-group row">
														<label class="col-sm-3 col-form-label" style="padding-top: 3px;"><strong>고객명</strong></label>
														<div class="col-sm-8">
                                        					<div class="input-group">                                        						
                                        						<input type="text" class="form-control" id="custname" name="custname" value="${searchVal.custname }"> 
                                        						<span class="input-group-append"> 
                                        							<a href="#" onClick="cliCustSearch();" class="btn btn-primary" style="padding-top: 2px;">검색 </a> 
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
															<th>이메일</th>
															<th>직책</th>
															<th>키맨여부</th>
															<th>역할</th>
															<th>메모</th>
														</tr>
													</thead>
													<tbody>
													
													<c:forEach var ="custList" items="${cliCustList }">
													<tr>
														<td><a href="#" onclick="window.open('/popclicust/view/${custList.CLICUSTNO}', '', 'width=600, height=500, scrollbars=yes, resizable'); return false;">${custList.CUSTNAME }</a></td>
														<td>${custList.EMAIL }</td>
														<td>${custList.DUTY }</td>
														<td>${custList.KEYMAN }</td>
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
																	<a href='/sales/client/view/${cliDetail.CLINO}?custname=${searchVal.custname }&pageNum=${page.startPageNum-1 }' >&laquo;</a>													
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
																		<a href = '/sales/client/view/${cliDetail.CLINO}?custname=${searchVal.custname }&pageNum=${i }'>${i }</a>
																	</li>
																</c:when>
																<c:otherwise>
																	<li>
																		<a href = '/sales/client/view/${cliDetail.CLINO}?custname=${searchVal.custname }&pageNum=${i }'>${i }</a>
																	</li>
																</c:otherwise>
															</c:choose>
														</c:forEach>
										
														<c:choose>
															<c:when test="${page.endPageNum lt page.totalPageCount }">
																<li>
																	<a href = '/sales/client/view/${cliDetail.CLINO}?custname=${searchVal.custname }&pageNum=${page.endPageNum+1 }'>&raquo;</a>
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
													<a href="javascript:void(0);" class="btn btn-primary">추가</a>
												</div>
												<table class="table table-bordered">
													<colgroup>
														<col style="width: 200px;" />
														<col style="width: 200px;" />
														<col style="width: 150px;" />
														<col style="width: 150px;" />
														<col style="width: 200px;" />
													</colgroup>
													<thead>
														<tr>
															<th>영업건명</th>
															<th>예상수주일</th>
															<th>영업담당자</th>
															<th>현단계</th>
															<th>단계진입일</th>
														</tr>
													</thead>
													<tbody>
													
												 	<c:forEach var="salesList" items="${cliSalesList }">
														<tr>
															<td>${salesList.SALENAME }</td>
															<td>${salesList.FORDDATE }</td>
															<td>${salesList.USERNAME }</td>
															<td>
																<c:choose>
																	<c:when test="${salesList.SALESTATE eq 1 }">계약성공종료</c:when>
																	<c:when test="${salesList.SALESTATE eq 2 }">계약중</c:when>
																	<c:when test="${salesList.SALESTATE eq 3 }">제안서제출</c:when>
																	<c:when test="${salesList.SALESTATE eq 4 }">접촉중</c:when>
																	<c:when test="${salesList.SALESTATE eq 5 }">문의</c:when>
																	<c:when test="${salesList.SALESTATE eq 6 }">중도포기</c:when>
																	<c:when test="${salesList.SALESTATE eq 7 }">경쟁실패</c:when>
																</c:choose>
															</td>
															<td>${salesList.STATEDATE }</td>
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
															<th>접촉자</th>
															<th>접촉일</th>
															<th>고객명</th>
															<th>접촉매체</th>
															<th>접촉메모</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="cont" items="${contList }">
														<tr>
															<td>${cont.CTTUSER }</td>
															<td>${cont.CTTDATE }</td>
															<td>${cont.CUSTNAME }</td>
															<td>${cont.CTTCHANNEL }</td>
															<td>${cont.MEMO }</td>
														</tr>
													</c:forEach>
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
			<!-- E: 거래처관리 상세 -->



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
	<script src="${pageContext.request.contextPath}/resources/crud/crud_cal.js"></script>

</body>
</html>
