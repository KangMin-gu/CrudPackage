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
<meta id="viewport" content="width=device-width, initial-scale=1" />
<title>CRUD SYSTEM</title>
<!-- link includ -->
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
<link href="${pageContext.request.contextPath}/resources/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
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
                    <h2>캠페인 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/campaign">캠페인목록</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="/campaign/${campInfo.CAMPNO }">캠페인정보</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>캠페인정보 수정</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>		
		
		
<!-- Content -->		
			<div class="wrapper wrapper-content  animated fadeInRight article">
            	<div class="row justify-content-md-center">
                	<div class="col-lg-12" style="background: #ffffff;">
                		<div class="ibox">
                            <div class="ibox-title row border-0">
                                <h4>대상 추출 </h4>
                            </div>
                            <div class="ibox-content row">
                            <c:set var="urls" value="${requestScope['javax.servlet.forward.request_uri']}" />
                                <div class="tabs-container col-12">
                                    <ul class="nav nav-tabs" role=0"tablist">
                                    <c:if test="${fn:substring(urls, 0, 15)  eq '/campaign/email' }">
                                    	<li><a class="nav-link active" data-toggle="tab" href="#sumbitTab1">EMAIL</a></li>
                                    </c:if>
                                    <c:if test="${fn:substring(urls, 0, 13)  eq '/campaign/sms' }">
                                    	<li><a class="nav-link" data-toggle="tab" href="#sumbitTab2">SMS/LMS</a></li>
                                    </c:if>
                                    <c:if test="${fn:substring(urls, 0, 13)  eq '/campaign/mms' }">
                                    	<li><a class="nav-link" data-toggle="tab" href="#sumbitTab3">MMS</a></li>
                                    </c:if>
                                    <c:if test="${fn:substring(urls, 0, 15)  eq '/campaign/kakao' }">
                                    	<li><a class="nav-link" data-toggle="tab" href="#sumbitTab4">Kakao</a></li>
                                    </c:if>    
                                    </ul>
                                    <div class="tab-content">
                                    <form:form action="${pageContext.request.contextPath}/campaignform/${campInfo.CAMPNO }" method="POST" enctype="multipart/form-data">
                                    <c:if test="${fn:substring(urls, 0, 15)  eq '/campaign/email' }">
                                    	<div role="tabpanel" id="sumbitTab1" class="tab-pane active">
                                        	<div class="panel-body">
                                        	<input type="hidden" id="sendform" name="sendform" value="1"/>
                                            	<div class="box col-12 tooltip-demo" style="padding-left: 0px;padding-right: 0px;">
													<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
														<a href="/campaign" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="목록"><i class="fa fa-list"></i></a>
														<a href="/campaign/${campInfo.CAMPNO }/#wizard-t-1" class="btn btn-primary">고객 추출 화면</a>
	                          						</div>													
													<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
														<a href="/campaign/${campInfo.CAMPNO }/#wizard-t-2" class="btn btn-primary">취소</a>
														<button  class="btn btn-primary">저장</button>
													</div>
												</div>
                                            	<div class="ibox-content row">
                                                	<div class="box1 col-lg-12 col-xl-4 p-0">
                                                		<input type="hidden" name="campno" id="campno" value="${campInfo.CAMPNO }">
                                                		<input type="hidden" name="no" id="no" value="${campForm.NO }">
                                                    	<table class="table table-bordered mb-0">
                                                        	<colgroup>
                                                            	<col style="width: 110px; background: #fafafa;">
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody>
                                                            	<tr>
                                                                	<th>캠페인명</th>
                                                                    <td>${campInfo.CAMPNAME }</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>캠페인기간</th>
                                                                    <td>${campInfo.CAMPDATE_ }</td>
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
                                                                    <th>캠페인 유형</th>
                                                                    <td>${campInfo.CAMPTYPE_ }</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>담당자</th>
                                                                    <td>${campInfo.OWNER_ }</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="box3 col-lg-12 col-xl-4 p-0">
                                                        <table class="table table-bordered mb-0">
                                                            <colgroup>
                                                                <col style="width: 110px; background: #fafafa;">
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody>
                                                                <tr>
                                                                    <th>진행단계</th>
                                                                    <td>${campInfo.CAMPSTEP_ }</td>
                                                                    <input type="hidden" name="campstep" id="campstep" class="form-control" value="3"/>
                                                                </tr>
                                                                <tr>
                                                                    <th>대상고객수</th>
                                                                    <td>${targetCustCnt} 명</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="box4 col-lg-12 col-xl-4 p-0">
                                                        <table class="table table-bordered mb-0 border-top-0">
                                                            <colgroup>
                                                                <col style="width: 110px; background: #fafafa;">
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody>
                                                                <tr>
                                                                    <th class="border-top-0">회신메일주소</th>
                                                                    <td class="border-top-0"><input type="text" id="sender" name="sender" class="form-control" value="${campEmailForm.SENDER}"></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="box5 col-lg-12 col-xl-8 p-0">
                                                        <table class="table table-bordered mb-0 border-top-0">
                                                            <colgroup>
                                                                <col style="width: 110px; background: #fafafa;">
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody>
                                                                <tr>
                                                                    <th class="border-top-0">서식형태</th>
                                                                    <td class="border-top-0">
                                                                        <div class="input-group contents">
                                                    						<input type="text" class="form-control" autocomplete="off" name="contentsno_" id="contentsno_" value="${campEmailForm.CONTENTSNO_ }">
                                                    						<input type="hidden" name="contentsno" id="contentsno" value="0"/>                                                    						
                                                    						<span class="input-group-addon">
                                                        						<a><i class="fa fa-search"></i></a>
                                                    						</span>
                                                						</div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="box6 col-lg-12 col-xl-4 p-0">
                                                        <table class="table table-bordered mb-0 border-top-0">
                                                            <colgroup>
                                                                <col style="width: 110px; background: #fafafa;">
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody>
                                                                <tr>
                                                                    <th class="border-top-0">발송형태</th>
                                                                    <td class="border-top-0" style="height: 40px;">
                                                                        <select class="form-control validate error required checkV" id="sendtype" name="sendtype" >
                                            								<option label="선택" value=""/>
                                                							<c:forEach var="sendType" items="${SENDTYPE }">
                                                								<c:choose>
                                                									<c:when test="${campEmailForm.SENDTYPE eq sendType.codeval}">
                                                										<option selected label="${sendType.codename }" value="${sendType.codeval }"/>
                                                									</c:when>
                                                									<c:otherwise>
                                                										<option label="${sendType.codename }" value="${sendType.codeval }"/>
                                                									</c:otherwise>
                                                								</c:choose>
                                                							</c:forEach>
                                                						</select>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="box7 col-lg-12 col-xl-4 p-0">
                                                        <table class="table table-bordered mb-0 border-top-0">
                                                            <colgroup>
                                                                <col style="width: 110px; background: #fafafa;">
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody>
                                                                <tr>
                                                                    <th class="border-top-0" style="height: 40px;">테스트 발송자</th>
                                                                    <td class="border-top-0">${sessionScope.USERNAME }</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="box8 col-lg-12 col-xl-4 p-0">
                                                        <table class="table table-bordered mb-0 border-top-0">
                                                            <colgroup>
                                                                <col style="width: 110px; background: #fafafa;">
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody>
                                                                <tr>
                                                                    <th class="border-top-0">테스트 메일</th>
                                                                    <td class="border-top-0">
                                                                        <input type="text" name="tester" id="tester" class="form-control" value="${campEmailForm.TESTER }">
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="box7 col-lg-12 col-xl-6 p-0">
                                                        <table class="table table-bordered mb-0 border-top-0">
                                                            <colgroup>
                                                                <col style="width: 110px; background: #fafafa;">
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody>
                                                                <tr class="direct">
                                                                    <th>발송일자</th>
                                                                    <td>
                                                                        <div class="input-group p-0">
                                                                            <div class="d-flex date date01">
                                                                              <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" id="senddate" name="senddate" class="form-control" value="${campEmailForm.SENDDATE }">
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr class="days">
                                                                    <th>요일설정</th>
                                                                    <td style="padding: 7px 8px;">
                                                                        <select class="form-control float-left col-5 mr-1" id="week" name="week" >
                                            								<option label="선택" value="0"/>
                                                							<c:forEach var="weekend" items="${WEEKEND }">
                                                								<c:choose>
                                                									<c:when test="${campEmailForm.WEEK eq weekend.codeval}">
                                                										<option selected label="${weekend.codename }" value="${weekend.codeval }"/>
                                                									</c:when>
                                                									<c:otherwise>
                                                										<option label="${weekend.codename }" value="${weekend.codeval }"/>
                                                									</c:otherwise>
                                                								</c:choose>
                                                							</c:forEach>
                                                						</select>
                                                                        <select class="form-control float-left col-5" id="day" name="day" >
                                            								<option label="선택" value="0"/>
                                                							<c:forEach var="day" items="${DAY }">
                                                								<c:choose>
                                                									<c:when test="${campEmailForm.DAY eq day.codeval}">
                                                										<option selected label="${day.codename }" value="${day.codeval }"/>
                                                									</c:when>
                                                									<c:otherwise>
                                                										<option label="${day.codename }" value="${day.codeval }"/>
                                                									</c:otherwise>
                                                								</c:choose>
                                                							</c:forEach>
                                                						</select>
                                                                    </td>
                                                                </tr>
                                                                <tr class="term">
                                                                    <th>기간설정</th>
                                                                    <td style="padding: 7px 8px;">
                                                                        <div class="input-group p-0">
                                                                            <div class="d-flex date date01 col-lg-5 col-md-5 p-0 col-5">
                                                                              <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" name="startdate" id="startdate" class="form-control" value="${campForm.STARTDATE }">
                                                                            </div>
                                                                            <h3 class="text-center col-lg-1 col-1 p-0">~</h3>
                                                                            <div class="d-flex date date02 col-lg-5 col-md-5 p-0 col-5">
                                                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" name="enddate" id="enddate" class="form-control" value="${campForm.ENDDATE }">
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="box7 col-lg-12 col-xl-6 p-0">
                                                        <table class="table table-bordered mb-0 border-top-0">
                                                            <colgroup>
                                                                <col style="width: 110px; background: #fafafa;">
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody>
                                                               <tr class="direct">
                                                                    <th>발송일시</th>
                                                                    <td style="padding: 7px 8px;">
                                                                        <div class="input-group clockpicker" data-autoclose="true">
                                            								<span class="input-group-addon">
                                    											<span class="fa fa-clock-o"></span>
                                											</span>
                                											<input type="text" class="form-control" autocomplete="off" name="sendtime" id="sendtime" value="${campEmailForm.SENDTIME }">
                            											</div>	
                                                                    </td>
                                                                </tr>
                                                                <tr class="days">
                                                                    <th>발송일시</th>
                                                                    <td style="padding: 7px 8px;">
                                                                        <div class="input-group clockpicker" data-autoclose="true">
                                            								<span class="input-group-addon">
                                    											<span class="fa fa-clock-o"></span>
                                											</span>
                                											<input type="text" class="form-control" autocomplete="off" name="sendtime" id="sendtime" value="${campEmailForm.SENDTIME }">
                            											</div>
                                                                    </td>
                                                                </tr>
                                                                <tr class="term">
                                                                    <th>발송일시</th>
                                                                    <td style="padding: 7px 8px;">
                                                                        <div class="input-group clockpicker" data-autoclose="true">
                                            								<span class="input-group-addon">
                                    											<span class="fa fa-clock-o"></span>
                                											</span>
                                											<input type="text" class="form-control" autocomplete="off" name="sendtime" id="sendtime" value="${campEmailForm.SENDTIME }">
                            											</div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="box8 col-lg-12 col-xl-12 p-0">
                                                        <table class="table table-bordered mb-0 border-top-0">
                                                            <colgroup>
                                                                <col style="width: 110px; background: #fafafa;">
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody>
                                                                <tr>
                                                                    <th class="border-top-0">제목</th>
                                                                    <td class="border-top-0">
                                                                        <input type="text" name="title" id="title" class="form-control" value="${campEmailForm.TITLE }">
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="box9 col-12 p-0 border-top-0">
                                                        <table class="table table-bordered">
                                                            <tr>
                                                                <td>
                                                                    <textarea name="senddesc" id="senddesc"  class="form-control summernote" style="resize:none; height: 8em;">${campEmailForm.SENDDESC }</textarea>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <input type="hidden" name="no" id="no" value="${campEmailForm.NO }" />
                                        			<input type="hidden" name="sendform" id="sendform" value="1" />
                                                </div>
                                            </div>
                                        </div>
                                        </c:if>
                                        <c:if test="${fn:substring(urls, 0, 13)  eq '/campaign/sms' }">
                                        	<div role="tabpanel" id="sumbitTab2" class="tab-pane">
                                                        <div class="panel-body">
                                                        <input type="hidden" id="sendform" name="sendform" value="2"/>
                                                            <div class="box col-12 tooltip-demo" style="padding-left: 0px;padding-right: 0px;">
																<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
																	<a href="/campaign" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="목록"><i class="fa fa-list"></i></a>
																	<a href="/campaign/${campInfo.CAMPNO }/#wizard-t-1" class="btn btn-primary">고객 추출 화면</a>
	                          									</div>													
																<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
																	<a href="/campaign/${campInfo.CAMPNO }/#wizard-t-2" class="btn btn-primary">취소</a>
																	<button id="btn" class="btn btn-primary">저장</button>
																</div>
															</div>
                                                            <div class="ibox-content row">
                                                                <div class="box1 col-lg-12 col-xl-4 p-0">
                                                                    <table class="table table-bordered mb-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th>캠페인명</th>
                                                                                <td>${campInfo.CAMPNAME }</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>캠페인기간</th>
                                                                                <td>${campInfo.CAMPDATE_ }</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box2 col-lg-12 col-xl-4 p-0">
                                                                    <table class="table table-bordered mb-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th>캠페인 유형</th>
                                                                                <td>${campInfo.CAMPTYPE_ }</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>담당자</th>
                                                                                <td>${campInfo.OWNER_ }</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box3 col-lg-12 col-xl-4 p-0">
                                                                    <table class="table table-bordered mb-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th>진행단계</th>
                                                                                <td>${campInfo.CAMPSTEP_ }</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>대상고객수</th>
                                                                                <td>${targetCustCnt} 명</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box4 col-lg-12 col-xl-6 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th class="border-top-0">회신전화번호</th>
                                                                                <td><input type="text" name="sender" id="sender" class="form-control" value="${campSmsForm.SENDER }"/></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>테스트발송자</th>
                                                                                <td class="border-top-0">${sessionScope.USERNAME }</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>테스트 전화번호</th>
                                                                                <td>
                                                                        			<input type="text" name="tester" id="tester" class="form-control" value="${campSmsForm.TESTER }">
                                                                        		</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송형태</th>
                                                                                <td>
                                                                                    <select class="form-control validate error required checkV" id="sendtype" name="sendtype" >
                                            											<option label="선택" value=""/>
                                                										<c:forEach var="sendType" items="${SENDTYPE }">
                                                											<c:choose>
                                                												<c:when test="${campSmsForm.SENDTYPE eq sendType.codeval}">
                                                													<option selected label="${sendType.codename }" value="${sendType.codeval }"/>
                                                												</c:when>
                                                												<c:otherwise>
                                                													<option label="${sendType.codename }" value="${sendType.codeval }"/>
                                                												</c:otherwise>
                                                											</c:choose>
                                                										</c:forEach>
                                                									</select>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="direct">
                                                                                <th >발송일자</th>
                                                                                <td>
                                                                                    <div class="input-group p-0">
                                                                            			<div class="d-flex date date01">
                                                                              				<span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" id="senddate" name="senddate" class="form-control" value="${campSmsForm.SENDDATE }">
                                                                            			</div>
                                                                        			</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="direct">
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    <div class="input-group clockpicker" data-autoclose="true">
                                            											<span class="input-group-addon">
                                    														<span class="fa fa-clock-o"></span>
                                														</span>
                                														<input type="text" class="form-control" autocomplete="off" name="sendtime" id="sendtime" value="${campSmsForm.SENDTIME }">
                            														</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="days">
                                                                                <th>요일설정</th>
                                                                                <td tyle="padding: 7px 8px;">
                                                                                    <select class="form-control col-5 mr-1" id="week" name="week" >
                                            											<option label="선택" value="0"/>
                                                											<c:forEach var="weekend" items="${WEEKEND }">
                                                												<c:choose>
                                                												<c:when test="${campEmailForm.WEEK eq weekend.codeval}">
                                                													<option selected label="${weekend.codename }" value="${weekend.codeval }"/>
                                                												</c:when>
                                                												<c:otherwise>
                                                													<option label="${weekend.codename }" value="${weekend.codeval }"/>
                                                												</c:otherwise>
                                                											</c:choose>
                                                										</c:forEach>
                                                									</select>
                                                                        			<select class="form-control col-5" id="day" name="day" >
                                            											<option label="선택" value="0"/>
                                                											<c:forEach var="day" items="${DAY }">
                                                												<c:choose>
                                                												<c:when test="${campEmailForm.DAY eq day.codeval}">
                                                													<option selected label="${day.codename }" value="${day.codeval }"/>
                                                												</c:when>
                                                												<c:otherwise>
                                                													<option label="${day.codename }" value="${day.codeval }"/>
                                                												</c:otherwise>
                                                											</c:choose>
                                                										</c:forEach>
                                                									</select>
                                                                            	</td>
                                                                            </tr>
                                                                            <tr class="days">
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    <div class="input-group clockpicker" data-autoclose="true">
                                            											<span class="input-group-addon">
                                    														<span class="fa fa-clock-o"></span>
                                														</span>
                                														<input type="text" class="form-control" autocomplete="off" name="sendtime" id="sendtime" value="${campSmsForm.SENDTIME }">
                            														</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="term">
                                                                                <th>기간설정</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    <div class="input-group p-0">
                                                                                        <div class="d-flex date date01 col-lg-5 col-md-5 p-0 col-5">
                                                                                          <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="">
                                                                                        </div>
                                                                                        <h3 class="text-center col-lg-1 col-1 p-0">~</h3>
                                                                                        <div class="d-flex date date02 col-lg-5 col-md-5 p-0 col-5">
                                                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="">
                                                                                        </div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="term">
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    <div class="input-group clockpicker" data-autoclose="true">
                                            											<span class="input-group-addon">
                                    														<span class="fa fa-clock-o"></span>
                                														</span>
                                														<input type="text" class="form-control" autocomplete="off" name="sendtime" id="sendtime" value="${campSmsForm.SENDTIME }">
                            														</div>
                                                                                </td>
                                                                            </tr>
                                                                            
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box6 col-lg-12 col-xl-6" style="padding-top: 4rem;">
                                                                    <div class="sms-form">
																		<h4>SMS</h4>
																		<div class="sub-text">
                                                                            <textarea name="name" disabled="" placeholder="내용을 입력하세요."></textarea>
                                                                        </div>
                                                                        <div class="limit-text">
                                                                        	<p><span>00</span> / 90</p>
                                                                        </div>
                                                                	</div>
                                                                </div>
                                                                <input type="hidden" name="no" id="no" value="${campSmsForm.NO }" />
                                        						<input type="hidden" name="sendform" id="sendform" value="2" />
                                                            </div>
                                                        </div>
                                                    </div>
                                        </c:if>
                                        <c:if test="${fn:substring(urls, 0, 13)  eq '/campaign/mms' }">
                                        		<div role="tabpanel" id="sumbitTab3" class="tab-pane">
                                                        <div class="panel-body">
                                                        <input type="hidden" id="sendform" name="sendform" value="4"/>
                                                            <div class="box col-12 tooltip-demo" style="padding-left: 0px;padding-right: 0px;">
																<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
																	<a href="/campaign" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="목록"><i class="fa fa-list"></i></a>
																	<a href="/campaign/${campInfo.CAMPNO }/#wizard-t-1" class="btn btn-primary">고객 추출 화면</a>
	                          									</div>													
																<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
																	<a href="/campaign/${campInfo.CAMPNO }/#wizard-t-2" class="btn btn-primary">취소</a>
																	<button  class="btn btn-primary">저장</button>
																</div>
															</div>
                                                            <div class="ibox-content row">
                                                                <div class="box1 col-lg-12 col-xl-4 p-0">
                                                                    <table class="table table-bordered mb-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th>캠페인명</th>
                                                                                <td>${campInfo.CAMPNAME }</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>캠페인기간</th>
                                                                                <td>${campInfo.CAMPDATE_ }</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box2 col-lg-12 col-xl-4 p-0">
                                                                    <table class="table table-bordered mb-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th>캠페인 유형</th>
                                                                                <td>${campInfo.CAMPTYPE_ }</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>담당자</th>
                                                                                <td>${campInfo.OWNER_ }</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box3 col-lg-12 col-xl-4 p-0">
                                                                    <table class="table table-bordered mb-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th>진행단계</th>
                                                                                <td>${campInfo.CAMPSTEP_ }</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>대상고객수</th>
                                                                                <td>${targetCustCnt} 명</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box4 col-lg-12 col-xl-6 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th>회신전화번호</th>
                                                                                <td>
                                                                                	<input type="text" name="sender" id="sender" class="form-control" value="${campMmsForm.SENDER }">
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>테스트발송자</th>
                                                                                <td class="border-top-0">${sessionScope.USERNAME }</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>테스트 전화번호</th>
                                                                                <td>
                                                                        			<input type="text" name="tester" id="tester" class="form-control" value="${campMmsForm.TESTER }">
                                                                        		</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송형태</th>
                                                                                <td>
                                                                                    <select class="form-control validate error required checkV" id="sendtype" name="sendtype" >
                                            											<option label="선택" value=""/>
                                                										<c:forEach var="sendType" items="${SENDTYPE }">
                                                											<c:choose>
                                                												<c:when test="${campMmsForm.SENDTYPE eq sendType.codeval}">
                                                													<option selected label="${sendType.codename }" value="${sendType.codeval }"/>
                                                												</c:when>
                                                												<c:otherwise>
                                                													<option label="${sendType.codename }" value="${sendType.codeval }"/>
                                                												</c:otherwise>
                                                											</c:choose>
                                                										</c:forEach>
                                                									</select>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="direct">
                                                                                <th>발송일자</th>
                                                                                <td>
                                                                                    <div class="input-group p-0">
                                                                            			<div class="d-flex date date01">
                                                                              				<span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" id="senddate" name="senddate" class="form-control" value="${campMmsForm.SENDDATE }">
                                                                            			</div>
                                                                        			</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="direct">
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    <div class="input-group clockpicker" data-autoclose="true">
                                            											<span class="input-group-addon">
                                    														<span class="fa fa-clock-o"></span>
                                														</span>
                                														<input type="text" class="form-control" autocomplete="off" name="sendtime" id="sendtime" value="${campMmsForm.SENDTIME }">
                            														</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="days">
                                                                                <th>요일설정</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    <select class="form-control float-left col-5 mr-1" id="week" name="week" >
                                            											<option label="선택" value="0"/>
                                                											<c:forEach var="weekend" items="${WEEKEND }">
                                                												<c:choose>
                                                												<c:when test="${campMmsForm.WEEK eq weekend.codeval}">
                                                													<option selected label="${weekend.codename }" value="${weekend.codeval }"/>
                                                												</c:when>
                                                												<c:otherwise>
                                                													<option label="${weekend.codename }" value="${weekend.codeval }"/>
                                                												</c:otherwise>
                                                											</c:choose>
                                                										</c:forEach>
                                                									</select>
                                                                        			<select class="form-control float-left col-5" id="day" name="day" >
                                            											<option label="선택" value="0"/>
                                                											<c:forEach var="day" items="${DAY }">
                                                												<c:choose>
                                                												<c:when test="${campMmsForm.DAY eq day.codeval}">
                                                													<option selected label="${day.codename }" value="${day.codeval }"/>
                                                												</c:when>
                                                												<c:otherwise>
                                                													<option label="${day.codename }" value="${day.codeval }"/>
                                                												</c:otherwise>
                                                											</c:choose>
                                                										</c:forEach>
                                                									</select>
                                                                            	</td>
                                                                            </tr>
                                                                            <tr class="days">
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    <div class="input-group clockpicker" data-autoclose="true">
                                            											<span class="input-group-addon">
                                    														<span class="fa fa-clock-o"></span>
                                														</span>
                                														<input type="text" class="form-control" autocomplete="off" name="sendtime" id="sendtime" value="${campMmsForm.SENDTIME }">
                            														</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="term">
                                                                                <th>기간설정</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    <div class="input-group p-0">
                                                                                        <div class="d-flex date date01 col-lg-5 col-md-5 p-0 col-5">
                                                                                          <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="">
                                                                                        </div>
                                                                                        <h3 class="text-center col-lg-1 col-1 p-0">~</h3>
                                                                                        <div class="d-flex date date02 col-lg-5 col-md-5 p-0 col-5">
                                                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="">
                                                                                        </div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr class="term">
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    <div class="input-group clockpicker" data-autoclose="true">
                                            											<span class="input-group-addon">
                                    														<span class="fa fa-clock-o"></span>
                                														</span>
                                														<input type="text" class="form-control" autocomplete="off" name="sendtime" id="sendtime" value="${campMmsForm.SENDTIME }">
                            														</div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th class="border-top-0">첨부파일</th>
                                            									<td class="border-top-0">
                                            										<div class="col-md-6">
																						<input id="file1" name="file1" class="form-control" type="file">
																						<p class="help-block">크기 250Kbyte 이하의 파일 선택</p>
																					</div>
                                            									</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>첨부이미지2</th>
                                                                                <td class="border-top-0">
                                            										<div class="col-md-6">
																						<input id="file2" name="file2" class="form-control" type="file">
																						<p class="help-block">크기 250Kbyte 이하의 파일 선택</p>
																					</div>
                                            									</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>첨부이미지3</th>
                                                                                <td class="border-top-0">
                                            										<div class="col-md-6">
																						<input id="file3" name="file3" class="form-control" type="file">
																						<p class="help-block">크기 250Kbyte 이하의 파일 선택</p>
																					</div>
                                            									</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box6 col-lg-12 col-xl-6" style="padding-top: 4rem;">
                                                                    <div class="sms-form">
                                                                        <div class="sub-text">
                                                                            <textarea name="senddesc" id="senddesc" placeholder="내용을 입력하세요."></textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <input type="hidden" name="no" id="no" value="${campMmsForm.NO }" />
                                        						<input type="hidden" name="sendform" id="sendform" value="3" />
                                                            </div>
                                                        </div>
                                                    </div>
                                        	</c:if>
                                        	<input type="hidden" name="campno" id="campno" value="${campInfo.CAMPNO }" />
                                        </form:form>
                                        <div role="tabpanel" id="sumbitTab4" class="tab-pane">
                                            <div class="panel-body"></div>
                                        </div>
                                        <div class="col-lg-6">
                    						<div class="ibox ">
                        						<div class="ibox-title">
                            						<h5>자주사용하는 양식</h5>
                            						<div class="ibox-tools">
                                						<a class="collapse-link">
                                    						<i class="fa fa-chevron-up"></i>
                                						</a>
                            						</div>
                        						</div>
                        						<div class="ibox-content">
                            						<div class="panel-body">
                                						<div class="panel-group" id="accordion">
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
<!-- Content End -->
			
<!-- foot -->
			<div class="footer">
				<%@ include file="/WEB-INF/views/template/menu/foot.jsp"%>
			</div>
<!-- right side -->
		<div id="right-sidebar">
			<%@ include file="/WEB-INF/views/template/menu/rightside.jsp"%>
		</div>
</div>
<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_validate.js"></script>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_cp.js"></script><!-- summernote-->		
	<script src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script><!-- summernote-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/clockpicker/clockpicker.js"></script>
	<script>
	
	$(document).ready(function () {
		$('.summernote').summernote();
		$('.clockpicker').clockpicker();	
		$('.date').datepicker({
			keyboardNavigation:false,
			forceParse:false,
			autoclose:true
		});
		enableSubmit();
		
		var data = $('#sendtype').val();
		sendtype(data);
		
		var no = $('#no').val();
		if(no ==''){
			$('#no').val(0);
		}
		var url = window.location.pathname;
		var type = url.split('/');
		var id;
		if(type[2] == 'email'){
			id = 1;
		}else if(type[2] == 'sms'){
			id = 2;
		}else if(type[2] == 'mms'){
			id = 3;
		}
		campContents(id,url);
	});

	$('#btn').click(function(e){
		smsToLms('senddesc');
	});

	</script>		

</body>
</html>