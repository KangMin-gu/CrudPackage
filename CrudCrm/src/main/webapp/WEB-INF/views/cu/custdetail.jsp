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

<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<!-- Toastr style -->
<link href="/resources/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">

<link href="/resources/css/animate.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">

<!-- S: 추가 CSS-->
<link href="/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<!--radioBox-->
<link href="/resources/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<!--datePicker-->
<!-- E: 추가 CSS-->
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
						<li class="breadcrumb-item"><a href="/cust">목록</a></li>
						<li class="breadcrumb-item active"><strong>상세정보</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<!-- Content -->
			<div class="wrapper wrapper-content animated fadeIn">
				<!-- S: 고객 등록 ppt p02~p05 -->
				<div class="wrapper wrapper-content  animated fadeInRight article">
					<div class="row justify-content-md-center">
						<div class="col-lg-12" style="background: #ffffff;">
							
							<div class="ibox">
								<div class="ibox-title row">
									<h4>기본정보</h4>
								</div>
								
								<div class="ibox-content row">
								
								
									<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
										<form:form action="/cust/view/${custDetail.CUSTNO}" method="PUT">
										<input type="hidden" name="custno" id="custno" value="${custDetail.CUSTNO}">
										<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
	                              			 <a href="#" class="btn btn-primary">내부통지</a>
	                              			 <a href="#" class="btn btn-primary">이메일</a>
	                              			 <a href="#" class="btn btn-primary">SMS</a>												
	                          			</div>													
										<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
											<a href="/cust/post/${custDetail.CUSTNO}" class="btn btn-primary">수 정</a>									
											<Button type="submit" class="btn btn-primary">삭 제</Button>					
											<a href="/cust" class="btn btn-primary">목 록</a>
										</div>
										</form:form>
									</div>
								
									<div class="box1 col-lg-4 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th>고객명</th>
													<td>${custDetail.CUSTNAME}</td>
												</tr>
												<tr>
													<th>직책</th>
													<td>${custDetail.DUTY}</td>
												</tr>
												<tr>
													<th>직장전화</th>
													<td>
													<c:choose>
														<c:when test="${fn:trim(custDetail.WRKTEL) eq '--'}"></c:when>
														<c:otherwise>${custDetail.WRKTEL }</c:otherwise>
													</c:choose>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box2 col-lg-4 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th>직장명</th>
													<td > ${custDetail.CLINAME}</td>
												</tr>
												<tr>
													<th>휴대전화</th>
													<td>
														<c:choose>
															<c:when test="${fn:trim(custDetail.MOBILE) eq '--'}"></c:when>
															<c:otherwise>${custDetail.MOBILE }</c:otherwise>
														</c:choose>
													</td>	
												</tr>
												<tr>
													<th>직장팩스</th>
													<td>  
														<c:choose>
															<c:when test="${fn:trim(custDetail.WRKFAX) eq '--'}"></c:when>
															<c:otherwise>${custDetail.WRKFAX }</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box3 col-lg-4 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th>부서</th>
													<td> ${custDetail.DEPTNAME}</td>
												</tr>
												<tr>
													<th>이메일</th>
													<td style="padding-top: 8px;padding-bottom: 2px;height: 34px;">  ${custDetail.EMAIL} &nbsp; &nbsp; &nbsp;											
														<c:choose>
															<c:when test="${fn:trim(custDetail.EMAIL) eq ''}"></c:when>
															<c:otherwise>
																<a class="btn btn-primary dim" style="padding-top: 2px;padding-bottom: 2px;padding-left: 6px;padding-right: 6px;border-bottom-width: 0px;border-top-width: 0px;"><i class="fa fa-envelope-o"></a></i>
															</c:otherwise>
														</c:choose>											
													</td>
												</tr>
												<tr>
													<th>홈페이지</th>
													<td style="padding-top: 8px;padding-bottom: 2px;height: 34px;">   ${custDetail.WRKURL} &nbsp; &nbsp; &nbsp;
														<c:choose>
															<c:when test="${fn:trim(custDetail.WRKURL) eq ''}"></c:when>
															<c:otherwise>
																<a class="btn btn-primary dim" style="padding-top: 2px; padding-bottom: 2px; padding-left: 6px; padding-right: 6px; border-bottom-width: 0px;border-top-width: 0px;" href="http://${custDetail.WRKURL}" target="_blank"><i class="fa fa-home" ></i></a>
																  
															</c:otherwise>
														</c:choose>	
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box4 col-lg-8 p-0">
										<table class="table table-bordered border-top-0  mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th class="border-top-0">직장주소</th>
													<td class="border-top-0">
														 ${custDetail.WRKADDR1} &nbsp;   ${custDetail.WRKADDR2} &nbsp; ${custDetail.WRKADDR3}
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box5 col-lg-4 p-0">
										<table class="table table-bordered border-top-0 ">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th class="border-top-0">담당자</th>
													<td class="border-top-0">${custDetail.OWNERNAME} </td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="ibox mb-0">
									<div class="ibox-title row border-0">
										<h4>부가정보</h4>
	                                <div class="ibox-tools">
	                                    <a class="collapse-link"> <i class="fa fa-chevron-up"></i>  </a>
	                                </div>
									</div>
									
									<div class="ibox-content row">
										<div class="box1 col-lg-4 p-0">
											<table class="table table-bordered mb-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th>자택전화</th>
														<td> 
															<c:choose>
																<c:when test="${fn:trim(custDetail.HOMTEL) eq '--'}"></c:when>
																<c:otherwise>${custDetail.HOMTEL }</c:otherwise>
															</c:choose>
														</td>
													</tr>
													<tr>
														<th>결혼여부</th>
														<td>
														<c:choose>
															<c:when test="${custDetail.MARRIED eq 1 }">미혼</c:when>
															<c:when test="${custDetail.MARRIED eq 2 }">기혼</c:when>
														</c:choose>
														</td>
													</tr>
													<tr>
														<th>결혼기념일</th>
														<td> ${custDetail.WEDDINGDAY}</td>
													</tr>
													<tr>
														<th>취미</th>
														<td>${custDetail.HOBBY}</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box2 col-lg-4 p-0">
											<table class="table table-bordered mb-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th>성별</th>
														<td>
															<c:choose>
																<c:when test="${custDetail.SEX eq 1 }">남자</c:when>
																<c:when test="${custDetail.SEX eq 2 }">여자</c:when>
																<c:otherwise>
																</c:otherwise>
															</c:choose>
														</td>
													</tr>
													<tr>
														<th>발송처</th>
														<td>
															<c:choose>
																<c:when test="${custDetail.MAILTO eq 1 }">자택</c:when>
																<c:when test="${custDetail.MAILTO eq 2 }">직장</c:when>
																<c:otherwise>
																</c:otherwise>
															</c:choose>
														</td>
													</tr>
													<tr>
														<th>고객등급</th>
														<td>
															<c:choose>
																<c:when test="${custDetail.CUSTGRADE eq 1 }">일반</c:when>
																<c:when test="${custDetail.CUSTGRADE eq 2 }">VIP</c:when>
																<c:when test="${custDetail.CUSTGRADE eq 3 }">VVIP</c:when>
 																<c:otherwise>
																</c:otherwise>
															</c:choose>
														</td>
													</tr>
													<tr>
														<th>회원구분</th>
														<td>
															 <c:choose>
																<c:when test="${custDetail.CUSTGUBUN eq 1 }">회원</c:when>
																<c:when test="${custDetail.CUSTGUBUN eq 2 }">비회원</c:when>
																<c:when test="${custDetail.CUSTGUBUN eq 3 }">탈퇴회원</c:when>															
																<c:otherwise>
																</c:otherwise>
															</c:choose>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box3 col-lg-4 p-0">
											<table class="table table-bordered mb-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th>생일</th>
														<td> ${custDetail.BIRTH }</td>
													</tr>
													<tr>
														<th>양력/음력</th>
														<td>
															 <c:choose>
																<c:when test="${custDetail.SOLAR eq 1 }">양력</c:when>
																<c:when test="${custDetail.SOLAR eq 2 }">음력</c:when>
																<c:otherwise>
																</c:otherwise>
															</c:choose>
														</td>
													</tr>
													<tr>
														<th>직업</th>
														<td>${custDetail.JOB} </td>
													</tr>
													<tr>
														<th>활동등급</th>
														<td>
															<c:choose>
																<c:when test="${custDetail.ACTGRADE eq 1 }">우수</c:when>
																<c:otherwise>
																</c:otherwise>
															</c:choose>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box4 col-lg-8 p-0">
											<table class="table table-bordered m-0 border-top-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th class="border-top-0">자택주소</th>
														<td class="border-top-0">
															${custDetail.HOMADDR1}&nbsp; ${custDetail.HOMADDR2}&nbsp; ${custDetail.HOMADDR3}
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box4-2 col-lg-4 p-0">
											<table class="table table-bordered m-0 border-top-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<th class="border-top-0">정보활용</th>
													<td class="border-top-0">
														<div class="i-checks" style="height: 1.15rem;">
															<label class="pr-lg-3 mb-0">
															<input type="radio" value="0" id="infoagree" name="infoagree"  class="pr-lg-1" ${custDetail.INFOAGREE eq "0" ? "checked" : ""} disabled="disabled"><i></i> 동의 </label> 
																<label class="pr-lg-3 mb-0">
																<input type="radio" value="1" id="infoagree" name="infoagree" class="pr-lg-1" ${custDetail.INFOAGREE eq "1" ? "checked" : ""} disabled="disabled"><i></i>거부</label>
														</div>
													</td>
												</tbody>
											</table>
										</div>											
										<div class="box5 col-lg-12 p-0">
											<table class="table table-bordered mb-0 border-top-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: 100px; background: #fefefe;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th rowspan="5" class="border-top-0">접촉 거부</th>
														<th class="border-top-0">EMAIL 거부</th>
														<td class="border-top-0">
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="emailChec1" type="checkbox" class="i-checks" disabled="disabled" ${custDetail.DENYMAILNEWS eq "1" ? "checked='checked'" : ""}>
																<label for="emailChec1" > 뉴스레터</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="emailChec2" type="checkbox" class="i-checks" disabled="disabled" ${custDetail.DENYMAILSEMINAR eq "1" ? "checked='checked'" : ""}>
																<label for="emailChec2"> 세미나</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="emailChec3" type="checkbox" class="i-checks"  disabled="disabled" ${custDetail.DENYMAILAD eq "1" ? "checked='checked'" : ""}>
																<label for="emailChec3"> 광고 </label>
															</div>
														</td>
													</tr>
													<tr>
														<th>SMS 거부</th>
														<td>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="smsCheck1" type="checkbox" class="i-checks" disabled="disabled" ${custDetail.DENYSMSSEMINAR eq "1" ? "checked='checked'" : ""}>
																<label for="smsCheck1"> 세미나</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="smsCheck2" type="checkbox" class="i-checks" disabled="disabled" ${custDetail.DENYSMSNOMAL eq "1" ? "checked='checked'" : ""}>
																<label for="smsCheck2"> 일반</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="smsCheck3" type="checkbox" class="i-checks" disabled="disabled" ${custDetail.DENYSMSAD eq "1" ? "checked='checked'" : ""}>
																<label for="smsCheck3"> 광고</label>
															</div>
														</td>
													</tr>
													<tr>
														<th>DM 거부</th>
														<td>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="dmCheck1" type="checkbox" class="i-checks" disabled="disabled" ${custDetail.DENYDMNEWS eq "1" ? "checked='checked'" : ""}>
																<label for="dmCheck1"> 뉴스레터</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="dmCheck2" type="checkbox" class="i-checks" disabled="disabled" ${custDetail.DENYDMSEMINAR eq "1" ? "checked='checked'" : ""}>
																<label for="dmCheck2"> 세미나</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="dmCheck3" type="checkbox" class="i-checks" disabled="disabled" ${custDetail.DENYDMAD eq "1" ? "checked='checked'" : ""}>
																<label for="dmCheck3"> 광고</label>
															</div>
														</td>
													</tr>
													<tr>
														<th>전화 거부</th>
														<td>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="callCheck1" type="checkbox" class="i-checks" disabled="disabled" ${custDetail.DENYTELNEWS eq "1" ? "checked='checked'" : ""}>
																<label for="callCheck1"> 뉴스거부</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="callCheck2" type="checkbox" class="i-checks" disabled="disabled" ${custDetail.DENYTELSEMINAR eq "1" ? "checked='checked'" : ""}>
																<label for="callCheck2"> 세미나거부</label>
															</div>
														</td>
													</tr>
													<tr>
														<th>기타</th>
														<td>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="etcCheck1" type="checkbox" class="i-checks" disabled="disabled" ${custDetail.DENYFAX eq "1" ? "checked='checked'" : ""}>
																<label for="etcCheck1"> FAX거부</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="etcCheck2" type="checkbox" class="i-checks" disabled="disabled" ${custDetail.DENYVISIT eq "1" ? "checked='checked'" : ""}>
																<label for="etcCheck2"> 방문거부</label>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box6 col-lg-12 p-0">
											<table class="table table-bordered border-top-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th class="border-top-0">메모</th>
														<td class="border-top-0">
															<textarea name="memo" id="memo" class="form-control" style="resize: none; height: 8em;" readonly>${custDetail.MEMO}</textarea>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="w-100 text-right">
											<a href="/cust/post/${custDetail.CUSTNO}" class="btn btn-primary">수 정</a>
											<Button type="submit" class="btn btn-primary">삭 제</Button>	
											<a href="/cust" class="btn btn-primary">목 록</a>
										</div>
									</div>
								</div>
								
								<div class="ibox">
									<div class="ibox-title row border-0">
										<h4>고객 상세</h4>
									</div>
									<div class="ibox-content row">
										<div class="box1 col-lg-12 p-0">
											<div class="tabs-container">
												<ul class="nav nav-tabs" role="tablist">
													<li><a class="nav-link active" data-toggle="tab" href="#tab1">서비스</a></li>
													<li><a class="nav-link" data-toggle="tab" href="#tab2">영업</a></li>
													<li><a class="nav-link" data-toggle="tab" href="#tab3">캠페인</a></li>
													<li><a class="nav-link" data-toggle="tab" href="#tab4">접촉</a></li>
													<li><a class="nav-link" data-toggle="tab" href="#tab5">출처</a></li>
												</ul>
												<div class="tab-content">
													<div role="tabpanel" id="tab1" class="tab-pane active overflow-x">
														<div class="panel-body">
															<table class="table table-bordered">
																
																<colgroup>
																	<col width="180px;">
																	<col width="80px;">
																	<col width="80px;">
																	<col width="100px;">
																	<col width="120px;">
																	<col width="100px;">
																	<col width="100px;">
																	<col width="100px;">
																	<col width="80px;">
																</colgroup>
																
																
																<thead>
																	<tr>
																		 <th>서비스명</th>
                                        								 <th>접수유형</th>
                                         								 <th>처리유형</th>
                                        							  	 <th>고객명</th>
                                        								 <th>거래처명</th>
                                        								 <th>접수일</th>
                                      								     <th>접수자</th>
                                        								 <th>담당자</th>
                                        								 <th>처리상태</th>
																	</tr>
																</thead>
																<tbody>			
																<c:forEach var="svList" items="${custService}"  >
																	<tr>
												 						<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"><a href="${pagecontext.request.contextpath}/sv/${svList.RCVNO }">${svList.RCVNAME}</a></td>
                                        								<td>${svList.RCVTYPE_ }</td>
                                        								<td>${svList.RACTCODE_ }</td>
                                        								<td>${svList.CUSTNO_ }</td>
                                        								<td>${svList.CLINO_ }</td>
                                        								<td>${svList.RCVDATE_ }</td>
                                        								<td>${svList.RCVOWNER_ }</td>
                                        								<td>${svList.RACTOWNER_ }</td>
                                        								<td>${svList.PRCSTATE_ }</td>
                                        							</tr>		
																</c:forEach>																								
																</tbody>
															</table>
															<c:if test='${fn:length(custService) != 0 }'> 
															<div class="text-right" >
																<a href="/service?custno=${custDetail.CUSTNO }" class="btn btn-primary" >서비스이동</a>
															</div>
															</c:if>
														</div>
													</div>
													<div role="tabpanel" id="tab2" class="tab-pane overflow-x">
														<div class="panel-body">
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th>예상수주일</th>
																		<th>영업건명</th>
																		<th>상담건</th>
																		<th>영업담당자</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>203일</td>
																		<td>영업건명입니다</td>
																		<td>상담건입니다</td>
																		<td>담당자</td>
																	</tr>
																	<tr>
																		<td>203일</td>
																		<td>영업건명입니다</td>
																		<td>상담건입니다</td>
																		<td>담당자</td>
																	</tr>
																	<tr>
																		<td>203일</td>
																		<td>영업건명입니다</td>
																		<td>상담건입니다</td>
																		<td>담당자</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div role="tabpanel" id="tab3" class="tab-pane overflow-x">
														<div class="panel-body">
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th>캠페인명</th>
																		<th>프로젝트</th>
																		<th>시작일</th>
																		<th>종료일</th>
																		<th>채널매체</th>
																		<th>결과</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>캠페인명입니다</td>
																		<td>프로젝트입니다</td>
																		<td>2018/10/12</td>
																		<td>2018/11/22</td>
																		<td>채널메체입니다</td>
																		<td>결과입니다</td>
																	</tr>
																	<tr>
																		<td>캠페인명입니다</td>
																		<td>프로젝트입니다</td>
																		<td>2018/10/12</td>
																		<td>2018/11/22</td>
																		<td>채널메체입니다</td>
																		<td>결과입니다</td>
																	</tr>
																	<tr>
																		<td>캠페인명입니다</td>
																		<td>프로젝트입니다</td>
																		<td>2018/10/12</td>
																		<td>2018/11/22</td>
																		<td>채널메체입니다</td>
																		<td>결과입니다</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div role="tabpanel" id="tab4" class="tab-pane overflow-x">
														<div class="panel-body">
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th>접촉일</th>
																		<th>접촉자</th>
																		<th>접촉유형</th>
																		<th>접촉매체</th>
																		<th>접촉결과</th>
																		<th>접촉내용</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>2018/10/11</td>
																		<td>접촉자임</td>
																		<td>접촉유형입니다</td>
																		<td>접촉매체입니다</td>
																		<td>접촉결과입니다</td>
																		<td>접촉내용입니다</td>
																	</tr>
																	<tr>
																		<td>2018/10/11</td>
																		<td>접촉자임</td>
																		<td>접촉유형입니다</td>
																		<td>접촉매체입니다</td>
																		<td>접촉결과입니다</td>
																		<td>접촉내용입니다</td>
																	</tr>
																	<tr>
																		<td>2018/10/11</td>
																		<td>접촉자임</td>
																		<td>접촉유형입니다</td>
																		<td>접촉매체입니다</td>
																		<td>접촉결과입니다</td>
																		<td>접촉내용입니다</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div role="tabpanel" id="tab5" class="tab-pane overflow-x">
														<div class="panel-body">
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th>등록일</th>
																		<th>출처명</th>
																		<th>출처메모</th>
																		<th>출처회원번호</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>2018/10/11</td>
																		<td>출처명입니다</td>
																		<td>출처메모입니다출처메모입니다출처메모입니다</td>
																		<td>1568951615</td>
																	</tr>
																	<tr>
																		<td>2018/10/11</td>
																		<td>출처명입니다</td>
																		<td>출처메모입니다출처메모입니다출처메모입니다</td>
																		<td>1568951615</td>
																	</tr>
																	<tr>
																		<td>2018/10/11</td>
																		<td>출처명입니다</td>
																		<td>출처메모입니다출처메모입니다출처메모입니다</td>
																		<td>1568951615</td>
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
					</div>
				</div>
			</div>
			<!-- E: 고객 등록 ppt p02~p05 -->
			<!-- Content End -->


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
	<script src="/resources/js/plugins/iCheck/icheck.min.js"></script>
	<!-- radioBox-->

	<script>
        $(document).ready(function () {
            // icheck css
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });

    
        });
    </script>
	<!-- E: 추가 js -->
</body>
</html>