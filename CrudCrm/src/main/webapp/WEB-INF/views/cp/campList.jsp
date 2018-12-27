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
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet"> <!--radioBox-->
</head>

<body>
	<div id="wrapper">
<!-- leftside -->	
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
    
<!-- Top -->    
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>
		<c:set var="url" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>캠페인 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active">
                        	<c:if test="${url eq '/campaign' }">
                            	<strong>캠페인 목록</strong>
                            </c:if>
                            <c:if test="${url eq '/campaign/cust' }">
                            	<strong>캠페인 추출고객 목록</strong>
                            </c:if>
                        </li>
                    
                    </ol>
                </div>
            </div>		
		
		
<!-- Content -->		
		<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                    <div class="ibox">
                    <form:form action="${pageContext.request.contextPath}/campaign" method="POST">
                    	
                        <div class="ibox-content row">
                        	<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
                        		<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
                        			<a class="alert-link" href="#">
                        				<span id="showMsg"></span>
                        			</a>
                        		</div>
                        		<div class="w-100 text-right">
									<button type="submit" class="btn btn-primary" data-style="zoom-in">검 색</button>
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
                                            <th>캠페인 기간</th>
                                            <td>
                                                <div class="input-group p-0">
                                                    <div class="d-flex date date01 col-lg-5 col-md-5 p-0 col-5">
                                                      <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control reset" autocomplete="off" id="startdate" name="startdate" value="${search.startdate }">
                                                    </div>
                                                    <h3 class="text-center col-lg-1 col-1 p-0">~</h3>
                                                    <div class="d-flex date date02 col-lg-5 col-md-5 p-0 col-5">
                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control reset" autocomplete="off" id="enddate" name="enddate" value="${search.enddate }">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>캠페인명</th>
                                            <td><input type="text" class="form-control reset" name="campname" id="campname" value="${search.campname }" style="height: 23px;"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>발송매체</th>
                                            <td>
                                                <select class="form-control" name="sendform" id="sendform">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="sendForm" items="${SENDFORM }">
                                                		<c:choose>
                                                			<c:when test="${search.sendform eq sendForm.codeval}">
                                                				<option selected label="${sendForm.codename }" value="${sendForm.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${sendForm.codename }" value="${sendForm.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">진행단계</th>
                                            <td class="border-top-0">
                                                <select class="form-control" id="campstep" name="campstep">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="campStep" items="${CAMPSTEP }">
                                                		<c:choose>
                                                			<c:when test="${search.campstep eq campStep.codeval}">
                                                				<option selected label="${campStep.codename }" value="${campStep.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${campStep.codename }" value="${campStep.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">캠페인유형</th>
                                            <td class="border-top-0">
                                                <select class="form-control" id="camptype" name="camptype">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="campType" items="${CAMPTYPE }">
                                                		<c:choose>
                                                			<c:when test="${search.camptype eq campType.codeval}">
                                                				<option selected label="${campType.codename }" value="${campType.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${campType.codename }" value="${campType.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0" class="border-top-0">담당자</th>
                                            <td class="border-top-0">
                                                <div class="input-group owner" id="owner_">
                                                    <input type="text" class="form-control reset" disabled autocomplete="off" name="owner_" value="${memCompany.owner_ }">
                                                    <input type="hidden" class="reset" name="owner" value="${search.owner }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </form:form>
                        <form:form action="${pageContext.request.contextPath}/campaign/delete" method="POST">
                        <div class="ibox-content row border-top-0 pt-lg-0 tooltip-demo">
                        	<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
								<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
	                            	 <a href="${pageContext.request.contextPath}/campexcel" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="엑셀다운로드"><i class="fa fa-file-excel-o" ></i></a>
	                          	</div>													
								<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
									<a href="${pageContext.request.contextPath}/campaign/post" class="btn btn-primary">추가</a>
									<a href="javascript:void(0);" class="btn btn-primary" >삭제</a>
								</div>
							</div>
                            <div class="table-responsive">
                            <table class="table table-bordered" style="border-top: 1px solid #e7eaec;">
                                <colgroup>
                                    <col style="width: 50px"/>
                                    <col style="width: 200px"/>
                                    <col style="width: 200px"/>
                                    <col style="width: 100px"/>
                                    <col style="width: 150px"/>
                                    <col style="width: 150px"/>
                                    <col style="width: 100px"/>
                                    <col style="width: 100px"/>
                                    <col style="width: 100px"/>                             
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="i-checks" name=""></th>
                                        <th>캠페인명</th>
                                        <th>캠페인 기간</th>
                                        <th>유형</th>
                                        <th>발송매체</th>
                                        <th>담당자</th>
                                        <th>진행단계</th>
                                        <th>읽은인원 /전체인원</th>
                                        <th>발송인원 /전체인원</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cpList" items="${camp }">
                                    	<tr>
                                        	<td><input type="checkbox" class="i-checks" name="campno" id="campno" value="${cpList.CAMPNO }"></td>
                                        	<c:if test="${url eq '/campaign' }">
                                        	<td><a href="${pagecontext.request.contextpath}/campaign/${cpList.CAMPNO }">${cpList.CAMPNAME}</a></td>
                                        	</c:if>
                                        	<c:if test="${url eq '/campaign/cust' }">
                                        	<td><a href="${pagecontext.request.contextpath}/campaign/cust/${cpList.CAMPNO }">${cpList.CAMPNAME}</a></td>
                                        	</c:if>
                                        	<td>${cpList.CAMPDATE_ }</td>
                                        	<td>${cpList.CAMPTYPE_ }</td>
                                        	<td>${cpList.CAMPFORM_ }</td>
                                        	<td>${cpList.OWNER_ }</td>
                                        	<td>${cpList.CAMPSTEP_ }</td>
                                        	<td>${cpList.CLICKTOTAL }</td>
                                        	<td>${cpList.SENDTOTAL }</td>
                                    	</tr>
                                	</c:forEach>
                                </tbody>
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
                           <h4 class="float-right">&middot; 총 자료수 : ${totalRows }건</h4>
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
<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>	
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script> <!-- radioBox-->
	<script>
    $( document ).ready(function() {
    	
    	$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    	
        $('.date').datepicker({
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true
        });
    });
    
    $('.resets').click(function(e){
    	e.preventDefault();
    	$('.reset').val('');
    });

	</script>			

</body>
</html>