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
<!-- Toastr style -->
<link href="/resources/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">
<!-- DatePicker -->
<link href="/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">

<link href="/resources/css/animate.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">
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
					<h2>공지사항</h2> 					
				</div>
				<div class="col-lg-2">
				</div>
			</div>
			<!-- Content -->
			<div class="wrapper wrapper-content animated fadeIn">
				<div class="wrapper wrapper-content  animated fadeInRight article">
					<div class="row justify-content-md-center">
						<div class="col-lg-12" style="background: #ffffff;">
							<div class="ibox">				
								<!-- conten-row -->
								<div class="ibox-content row">
									<form:form action="${pageContext.request.contextPath}/ad/user/delete" method="POST">
			                        <div class="ibox-content row border-top-0 pt-lg-0 tooltip-demo">
			                            <div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
																						
											<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
												<a href="${pageContext.request.contextPath}/ad/user/post" class="btn btn-primary">추가</a>
												<a href="javascript:void(0);" class="btn btn-primary" >삭제</a>
											</div>
										</div>
										
			                            <div class="overflow-x w-100">
			                            <table class="table table-bordered table-hover">
			                                <colgroup>
			                            		<col style="width: 50px;">
			                            		<col style="width: 150px;">
			                            		<col style="width: 70px;">
			                            		<col style="width: 100px;">			                            		                     		                            		                            		                            		                            		                            		                            		
			                            	</colgroup>  
			                                <thead>
			                                    <tr>
			                                        <th>말머리</th>
			                                        <th>내용</th>
			                                        <th>글쓴이</th>
			                                        <th>등록일</th>			                         
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                <c:forEach var="user" items="${user }">
			                                    <tr>			                                        
			                                        <td>${user.USERDUTY }</td>
			                                        <td>${user.ENTERDATE }</td>
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
			</div>
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
	<script src="/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	
	<script>
	
	</script>
	
	
</body>
</html>