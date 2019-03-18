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
					<h2>거래처 상세</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><a href="/sales/client">목록</a></li>
						<li class="breadcrumb-item active"><strong>상세 정보</strong></li>
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
								
								<div class="box col-12 tooltip-demo" style="padding-left: 0px;padding-right: 0px;">
									<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
										<!-- <a href="/sales/client" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="목록"><i class="fa fa-list"></i></a> -->
	                              		<a href="#" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="내부통지"><i class="fa fa-envelope"></i></a>
	                              		<a href="#" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="SMS" style="padding-top: 5px;padding-bottom: 5px;height: 33px;width: 39px;"><i class="fa fa-mobile" style="font-size:20px;"></i></a>												
	                          		</div>													
									<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
										<a href="/sales/client/post/${cliDetail.CLINO }" class="btn btn-primary">수정</a> 
										<c:if test="${sessionScope.CHKAUTH eq 30 || sessionScope.CHKAUTH eq 20 || sessionScope.USERNO eq cliDetail.OWNER }">  
											<a href="/sales/client/del/${cliDetail.CLINO }" class="btn btn-primary">삭제</a>
											<a href="/sales/client" class="btn btn-primary">목록</a>
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
												<td><c:if test="${fn:length(cliDetail.TELNO1) gt  0 && fn:length(cliDetail.TELNO2) gt 0 && fn:length(cliDetail.TELNO3) gt 0   }">${cliDetail.TELNO1 }-${cliDetail.TELNO2 }-${cliDetail.TELNO3 }</c:if></td>
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
												<td><c:if test="${fn:length(cliDetail.FAXTEL1) gt  0 && fn:length(cliDetail.FAXTEL2) gt 0 && fn:length(cliDetail.FAXTEL3) gt 0   }">${cliDetail.FAXTEL1 }-${cliDetail.FAXTEL2 }-${cliDetail.FAXTEL3 }</c:if></td>
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
												<td><c:if test="${fn:length(cliDetail.MOBILE1) gt  0 && fn:length(cliDetail.MOBILE2) gt 0 && fn:length(cliDetail.MOBILE3) gt 0   }">${cliDetail.MOBILE1 }-${cliDetail.MOBILE2 }-${cliDetail.MOBILE3 }</c:if></td>
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
												<th class="border-top-0">EMAIL</th>
												<td class="border-top-0">${cliDetail.EMAIL }</td>
											</tr>
											<tr>
												<th class="border-top-0">메모</th>
												<td class="border-top-0">${cliDetail.MEMO }</td>
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
												<th class="border-top-0">거래처 위치</th>
												<td class="border-top-0">
												<div id="map" style="width:100%;height:350px;"></div>
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
										<li><a class="nav-link" onClick="javascript:tabTargetSalesList(1);" data-toggle="tab" href="#tab2">영업</a></li>
										<li><a class="nav-link" onClick="javascript:tabTargetContect(1);"  data-toggle="tab" href="#tab3">고객접촉</a></li>
									</ul>
									<div class="tab-content">
									
										<!-- 관련고객 -->
										<div role="tabpanel" id="tab1" class="tab-pane active">
											<div class="panel-body table-responsive">
												
												<div class="box col-12 tooltip-demo" style="padding-left: 0px; padding-right: 0px;"> <br>
													<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height: 2.00rem; padding-left: 0px;">
														
                                						<div class="form-group  row"><label class="col-sm-2 col-form-label" style="padding-top: 3px;padding-left:20px;"><strong>고객명</strong></label>
                            								<div class="col-sm-7">
                                								<input type="text" class="form-control" id="custname" name="custname" value="${searchVal.custname }" style="height: 27px;">  
                            								</div>                                
															<div class="col-sm-3 w-100" style="padding-left: 0px;">
																<a href="#" onClick="cliCustSearch(${cliDetail.CLINO });" class="btn btn-primary" style="padding-top: 2px;">검색 </a> 
															</div>			
														</div>		
													</div>
													<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
										 				<Button class="btn btn-primary cliCustBtn" id="clino" value= "${cliDetail.CLINO }">추가</Button>
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
															<th class="tablecenter">고객명</th>
															<th class="tablecenter">이메일</th>
															<th class="tablecenter">직책</th>
															<th class="tablecenter">키맨여부</th>
															<th class="tablecenter">역할</th>
															<th class="tablecenter">메모</th>
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
													<c:if test="${fn:length(cliCustList) ne 0 }"> 
													<ul class="pagination justify-content-center">													
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
													</c:if> 
												</div> 
											
											</div>									
										</div>
										<div role="tabpanel" id="tab2" class="tab-pane ">
											<div class="panel-body table-responsive">
												
												<div class="box col-12 tooltip-demo" style="padding-left: 0px; padding-right: 0px;"> <br>
													<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height: 2.00rem; padding-left: 0px;">
														
                                						<div class="form-group  row"><label class="col-sm-2 col-form-label" style="padding-top: 3px;padding-left:20px;"><strong>영업명</strong></label>
                            								<div class="col-sm-7">
                                								<input type="text" class="form-control" id="salename" name="salename" value="${searchVal.salename }" style="height: 27px;">  
                            								</div>                                
															<div class="col-sm-3 w-100" style="padding-left: 0px;">
																<a href="#" onClick="tabTargetSalesList(1);" class="btn btn-primary" style="padding-top: 2px;">검색 </a> 
															</div>			
														</div>		
                                						
													</div>
												</div>
							
												<table class="table table-bordered" style="border-top: 1px solid #e7eaec;">
													<colgroup>
														<col style="width: 200px;" />
														<col style="width: 200px;" />
														<col style="width: 150px;" />
														<col style="width: 150px;" />
														<col style="width: 200px;" />
													</colgroup>
													<thead>
														<tr>
															<th class="tablecenter">영업건명</th>
															<th class="tablecenter">예상수주일</th>
															<th class="tablecenter">영업담당자</th>
															<th class="tablecenter">현단계</th>
															<th class="tablecenter">단계진입일</th>
														</tr>
													</thead>
													<tbody></tbody>
												</table>
												<div class="m-auto" style="float:center;">
													<ul class="pagination justify-content-center"></ul>
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
															<th class="tablecenter">접촉자</th>
															<th class="tablecenter">접촉일</th>
															<th class="tablecenter">고객명</th>
															<th class="tablecenter">접촉매체</th>
															<th class="tablecenter">접촉메모</th>
														</tr>
													</thead>
													<tbody></tbody>
												</table>
												<div class="m-auto" style="float:center;">
													<ul class="pagination justify-content-center"></ul>
												</div>
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
	<script src="${pageContext.request.contextPath}/resources/crud/crud_sa.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=60c1fc75825cf6619b0ff66b5aca7161&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 지도를 표시하는 div 크기를 변경하는 함수입니다
		function resizeMap() {
		    var mapContainer = document.getElementById('map');
		    mapContainer.style.width = '650px';
		    mapContainer.style.height = '650px'; 
		}
		
		function relayout() {    
		    
		    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
		    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
		    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
		    map.relayout();
		}
		
		var geocoder = new daum.maps.services.Geocoder();
		
		var accountAddr = "${cliDetail.CLIADDR2 }${cliDetail.CLIADDR3 }";
		var accountName = "${cliDetail.CLINAME }";
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(accountAddr, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: "<div style='width:150px;text-align:center;padding:6px 0;''>"+accountName+"</div>"
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>
</body>
</html>
