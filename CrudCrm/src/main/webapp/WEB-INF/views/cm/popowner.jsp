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
		<div class="row wrapper border-bottom white-bg page-heading" style="padding-bottom: 12px;">
			<div class="col-lg-10">
				<h2>사용자검색</h2>
			</div>
		</div>

		<!-- S: 고객 목록 ppt p01-->
		<div class="wrapper wrapper-content  animated fadeInRight article">

			<div class="col-lg-12">
				<div class="ibox">
					<div class="ibox-content row">
						<div class="col-sm-12 col-xs-12 p-0 float-left">
						<form:form action="/popowner" method="GET">
							<input type="hidden" id="parentid" name="parentid" value="${searchVal.parentid}">
							<div class="form-group  row"><label class="col-sm-2 col-form-label" style="padding-top: 0px;" >담당자명</label>
                                <div class="col-sm-7">
                                    <input type="text" name="username" id="username" class="form-control" value="${searchVal.username}">
                                </div>                                
								<div class="col-sm-3 w-100" style="padding-left: 0px;">
									<button type="submit" class="btn btn-primary" data-style="zoom-in" style="height: 22px;padding-top: 0px;padding-bottom: 0px;" >검색</button>
								</div>							
							</div>		
						</form:form>	
						</div>
						
						<div class="overflow-x w-100">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>사용자명</th>
									<th>아이디</th>
									<th>직급</th>
									<th>권한</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${userList}">
									<tr style="cursor: pointer;" onClick="javascript:parentOwnerUser(this);" value="${list.USERNO }"> 
										<td id="username">${list.USERNAME}</td>
										<td>${list.USERID}</td>
										<td>${list.USERDUTY}</td>
										<td>
											 <c:choose>
												<c:when test="${list.CHKAUTH==10}">사용자</c:when>
												<c:when test="${list.CHKAUTH==20}">회원사관리자</c:when>
												<c:when test="${list.CHKAUTH==30}">총관리자</c:when>
											</c:choose>							
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<div class="col-sm-4 float-left"></div>
					<div class="col-sm-4 float-center">																	
					
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

							<c:forEach var="i" begin="${page.startPageNum }" end="${page.endPageNum }">
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
					</div>
					<div class="col-sm-3 float-right">		
						<h4 class="float-right">&middot; ${page.totalRows }건</h4>																
					</div>
									
				</div>
				
			</div>
			</div>
		</div>

	</div>

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	
</body>
</html>