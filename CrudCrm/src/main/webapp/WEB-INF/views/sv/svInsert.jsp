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
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/select2/select2.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">

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
                            <strong>서비스 추가</strong>
                        </li>
                    </ol>
                </div>
            </div>		
		
		
<!-- Content -->		
		<form:form action ="${pageContext.request.contextPath}/service/post" method="POST" enctype="multipart/form-data">
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
                        	<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
								<div class="col-xl-8 col-lg-12 float-left alert alert-info w-100" id="reqMsgDiv" style="height:2.00rem;padding-top: 6px;overflow:hidden;" >
									<span id="reqDefaultMsg" title="필수 입력값을 확인해 주세요.&nbsp;&nbsp;(서비스명 : 입력이 필요합니다., 접수유형 : 선택해주세요 ) ">
										<strong>필수 입력값을 확인해 주세요.&nbsp;&nbsp;(서비스명 : 입력이 필요합니다., 접수유형 : 선택해주세요 ) </strong>
									</span>
									<span id="reqSuccessMsg" style="display:none;"><Strong>필수값이 정상적으로 입력 되었습니다.</Strong></span>				
	                        	</div>
								<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
									<Strong><span id="showMsg"></span></Strong>				
	                        	</div>													
								<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
									<Button type="submit" disabled class="btn btn-primary submit" >저 장</Button>
									<a href="/service" class="btn btn-primary">취소</a>
									<a class="btn btn-primary" href="${pageContext.request.contextPath}/service" >목록</a>
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
                                            <th><label for="clino" class="mb-0">거래처명</label></th>
                                            <td class="border-top-0">
                                                <div class="input-group cli" id="clino_">
                                                    <input type="text" class="form-control validate allV" disabled name="clino_" value="${serviceInfo.CLINO_ }">
                                                    <input type="hidden" class="form-control" name="clino" value="0">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="prsdname" class="mb-0">대표자명</label></th>
                                            <td><input type="text" class="form-control" disabled name="prsdname" id="prsdname" value="${serviceInfo.PRSDNAME }"></td>
                                        </tr>
                                        <tr>
                                            <th><label for="custname" class="mb-0">고객명</label></th>
                                            <td class="border-top-0">
                                                <div class="input-group cust" id="custno_">
                                                    <input type="text" class="form-control validate nameV" disabled name="custno_" value="${serviceInfo.CUSTNAME }">
                                                    <input type="hidden" class="form-control" name="custno" value="0">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="border-top-0">고객주소</th>
                                            <td class="border-top-0">
                                            	<input type="text" class="form-control" disabled name="custaddress" id="custaddress" value="${serviceInfo.CUSTADDRESS }">
                                           		<input type="hidden" class="form-control" name="custno" id="homaddr1" value="${serviceInfo.HOMADDR1 }">
                                           		<input type="hidden" class="form-control" name="custno" id="homaddr2" value="${serviceInfo.HOMADDR2 }">
                                           		<input type="hidden" class="form-control" name="custno" id="homaddr3" value="${serviceInfo.HOMADDR3 }">
                                            </td>
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
                                            <td><input type="text" class="form-control" disabled name="bsno" id="bsno" value="${serviceInfo.BSNO }"></td>
                                        </tr>
                                        <tr>
                                            <th>대표전화번호</th>
                                            <td>
                                            	<input type="text" class="form-control" disabled name="clitelno" id="clitelno" value="${serviceInfo.CLITELNO }">
											</td>
                                        </tr>
                                        <tr>
                                            <th>직장명</th>
                                            <td><input type="text" class="form-control" disabled name="company" id="company" value="${serviceInfo.COMPANY }"></td>
                                        </tr>
                                        <tr>
                                            <th class="border-top-0">휴대전화번호</th>
                                            <td class="border-top-0">
                                                <input type="text" class="form-control" disabled name="mobile" id="mobile" value="${serviceInfo.MOBILE }">
                                            </td>
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
                                            <td><input type="text" class="form-control" disabled name="incno" id="incno" value="${serviceInfo.INCNO }"></td>
                                        </tr>
                                        <tr>
                                            <th>홈페이지</th>
                                            <td><input type="text" class="form-control" disabled name="homepage" id="homepage" value="${serviceInfo.HOMEPAGE }"></td>
                                        </tr>
                                        <tr>
                                            <th>직책</th>
                                            <td><input type="text" class="form-control" disabled name="duty" id="duty" value="${serviceInfo.DUTY }"></td>
                                        </tr>
                                        <tr>
                                            <th>이메일</th>
                                            <td><input type="text" class="form-control" disabled name="email" id="email" value="${serviceInfo.EMAIL }"></td>
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
                                            <td>
                                            	<input type="text" class="form-control" disabled id="receptiondate_" >
                                            	<input type="hidden" class="form-control date" name="receptiondate" id="receptiondate" value="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>상담구분</th>
                                            <td class="border-top-0">
                                                <div class="i-checks servicetype voc">
                                    				<c:forEach var="serviceType" items="${SERVICETYPE }">
                                    					<label class="mr-2 mb-0"><input type="radio" value="${serviceType.codeval }" id="servicetype" name="servicetype">${serviceType.codename}</label>
                                        			</c:forEach>
                                    			</div>
                                            </td>
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
                                            <td>
                                            	<div class="input-group">
                                                    <input type="text" class="form-control" disabled name="serviceowner_" id="serviceowner_" value="${sessionScope.USERNAME }">
                                                    <input type="hidden" name="serviceowner" id="serviceowner" value="${sessionScope.USERNO }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                    	<tr>
                                        	<th class="border-top-0">접수유형1</th>
                                        	<td class="border-top-0">
                                                <select class="form-control validate numberV" name="servicecode1" id="servicecode1">
                                            		<option label="선택" value="0"/>
                                                	<c:forEach var="serviceCode1" items="${SERVICECODE1 }">
                                                		<c:choose>
                                                			<c:when test="${serviceInfo.SERVICECODE1 eq serviceCode1.codeval}">
                                                				<option selected label="${serviceCode1.codename }" value="${serviceCode1.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${serviceCode1.codename }" value="${serviceCode1.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                            </td>
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
                                            <td>
                                            	<input type="text" disabled class="form-control" disabled name="servicestep_" id="servicestep_" value="접수">
                                                <input type="hidden" name="servicestep" id="servicestep" value="1">
											</td>
                                        </tr>
                                        <tr>
                                            <th>접수유형2</th>
                                            <td>
                                            	<select class="form-control select validate numberV" name="servicecode2" id="servicecode2" upper ="servicecode1" value="${serviceInfo.SERVICECODE2 }">
                                                    <option value="0">선택</option>
                                                </select>
											</td>
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
                                            	<input type="text" class="form-control error required validate allV" name="servicename" id="servicename" value="${serviceInfo.SERVICENAME }">
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
                                            <th class="border-top-0 border-bottom-0">처리담당자</th>
                                            <td class="border-top-0 border-bottom-0">
                                            	<div class="input-group owner" id="owner_">
                                                    <input type="text" class="form-control error required validate nameV" autocomplete="off" name="owner_" value="${serviceInfo.OWNER_ }">
                                                    <input type="hidden" name="owner" id="owner" value="${serviceInfo.OWNER }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                    <span class="input-group-addon serviceself">
                                                        <a><i class="fa fa-child"></i></a>
                                                    </span>
                                                </div>
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
                                        <!-- S: 이 영역을 계속 추가 하면 됨 -->
                                         			<div class="select-box mb-1 product" style="height: 29px;">
                                            			<select id="product11" name="product11" class="form-control col-xl-3 d-inline-block mr-2 voc">
                                            				<option value="">선택</option>
                                                			<c:forEach var="productB" items="${productB }">
                                            					<option label="${productB.prdname }" value="${productB.prdno }"/>
                                    						</c:forEach>
                                            			</select>
                                            			<select id="product12" name="product12"  class="form-control col-xl-3 d-inline-block mr-2 voc">
                                            				<option value="">선택</option>
                                            			</select>
                                            			<select id="product13" name="product13" class="form-control col-xl-3 d-inline-block mr-2 voc">
                                            				<option value="">선택</option>
                                            			</select>
                                            			<button class="plus btn btn-primary d-inline-block btn-sm mr-2">추가</button>
                                            			<button class="minus btn btn-primary d-inline-block btn-sm mr-2">삭제</button>
                                        			</div>
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
                                                <textarea name="servicedesc" class="form-control tinymce" id="servicedesc">${serviceInfo.SERVICEDESC }</textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 p-0">
                             	<table class="table table-bordered border-top-0 mb-0">
                             		<colgroup>
                                    	<col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                    	<tr>
                                        	<th class="border-top-0">첨부파일</th>
                                            <td class="border-top-0">
                                            	<div class="col-md-6">
													<input id="servicefile" name="servicefile" class="form-control" type="file" value="0" multiple>
														<p class="help-block">크기 200Mbyte 이하의 파일 선택</p>
												</div>
                                            </td>
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
                            <h4>현상 파악</h4>
                            <div class="ibox-tools">
                            <div class="float-left" style="height:2.00rem;padding-left: 0px;" >
                            	<a href="" id="rewardSame" class="btn btn-primary" data-placement="right">접수정보와 동일</a>               
                             </div>
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
                                            <td class="border-top-0">
                                            	<div class="input-group p-0 date">
                                            		<div class="d-flex date date01">
                                                    	<span class="input-group-addon">
                                                    		<i class="fa fa-calendar"></i>
                                                    	</span>
                                                    	<input type="text" id="visitdate" name="visitdate" class="form-control date" value="${rewardInfo.VISITDATE }">
                                                    </div>
                                                </div>   
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <th>현상</th>
                                            <td>
                                            	<div>
                                            		<select class="form-control validate numberV" name="rewardtype" id="rewardtype" value="${rewardInfo.REWARDTYPE }">
                                                    	<option value="0">선택</option>
                                                    	<option value="1" <c:if test='${rewardInfo.REWARDTYPE eq 1}'>selected</c:if>>클라1</option>
                                                    	<option value="2" <c:if test='${rewardInfo.REWARDTYPE eq 2}'>selected</c:if>>클라2</option>
                                                    	<option value="3" <c:if test='${rewardInfo.REWARDTYPE eq 3}'>selected</c:if>>클라3</option>
                                                	</select>
                                                </div>
											</td>
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
                                            <th>방문약속일시</th>
                                            <td>
                                            	<div class="input-group clockpicker" data-autoclose="true">
                                            		<span class="input-group-addon">
                                    					<span class="fa fa-clock-o"></span>
                                					</span>
                                					<input type="text" class="form-control" autocomplete="off" name="visittime" id="visittime" value="${rewardInfo.VISITTIME }">
                            					</div>	
											</td>
                                        </tr>
                                        <tr>
                                            <th>원인구분</th>
                                            <td>
                                            	<select class="form-control validate numberV" name="causecode" id="causecode" value="${rewardInfo.CAUSECODE }">
                                                    	<option value="0">선택</option>
                                                    	<option value="1" <c:if test='${rewardInfo.CAUSECODE eq 1}'>selected</c:if>>클라1</option>
                                                    	<option value="2" <c:if test='${rewardInfo.CAUSECODE eq 2}'>selected</c:if>>클라2</option>
                                                    	<option value="3" <c:if test='${rewardInfo.CAUSECODE eq 3}'>selected</c:if>>클라3</option>
                                                </select>
											</td>
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
                                            <td>
                                            	<div class="input-group">
                                                    <input type="text" class="form-control" disabled name="rewardowner_" value="${serviceInfo.OWNER_ }">
                                                    <input type="hidden" name="rewardowner" id="rewardowner" value="${serviceInfo.OWNER }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
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
                            				<td>
            									<div class="input-group pl-0 float-left mr-2" style="width: 180px;">
            										<input type="text" class="form-control daumzip" name="visitaddr1" id="visitaddr1" readonly>
            										<span class="input-group-addon"><a href="#"><i class="fa fa-search daumzip"></i></a></span>
            									</div>
            									<input type="text" class="form-control float-left mr-2" name="visitaddr2" id="visitaddr2" readonly style="width: 220px;">
            									<input type="text" class="form-control float-left" name="visitaddr3" id="visitaddr3" style="width: 220px;">
            									<input type="radio" class="i-checks" value="" id="addrsame" name="addrsame">
            									<label>고객주소와 동일</label>
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
                                            <th class="border-top-0">상세내역</th>
                                            <td class="border-top-0">
                                            	<textarea name="rewarddesc" class="form-control tinymce" id="rewarddesc">${rewardInfo.REWARDDESC }</textarea>
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
                                        	<th class="border-top-0" style="height: 58px;">지연사유</th>
                                        	<td class="border-top-0" style="height: 58px;">
                                                <select class="form-control select2" name="delaytype" id="delaytype" value="${rewardInfo.DELAYTYPE }">
                                                    	<option value="0">선택</option>
                                                    	<option value="1" <c:if test='${rewardInfo.DELAYTYPE eq 1}'>selected</c:if>>클라1</option>
                                                    	<option value="2" <c:if test='${rewardInfo.DELAYTYPE eq 2}'>selected</c:if>>클라2</option>
                                                    	<option value="3" <c:if test='${rewardInfo.DELAYTYPE eq 3}'>selected</c:if>>클라3</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 col-xl-8 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">지연사유</th>
                                            <td class="border-top-0">
                                                <textarea name="delaydesc" class="form-control" cols="60" id="delaydesc">${rewardInfo.DELAYDESC }</textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 p-0">
                             	<table class="table table-bordered border-top-0 mb-0">
                             		<colgroup>
                                    	<col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                    	<tr>
                                        	<th class="border-top-0">첨부파일</th>
                                            <td class="border-top-0">
                                            	<div class="col-md-6">
													<input id="rewardfile" name="rewardfile" class="form-control" type="file" multiple>
														<p class="help-block">크기 200Mbyte 이하의 파일 선택</p>
												</div>
                                            </td>
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
                            <h4>처리 정보</h4>
                            <div class="ibox-tools">
                            	<div class="float-left" style="height:2.00rem;padding-left: 0px;" >
                            		<a href="" id="ractSame" class="btn btn-primary" data-placement="right">접수정보와 동일</a>               
                             	</div>
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
                                            <td>
                                            	<div class="input-group">
                                            		<span class="input-group-addon">
                                                        <a><i class="fa fa-calendar"></i></a>
                                                    </span>
                                                    <input type="text" class="form-control date" name="ractdate" id="ractdate" value="">
                                                </div>
                                            </td>
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
                                            <td class="border-top-0 border-bottom-0">
                                            	<div class="input-group owner" id="ractowner_">
                                                    <input type="text" class="form-control" autocomplete="off" name="ractowner_" value="">
                                                    <input type="hidden" name="ractowner" value="0">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                    <span class="input-group-addon ractself">
                                                        <a><i class="fa fa-child"></i></a>
                                                    </span>
                                                </div>
                                            </td>
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
                                            <td>
                                            	<div class="checkbox float-left p-0">
													<label for="sendyn" class="mb-0">발송여부</label>
													<input type="checkbox" class="i-checks" name="sendyn" id="sendyn"  value="0">													
												</div>
                                            </td>
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
                                                <textarea class="tinymce" name="ractdesc" id="ractdesc">${ractInfo.RACTDESC }</textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 p-0">
                             	<table class="table table-bordered border-top-0 mb-0">
                             		<colgroup>
                                    	<col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                    	<tr>
                                        	<th class="border-top-0">첨부파일</th>
                                            <td class="border-top-0">
                                            	<div class="col-md-6">
													<input id="ractfile" name="ractfile" class="form-control" type="file" multiple>
														<p class="help-block">크기 200Mbyte 이하의 파일 선택</p>
												</div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form:form>
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
	 <script src="${pageContext.request.contextPath}/resources/crud/crud_validate.js"></script>
	 <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	 <script src="${pageContext.request.contextPath}/resources/tinymce/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/clockpicker/clockpicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/select2/select2.full.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_sv.js"></script>
	<script>
	$(document).ready(function () {
		$('.product .minus:first').remove();
	});
	
	 $('#servicecode1').change(function(){
		 upperCode('servicecode1'); 
	 });
	</script>
</body>
</html>