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
		<div class="row wrapper border-bottom white-bg page-heading" style="padding-bottom: 12px;">
			<div class="col-lg-10">
				<h2>영업 검색</h2>
				
			</div>

		</div>

		<!-- S: 고객 목록 ppt p01-->
		<div class="wrapper wrapper-content  animated fadeInRight article">

				<div class="ibox-content row border-top-0 ">
								
					<div class="col-sm-12 col-xs-12 p-0 float-left">
						<form:form action="/popsales" method="GET">
						<div class="form-group  row"><label class="col-sm-2 col-form-label" style="padding-top: 0px;" >영업명</label>
                            <div class="col-sm-7">
                                <input type="text" name="salename" id="salename" class="form-control" value="${searchVal.salename}"> 
                            </div>                                
							<div class="col-sm-3 w-100" style="padding-left: 0px;">
								<button type="submit" class="btn btn-primary" data-style="zoom-in" style="height: 22px;padding-top: 0px;padding-bottom: 0px;" >검색</button>
							</div>			
						</div>		
					</div>			

					<div class="overflow-x w-100">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>영업명</th>
									<th>거래처명</th>
									<th>담당자</th>
									
								</tr>
							</thead>
							<tbody>
								<input type="hidden" id="parentid" name="parentid" value="${searchVal.parentid}">
								<c:forEach var="list" items="${salesList}">
									<tr style="cursor: pointer;" onclick="javascript:parentSalename(this);" value="${list.SALESNO }">
										<td id="salename">${list.SALENAME}</td>
										<td>${list.CLINAME}</td>
										<td>${list.USERNAME}</td>										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					</form:form>
									
		
					<div class="col-sm-4 float-left"></div>
					<div class="col-sm-4 float-center">					
		
						<div class="m-auto">
							<ul class="pagination popPaging">
								<c:choose>
									<c:when test="${page.startPageNum ne 1 }">
										<li class="footable-page-arrow disabled">
											<a onclick="javascript:paging(${page.endPageNum+-1 })">&laquo;</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="disabled"><a href="javascript:">&laquo;</a></li>
									</c:otherwise>
								</c:choose>

								<c:forEach var="i" begin="${page.startPageNum }" end="${page.endPageNum }">
									<c:choose>
										<c:when test="${i eq page.pageNum }">
											<li class="footable-page active">
												<a onclick="javascript:paging(${i})">${i }</a>
											</li>
										</c:when>
										<c:otherwise>
											<li>									
												<a onclick="javascript:paging(${i})">${i }</a>
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
					</div>
					<div class="col-sm-4 float-right">		
						<h4 class="float-right">&middot; ${page.totalRows }건</h4>																
					</div>
					
				</div>
	
			</div>



	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	


</body>
</html>