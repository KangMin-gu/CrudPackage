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
                    <h2>서비스 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active">
                            <strong>서비스 목록</strong>
                        </li>
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
                                            <td>
                                                <div class="input-group cust">
                                                    <input type="text" class="form-control reset" autocomplete="off" name="custno_" id="custno_" value="${search.custno_ }">
                                                    <input type="hidden" class="form-control reset" name="custno" id="custno" value="${search.custno }">
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
                                                    <input type="text" class="form-control reset" name="rcvname" id="rcvname" value="${search.rcvname }">
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
                                                    <select class="form-control reset select2" name="rcvtype" id="rcvtype" value="${search.rcvtype }">
                                                    	<option value="">선택</option>
                                                    	<option value="1" <c:if test='${search.rcvtype eq 1}'>selected</c:if>>문의</option>
                                                    	<option value="2" <c:if test='${search.rcvtype eq 2}'>selected</c:if>>개선</option>
                                                    	<option value="3" <c:if test='${search.rcvtype eq 3}'>selected</c:if>>오류</option>
                                                	</select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>거래처명</th>
                                            <td>
                                                <div class="input-group cli">
                                                    <input type="text" class="form-control reset" autocomplete="off" name="clino_" id="clino_" value="${search.clino_ }">
                                                    <input type="hidden" class="form-control reset" name="clino" id="clino" value="${search.clino }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>접수매체</th>
                                            <td>
                                            	<select class="form-control reset select2" name="rcvchannel" id="rcvchannel" value="${search.rcvchannel }">
                                            		<option value="">선택</option>
                                                    <option value="10" <c:if test='${search.rcvchannel eq 10}'>selected</c:if>>전화</option>
                                                    <option value="20" <c:if test='${search.rcvchannel eq 20}'>selected</c:if>>SMS</option>
                                                    <option value="30" <c:if test='${search.rcvchannel eq 30}'>selected</c:if>>메일</option>
                                                </select>
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
                                            <td>
                                                <div class="input-group owner" style="height: 1.6rem;">
                                                    <input type="text" class="form-control required reset" autocomplete="off" name="rcvowner_" id="rcvowner_" value="${search.rcvowner_ }">
                                                    <input type="hidden" class="reset" name="rcvowner" id="rcvowner" value="${search.rcvowner }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>담당자</th>
                                            <td>
                                                <div class="input-group owner">
                                                    <input type="text" class="form-control required reset" autocomplete="off" name="ractowner_" id="ractowner_" value="${search.ractowner_ }">
                                                    <input type="hidden" class="reset" name="ractowner" id="ractowner" value="${search.ractowner }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>처리상태</th>
                                            <td>
                                            	<select class="form-control reset select2" name="prcstate" id="prcstate" value="${search.prcstate }">
                                            		<option value="">선택</option>
                                                    <option value="1" <c:if test='${search.prcstate eq 1}'>selected</c:if>>접수</option>
                                                    <option value="2" <c:if test='${search.prcstate eq 2}'>selected</c:if>>이관</option>
                                                    <option value="3" <c:if test='${search.prcstate eq 3}'>selected</c:if>>완료</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </form:form>
                        <form:form action="${pageContext.request.contextPath}/service/delete" method="POST">
                        <div class="ibox-content row border-top-0 pt-lg-0">
                            <div class="w-100 text-right mb-2">
                            
                                <a href="${pageContext.request.contextPath}/service/post" class="btn btn-primary">추가</a>
                                <div class="d-inline-block mt-sx-1">
                                <a href="javascript:void(0);" class="btn btn-primary">엑셀다운로드</a>
                                <button class="btn btn-primary">삭제</button>
                                </div>
                             
                            </div>
                            <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                            	<colgroup>
                            		<col style="width: 30px;">
                            		<col style="width: 150px;">
                            		<col style="width: 70px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">
                            		<col style="width: 200px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">
                            		<col style="width: 70px;">                            		                            		                            		                            		                            		                            		                            		
                            	</colgroup>                            
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="i-checks"></th>
                                        <th>서비스명</th>
                                        <th>접수유형</th>
                                        <th>접수매체</th>
                                        <th>고객명</th>
                                        <th>거래처명</th>
                                        <th>접수일</th>
                                        <th>접수자</th>
                                        <th>담당자</th>
                                        <th>처리상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="svList" items="${svList }">
                                    <tr>
                                        <td><input type="checkbox" class="i-checks" name="rcvno" id="rcvno" value="${svList.RCVNO }"></td>
                                        <td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"><a href="${pagecontext.request.contextpath}/service/${svList.RCVNO }">${svList.RCVNAME}</a></td>
                                        <td>${svList.RCVTYPE_ }</td>
                                        <td>${svList.RCVCHANNEL_ }</td>
                                        <td>${svList.CUSTNO_ }</td>
                                        <td>${svList.CLINO_ }</td>
                                        <td>${svList.RCVDATE_ }</td>
                                        <td>${svList.RCVOWNER_ }</td>
                                        <td>${svList.RACTOWNER_ }</td>
                                        <td>${svList.PRCSTATE_ }</td>
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