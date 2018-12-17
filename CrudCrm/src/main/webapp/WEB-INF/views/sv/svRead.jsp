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
                        
                            <div class="w-100 text-right mb-2">
                            <form:form action="${pageContext.request.contextPath}/service/${serviceInfo.RCVNO}" method="POST">
                                <a href="${pageContext.request.contextPath}/service" class="btn btn-primary">목록</a>
                                <a href="${pageContext.request.contextPath}/service/post/${serviceInfo.RCVNO}" class="btn btn-primary">수정</a>
                                <a href="#" class="btn btn-primary servicenext">이관</a>
								<button class="btn btn-primary" type="submit" value="삭제">삭제</button>
							</form:form>	
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
                                            <td>${serviceInfo.CLINAME}</td>
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
                                            <th>접수유형</th>
                                            <td>${serviceInfo.RCVTYPE_ }</td>
                                        </tr>
                                        <tr>
                                            <th>접수일</th>
                                            <td>${serviceInfo.RCVDATE }</td>
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
                                            <th>서비스유형</th>
                                            <td>${serviceInfo.RCVCODE_ }</td>
                                        </tr>
                                        <tr>
                                            <th>접수시간</th>
                                            <td>${serviceInfo.RCVTIME }</td>
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
                                            <th>접수자</th>
                                            <td>${serviceInfo.RCVOWNER_ }</td>
                                        </tr>
                                        <tr>
                                            <th>처리상태</th>
                                            <td>${serviceInfo.PRCSTATE_ }</td>
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
                                                ${serviceInfo.RCVNAME }
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
                                        	<th class="border-top-0">접수매체</th>
                                        	<td class="border-top-0">
                                        		${serviceInfo.RCVCHANNEL_ }
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
                                                <textarea id="rcvdesc">${serviceInfo.RCVDESC }</textarea>
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
                                            <th class="border-top-0">메모</th>
                                            <td class="border-top-0">
                                                <textarea id="rcvopinion">${serviceInfo.RCVOPINION }</textarea>
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
                            
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>처리유형</th>
                                            <td>${serviceInfo.RACTCODE_}</td>
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
                                            <th>처리일</th>
                                            <td>${serviceInfo.RACTDATE }</td>
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
                                            <th>처리일시</th>
                                            <td>${serviceInfo.RACTTIME }</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered border-bottom-0 border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-bottom-0 border-top-0">담당자</th>
                                            <td class="border-bottom-0 border-top-0">${serviceInfo.RACTOWNER_ }</td>
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
                                                <textarea id="ractdesc">${serviceInfo.RACTDESC }</textarea>
                                            </td>
                                            <input type="hidden" id="rcvno" value="${serviceInfo.RCVNO }" /> 
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
                                                                <th>처리시간</th>
                                                                <th>처리유형</th>
                                                                <th>담당자</th>
                                                                <th>처리내용</th>
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
			
			$('#rcvdesc').summernote('disable');
			$('#rcvopinion').summernote('disable');
			$('#ractdesc').summernote('disable');
		});
		
		
	
	</script>
</body>
</html>