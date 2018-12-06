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

<!-- S: 추가 CSS-->
<!-- Toastr style -->
<link href="/resources/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">
<!--radioBox-->
<link href="/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<!--datePicker-->
<link href="/resources/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">

<style>
body {
	background-color: #f3f3f4;
}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>서식검색</h2>
			</div>
		</div>

		<!-- S: 고객 목록 ppt p01-->
		<div class="wrapper wrapper-content  animated fadeInRight article">

			<div class="col-lg-12">
				<div class="ibox">
					<div class="ibox-content row">
						
						
						<div class="col-sm-12 col-xs-12 p-0 float-left">
							<form:form action="/popcontents" method="GET">
								<input type="hidden" id="parentid" name="parentid" value="${search.parentid}">
								 <div class="form-group  row"><label class="col-sm-12 col-form-label">캠페인명</label>
                                    <div class="col-sm-12">
                                    	<input type="text" name="campname" id="campname" class="form-control" value="${search.campname}">
                                    </div>
                                </div>
							</form:form>
						</div>
						<div class="w-100 text-right">
							<button type="submit" class="btn btn-primary" data-style="zoom-in" >검 색</button><br><br>
						</div>							
																	
						<div class="overflow-x w-100">
						<table class="table table-bordered table-hover">
							<colgroup>
								<col style="width: 70px"/>
                                <col style="width: 70px"/>
                                <col style="width: 50px"/>
                                <col style="width: 70px"/>
                                </colgroup>
							<thead>
								<tr>
									<th>캠페인명</th>
									<th></th>
									<th>사용매체</th>
									<th>용도</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="contentsList" items="${contents}">
									<tr  style="cursor: pointer;" onClick="javascript:parentContents(this);" value="${contentsList.NO }">
										<td id="title">${contentsList.TITLE}</td> 
										<td id="content">${contentsList.CONTENT}</td>
										<td>${contentsList.FORMTYPE_}</td>
										<td>${contentsList.PURP}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="m-auto">
						<ul class="pagination">
							<c:choose>
								<c:when test="${page.startPageNum ne 1 }">
									<li class="footable-page-arrow disabled">
										<a onclick="javascript:paging(${page.startPageNum-1 })">&laquo;</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="javascript:">&laquo;</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="i" begin="${page.startPageNum }"
								end="${page.endPageNum }">
								<c:choose>
									<c:when test="${i eq page.pageNum }">
										<li class="footable-page active">										
											<a onclick="javascript:paging(${i })">${i }</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a onclick="javascript:paging(${i })">${i }</a>
										</li>

									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${page.endPageNum lt page.totalPageCount }">
									<li>
										<a onclick="javascript:paging(${page.endPageNum+1 })">&raquo;</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="javascript:">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<h4 class="float-right">&middot; 총 자료수 : ${totalRows }건</h4>
					
					</div>
				</div>
				
			</div>
			</div>
		</div>

	</div>

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_cp.js"></script> <!-- radioBox-->
	
</body>
</html>