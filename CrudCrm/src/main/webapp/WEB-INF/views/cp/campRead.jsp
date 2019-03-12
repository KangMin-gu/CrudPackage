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
<title>IDEA CRM</title>
<!-- link includ -->
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
<link href="${pageContext.request.contextPath}/resources/css/plugins/steps/jquery.steps.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/dualListbox/bootstrap-duallistbox.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
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
                        <div class="ibox-content row tooltip-demo">
                            <div id="wizard" style="height:auto">
                                <h1>캠페인정보</h1>
                                <div class="step-content">
                                	
                            		<div class="box col-12" style="padding-left: 0px;padding-right: 0px; border-top: 1px solid #e7eaec;">
                           				<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
                              				<%-- <a href="${pageContext.request.contextPath}/campaign" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="목록"><i class="fa fa-list"></i></a> --%>
                                       		<a href="#" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="내부통지"><i class="fa fa-envelope"></i></a>
                                       		<a href="#" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="SMS" style="padding-top: 5px;padding-bottom: 5px;height: 33px;width: 39px;"><i class="fa fa-mobile" style="font-size:20px;"></i></a>                                    
                                   		</div>
                           		   		<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
                              				<form:form action="${pageContext.request.contextPath}/campaign/${campInfo.CAMPNO }" method="POST">
                                				<a href="${pageContext.request.contextPath}/campaign/post/${campInfo.CAMPNO }" class="btn btn-primary">수정</a>
												<button class="btn btn-primary" type="submit" value="삭제">삭제</button>
												<a href="${pageContext.request.contextPath}/campaign" class="btn btn-primary">목록</a>
											</form:form> 
                           		   		</div>
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
                                                            <td>${campInfo.CAMPSTEP_ }</td>
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
                                            <div class="mail-attachment">																	
												<p>	<span><i class="fa fa-paperclip"></i> 첨부파일</span></p>
												<div class="attachment">
													<c:forEach var="file" items="${campFile }">
														<div class="file-box">
															<div class="file">
																<a href="${pageContext.request.contextPath}/campaign/download/${file.FILEID}"> <span class="corner"></span>
																	<div class="icon">
																		<i class="fa fa-file"></i>
																	</div>
																	<div class="file-name">
																		${file.ORGFILENAME } <br /> <small>${file.REGDATE }</small>
																	</div>
																</a>
															</div>
														</div>	
													</c:forEach>										
													<div class="clearfix"></div>
												</div>
											</div>
                                        </div>
                                    </div>
                                </div>

                                <h1>대상추출</h1>
                                <div class="step-content">
                                	<div class="box col-12 pt-3 pb-3 clearfix tooltip-demo" style="border-top: 1px solid #e7eaec; border-bottom: 1px solid #e7eaec">
										<%-- <div class="float-left" style="height:2.00rem;padding-left: 0px;" >
											<a href="${pageContext.request.contextPath}/campaign" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="목록"><i class="fa fa-list"></i></a>
	                          			</div> --%>													
										<div class="float-right" style="padding-right: 0px;">
											<a href="${pageContext.request.contextPath}/campaign/target/${campInfo.CAMPNO }" class="btn btn-primary">타켓추출</a>
											<a href="${pageContext.request.contextPath}/campaign" class="btn btn-primary">목록</a>									
										</div>
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
                                                            <td>${campInfo.CAMPSTEP_ }</td>
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
                                            <div class="box1 col-lg-12 col-xl-6 p-0">
                                				<table class="table table-bordered mb-0 border-top-0">
                                    				<colgroup>
                                        				<col style="width: 120px; background: #fafafa;">
                                        				<col style="width: auto;">
                                    				</colgroup>
                                    				<tbody>
                                        				<tr>
                                            				<th class="border-top-0">메일수신거부</th>
                                            				<td class="border-top-0">
                                            					<div class="checkbox float-left col-lg-2 p-0">
																	<input id="denymailnomal" name="denymailnomal" type="checkbox" class="i-checks" disabled="disabled" ${campInfo.DENYMAILNOMAL eq "1" ? "checked='checked'" : ""}>
																	<label for="denymailnomal">NOMAL </label>
																</div>
																<div class="checkbox float-left col-lg-2 p-0">
																	<input id="denymailsurvey" name="denymailsurvey" type="checkbox" class="i-checks" disabled="disabled" ${campInfo.DENYMAILSURVEY eq "1" ? "checked='checked'" : ""}>
																	<label for="denymailsurvey">SURVEY</label>
																</div>
																<div class="checkbox float-left col-lg-2 p-0">
																	<input id="denymailnews" name="denymailnews" type="checkbox" class="i-checks" disabled="disabled" ${campInfo.DENYMAILNEWS eq "1" ? "checked='checked'" : ""}>
																	<label for="denymailnews">NEWS</label>
																</div>
																<div class="checkbox float-left col-lg-2 p-0">
																	<input id="denymailad" name="denymailad" type="checkbox" class="i-checks" disabled="disabled" ${campInfo.DENYMAILAD eq "1" ? "checked='checked'" : ""}>
																	<label for="denymailad">AD</label>
																</div>
                                            				</td>
                                        				</tr>
                                    				</tbody>
                                				</table>
                            				</div>
                            				<div class="box1 col-lg-12 col-xl-6 p-0">
                                				<table class="table table-bordered mb-0 border-top-0">
                                    				<colgroup>
                                        				<col style="width: 120px; background: #fafafa;">
                                        				<col style="width: auto;">
                                    				</colgroup>
                                    				<tbody>
                                        				<tr>
                                            				<th class="border-top-0">SMS수신거부</th>
                                            				<td class="border-top-0">
                                            					<div class="checkbox float-left col-lg-2 p-0">
																	<input id="denysmsnomal" name="denysmsnomal" type="checkbox" class="i-checks" disabled="disabled" ${campInfo.DENYSMSNOMAL eq "1" ? "checked='checked'" : ""}>
																	<label for="denysmsnomal">NOMAL </label>
																</div>
																<div class="checkbox float-left col-lg-2 p-0">
																	<input id="denysmssurvey" name="denysmssurvey" type="checkbox" class="i-checks" disabled="disabled" ${campInfo.DENYSMSSURVEY eq "1" ? "checked='checked'" : ""}>
																	<label for="denysmssurvey">SURVEY</label>
																</div>
																<div class="checkbox float-left col-lg-2 p-0">
																	<input id="denysmsnews" name="denysmsnews" type="checkbox" class="i-checks" disabled="disabled" ${campInfo.DENYSMSNEWS eq "1" ? "checked='checked'" : ""}>
																	<label for="denysmsnews">NEWS</label>
																</div>
																<div class="checkbox float-left col-lg-2 p-0">
																	<input id="denysmsad" name="denysmsad" type="checkbox" class="i-checks" disabled="disabled" ${campInfo.DENYSMSAD eq "1" ? "checked='checked'" : ""}>
																	<label for="denysmsad">AD</label>
																</div>
                                            				</td>
                                        				</tr>
                                    				</tbody>
                                				</table>
                            				</div>
                                            <div class="box1 col-lg-12 col-xl-6 p-0 addr">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>주소지 1</th>
                                                            <td id="addr1">
                                                                ${campInfo.ADDR11 } ${campInfo.ADDR12 } ${campInfo.ADDR13 }
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 col-xl-6 p-0 addr">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>주소지 2</th>
                                                            <td id="addr2">
                                                                ${campInfo.ADDR21 } ${campInfo.ADDR22 } ${campInfo.ADDR23 }
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 col-xl-6 p-0 addr">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>주소지 3</th>
                                                            <td id="addr3">
                                                                ${campInfo.ADDR31 } ${campInfo.ADDR32 } ${campInfo.ADDR33 }
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="box1 col-lg-12 col-xl-6 p-0 addr">
                                                <table class="table table-bordered mb-0">
                                                    <colgroup>
                                                        <col style="width: 120px; background: #fafafa;">
                                                        <col style="width: auto;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>주소지 4</th>
                                                            <td id="addr4">
                                                                ${campInfo.ADDR41 } ${campInfo.ADDR42 } ${campInfo.ADDR43 }
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
																<div class="m-auto text-center">
																	<ul class="pagination justify-content-center">
																		
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
                                                            <div class="box col-12 tooltip-demo" style="padding-left: 0px;padding-right: 0px;">
																<form:form action="/campaign/send/${campInfo.CAMPNO }" method="POST">
																	<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
																		<!-- <a href="/campaign" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="목록"><i class="fa fa-list"></i></a> -->
																		<a href="/campaign/${campInfo.CAMPNO }/#wizard-t-1" class="btn btn-primary">고객 추출 화면</a>
	                          										</div>													
																	<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
																		<form:form action="/campaign/test/${campInfo.CAMPNO }" method="POST">
                                                                			<a href="javascript:void(0);" class="btn btn-primary">테스트발송</a>
                                                                			<input type="hidden" name="sendform" id="sendform" value="${campEmailForm.SENDFORM }" />
                                                                		</form:form>
                                                                		<form:form action="/campaign/send/${campInfo.CAMPNO }" method="POST">
                                                                			<button  class="btn btn-primary">발송</button>
                                                                			<input type="hidden" name="sendform" id="sendform" value="${campEmailForm.SENDFORM }" />
                                                                		</form:form>
                                                                		<a href="/campaign/email/${campInfo.CAMPNO }" class="btn btn-primary">발송입력</a>
                                                                		<a href="/campaign" class="btn btn-primary">목록</a>
																	</div>
																</form:form>
															</div>
                                                            <div class="ibox-content row">
                                                                <div class="box4 col-lg-12 col-xl-4 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th>회신메일주소</th>
                                                                                <td>${campEmailForm.SENDER }</td>
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
                                                                                <th>테스트 발송자</th>
                                                                                <td>${sessionScope.USERNAME }</td>
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
                                                                                <th>테스트 메일</th>
                                                                                <td>${campEmailForm.TESTER }</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box6 col-lg-12 col-xl-6 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th class="border-top-0">발송형태</th>
                                                                                <td class="border-top-0">
                                                                                    ${campEmailForm.SENDTYPE_ }
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box7 col-lg-12 col-xl-6 p-0">
                                                                <input type="hidden" name="sendform" id="sendform" value="${campEmailForm.SENDFORM }" />
                                                                </div>
                                                                
                                                                <div class="box7 col-lg-12 col-xl-6 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                        <c:if test="${campEmailForm.SENDTYPE eq 2 }">
                                                                            <tr>
                                                                                <th class="border-top-0">발송일자</th>
                                                                                <td class="border-top-0">
                                                                                    <div class="input-group p-0">
                                                                                        <div class="d-flex date date01">
                                                                                          ${campEmailForm.SENDDATE_ }
                                                                                        </div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            </c:if>
                                                                            <c:if test="${campEmailForm.SENDTYPE eq 3 }">
                                                                            <tr>
                                                                                <th>요일설정</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campEmailForm.WEEK_ } ${campEmailForm.DAY_ }
                                                                                </td>
                                                                            </tr>
                                                                            </c:if>
                                                                            <c:if test="${campEmailForm.SENDTYPE eq 4 }">
                                                                            <tr>
                                                                                <th>기간설정</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campEmailForm.STARTDATE } ~ ${campEmailForm.ENDDATE }
                                                                                </td>
                                                                            </tr>
                                                                            </c:if>
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
                                                                        <c:if test="${campEmailForm.SENDTYPE eq 2 }">
                                                                           <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campEmailForm.SENDTIME }
                                                                                </td>
                                                                            </tr>
                                                                            </c:if>
                                                                            <c:if test="${campEmailForm.SENDTYPE eq 3 }">
                                                                            <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campEmailForm.SENDTIME }
                                                                                </td>
                                                                            </tr>
                                                                            </c:if>
                                                                            <c:if test="${campEmailForm.SENDTYPE eq 4 }">
                                                                            <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campEmailForm.SENDTIME }
                                                                                </td>
                                                                            </tr>
                                                                            </c:if>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box9 col-12 p-0 border-top-0">
                                                                    <table class="table table-bordered">
                                                                     	<colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                        	<tr>
                                                                        		<th>제목</th>
                                                                            	<td>
                                                                                	${campEmailForm.TITLE }
                                                                            	</td>
                                                                        	</tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box9 col-12 p-0 border-top-0">
                                                                    <table class="table table-bordered">
                                                                        <tr>
                                                                            <td>
                                                                                <textarea name="senddesc" id="senddesc"  class="form-control tinymce" readonly="readonly" style="resize:none; height: 8em;">${campEmailForm.SENDDESC }</textarea>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div role="tabpanel" id="sumbitTab2" class="tab-pane">
                                                        <div class="panel-body">
                                                            <div class="box col-12 tooltip-demo" style="padding-left: 0px;padding-right: 0px;">
																<form:form action="/campaign/send/${campInfo.CAMPNO }" method="POST">
																	<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
																		<a href="/campaign" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="목록"><i class="fa fa-list"></i></a>
																		<a href="/campaign/${campInfo.CAMPNO }/#wizard-t-1" class="btn btn-primary">고객 추출 화면</a>
	                          										</div>													
																	<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
																		<form:form action="/campaign/test/${campInfo.CAMPNO }" method="POST">
                                                                			<a href="javascript:void(0);" class="btn btn-primary">테스트발송</a>
                                                                			<input type="hidden" name="sendform" id="sendform" value="${campSmsForm.SENDFORM }" />
                                                                		</form:form>
                                                                		<form:form action="/campaign/send/${campInfo.CAMPNO }" method="POST">
                                                                			<button  class="btn btn-primary">발송</button>
                                                                				<input type="hidden" name="sendform" id="sendform" value="${campSmsForm.SENDFORM }" />
                                                                		</form:form>
                                                                		<a href="/campaign/sms/${campInfo.CAMPNO }" class="btn btn-primary">발송입력</a>
																	</div>
																</form:form>
															</div>
                                                            <div class="ibox-content row">
                                                                <div class="box4 col-lg-12 col-xl-6 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th>회신전화번호</th>
                                                                                <td>${campSmsForm.SENDER }</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>테스트발송자</th>
                                                                                <td>010-7777-7777</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>테스트 전화번호</th>
                                                                                <td>${campSmsForm.TESTER }</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송형태</th>
                                                                                <td>
                                                                                    ${campSmsForm.SENDTYPE_ }
                                                                                </td>
                                                                            </tr>
                                                                            <c:if test="${campSmsForm.SENDTYPE eq 2 }">
                                                                            <tr>
                                                                                <th>발송일자</th>
                                                                                <td>
                                                                                    ${campSmsForm. SENDDATE}
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campSmsForm.SENDHOUR} : ${campSmsForm.SENDMINUTE }
                                                                                </td>
                                                                            </tr>
                                                                            </c:if>
                                                                            <c:if test="${campSmsForm.SENDTYPE eq 3 }">
                                                                            <tr>
                                                                                <th>요일설정</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campsmsForm.WEEK_ } ${campSmsForm.DAY_}
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campSmsForm.SENDHOUR} : ${campSmsForm.SENDMINUTE }
                                                                                </td>
                                                                            </tr>
                                                                            </c:if>
                                                                            <c:if test="${campSmsForm.SENDTYPE eq 4 }">
                                                                            <tr>
                                                                                <th>기간설정</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campSmsForm.STARTDATE_ } ~ ${campSmsForm.ENDDATE_ }
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campSmsForm.SENDTIME}
                                                                                </td>
                                                                            </tr>
                                                                            </c:if>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="box6 col-lg-12 col-xl-6" style="padding-top: 4rem;">
                                                                	<div class="sms-form">
																		<h4>SMS</h4>
																		<div class="sub-text">
                                                                            <textarea name="name" disabled placeholder="내용을 입력하세요.">${campSmsForm.SENDDESC}</textarea>
                                                                        </div>
                                                                        <div class="limit-text">
                                                                        	<p><span>00</span> / 90</p>
                                                                        </div>
                                                                	</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div role="tabpanel" id="sumbitTab3" class="tab-pane">
                                                        <div class="panel-body">
                                                            <div class="box col-12 tooltip-demo" style="padding-left: 0px;padding-right: 0px;">
																<form:form action="/campaign/send/${campInfo.CAMPNO }" method="POST">
																	<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
																		<a href="/campaign" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="목록"><i class="fa fa-list"></i></a>
																		<a href="/campaign/${campInfo.CAMPNO }/#wizard-t-1" class="btn btn-primary">고객 추출 화면</a>
	                          										</div>													
																	<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
																		<form:form action="/campaign/test/${campInfo.CAMPNO }" method="POST">
                                                                			<a href="javascript:void(0);" class="btn btn-primary">테스트발송</a>
                                                                			<input type="hidden" name="sendform" id="sendform" value="${campMmsForm.SENDFORM }" />
                                                                		</form:form>
                                                                		<form:form action="/campaign/send/${campInfo.CAMPNO }" method="POST">
                                                                			<button  class="btn btn-primary">발송</button>
                                                                			<input type="hidden" name="sendform" id="sendform" value="${campMmsForm.SENDFORM }" />
                                                                		</form:form>
                                                                		<a href="/campaign/mms/${campInfo.CAMPNO }" class="btn btn-primary">발송입력</a>
																	</div>
																</form:form>
															</div>
                                                            <div class="ibox-content row">
                                                                <div class="box4 col-lg-12 col-xl-6 p-0">
                                                                    <table class="table table-bordered mb-0 border-top-0">
                                                                        <colgroup>
                                                                            <col style="width: 120px; background: #fafafa;">
                                                                            <col style="width: auto;">
                                                                        </colgroup>
                                                                        <tbody>
                                                                            <tr>
                                                                                <th>회신전화번호</th>
                                                                                <td>${campMmsForm.SENDER }</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>테스트발송자</th>
                                                                                <td>010-7777-7777</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>테스트 전화번호</th>
                                                                                <td>${campMmsForm.TESTER }</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송형태</th>
                                                                                <td>
                                                                                    ${campMmsForm.SENDTYPE_ }
                                                                                </td>
                                                                            </tr>
                                                                            <c:if test="${campMmsForm.SENDTYPE eq 2 }">
                                                                            <tr>
                                                                                <th>발송일자</th>
                                                                                <td>
                                                                                    ${campMmsForm.SENDDATE}
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campMmsForm.SENDTIME}
                                                                                </td>
                                                                            </tr>
                                                                            </c:if>
                                                                            <c:if test="${campMmsForm.SENDTYPE eq 3 }">
                                                                            <tr>
                                                                                <th>요일설정</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campMmsForm.WEEK_ } ${campMmsForm.DAY_}
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campMmsForm.SENDHOUR} : ${campMmsForm.SENDMINUTE }
                                                                                </td>
                                                                            </tr>
                                                                            </c:if>
                                                                            <c:if test="${campMmsForm.SENDTYPE eq 4 }">
                                                                            <tr>
                                                                                <th>기간설정</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campMmsForm.STARTDATE_ } ~ ${campMmsForm.ENDDATE_ }
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>발송일시</th>
                                                                                <td style="padding: 7px 8px;">
                                                                                    ${campMmsForm.SENDHOUR} : ${campMmsForm.SENDMINUTE }
                                                                                </td>
                                                                            </tr>
                                                                            </c:if>
                                                                            <tr>
                                                                            	<th>첨부파일1</th>
                                                                            	<td>
                                                                            		<div class="mail-attachment">																	
																						<p>	<span><i class="fa fa-paperclip"></i> 첨부파일</span></p>
																						<div class="attachment">
																							<c:forEach var="file1" items="${MMSFILE1 }">
																								<div class="file-box">
																									<div class="file">
																										<a href="${pageContext.request.contextPath}/campaign/download/${file1.FILEID}"> <span class="corner"></span>
																											<div class="icon">
																												<i class="fa fa-file"></i>
																											</div>	
																											<div class="file-name">
																												${file1.ORGFILENAME } <br /> <small>${file1.REGDATE }</small>
																											</div>
																										</a>
																									</div>
																								</div>	
																							</c:forEach>										
																							<div class="clearfix"></div>
																						</div>
																					</div>
                                                                            	</td>
                                                                            </tr>
                                                                            <tr>
                                                                            	<th>첨부파일2</th>
                                                                            	<td>
                                                                            		<div class="mail-attachment">																	
																						<p>	<span><i class="fa fa-paperclip"></i> 첨부파일</span></p>
																						<div class="attachment">
																							<c:forEach var="file2" items="${MMSFILE2 }">
																								<div class="file-box">
																									<div class="file">
																										<a href="${pageContext.request.contextPath}/campaign/download/${file2.FILEID}"> <span class="corner"></span>
																											<div class="icon">
																												<i class="fa fa-file"></i>
																											</div>	
																											<div class="file-name">
																												${file2.ORGFILENAME } <br /> <small>${file2.REGDATE }</small>
																											</div>
																										</a>
																									</div>
																								</div>	
																							</c:forEach>										
																							<div class="clearfix"></div>
																						</div>
																					</div>
                                                                            	</td>
                                                                            </tr>
                                                                            <tr>
                                                                            	<th>첨부파일3</th>
                                                                            	<td>
                                                                            		<div class="mail-attachment">																	
																						<p>	<span><i class="fa fa-paperclip"></i> 첨부파일</span></p>
																						<div class="attachment">
																							<c:forEach var="file3" items="${MMSFILE3 }">
																								<div class="file-box">
																									<div class="file">
																										<a href="${pageContext.request.contextPath}/campaign/download/${file3.FILEID}"> <span class="corner"></span>
																											<div class="icon">
																												<i class="fa fa-file"></i>
																											</div>	
																											<div class="file-name">
																												${file3.ORGFILENAME } <br /> <small>${file3.REGDATE }</small>
																											</div>
																										</a>
																									</div>
																								</div>	
																							</c:forEach>										
																							<div class="clearfix"></div>
																						</div>
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
                                                                            <textarea name="name" disabled placeholder="내용을 입력하세요.">${campMmsForm.SENDDESC }</textarea>
                                                                        </div>
                                                                        <div class="limit-text">
                                                                        	<p><span>00</span> / 90</p>
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
</div>
<!-- js includ -->
<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
<script src="${pageContext.request.contextPath}/resources/tinymce/tinymce.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_cp.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/steps/jquery.steps.min.js"></script>
	
	<script>
	$(document).ready(function () {
			
		$('#wizard').steps({
			headerTag: "h1",
			enableAllSteps: true,
		    enablePagination: false
		});
		
		var totalHash = window.location.hash;
		hash = totalHash.split('?');
		stepClick(hash[0]);
		
		var length = $('.addr').length
		for (i = 2; i <= length; i++){
			if($('#addr'+i).text().trim() == ''){
				$('#addr'+i).parents('table').parent().css('display','none');
			}
		}
		setTimeout(function() { 
			tinymceEditor();
		}, 2000)
		
		
		//tinymceEditor();
		//tinymce.activeEditor.setContent($('#senddesc').val());
	});

	</script>

</body>
</html>