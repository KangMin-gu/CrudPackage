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
    </div>
<!-- Top -->    
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>

            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>회원사 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active">
                            <strong>회원사 목록</strong>
                        </li>
                    </ol>
                </div>
            </div>		
		
		
<!-- Content -->		
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                
                    <div class="ibox">
                    <form:form action="${pageContext.request.contextPath}/ma/company" method="POST">
                        <div class="ibox-content row">
                        	<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
                        		<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
                        			<a class="alert-link" href="#">
                        				<span id="showMsg"></span>
                        			</a>
                        		</div>
                        		<div class="w-100 text-right">
									<button type="submit" class="btn btn-primary" data-style="zoom-in">검 색</button>
									<a href="javascript:void(0);" class="btn btn-primary resets">초기화</a> 
								</div>
							</div>
							<br><br>
                            <div class="box1 col-lg-6 p-0">
                                <table class="table table-bordered">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>등록일자</th>
                                            <td>
                                                <div class="input-group p-0">
                                                    <div class="d-flex date date01 col-lg-5 col-md-5 p-0 col-5">
                                                      <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control reset" autocomplete="off" name="strDate" id="strDate" value="${search.strDate }">
                                                    </div>
                                                    <h3 class="text-center col-lg-1 col-1 p-0">~</h3>
                                                    <div class="d-flex date date02 col-lg-5 col-md-5 p-0 col-5">
                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control reset" autocomplete="off" name="endDate" id="endDate" value="${search.endDate }">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-3 p-0">
                                <table class="table table-bordered" style="height: 42.8px;">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>회원사명</th>
                                            <td>
                                                <div class="input-group">
                                                    <input type="text" class="form-control reset" name="sitename" id="sitename" value="${search.sitename }">

                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-3 p-0">
                                <table class="table table-bordered">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>기업규모</th>
                                            <td>
                                                <select class="form-control reset" name="sitesize" id="sitesize" value="${search.sitesize }">
                                                    <option value="">선택</option>
                                                    <option value="1" <c:if test='${search.sitesize eq 1}'>selected</c:if>>대기업</option>
                                                    <option value="2" <c:if test='${search.sitesize eq 2}'>selected</c:if>>중견기업</option>
                                                    <option value="3" <c:if test='${search.sitesize eq 3}'>selected</c:if>>중소기업</option>
                                                    <option value="4" <c:if test='${search.sitesize eq 4}'>selected</c:if>>소기업</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </form:form>
                        <form:form action="${pageContext.request.contextPath}/ma/company/delete" method="POST">
                        <div class="ibox-content row border-top-0 pt-lg-0">
                            <div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
								<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
	                            	 <a href="${pageContext.request.contextPath}/companyexcel" class="btn btn-primary">엑셀 다운로드</a>
	                          	</div>													
								<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
									<a href="${pageContext.request.contextPath}/ma/company/post" class="btn btn-primary">추가</a>
									<a href="javascript:void(0);" class="btn btn-primary" >삭제</a>
								</div>
							</div>
                            <div class="overflow-x w-100">
                            <table class="table table-bordered table-hover">
                                <colgroup>
                            		<col style="width: 30px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">                           		                            		                            		                            		                            		                            		                            		
                            	</colgroup>  
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="i-checks" id="icheckAll" name="icheckAll"></th>
                                        <th>회원사명</th>
                                        <th>대표자명</th>
                                        <th>사업자번호</th>
                                        <th>핸드폰번호</th>
                                        <th>종목</th>
                                        <th>기업규모</th>
                                        <th>가입일</th>
                                        <th>라이센스구매갯수</th>
                                        <th>서비스상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="memCompany" items="${memCompany }">
                                    <tr>
                                        <td><input type="checkbox" class="i-checks" name="siteid" id="siteid" value="${memCompany.SITEID }"></td>
                                        <td><a href="${pagecontext.request.contextpath}/ma/company/${memCompany.SITEID }">${memCompany.SITENAME}</td>
                                        <td>${memCompany.PRSDNAME }</td>
                                        <td>${memCompany.BSNO }</td>
                                        <td>${memCompany.MOBILE }</td>
                                        <td>${memCompany.BSTYPE }</td>
                                        <td>${memCompany.SITESIZE }</td>
                                        <td>${memCompany.FREGDATE }</td>
                                        <td>${memCompany.BUYCNT }</td>
                                        <td>${memCompany.ISDELETE }</td>
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
												<li><a onclick="javascript:paging(${page.endPageNum+1 })">&raquo;</a>
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