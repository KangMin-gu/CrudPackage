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
                    <h2>캠페인 서식관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active">
                            <strong>서식 목록</strong>
                        </li>
                    </ol>
                </div>
            </div>		
		
		
<!-- Content -->		
		<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                    <div class="ibox">
                    <form:form action="${pageContext.request.contextPath}/campaign/contents" method="POST">
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
                                            <th>사용매체</th>
                                            <td>
                                            	<select class="form-control reset select" name="formtype" id="formtype" style="height: 22px !important">
                                                   	<option value="">선택</option>
                                                   	<option value="1" <c:if test='${search.formtype eq 1}'>selected</c:if>>EMAIL</option>
                                                   	<option value="2" <c:if test='${search.formtype eq 2}'>selected</c:if>>SMS/LMS</option>
                                                   	<option value="3" <c:if test='${search.formtype eq 3}'>selected</c:if>>MMS</option>
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
                                            <th>제목</th>
                                            <td>
                                                <input type="text" name="title" id="title" class="form-control reset" value="${search.title }">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </form:form>
                        <form:form action="${pageContext.request.contextPath}/campaign/contents/delete" method="POST">
                        <div class="ibox-content row border-top-0 pt-lg-0">
                        	<div class="w-100 text-right mb-2">
                                <a href="${pageContext.request.contextPath}/campaign/contents/post" class="btn btn-primary">추가</a>
                                <div class="d-inline-block mt-sx-1">
                                	<button class="btn btn-primary">삭제</button>
                                </div>
                            </div>
                            <div class="table-responsive">
                            <table class="table table-bordered" style="border-top: 1px solid #e7eaec;">
                                <colgroup>
                                    <col style="width: 50px"/>
                                    <col style="width: 200px"/>
                                    <col style="width: 100px"/>
                                    <col style="width: 150px"/>
                                    <col style="width: 150px"/>
                                    <col style="width: 100px"/>                     
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="i-checks" name=""></th>
                                        <th>제목</th>
                                        <th>사용매체</th>
                                        <th>용도</th>
                                        <th>등록자</th>
                                        <th>등록일시</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="contentsList" items="${contents }">
                                    	<tr>
                                        	<td><input type="checkbox" class="i-checks" name="no" id="no" value="${contentsList.NO }"></td>
                                        	<td><a href="${pagecontext.request.contextpath}/campaign/contents/${contentsList.NO }">${contentsList.TITLE}</a></td>
                                        	<td>${contentsList.FORMTYPE_ }</td>
                                        	<td>${contentsList.PURP }</td>
                                        	<td>${contentsList.REGUSER_ }</td>
                                        	<td>${contentsList.REGDATE_ }</td>
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
											<li><a
												href="${pageContext.request.contextPath}/user?pageNum=${page.startPageNum-1 }&">&laquo;</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a href="javascript:">&laquo;</a>
											</li>
										</c:otherwise>
									</c:choose>
									<c:forEach var="i" begin="${page.startPageNum }" end="${page.endPageNum }">
										<c:choose>
											<c:when test="${i eq page.pageNum }">
												<li class="footable-page active"><a
													href="${pageContext.request.contextPath}/user?pageNum=${i }">${i }</a></li>
											</c:when>
											<c:otherwise>
												<li><a
													href="${pageContext.request.contextPath}/user?pageNum=${i }">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${page.endPageNum lt page.totalPageCount }">
											<li><a
												href="${pageContext.request.contextPath}/user?pageNum=${page.endPageNum+1 }">&raquo;</a>
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