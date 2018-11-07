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
<link href="${pageContext.request.contextPath}/resources/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
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
                    <h2>서비스 정보</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/">메인</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="/sv">서비스 목록</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <a href="/sv/${serviceInfo.SERVICENO }">서비스 정보</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>서비스 정보 수정</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>		
		
		
<!-- Content -->		
		<form:form action ="${pageContext.request.contextPath}/sv/post/${serviceInfo.SERVICENO }" method="PUT">
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
                        
                            <div class="w-100 text-right mb-2">
                                <a href="${pageContext.request.contextPath}/sv" class="btn btn-primary">서비스목록</a>
                                <button class="btn btn-primary">서비스저장</button>
                            </div>
                            
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="clino">거래처명</label></th>
                                            <td>
                                            	<div class="input-group cli">
                                                    <input type="text" class="form-control required" name="clino_" id="clino_" value="${serviceInfo.CLINO_ }">
                                                    <input type="hidden" class="form-control" name="clino" id="clino" value="${serviceInfo.CLINO }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="prsdname">대표자명</label></th>
                                            <td><input type="text" class="form-control" disabled name="prsdname" id="prsdname" value="${serviceInfo.PRSDNAME }"></td>
                                        </tr>
                                        <tr>
                                            <th><label for="custname">고객명</label></th>
                                            <td>
                                            	<div class="input-group cust">
                                                    <input type="text" class="form-control required" name="custno_" id="custno_" value="${serviceInfo.CUSTNO_ }">
                                                    <input type="hidden" class="form-control" name="custno" id="custno" value="${serviceInfo.CUSTNO }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
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
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
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
                                            <th>이메일</th>
                                            <td><input type="text" class="form-control" disabled name="email" id="email" value="${serviceInfo.EMAIL }"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box4 col-lg-8 p-0">
                                <table class="table table-bordered border-top-0  mb-0">
                                    <colgroup>
                                        <col style="width: 12.4%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">고객주소</th>
                                            <td>
                                            	<input type="text" class="form-control" disabled name="custaddress" id="custaddress" value="${serviceInfo.CUSTADDRESS }">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>휴대전화번호</th>
                                            <td>
                                                <input type="text" class="form-control" disabled name="custmobile" id="custmobile" value="${serviceInfo.CUSTMOBILE }">
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
                            <h4>접수 정보</h4>
                            <div class="ibox-tools">
                            	<a class="collapse-link">
                                	<i class="fa fa-chevron-up"></i>
                            	</a>
                        	</div>
                        </div>
                        
                        <div class="ibox-content row">
                            
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>접수유형</th>
                                            <td>
                                            	<select class="form-control float-left" name="rcvtype" id="rcvtype">
                                            		<option value=0>선택</option>
                                                    <option value=1 <c:if test='${serviceInfo.RCVTYPE eq 1}'>selected</c:if>>문의</option>
                                                    <option value=2 <c:if test='${serviceInfo.RCVTYPE eq 2}'>selected</c:if>>개선</option>
                                                    <option value=3 <c:if test='${serviceInfo.RCVTYPE eq 3}'>selected</c:if>>오류</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>접수일</th>
                                            <td>
                                            	<input type="text" class="form-control date" disabled name="rcvdate" id="rcvdate" value="${serviceInfo.RCVDATE }">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>서비스유형</th>
                                            <td>
                                            	<select class="form-control float-left" name="rcvcode" id="rcvcode">
                                            		<option value=0>선택</option>
                                                    <option value=1 <c:if test='${serviceInfo.RCVCODE eq 1}'>selected</c:if>>클라1</option>
                                                    <option value=2 <c:if test='${serviceInfo.RCVCODE eq 2}'>selected</c:if>>클라2</option>
                                                    <option value=3 <c:if test='${serviceInfo.RCVCODE eq 3}'>selected</c:if>>클라3</option>
                                                </select>
											</td>
                                        </tr>
                                        <tr>
                                            <th>접수시간</th>
                                            <td>
                                            	<div class="input-group clockpicker" data-autoclose="true">
                                					<input type="text" class="form-control" name="rcvtime" id="rcvtime" value="${serviceInfo.RCVTIME }">
                                					<span class="input-group-addon">
                                    					<span class="fa fa-clock-o"></span>
                                					</span>
                            					</div>	
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>접수자</th>
                                            <td>
                                            	<div class="input-group owner">
                                                    <input type="text" class="form-control required" name="rcvowner_" id="rcvowner_" value="${serviceInfo.RCVOWNER_ }">
                                                    <input type="hidden" name="rcvowner" id="rcvowner" value="${serviceInfo.RCVOWNER }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>처리상태</th>
                                            <td>
                                            	<select class="form-control float-left" name="prcstate" id="prcstate">
                                            		<option value=0>선택</option>
                                                    <option value=1 <c:if test='${serviceInfo.PRCSTATE eq 1}'>selected</c:if>>접수</option>
                                                    <option value=2 <c:if test='${serviceInfo.PRCSTATE eq 2}'>selected</c:if>>이관</option>
                                                    <option value=3 <c:if test='${serviceInfo.PRCSTATE eq 3}'>selected</c:if>>완료</option>
                                                </select>
											</td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                            <div class="box4 col-lg-8 p-0">
                                <table class="table table-bordered border-top-0  mb-0">
                                    <colgroup>
                                        <col style="width: 12.4%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">서비스명</th>
                                            <td>
                                            	<input type="text" class="form-control required" name="servicename" id="servicename" value="${serviceInfo.SERVICENAME }">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box4 col-lg-4 p-0">
                                <table class="table table-bordered border-top-0  mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                        	<th class="border-top-0">접수매체</th>
                                        	<td>
                                        		<select class="form-control float-left" name="rcvchannel" id="rcvchannel">
                                            		<option value=0>선택</option>
                                                    <option value=10 <c:if test='${serviceInfo.RCVCHANNEL eq 10}'>selected</c:if>>전화</option>
                                                    <option value=20 <c:if test='${serviceInfo.RCVCHANNEL eq 20}'>selected</c:if>>SMS</option>
                                                    <option value=30 <c:if test='${serviceInfo.RCVCHANNEL eq 30}'>selected</c:if>>메일</option>
                                                </select>
                                        	</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 8.3%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>서비스내용</th>
                                            <td>
                                                <textarea id="servicedesc">${serviceInfo.SERVICEDESC }</textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 8.3%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>메모</th>
                                            <td>
                                                <textarea id="ractopinion">${serviceInfo.RACTOPINION }</textarea>
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
                            	<a class="collapse-link">
                                	<i class="fa fa-chevron-up"></i>
                            	</a>
                        	</div>
                        </div>
                        
                        <div class="ibox-content row">
                            
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>처리유형</th>
                                            <td>
                                            	<select class="form-control float-left" name="ractcode" id="ractcode">
                                            		<option value=0>선택</option>
                                                    <option value=1 <c:if test='${serviceInfo.RACTCODE eq 1}'>selected</c:if>>option1</option>
                                                    <option value=2 <c:if test='${serviceInfo.RACTCODE eq 2}'>selected</c:if>>option2</option>
                                                    <option value=3 <c:if test='${serviceInfo.RACTCODE eq 3}'>selected</c:if>>option3</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>처리일</th>
                                            <td>
                                            	<input type="text" class="form-control date" name="ractdate" id="ractdate" value="${serviceInfo.RACTDATE }">
                                            </td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>처리 시간</th>
                                            <td>
                                            	<div class="input-group clockpicker" data-autoclose="true">
                                					<input type="text" class="form-control" name="racttime" id="racttime" value="${serviceInfo.RACTTIME }">
                                					<span class="input-group-addon">
                                    					<span class="fa fa-clock-o"></span>
                                					</span>
                            					</div>	
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>담당자</th>
                                            <td>
                                            	<div class="input-group owner">
                                                    <input type="text" class="form-control required" name="ractowner_" id="ractowner_" value="${serviceInfo.RACTOWNER_ }">
                                                    <input type="hidden" name="ractowner" id="ractowner" value="${serviceInfo.RACTOWNER }">
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
                                        <col style="width: 8.3%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>처리내용</th>
                                            <td>
                                                <textarea id="ractdesc">${serviceInfo.RACTDESC }</textarea>
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
	<script src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script><!-- summernote-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/clockpicker/clockpicker.js"></script>
	<script>
		$(document).ready(function () {
			
			$('.clockpicker').clockpicker();
			
			$('#servicedesc').summernote();
			$('#ractopinion').summernote();
			$('#ractdesc').summernote();
			
			$('.date').datepicker({
				keyboardNavigation:false,
				forceParse:false,
				autoclose:true
				
			});
		});
		
	</script>
</body>
</html>