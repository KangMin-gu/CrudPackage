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
    </div>
<!-- Top -->    
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>

            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>사용자 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/">메인</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>사용자 목록</strong>
                        </li>
                    </ol>
                </div>
            </div>		
		
		
<!-- Content -->		
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                
                    <div class="ibox">
                    <form:form action="${pageContext.request.contextPath}/au" method="POST">
                        <div class="ibox-content row">
                           <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>사용자명</th>
                                            <td>
                                                <div class="input-group">
                                                    <input type="text" class="form-control reset" name="username" id="username" value="${search.username }">

                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>ID</th>
                                            <td>
                                                <div class="input-group">
                                                    <input type="text" class="form-control reset" name="userid" id="userid" value="${search.userid }">

                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-4 p-0">
                                <table class="table table-bordered">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>사용자상태</th>
                                            <td>
                                                <select class="form-control reset" name="isdelete" id="isdelete" value="${search.isdelete }">
                                                    <option value="">선택</option>
                                                    <option value="0" <c:if test='${search.isDelete eq 0}'>selected</c:if>>사용</option>
                                                    <option value="1" <c:if test='${search.isDelete eq 1}'>selected</c:if>>미사용</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>가입일</th>
                                            <td>
                                                <div class="input-group p-0  input-daterange">
                                                    <div class="d-flex date date01 col-lg-5 col-md-5 p-0 col-5">
                                                      <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control reset" autocomplete="off" name="strdate" id="strdate" value="${search.strdate }">
                                                    </div>
                                                    <h3 class="text-center col-lg-1 col-1 p-0">~</h3>
                                                    <div class="d-flex date date02 col-lg-5 col-md-5 p-0 col-5">
                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control reset" autocomplete="off" name="enddate" id="enddate" value="${search.enddate }">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="w-100 text-right">
                                <button class="btn btn-primary resets">초기화</button>
                                <button class="btn btn-primary">검색</button>
                                
                            </div>
                        </div>
                        </form:form>
                        <form:form action="${pageContext.request.contextPath}/au/delete" method="POST">
                        <div class="ibox-content row border-top-0 pt-lg-0">
                            <div class="w-100 text-right mb-2">
                            
                                <a href="${pageContext.request.contextPath}/au/post" class="btn btn-primary">추가</a>
                                <div class="d-inline-block mt-sx-1">
                                <a href="javascript:void(0);" class="btn btn-primary">엑셀다운로드</a>
                                <button class="btn btn-primary">삭제</button>
                                </div>
                             
                            </div>
                            <div class="overflow-x w-100">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="i-checks" name="userno"></th>
                                        <th>사용자명</th>
                                        <th>사용자ID</th>
                                        <th>부서</th>
                                        <th>직책</th>
                                        <th>역할</th>
                                        <th>사용자상태</th>
                                        <th>등록일시</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${user }">
                                    <tr>
                                        <td><input type="checkbox" class="i-checks" name="userno" id="userno" value="${user.USERNO }"></td>
                                        <td><a href="${pagecontext.request.contextpath}/au/${user.USERNO }">${user.USERNAME}</a></td>
                                        <td>${user.USERID }</td>
                                        <td>${user.DEPT_ }</td>
                                        <td>${user.USERDUTY }</td>
                                        <td>${user.CHKROLE_ }</td>
                                        <td>${user.ISDELETE_ }</td>
                                        <td>${user.REGDATE }</td>
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
													href="${pageContext.request.contextPath}/au?pageNum=${page.startPageNum-1 }&">&laquo;</a>
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
													<li class="active"><a
														href="${pageContext.request.contextPath}/au?pageNum=${i }">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li><a
														href="${pageContext.request.contextPath}/au?pageNum=${i }">${i }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${page.endPageNum lt page.totalPageCount }">
												<li><a
													href="${pageContext.request.contextPath}/au?pageNum=${page.endPageNum+1 }">&raquo;</a>
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

<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>	
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script> <!-- radioBox-->
	<script>
    $( document ).ready(function() {
    	
    	$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    	
        $('.input-daterange').datepicker({
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