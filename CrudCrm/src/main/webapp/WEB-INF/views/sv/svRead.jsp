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
<link href="${pageContext.request.contextPath}/resources/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
</head>

<body>
	<div id="wrapper">
<!-- leftside -->	
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>

        </div>
<!-- Top -->    
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>

            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>서비스 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/service">서비스 목록</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>서비스 정보</strong>
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
                        <div class="ibox-title row">
                            <h4>기본정보</h4>
                            <div class="ibox-tools">
                            	<a class="collapse-link">
                                	<i class="fa fa-chevron-up"></i>
                            	</a>
                        	</div>
                        </div>
                        
                        <div class="ibox-content row">
                        	<div class="box col-12 mb-2 tooltip-demo" style="padding-left: 0px;padding-right: 0px;">
                           		<div class="float-left" style="height:2.00rem;padding-left: 0px;" >
                            		<c:if test="${serviceInfo.OWNER eq sessionScope.USERNO or sessionScope.CHKAUTH eq '20' or sessionScope.CHKAUTH eq '30'}">
                            			<c:if test="${serviceInfo.SERVICESTEP eq 1 or serviceInfo.SERVICESTEP eq 2 or serviceInfo.SERVICESTEP eq 3 or serviceInfo.SERVICESTEP eq 4 or serviceInfo.SERVICESTEP eq 5 or serviceInfo.SERVICESTEP eq 6}">
                            				<a href="#" class="btn btn-default servicenext" data-toggle="tooltip" data-placement="top" title="이관"><i class="fa fa-external-link"></i></a>
                            			</c:if>
                            		</c:if>
                            		<c:if test="${sessionScope.CHKAUTH eq '20' or sessionScope.CHKAUTH eq '30' }">
                            			<c:if test="${serviceInfo.SERVICESTEP eq 3 } ">
                            				<a href="#" class="btn btn-primary complete">종결</a>
                            			</c:if>
                            		</c:if>
                                </div>
                                
                           		<div class="float-right text-right" style="padding-right: 0px;">
                           		
                              		<form:form action="${pageContext.request.contextPath}/service/${serviceInfo.SERVICENO}" method="POST">
                              		<c:if test="${serviceInfo.OWNER eq sessionScope.USERNO or sessionScope.CHKAUTH eq '20' or sessionScope.CHKAUTH eq '30'}">
                              			<c:if test="${serviceInfo.SERVICESTEP eq 1 or serviceInfo.SERVICESTEP eq 2 or serviceInfo.SERVICESTEP eq 3 or serviceInfo.SERVICESTEP eq 4 or serviceInfo.SERVICESTEP eq 5 or serviceInfo.SERVICESTEP eq 6}">
                                			<a href="${pageContext.request.contextPath}/service/post/${serviceInfo.SERVICENO}" class="btn btn-primary">수정</a>
                                			<c:if test="${sessionScope.CHKAUTH eq '20' or sessionScope.CHKAUTH eq '30'}">
												<button class="btn btn-primary" type="submit" value="삭제">삭제</button>
											</c:if>
										</c:if>
									</c:if>
									<a class="btn btn-primary" href="${pageContext.request.contextPath}/service" >목록</a>
									</form:form>

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
                                            <td>${serviceInfo.CLINAME }</td>
                                        </tr>
                                        <tr>
                                            <th>대표자명</th>
                                            <td>${serviceInfo.PRSDNAME }</td>
                                        </tr>
                                        <tr>
                                            <th>고객명</th>
                                            <td>${serviceInfo.CUSTNAME }</td>
                                        </tr>
                                        <tr>
                                            <th>고객주소</th>
                                            <td>${serviceInfo.CUSTADDRESS }</td>
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
                                            <th>사업자등록번호</th>
                                            <td>${serviceInfo.BSNO }</td>
                                        </tr>
                                        <tr>
                                            <th>대표전화번호</th>
                                            <td>${serviceInfo.CLITELNO }</td>
                                        </tr>
                                        <tr>
                                            <th>직장명</th>
                                            <td>${serviceInfo.COMPANY }</td>
                                        </tr>
                                        <tr>
                                            <th>휴대번호</th>
                                            <td>${serviceInfo.MOBILE }</td>
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
                                            <th>법인번호</th>
                                            <td>${serviceInfo.INCNO }</td>
                                        </tr>
                                        <tr>
                                            <th>홈페이지</th>
                                            <td>${serviceInfo.HOMEPAGE }</td>
                                        </tr>
                                        <tr>
                                            <th>직책</th>
                                            <td>${serviceInfo.DUTY }</td>
                                        </tr>
                                        <tr>
                                            <th>이메일</th>
                                            <td>${serviceInfo.EMAIL }</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>
                </div>
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-title row">
                            <h4>접수 정보</h4>
                            <div class="ibox-tools">
                            	<a class="collapse-link">
                                	<i class="fa fa-chevron-up"></i>
                            	</a>
                        	</div>
                        </div>
                        <div class="ibox-content row">
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>접수일</th>
                                            <td>${serviceInfo.RECEPTIONDATE_ }</td>
                                        </tr>
                                        <tr>
                                            <th>접수구분</th>
                                            <td>${serviceInfo.SERVICETYPE_ }</td>
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
                                            <th>접수자</th>
                                            <td>${serviceInfo.SERVICEOWNER_ }</td>
                                        </tr>
                                        <tr>
                                            <th>접수유형1</th>
                                            <td>${serviceInfo.SERVICECODE1 }</td>
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
                                            <td>${serviceInfo.SERVICESTEP_ }</td>
                                        </tr>
                                        <tr>
                                            <th>접수유형2</th>
                                            <td>${serviceInfo.SERVICECODE2 }</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box4 col-lg-12 col-xl-8 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">서비스명</th>
                                            <td class="border-top-0">
                                                ${serviceInfo.SERVICENAME }
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                            <div class="box4 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                        	<th class="border-top-0">처리담당자</th>
                                        	<td class="border-top-0">
                                        		${serviceInfo.OWNER_ }
                                        	</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box4 col-lg-12 col-xl-12 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                    	<tr>
                                            <th class="border-top-0 border-bottom-0">문의제품</th>
                                        	<td class="border-top-0">
                                        		<div class="select-area mt-1">
                                        			<c:forEach var="product" items="${product }">
                                        				<div class="select-box mb-1 product" style="height: 29px;">
                                        					<select id="product11" disabled name="product11" class="form-control col-xl-3 d-inline-block mr-2 voc">
                                        						<option label="${product.PRODUCTBNAME }" value="${product.PRODUCTBNAME }"/>
                                        					</select>
                                        					<select id="product11" disabled name="product11" class="form-control col-xl-3 d-inline-block mr-2 voc">
                                        						<option label="${product.PRODUCTMNAME }" value="${product.PRODUCTMNAME }"/>
                                        					</select>
                                        					<select id="product11" disabled name="product11" class="form-control col-xl-3 d-inline-block mr-2 voc">
                                        						<option label="${product.PRODUCTSNAME }" value="${product.PRODUCTSNAME }"/>
                                        					</select>
                                        				</div>
                                        			</c:forEach>
                                        			<!-- E: 이 영역을 계속 추가 하면 됨 -->
                                    			</div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">서비스내용</th>
                                            <td class="border-top-0">
                                                <textarea class="summernote" id="servicedesc">${serviceInfo.SERVICEDESC }</textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="mail-attachment">																	
								<p>	<span><i class="fa fa-paperclip"></i> 첨부파일</span></p>
								<div class="attachment">
									<c:forEach var="serviceFile" items="${serviceFile }">
										<div class="file-box">
											<div class="file">
												<a href="${pageContext.request.contextPath}/campaign/download/${serviceFile.FILEID}"> <span class="corner"></span>
													<div class="icon">
														<i class="fa fa-file"></i>
													</div>
													<div class="file-name">
														${serviceFile.ORGFILENAME } <br /> <small>${serviceFile.REGDATE }</small>
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
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-title row">
                            <h4>현상파악</h4>
                            <div class="ibox-tools">
                            	<a class="collapse-link">
                                	<i class="fa fa-chevron-up"></i>
                            	</a>
                        	</div>
                        </div>
                        
                        <div class="ibox-content row">
                            
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>방문약속일자</th>
                                            <td>${rewardInfo.VISITDATE_}</td>
                                        </tr>
                                        <tr>
                                            <th>현상</th>
                                            <td>${rewardInfo.REWARDTYPE_ }</td>
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
                                            <th>방문약속일시</th>
                                            <td>${rewardInfo.VISITTIME }</td>
                                        </tr>
                                        <tr>
                                            <th>원인구분</th>
                                            <td>${rewardInfo.CAUSECODE_ }</td>
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
                                            <th>담당자</th>
                                            <td>${rewardInfo.OWNER_ }</td>
                                        </tr>
                                        <tr>
                                            <th>????</th>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>방문지 주소</th>
                                            <td>${rewardInfo.VISITADDR_ }</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>상세내역</th>
                                            <td>
                                                <textarea class="summernote" id="rewarddesc">${rewardInfo.REWARDDESC }</textarea>
                                            </td>
                                            <input type="hidden" id="serviceno" value="${serviceInfo.SERVICENO }" /> 
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th style="height: 58px;">지연사유</th>
                                            <td style="height: 58px;">
                                                ${rewardInfo.DELAYTYPE_ }
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-8 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>지연내용</th>
                                            <td>
                                                <textarea class="form-control" disabled id="delaydesc" cols="80">${rewardInfo.DELAYDESC }</textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="mail-attachment">																	
								<p>	<span><i class="fa fa-paperclip"></i> 첨부파일</span></p>
								<div class="attachment">
									<c:forEach var="rewardFile" items="${rewardFile }">
										<div class="file-box">
											<div class="file">
												<a href="${pageContext.request.contextPath}/campaign/download/${rewardFile.FILEID}"> <span class="corner"></span>
													<div class="icon">
														<i class="fa fa-file"></i>
													</div>
													<div class="file-name">
														${rewardFile.ORGFILENAME } <br /> <small>${rewardFile.REGDATE }</small>
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
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-title row">
                            <h4>처리결과</h4>
                            <div class="ibox-tools">
                            	<a class="collapse-link">
                                	<i class="fa fa-chevron-up"></i>
                            	</a>
                        	</div>
                        </div>
                        
                        <div class="ibox-content row">
                            
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>처리일</th>
                                            <td>${ractInfo.RACTDATE_}</td>
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
                                            <th>처리담당자</th>
                                            <td>${serviceInfo.OWNER_ }</td>
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
                                            <th>처리발송여부</th>
                                            <td>${ractInfo.SENDYN_ }</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>처리내용</th>
                                            <td>
                                                <textarea class="summernote" id="ractdesc">${ractInfo.RACTDESC }</textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="mail-attachment">																	
								<p>	<span><i class="fa fa-paperclip"></i> 첨부파일</span></p>
								<div class="attachment">
									<c:forEach var="ractFile" items="${ractFile }">
										<div class="file-box">
											<div class="file">
												<a href="${pageContext.request.contextPath}/campaign/download/${ractFile.FILEID}"> <span class="corner"></span>
													<div class="icon">
														<i class="fa fa-file"></i>
													</div>
													<div class="file-name">
														${ractFile.ORGFILENAME } <br /> <small>${ractFile.REGDATE }</small>
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
                <div class="box col-12 mb-2 tooltip-demo" style="padding-left: 0px;padding-right: 0px;">
                	<div class="float-left" style="height:2.00rem;padding-left: 0px;" >
                    	<c:if test="${serviceInfo.OWNER eq sessionScope.USERNO or sessionScope.CHKAUTH eq '20' or sessionScope.CHKAUTH eq '30'}">
                        	<c:if test="${serviceInfo.SERVICESTEP eq 1 or serviceInfo.SERVICESTEP eq 2 or serviceInfo.SERVICESTEP eq 3 or serviceInfo.SERVICESTEP eq 4 or serviceInfo.SERVICESTEP eq 5 or serviceInfo.SERVICESTEP eq 6}">
                            	<a href="#" class="btn btn-default servicenext" data-toggle="tooltip" data-placement="top" title="이관"><i class="fa fa-external-link"></i></a>
                           	</c:if>
                        </c:if>
                        <c:if test="${sessionScope.CHKAUTH eq '20' or sessionScope.CHKAUTH eq '30' }">
                        	<c:if test="${serviceInfo.SERVICESTEP eq 3 } ">
                            	<a href="#" class="btn btn-primary complete">종결</a>
                            </c:if>
                        </c:if>
                    </div>
                                
                    <div class="float-right text-right" style="padding-right: 0px;">
                    	<form:form action="${pageContext.request.contextPath}/service/${serviceInfo.SERVICENO}" method="POST">
                        	<c:if test="${serviceInfo.OWNER eq sessionScope.USERNO or sessionScope.CHKAUTH eq '20' or sessionScope.CHKAUTH eq '30'}">
                            	<c:if test="${serviceInfo.SERVICESTEP eq 1 or serviceInfo.SERVICESTEP eq 2 or serviceInfo.SERVICESTEP eq 3 or serviceInfo.SERVICESTEP eq 4 or serviceInfo.SERVICESTEP eq 5 or serviceInfo.SERVICESTEP eq 6}">
                                	<a href="${pageContext.request.contextPath}/service/post/${serviceInfo.SERVICENO}" class="btn btn-primary">수정</a>
                                	<c:if test="${sessionScope.CHKAUTH eq '20' or sessionScope.CHKAUTH eq '30'}">
										<button class="btn btn-primary" type="submit" value="삭제">삭제</button>
									</c:if>
								</c:if>
							</c:if>
							<a class="btn btn-primary" href="${pageContext.request.contextPath}/service" >목록</a>
						</form:form>
                    </div>
                </div>
                <div class="col-lg-12" style="background: #ffffff;">
                	<div class="ibox">
                            <div class="ibox-title row">
                                <h4>서비스 상세</h4>
                            </div>
                            <div class="ibox-tools">
                            	<a class="collapse-link">
                                	<i class="fa fa-chevron-up"></i>
                            	</a>
                        	</div>
                            <div class="ibox-content row">
                                <div class="box1 col-lg-12 p-0">
                                    <div class="tabs-container">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li><a class="nav-link li tabRact active" data-toggle="tab" href="#tab1">처리 이력</a></li>
                                            <li><a class="nav-link tabConvey" data-toggle="tab" href="#tab2">이관이력</a></li>
                                        </ul>
                                        <div class="tab-content">
                                            <div role="tabpanel" id="tab1" class="tab-pane active overflow-x">
                                                <div class="panel-body">
                                                    <table class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>처리일</th>
                                                                <th>처리유형</th>
                                                                <th>담당자</th>
                                                                <th>처리내용</th>
                                                                <th>발송여부</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div role="tabpanel" id="tab2" class="tab-pane overflow-x">
                                                <div class="panel-body">
                                                    <table class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>이관일자</th>
                                                                <th>이관사유</th>
                                                                <th>이전 담당자</th>
                                                                <th>이관 담당자</th>
                                                                <th>비고</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                
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
	<script src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script><!-- summernote-->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_sv.js"></script><!-- summernote-->
	<script>
		$(document).ready(function () {
			$('.note-editable').attr('contenteditable',false);
		});
		
		
	
	</script>
</body>
</html>