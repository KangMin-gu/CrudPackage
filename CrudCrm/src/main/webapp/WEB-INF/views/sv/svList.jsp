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
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet"> <!--radioBox-->
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
                    <h2>서비스 관리</h2>
                    <ol class="breadcrumb">
                    <c:set var="urls" value="${requestScope['javax.servlet.forward.request_uri']}" />
                    <c:choose>
                    	<c:when test="${fn:substring(urls, 0, 15)  eq '/service/convey' }">
                    	<li class="breadcrumb-item active">
                            <strong>서비스 이관 목록</strong>
                        </li>
                    	</c:when>
                    	<c:otherwise>
                    	<li class="breadcrumb-item active">
                            <strong>서비스 목록</strong>
                        </li>
                    	</c:otherwise>
                    </c:choose>
                    </ol>
                </div>
            </div>		
<!-- Content -->		
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                
                    <div class="ibox">
                    <form:form action="${pageContext.request.contextPath}/service" method="POST">
                        <div class="ibox-content row">
							<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
                        		<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
                        			<a class="alert-link" href="#">
                        				<span id="showMsg"></span>
                        			</a>
                        		</div>
                        		<div class="w-100 text-right">
									<button type="submit" class="btn btn-primary" data-style="zoom-in">검색</button>
									<a href="javascript:void(0);" class="btn btn-primary resets" >초기화</a> 
								</div>
							</div>
							<br><br>
							
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>접수일자</th>
                                            <td>
                                                <div class="input-group p-0 ">
                                                    <div class="d-flex date date01 col-lg-5 col-md-5 p-0 col-5">
                                                      <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control reset" autocomplete=off name="strDate" id="strDate" value="${search.strDate }">
                                                    </div>
                                                    <h3 class="text-center col-lg-1 col-1 p-0">~</h3>
                                                    <div class="d-flex date date02 col-lg-5 col-md-5 p-0 col-5">
                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control reset" autocomplete=off name="endDate" id="endDate" value="${search.endDate }">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>고객명</th>
                                            <td class="border-top-0">
                                                <div class="input-group cust" id="custno_">
                                                    <input type="text" class="form-control reset" autocomplete="off" readonly name="custno_" value="${search.custno_ }">
                                                    <input type="hidden" class="reset" name="custno" value="${search.custno }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>서비스명</th>
                                            <td>
                                                <div class="input-group" style="height: 1.6rem;">
                                                    <input type="text" class="form-control reset" name="servicename" id="servicename" value="${search.servicename }">
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
                                            <th>접수유형</th>
                                            <td>
                                            	<select class="form-control reset" name="servicetype" id="servicetype" value="${search.servicetype }">
                                                	<option value="">선택</option>
                                                	<c:forEach var="serviceType" items="${SERVICETYPE }">
                                                		<c:choose>
                                                			<c:when test="${search.servicetype eq serviceType.codeval}">
                                                				<option selected label="${serviceType.codename }" value="${serviceType.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
	                                                			<option label="${serviceType.codename }" value="${serviceType.codeval }"/>
    	                                            		</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                               	</select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>거래처명</th>
                                            <td class="border-top-0">
                                                <div class="input-group cli" id="clino_">
                                                    <input type="text" class="form-control reset" readonly autocomplete="off" name="clino_" value="${search.clino_ }">
                                                    <input type="hidden" class="reset" name="clino" value="${search.clino }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>접수매체</th>
                                            <td class="border-top-0">
                                            <div class="input-group">
                                                <select class="form-control reset" name="servicecode1" id="servicecode1" value="${search.servicecode1 }">
                                            		<option value="">선택</option>
                                                    <c:forEach var="serviceCode1" items="${SERVICECODE1 }">
                                                		<c:choose>
                                                			<c:when test="${search.servicecode1 eq serviceCode1.codeval}">
                                                				<option selected label="${serviceCode1.codename }" value="${serviceCode1.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
	                                                			<option label="${serviceCode1.codename }" value="${serviceCode1.codeval }"/>
    	                                            		</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                                <select class="form-control reset" name="servicecode2" id="servicecode2" upper="servicecode1" value="${search.servicechannel }">
                                            		<option value="">선택</option>
                                                    
                                                </select>
                                            </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>접수자</th>
                                            <td class="border-top-0">
                                                <div class="input-group owner" id="serviceowner_">
                                                    <input type="text" class="form-control reset" readonly autocomplete="off" name="serviceowner_" value="${search.serviceowner_ }">
                                                    <input type="hidden" class="reset" name="serviceowner" value="${search.serviceowner }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>담당자</th>
                                            <td class="border-top-0">
                                                <div class="input-group owner" id="owner_">
                                                    <input type="text" class="form-control reset" readonly autocomplete="off" name="owner_" value="${search.owner_ }">
                                                    <input type="hidden" class="reset" name="owner" value="${search.owner }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>처리상태</th>
                                            <td class="border-top-0">
                                                <select class="form-control reset" name="servicestep" id="servicestep" value="${search.servicestep }">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="serviceStep" items="${SERVICESTEP }">
                                                		<c:choose>
                                                			<c:when test="${search.servicestep eq serviceStep.codeval}">
                                                				<option selected label="${serviceStep.codename }" value="${serviceStep.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${serviceStep.codename }" value="${serviceStep.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </form:form>
                        <form:form action="${pageContext.request.contextPath}/service/delete" method="POST">
                        <div class="ibox-content row border-top-0 pt-lg-0 tooltip-demo">
                            <div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
								<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
									<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
                             			<button type="button" class="btn btn-default" data-toggle="modal" data-target="#exModal"  id="excelBtn" onClick ><i class="fa fa-file-excel-o" ></i></button>
										<c:choose>
                    						<c:when test="${fn:substring(urls, 0, 15)  eq '/service/convey' }">
                    							<input type="hidden" id="excelUrl" name="excelUrl" value="/serviceexcel?servicestep=3">
                    						</c:when>
                    						<c:otherwise>
	                    						<input type="hidden" id="excelUrl" name="excelUrl" value="/serviceexcel">
                    						</c:otherwise>                    					
                    					</c:choose>
                             			<input type="hidden" id="searchFormId" name="searchFormId" value="command"> 
                             		</div> 	
	                          	</div>	
	                          	
	                          													
								<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
									<a href="${pageContext.request.contextPath}/service/post" class="btn btn-primary">추가</a>
									<button class="btn btn-primary" >삭제</button>
								</div>
							</div>
							
							<div class="modal inmodal" id="exModal" tabindex="-1" role="dialog"  aria-hidden="true" data-backdrop="static">
                                <div class="modal-dialog" >
                                   	<div class="modal-content animated fadeIn">
                                       	<div class="modal-header">
                                           	<div class="h1 m-t-xs text-navy">
                                				<span class="loading hamburger"></span>
                            				</div>
                                       	</div>
                                       	<div class="modal-body" style="text-align:center">
                                       		<p><strong>엑셀 다운로드 중 입니다.</strong></p>
                                       	</div>
                                       	<div class="modal-footer">
                                           	<button type="button" class="btn btn-white" data-dismiss="modal" id="modalCloseBtn" style="display: none;">확인</button>
                                       	</div>
                                   	</div>
                                </div>
                            </div> 
							
							
                            <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                            	<colgroup>
                            		<col style="width: 3%;">
                            		<col style="width: 15%;">
                            		<col style="width: 10%;">
                            		<col style="width: 10%;">
                            		<col style="width: 10%;">
                            		<col style="width: 15%;">
                            		<col style="width: 10%;">
                            		<col style="width: 10%;">
                            		<col style="width: 10%;">
                            		<col style="width: 7%;">                            		                            		                            		                            		                            		                            		                            		
                            	</colgroup>                            
                                <thead>
                                    <tr>
                                        <th style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"><input type="checkbox" class="i-checks chksquare" name="icheckAll" id="icheckAll"></th>
                                        <th style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">서비스명</th>
                                        <th style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">접수유형</th>
                                        <th style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">상담유형</th>
                                        <th style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">고객명</th>
                                        <th style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">거래처명</th>
                                        <th style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">접수일</th>
                                        <th style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">접수자</th>
                                        <th style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">담당자</th>
                                        <th style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">처리상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="svList" items="${svList }">
                                    <tr>
                                        <td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"><input type="checkbox" class="i-checks chksquare" name="serviceno" id="serviceno" value="${svList.SERVICENO }"></td>
                                        <td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"><a href="${pagecontext.request.contextpath}/service/${svList.SERVICENO }">${svList.SERVICENAME}</a></td>
                                        <td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"> ${svList.SERVICETYPE_ }</td>
                                        <td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${svList.SERVICECODE_ }</td>
                                        <td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${svList.CUSTNAME_ }</td>
                                        <td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${svList.CLINAME_ }</td>
                                        <td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${svList.RECEPTIONDATE_ }</td>
                                        <td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${svList.SERVICEOWNER_ }</td>
                                        <td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${svList.OWNER_ }</td>
                                        <td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${svList.SERVICESTEP_ }</td>
                                    </tr>
                                </c:forEach>
                                       
                                </tbody>
                                <tfoot>
                            </table>
                            </div>
                            <div class="m-auto">
                                <ul class="pagination">
                                    <c:choose>
											<c:when test="${page.startPageNum ne 1 }">
												<li><a onclick="javascript:paging(${page.startPageNum-1})">&laquo;</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&laquo;</a>
												</li>
											</c:otherwise>
										</c:choose>
										<c:forEach var="i" begin="${page.startPageNum }"
											end="${page.endPageNum }">
											<c:choose>
												<c:when test="${i eq page.pageNum }">
													<li class="footable-page active"><a
														onclick="javascript:paging(${i})">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li><a onclick="javascript:paging(${i})">${i }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${page.endPageNum lt page.totalPageCount }">
												<li><a onclick="javascript:paging(${page.endPageNum+1 })"></a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&raquo;</a>
												</li>
											</c:otherwise>
										</c:choose>
                                </ul>
                            </div>
                           <h4 class="float-right">&middot; 총 자료수 : ${totalRows }</h4>
                        </div>
                        </form:form>
                        
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
</div>
<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>	
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script> <!-- radioBox-->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_sv.js"></script>

<script>

$('#servicecode1').change(function(){
	 upperCode('servicecode1'); 
});
</script>
</body>
</html>