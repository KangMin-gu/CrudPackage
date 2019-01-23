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
                    <h2>라이센스 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active">
                            <strong>라이센스 목록</strong>
                        </li>
                    </ol>
                </div>
            </div>		
		
		
<!-- Content -->		
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                
                    <div class="ibox">
                    <form:form action="${pageContext.request.contextPath}/ma/license" method="POST">
                        <div class="ibox-content row">
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>라이센스명</th>
                                            <td>
                                                <div class="input-group">
                                                    <input type="text" class="form-control reset" name="licensename" id="licensename" value="${search.licensename }">
                                                    <button class="btn btn-primary btn-sm ml-1" style="line-height: 1.2;">검색</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </form:form>
                        <div class="ibox-content row pt-lg-0 border-top-0">
                            <div class="table-responsive head">
                            <table class="table table-bordered table-hover" style="border-top: 1px solid #EBEBEB">
                                <colgroup>
                            		<col style="width: 150px;">
                            		<col style="width: 120px;">
                            		<col style="width: 100px;">
                            		<col style="width: 150px;">
                            		<col style="width: 150px;">                         		                            		                            		                            		                            		                            		                            		
                            	</colgroup>  
                                <thead>
                                    <tr>
                                        
                                        <th>라이센스명</th>
                                        <th>단가</th>
                                        <th>총사용량</th>
                                        <th>등록일</th>
                                        <th>등록자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="license" items="${license }">
                                    <tr name="licenseno" id="licenseno" value="${license.LICENSENO}">
                                        <td><a>${license.LICENSENAME}</a></td>
                                        <td>${license.LICENSECOST }</td>
                                        <td>${license.TOTALCNT }</td>
                                        <td>${license.REGDATE }</td>
                                        <td>${license.REGUSER_ }</td>
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
                        <div class="row justify-content-md-center">
            
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-content row body">
                            <div class="w-100 text-right mb-2">
                            	<button class="btn btn-primary" id="reset">초기화</button>
                            	<button class="btn btn-primary" id="create">추가</button>
                            	<button class="btn btn-primary submit" id="save">저장</button>
                            	<button class="btn btn-primary" id="update">수정</button>
                            	<button class="btn btn-primary" id="cancel">취소</button>
                                <button class="btn btn-primary" id="delete">삭제</button>
                            </div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0" style="height: 44.07px;">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>라이센스명</th>
                                            <td><input type="text" class="form-control error validate required stringV" maxlength="20" name="licensename" id="licensename" value=""></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-4 p-0">
                                <table class="table table-bordered mb-0" style="height: 44.07px;">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>라이센스 단가</th>
                                            <td height="40">
                                                <div class="input-group">
                                                    <input type="text" class="form-control error validate required numberV" maxlength="10" name="licensecost" id="licensecost" value="">
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                           	<div class="box4 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                    
                                        <tr> 
                                        	<th><label for="isdelete">사용여부</label></th>
                                            <td>
                                            	<select class="form-control col-12 float-left mr-12" name="isdelete" id="isdelete">
                                                	<option value=0 <c:if test='${menu.ISDELETE eq 0}'>selected</c:if>>사용</option>
                                                	<option value=1 <c:if test='${menu.ISDELETE eq 1}'>selected</c:if>>미사용</option>
                                                </select>
                                            </td>
                                           		<input type="hidden" id="no" />
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
	<script src="${pageContext.request.contextPath}/resources/crud/crud_ma.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script> <!-- radioBox-->
	<script>
	$( document ).ready(function() {
    	
    	$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
	</script>

</body>
</html>