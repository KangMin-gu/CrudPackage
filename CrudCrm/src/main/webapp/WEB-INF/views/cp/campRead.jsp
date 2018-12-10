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
<link href="${pageContext.request.contextPath}/resources/css/plugins/steps/jquery.steps.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/dualListbox/bootstrap-duallistbox.min.css" rel="stylesheet">
</head>

<body>
<style>
	.wizard > .content > .body{width: 100%; height: auto; background: #ffffff; padding: 2.5%; float: left; position: initial;}
    .wizard > .content > .body ul > li{list-style: none;}
    .wizard > .content > .body input{border: 1px solid #e5e6e7;}
    .wizard > .content > .body{position: relative;}
</style>
	<div id="wrapper">
<!-- leftside -->
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
    </div>
<!-- Top -->
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>

            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>캠페인 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/campaign">캠페인 목록</a>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>


<!-- Content -->
	<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content row">
                            <div id="wizard" style="height:auto">
                                <h1>캠페인정보</h1>
                                <div class="step-content">
                                	<div class="w-100 text-right mb-2">
                                		<form:form action="${pageContext.request.contextPath}/campaign/${campInfo.CAMPNO }" method="POST">
                                			<a href="${pageContext.request.contextPath}/campaign" class="btn btn-primary">목록</a>
                                			<a href="${pageContext.request.contextPath}/campaign/post/${campInfo.CAMPNO }" class="btn btn-primary">수정</a>
											<button class="btn btn-primary" type="submit" value="삭제">삭제</button>
										</form:form>
                            		</div>
                                    <div class="ibox">
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
                                                            <th>캠페인 기간</th>
                                                            <td>${campInfo.CAMPDATE_ }</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 col-xl-4 p-0">
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
                                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>진행단계</th>
                                                            <td>추출</td>
                                                        </tr>
                                                        <tr>
                                                            <th>대상 고객수</th>
                                                            <td>${targetCustCnt } 명</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box2 col-lg-12 p-0">
                                                <table class="table table-bordered border-top-0 mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th class="border-top-0">비고</th>
                                                            <td class="border-top-0">
                                                                <textarea name="campdesc" id="campdesc" disabled class="form-control" style="resize:none; height: 8em;" value="${campInfo.CAMPDESC }">${campInfo.CAMPDESC }</textarea>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <input type="hidden" id="campno" name="campno" value="${campInfo.CAMPNO }">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <h1>대상추출</h1>
                                <div class="step-content">
                                	<div class="w-100 text-right mb-2">
                                			<a href="${pageContext.request.contextPath}/campaign" class="btn btn-primary">목록</a>
                                			<a href="${pageContext.request.contextPath}/campaign/target/${campInfo.CAMPNO }" class="btn btn-primary">타켓추출</a>
                            		</div>
                                    <div class="ibox">
                                        <div class="ibox-title row border-0">
                                            <h4>캠페인 정보</h4>
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
                                                            <th>캠페인 기간</th>
                                                            <td>${campInfo.CAMPDATE_ }</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 col-xl-4 p-0">
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
                                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>진행단계</th>
                                                            <td>추출</td>
                                                        </tr>
                                                        <tr>
                                                            <th>대상 고객수</th>
                                                            <td>${targetCustCnt } 명</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ibox">
                                        <div class="ibox-title row border-0">
                                            <h4>대상 추출 </h4>
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
                                                            <th>성별</th>
                                                            <td>
                                                                ${campInfo.SEX }
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>고객구분</th>
                                                            <td>
                                                                ${campInfo.CUSTGUBUN }
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>나이</th>
                                                            <td>
                                                                ${campInfo.AGE1 } ~ ${campInfo.AGE2 }
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>고객등급</th>
                                                            <td>
                                                                ${campInfo.CUSTGRADE }
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>생일(월)</th>
                                                            <td>
                                                                ${campInfo.BIRTH }
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>활동등급</th>
                                                            <td>
                                                                ${campInfo.ACTGRADE }
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 col-xl-6 p-0">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>주소지 1</th>
                                                            <td>
                                                                ${campInfo.ADDR11 } ${campInfo.ADDR12 } ${campInfo.ADDR13 }
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 col-xl-6 p-0">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>주소지 2</th>
                                                            <td>
                                                                ${campInfo.ADDR21 } ${campInfo.ADDR22 } ${campInfo.ADDR23 }
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 col-xl-6 p-0">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>주소지 3</th>
                                                            <td>
                                                                ${campInfo.ADDR31 } ${campInfo.ADDR32 } ${campInfo.ADDR33 }
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 col-xl-6 p-0">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>주소지 4</th>
                                                            <td>
                                                                ${campInfo.ADDR41 } ${campInfo.ADDR42 } ${campInfo.ADDR43 }
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 col-xl-6 p-0">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>고객등록일</th>
                                                            <td style="padding: 7px 8px;">
                                                                ${campInfo.REGDATE1 } ~ ${campInfo.REGDATE2 }
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 col-xl-6 p-0">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>추출내용</th>
                                                            <td>
                                                                ${campInfo.REGDATE1 }
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 p-0 mt-5">
                                                <div class="tabs-container">
                                                    <ul class="nav nav-tabs" role="tablist">
                                                    	<li><a class="nav-link tabcust active" onclick="javaacript:tabTargetCust(1);" data-toggle="tab" href="#tab1">추출 대상자</a></li>
                                            			<li><a class="nav-link tabhistory" onclick="javascript:tabHistory();" data-toggle="tab" href="#tab2">추출이력</a></li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div role="tabpanel" id="tab1" class="tab-pane active">
															<div class="panel-body table-responsive">				
																<div class="box1 col-xl-3 p-0">
																	<div class="form-group row">
																		<label class="col-sm-3 col-form-label" style="padding-top: 3px;"><strong>고객명</strong></label>
																		<div class="col-sm-8">
                                        									<div class="input-group">                                        						
                                        										<input type="text" class="form-control" id="custname" name="custname" value="${search.custname }"> 
                                        										<span class="input-group-append"> 
                                        											<a onclick="javaacript:tabTargetCust(1)" class="btn btn-primary" style="padding-top: 2px;">검색 </a>
                                        										</span>
                                        									</div>
                                    									</div>
                                									</div>
																</div>		
																<table class="table table-bordered">
																	<colgroup>
																		<col style="width: 130px;" />
																		<col style="width: 130px;" />
																		<col style="width: 130px;" />
																		<col style="width: 200px;" />
																		<col style="width: 100px;" />
																		<col style="width: 100px;" />
																		<col style="width: 100px;" />
																		<col style="width: 300px;" />
																	</colgroup>
																	<thead>
																		<tr>
																			<th>고객명</th>
																			<th>고객ID</th>
																			<th>전화번호</th>
																			<th>이메일</th>
																			<th>정보활용동의</th>
																			<th>고객구분</th>
																			<th>고객등급</th>
																			<th>주소</th>
																		</tr>
																	</thead>
																	<tbody>
																		
																	</tbody>
																</table>
																<div class="m-auto" style="float:center;">
																	<ul class="pagination">
																		
																	</ul> 
																</div> 
															</div>									
														</div>
                                                        <div role="tabpanel" id="tab2" class="tab-pane ">
                                                            <div class="panel-body table-responsive">
                                                                <table class="table table-bordered">
                                                                    <colgroup>
                                                                        <col style="width: 10%" />
                                                                        <col style="width: 90%" />
                                                                    </colgroup>
                                                                    <thead>
                                                                        <tr>
                                                                             <th>등록일시</th>
                                                                            <th>추출 내용</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                      
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
                                <h1>캠페인발송</h1>
                                <div class="step-content">
                                    <div class="ibox">
                                        <div class="ibox-content row">
                                            <div class="tabs-container col-12">
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li><a class="nav-link active" data-toggle="tab" href="#sumbitTab1">EMAIL</a></li>
                                                    <li><a class="nav-link" data-toggle="tab" href="#sumbitTab2">SMS/LMS</a></li>
                                                    <li><a class="nav-link" data-toggle="tab" href="#sumbitTab3">MMS</a></li>
                                                    <li><a class="nav-link" data-toggle="tab" href="#sumbitTab4">Kakao</a></li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div role="tabpanel" id="sumbitTab1" class="tab-pane active">
                                                        <div class="panel-body">
                                                            <div class="w-100 text-right mb-2">
                                                                <a href="/campaign" class="btn btn-primary">캠페인 목록</a>
                                                                <a href="/campaign/${campInfo.CAMPNO }/#wizard-t-1" class="btn btn-primary">고객 추출 화면</a>
                                                                <div class="d-inline-block mt-sx-1">
                                                                <a href="/campaign/email/${campInfo.CAMPNO }" class="btn btn-primary">발송입력</a>
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
                                                                <div class="box4 col-lg-12 col-xl-4 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th class="border-top-0">회신메일주소</th>
                                                                                <td class="border-top-0">${campForm.RETURNMAIL }</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box5 col-lg-12 col-xl-8 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th class="border-top-0">서식형태</th>
                                                                                <td class="border-top-0">

                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box6 col-lg-12 col-xl-4 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th class="border-top-0">발송형태</th>
                                                                                <td class="border-top-0">
                                                                                    ${campForm.SENDTYPE_ }
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box7 col-lg-12 col-xl-4 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th class="border-top-0">테스트 발송자</th>
                                                                                <td class="border-top-0">${sessionScope.USERNAME }</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box8 col-lg-12 col-xl-4 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th class="border-top-0">테스트 메일</th>
                                                                                <td class="border-top-0">
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box7 col-lg-12 col-xl-6 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th class="border-top-0">발송일자</th>
                                                                                <td class="border-top-0">
                                                                                    <div class="input-group p-0">
                                                                                        <div class="d-flex date date01">
                                                                                          ${campForm.SENDDATE }
                                                                                        </div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>요일설정</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campForm.WEEK_ } ${campForm.DAY_ }
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>기간설정</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campForm.STARTDATE } ~ ${campForm.ENDDATE }
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box7 col-lg-12 col-xl-6 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                           <tr>
                                                                                <th class="border-top-0">발송일시</th>
                                                                                <td class="border-top-0" style="padding: 7px 8px;">
                                                                                    ${campForm.SENDHOUR } 시 ${campForm.SENDMINUTE } 분
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campForm.SENDHOUR } 시 ${campForm.SENDMINUTE } 분
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campForm.SENDHOUR } 시 ${campForm.SENDMINUTE } 분
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box9 col-12 p-0 border-top-0">
                                                                    <table class="table table-bordered">
                                                                        <tr>
                                                                            <td>
                                                                                <textarea name="campdesc" id="campdesc"  class="form-control summernote" style="resize:none; height: 8em;">${campForm.SENDDESC }</textarea>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
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
                                                    <div role="tabpanel" id="sumbitTab3" class="tab-pane">
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
                                                    <div role="tabpanel" id="sumbitTab4" class="tab-pane">
                                                        <div class="panel-body"></div>
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
		</div>
<!-- right side -->
		<div id="right-sidebar">
			<%@ include file="/WEB-INF/views/template/menu/rightside.jsp"%>
		</div>

<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_cp.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/steps/jquery.steps.min.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script><!-- summernote-->
	<script>
	$(document).ready(function () {

		$('.summernote').summernote('disable');

		$('#wizard').steps({
			headerTag: "h1",
			enableAllSteps: true,
		    enablePagination: false
		});
		
		var totalHash = window.location.hash;
		hash = totalHash.split('?');
		campStep(hash[0]);

	});

	</script>

</body>
</html>
