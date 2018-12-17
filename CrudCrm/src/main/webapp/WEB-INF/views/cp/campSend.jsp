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
                                    <c:if test="${fn:substring(urls, 0, 15)  eq '/campaign/email' }">
                                    <form:form action="${pageContext.request.contextPath}/campaignform/${campInfo.CAMPNO }" method="POST">
                                    	<div role="tabpanel" id="sumbitTab1" class="tab-pane active">
                                        	<div class="panel-body">
                                            	<div class="w-100 text-right mb-2">
                                                	<a href="/campaign" class="btn btn-primary">캠페인 목록</a>
                                                    <a href="/campaign/${campInfo.CAMPNO }#wizard-t-1" class="btn btn-primary">고객 추출 화면</a>
                                                    <div class="d-inline-block mt-sx-1">
                                                    	<button type="submit" class="btn btn-primary">저장</button>
                                                    	<a href="javascript:void(0);" class="btn btn-primary test" data-style="zoom-in">테스트 발송</a>
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
                                                                    <td>발송</td>
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
                                                                    <td class="border-top-0"><input type="text" id="returnmail" name="returnmail" class="form-control" value="${campForm.RETURNMAIL}"></td>
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
                                                    						<input type="text" class="form-control" autocomplete="off" name="contentsno_" id="contentsno_" value="${campForm.CONTENTSNO_ }">
                                                    						<input type="hidden" name="contentsno" id="contentsno" value=${campForm.CONTENTSNO }>
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
                                                                        <select name="sendtype" id="sendtype" class="form-control" style="height: 23px;">
                                                                        	<option value="0" <c:if test='${campForm.SENDTYPE eq 0}'>selected</c:if>>선택</option>
                                                                        	<option value="1" <c:if test='${campForm.SENDTYPE eq 1}'>selected</c:if>>즉시발송</option>
                                                                        	<option value="2" <c:if test='${campForm.SENDTYPE eq 2}'>selected</c:if>>예약발송</option>
                                                   							<option value="3" <c:if test='${campForm.SENDTYPE eq 3}'>selected</c:if>>요일반복발송</option>
                                                   							<option value="4" <c:if test='${campForm.SENDTYPE eq 4}'>selected</c:if>>기간반복발송</option>
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
                                                                        <input type="text" name="testmail" id="testmail" class="form-control" value="${campForm.TESTMAIL }">
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
                                                                              <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" id="senddate" name="senddate" class="form-control" value="${campForm.SENDDATE }">
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr class="days">
                                                                    <th>요일설정</th>
                                                                    <td style="padding: 7px 8px;">
                                                                        <select name="week" id="week" class="form-control float-left col-5 mr-1">
                                                                            <option value="0" <c:if test='${campForm.WEEK eq 0}'>selected</c:if>>선택</option>
                                                                        	<option value="1" <c:if test='${campForm.WEEK eq 1}'>selected</c:if>>1주차</option>
                                                                        	<option value="2" <c:if test='${campForm.WEEK eq 2}'>selected</c:if>>2주차</option>
                                                   							<option value="3" <c:if test='${campForm.WEEK eq 3}'>selected</c:if>>3주차</option>
                                                   							<option value="4" <c:if test='${campForm.WEEK eq 4}'>selected</c:if>>4주차</option>
                                                   							<option value="5" <c:if test='${campForm.WEEK eq 5}'>selected</c:if>>5주차</option>
                                                                        </select>
                                                                        <select name="day" id="day" class="form-control float-left col-5">
                                                                            <option value="0" <c:if test='${campForm.DAY eq 0}'>selected</c:if>>선택</option>
                                                                        	<option value="2" <c:if test='${campForm.DAY eq 2}'>selected</c:if>>월요일</option>
                                                                        	<option value="3" <c:if test='${campForm.DAY eq 3}'>selected</c:if>>화요일</option>
                                                   							<option value="4" <c:if test='${campForm.DAY eq 4}'>selected</c:if>>수요일</option>
                                                   							<option value="5" <c:if test='${campForm.DAY eq 5}'>selected</c:if>>목요일</option>
                                                   							<option value="6" <c:if test='${campForm.DAY eq 6}'>selected</c:if>>금요일</option>
                                                   							<option value="7" <c:if test='${campForm.DAY eq 7}'>selected</c:if>>토요일</option>
                                                   							<option value="1" <c:if test='${campForm.DAY eq 1}'>selected</c:if>>일요일</option>
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
                                                                        <select name="sendhour" id="sendhour" class="form-control float-left col-5 mr-1">
                                                                        	<option value="0" <c:if test='${campForm.SENDHOUR eq 0}'>selected</c:if>>선택</option>
                                                                        	<option value="1" <c:if test='${campForm.SENDHOUR eq 1}'>selected</c:if>>1</option>
                                                                        	<option value="24" <c:if test='${campForm.SENDHOUR eq 24}'>selected</c:if>>24</option>
                                                                        </select>
                                                                        <select name="sendminute" id="sendminute" class="form-control float-left col-5">
                                                                            <option value="00">00분</option>
                                                                            <option value="59">59분</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <tr class="days">
                                                                    <th>발송일시</th>
                                                                    <td style="padding: 7px 8px;">
                                                                        <select name="sendhour" id="sendhour" class="form-control float-left col-5 mr-1">
                                                                            <option value="1">1시</option>
                                                                            <option value="24">24시</option>
                                                                        </select>
                                                                        <select name="sendminute" id="sendminute" class="form-control float-left col-5">
                                                                            <option value="00">00분</option>
                                                                            <option value="59">59분</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <tr class="term">
                                                                    <th>발송일시</th>
                                                                    <td style="padding: 7px 8px;">
                                                                        <select name="sendhour" id="sendhour" class="form-control float-left col-5 mr-1">
                                                                            <option value="1">1시</option>
                                                                            <option value="24">24시</option>
                                                                        </select>
                                                                        <select name="sendminute" id="sendminute" class="form-control float-left col-5">
                                                                            <option value="00">00분</option>
                                                                            <option value="59">59분</option>
                                                                        </select>
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
                                                                        <input type="text" name="title" id="title" class="form-control" value="${campForm.TITLE }">
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="box9 col-12 p-0 border-top-0">
                                                        <table class="table table-bordered">
                                                            <tr>
                                                                <td>
                                                                    <textarea name="senddesc" id="senddesc"  class="form-control summernote" style="resize:none; height: 8em;">${campForm.SENDDESC }</textarea>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <input type="hidden" name="sendtype" id="sendtype" class="form-control" value="10">
                                                </div>
                                            </div>
                                        </div>
                                        </form:form>
                                        </c:if>
                                        <c:if test="${fn:substring(urls, 0, 13)  eq '/campaign/sms' }">
                                        <div role="tabpanel" id="sumbitTab2" class="tab-pane">
                                                        <div class="panel-body">
                                                            <div class="w-100 text-right mb-2">
                                                                <a href="/campaign" class="btn btn-primary">캠페인 목록</a>
                                                                <a href="/campaign/${campInfo.CAMPNO }/#wizard-t-1" class="btn btn-primary">고객 추출 화면</a>
                                                                <div class="d-inline-block mt-sx-1">
                                                                <a href="/campaign/sms/${campInfo.CAMPNO }" class="btn btn-primary">발송입력</a>
                                                                <a href="javascript:void(0);" class="btn btn-primary">테스트발송</a>
                                                                <a href="javascript:void(0);" class="btn btn-primary">발송</a>
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
                                                                                <td>발송</td>
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
                                                                                <td class="border-top-0">${campForm.RETURNMAIL }</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>서식형태</th>
                                                                                <td>
                                                                                    <span class="input-group-addon">
                                                                                        <a href="javascript:void(0);"><i class="fa fa-search"></i></a>
                                                                                    </span>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>테스트발송자</th>
                                                                                <td>010-7777-7777</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>테스트 전화번호</th>
                                                                                <td>010-7777-7777</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송형태</th>
                                                                                <td>
                                                                                    <select class="form-control" style="height: 23px;">
                                                                                        <option>회원</option>
                                                                                        <option>비회원</option>
                                                                                    </select>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송일자</th>
                                                                                <td>
                                                                                    <div class="input-group p-0">
                                                                                        <div class="d-flex date date01">
                                                                                          <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="">
                                                                                        </div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    <select name="" id="" class="form-control float-left col-5 mr-1">
                                                                                        <option value="">00시</option>
                                                                                        <option value="">00시</option>
                                                                                        <option value="">00시</option>
                                                                                    </select>
                                                                                    <select name="" id="" class="form-control float-left col-5">
                                                                                        <option value="">00시</option>
                                                                                        <option value="">00시</option>
                                                                                        <option value="">00시</option>
                                                                                    </select>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>요일설정</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    <select name="" id="" class="form-control float-left col-5 mr-1">
                                                                                        <option value="">월</option>
                                                                                        <option value="">화</option>
                                                                                        <option value="">수</option>
                                                                                    </select>
                                                                                    <select name="" id="" class="form-control float-left col-5">
                                                                                        <option value="">월</option>
                                                                                        <option value="">화</option>
                                                                                        <option value="">수</option>
                                                                                    </select>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    <select name="" id="" class="form-control float-left col-5 mr-1">
                                                                                        <option value="">00시</option>
                                                                                        <option value="">00시</option>
                                                                                        <option value="">00시</option>
                                                                                    </select>
                                                                                    <select name="" id="" class="form-control float-left col-5">
                                                                                        <option value="">00시</option>
                                                                                        <option value="">00시</option>
                                                                                        <option value="">00시</option>
                                                                                    </select>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
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
                                                                            <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    <select name="" id="" class="form-control float-left col-5 mr-1">
                                                                                        <option value="">00시</option>
                                                                                        <option value="">00시</option>
                                                                                        <option value="">00시</option>
                                                                                    </select>
                                                                                    <select name="" id="" class="form-control float-left col-5">
                                                                                        <option value="">00시</option>
                                                                                        <option value="">00시</option>
                                                                                        <option value="">00시</option>
                                                                                    </select>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box6 col-lg-12 col-xl-6" style="padding-top: 4rem;">
                                                                    <div class="sms-form">
                                                                        <div class="num-text">
                                                                            <input type="text" placeholder="번호를 입력하세요.">
                                                                        </div>
                                                                        <div class="sub-text">
                                                                            <textarea name="name" placeholder="내용을 입력하세요."></textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                        </c:if>
                                        <c:if test="${fn:substring(urls, 0, 13)  eq '/campaign/mms' }">
                                        <div role="tabpanel" id="sumbitTab3" class="tab-pane">
                                            <div class="panel-body">
                                                <div class="w-100 text-right mb-2">
                                                	<a href="/campaign" class="btn btn-primary">캠페인 목록</a>
                                                    <a href="/campaign/${campInfo.CAMPNO }" class="btn btn-primary">고객 추출 화면</a>
                                                    <div class="d-inline-block mt-sx-1">
                                                    	<a href="javascript:void(0);" class="btn btn-primary">미리보기</a>
                                                    	<form:form action="${pageContext.request.contextPath}/campaign/test" method="POST">
                                                    		<button type="submit" class="btn btn-primary" data-style="zoom-in">테스트 발송</button>
                                                    	</form:form>
                                                    	<form:form action="${pageContext.request.contextPath}/campaign/send" method="POST">
                                                        	<button type="submit" class="btn btn-primary" data-style="zoom-in">발송</button>
                                                        </form:form>
                                                    </div>
                                                </div>
                                                <div class="ibox-content row">
                                                    <div class="box1 col-lg-12 col-xl-4 p-0">
                                                    <input type="hidden" name="campno" id="campno" value="${campInfo.CAMPNO }">
                                                        <table class="table table-bordered mb-0">
                                                            <colgroup>
                                                                <col style="width: 110px; background: #fafafa;">
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody>
                                                                <tr>
                                                                    <th>캠페인명</th>
                                                                    <td>테스트 캠페인</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>캠페인기간</th>
                                                                    <td>2018/01/01 ~ 2018/01/14</td>
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
                                                                    <td>신규고객확보</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>담당자</th>
                                                                    <td>실행</td>
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
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>대상고객수</th>
                                                                    <td>0</td>
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
                                                                    <th class="border-top-0">회신번호</th>
                                                                    <td class="border-top-0"><input type="text" class="form-control"></td>
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
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control">
                                                                            <span class="input-group-addon">
                                                                                <a href="javascript:void(0);"><i class="fa fa-search"></i></a>
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
                                                                        <select name="" id="" class="form-control" style="height: 23px;">
                                                                            <option value="">즉시발송</option>
                                                                            <option value="">예약발송</option>
                                                                            <option value="">요일반복발송</option>
                                                                            <option value="">기간반복발송</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>1회예약 발송</th>
                                                                    <td style="padding: 5.5px 8px">
                                                                        <div class="i-checks">
                                                                            <label><input type="radio" value="예약발송" name="" ><i></i> 예약발송</label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>요일반복 발송</th>
                                                                    <td style="padding: 5.5px 8px">
                                                                        <div class="i-checks">
                                                                            <label><input type="radio" value="예약발송" name="" ><i></i> 예약발송</label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>기간반복 발송</th>
                                                                    <td style="padding: 5.5px 8px">
                                                                        <div class="i-checks">
                                                                            <label><input type="radio" value="예약발송" name="" ><i></i> 예약발송</label>
                                                                        </div>
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
                                                                    <td class="border-top-0">홍길동</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>발송일자</th>
                                                                    <td>
                                                                        <div class="input-group p-0">
                                                                            <div class="d-flex date date01">
                                                                              <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="">
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>요일설정</th>
                                                                    <td style="padding: 7px 8px;">
                                                                        <select name="" id="" class="form-control float-left col-5 mr-1">
                                                                            <option value="">월</option>
                                                                            <option value="">화</option>
                                                                            <option value="">수</option>
                                                                            <option value="">목</option>
                                                                            <option value="">금</option>
                                                                        </select>
                                                                        <select name="" id="" class="form-control float-left col-5">
                                                                            <option value="">월</option>
                                                                            <option value="">화</option>
                                                                            <option value="">수</option>
                                                                            <option value="">목</option>
                                                                            <option value="">금</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <tr>
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
                                                                    <th class="border-top-0">테스트 번호</th>
                                                                    <td class="border-top-0">
                                                                        <input type="text" class="form-control">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>발송일시</th>
                                                                    <td style="padding: 7px 8px;">
                                                                        <select name="" id="" class="form-control float-left col-5 mr-1">
                                                                            <option value="">1시</option>
                                                                            <option value="">24시</option>
                                                                        </select>
                                                                        <select name="" id="" class="form-control float-left col-5">
                                                                            <option value="">00분</option>
                                                                            <option value="">59분</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>발송일시</th>
                                                                    <td style="padding: 7px 8px;">
                                                                        <select name="" id="" class="form-control float-left col-5 mr-1">
                                                                            <option value="">1시</option>
                                                                            <option value="">24시</option>
                                                                        </select>
                                                                        <select name="" id="" class="form-control float-left col-5">
                                                                            <option value="">00분</option>
                                                                            <option value="">59분</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>발송일시</th>
                                                                    <td style="padding: 7px 8px;">
                                                                        <select name="" id="" class="form-control float-left col-5 mr-1">
                                                                            <option value="">1시</option>
                                                                            <option value="">24시</option>
                                                                        </select>
                                                                        <select name="" id="" class="form-control float-left col-5">
                                                                            <option value="">00분</option>
                                                                            <option value="">59분</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="box9 col-12 p-0 mt-3">
                                                        <div class="sms-form">
                                                            <div class="num-text">
                                                                <input type="text" placeholder="번호를 입력하세요.">
                                                            </div>
                                                            <div class="sub-text">
                                                                <textarea name="name" placeholder="내용을 입력하세요."></textarea>
                                                            </div>
                                                            <div class="limit-text">
																<p class="mb-0">0000/90자</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="sendtype" id="sendtype" class="form-control" value="30">
                                                </div>
                                            </div>
                                        </div>
                                        </c:if>
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

<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_cp.js"></script><!-- summernote-->		
	<script src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script><!-- summernote-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script>
	
	$(document).ready(function () {
		$('.summernote').summernote({});
		
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
		debugger;
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
		contents(id);
	});

	</script>		

</body>
</html>