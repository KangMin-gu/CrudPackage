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
					<h2><strong>공지사항</strong></h2> 					
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
						
			                        <div class="ibox-content row border-top-0 pt-lg-0 tooltip-demo">
			                            <div class="box col-12" style="padding-left: 0px;padding-right: 0px;">					                          																							
											 <div class="col-xl-10 col-lg-10 float-left text-rigth mb-2 w-100">
												
												<form:form method="post" action="${pageContext.request.contextPath}/notice">												
													<div class="row">				
														<div class="col-xl-8">
															<div class="row">
																<div class="col-xl-2">
																	<select id="header" name="header" class="form-control">
																			<option value="0">전체</option>										                                                                       
										                                    <option value="1">공지</option>
										                                    <option value="2">알림</option>
										                                    <option value="3">뉴스</option>
							                                    	</select>
																</div>
																<div class="col-xl-2" style="padding: 0px;">
																	<select id="condition" name="condition" class="form-control">										                                                                       
										                                    <option value="title">제목</option>
										                                    <option value="editor">작성자</option>
							                                    	</select>																
																</div>																
												 				<div class="col-xl-6" style="padding: 0px;">
																	<input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어">																
																</div>
																<div class="col-xl-2" style="padding: 0px;">
																	<button type="submit" class="btn btn-md btn-primary btn-block" >검색</button>
																</div>
															</div>
														</div>
													</div>
												
												</form:form>	
																				 
											 </div>
											 <div class="col-xl-2 col-lg-2 float-right text-right mb-2 w-100">			
												<c:if test="${CHKAUTH eq 20 || CHKAUTH eq 30 }">
													<a href="${pageContext.request.contextPath}/notice/post" class="btn btn-primary">등록</a>																			
												</c:if>																							
											</div> 
										</div>
										
			                            <div class="overflow-x w-100">
			                            <table class="table table-bordered table-hover">
			                                <colgroup>
			                            		<col style="width: 10px;">
			                            		<col style="width: 70px;">
			                            		<col style="width: 10px;">
			                            		<col style="width: 10px;">			                            		                     		                            		                            		                            		                            		                            		                            		
			                            	</colgroup>  
			                                <thead>	
			                                    <tr>
			                                        <th>분류</th>
			                                        <th>공지 제목</th>
			                                        <th>작성자</th>
			                                        <th>등록일</th>			                         
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                <c:forEach var="notice" items="${siteNotice }">
			                                    <tr>			                                        
			                                        <td id="header">${notice.HEADER }</td>
			                                        <td><a href="${pageContext.request.contextPath}/notice/${notice.ICNUM }">${notice.SUBJECT }</a></td>
			                                        <td>${notice.USERNAME }</td>
			                                        <td>${notice.REGDATE }</td>
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
															href="${pageContext.request.contextPath}/notice?pageNum=${page.startPageNum-1 }&condition=${condition}&keyword=${keyword}">&laquo;</a>
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
															<li class="active page-item"><a class="page-link"
																href="${pageContext.request.contextPath}/notice?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
														</c:when>
														<c:otherwise>
															<li><a
																href="${pageContext.request.contextPath}/notice?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${page.endPageNum lt page.totalPageCount }">
														<li><a
															href="${pageContext.request.contextPath}/notice?pageNum=${page.endPageNum+1 }&condition=${condition}&keyword=${keyword}">&raquo;</a>
														</li>
													</c:when>
													<c:otherwise>
														<li class="disabled"><a href="javascript:">&raquo;</a>
														</li>
													</c:otherwise>
												</c:choose>
											</ul>
			                            </div>			                          
			                        </div>			                     
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
	</div>
	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script src="/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	
	<script>
	$(document).ready(function(){
		$('#condition').attr("style","height: 33px !important; max-height: 33px !important;");
		$('#header').attr("style","height: 33px !important; max-height: 33px !important;");
		$('#keyword').attr("style","height: 33px !important; max-height: 33px !important;");		
		$('.input-group-addon').attr("style","height: 33px !important; max-height: 33px !important");
		
		$('#header').each(function(){
			if($(this).val()=="${noticeInfo.HEADER}"){
				$(this).attr("selected", "selected");
			}
		});
	});
		
	</script>
	
	
</body>
</html>