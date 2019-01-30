<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

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
				<h2>고객 검색</h2>
			</div>
		</div>

		<div class="wrapper wrapper-content  animated fadeInRight article">

			<div class="col-lg-12">
				
				<div class="ibox-content row border-top-0 ">						
					<div class="col-sm-12 col-xs-12 p-0 float-left">
						<form:form action="/vc/pop/cust" method="GET">
						<input type="hidden" id="parentid" name="parentid" value="${searchVal.parentid}">
						<div class="form-group  row">
							<label class="col-sm-2 col-form-label" style="padding-top: 0px;" >
							<select class="form-control" name="condition" id="condition">
								<option value="phone" ${searchVal.condition eq "phone" ? "selected" :""}>전화</option>
								<option value="mobile" ${searchVal.condition eq "mobile" ? "selected" :""}>휴대전화</option>
								<option value="homtel" ${searchVal.condition eq "homtel" ? "selected" :""}>집전화</option>
								<option value="wrktel" ${searchVal.condition eq "wrktel" ? "selected" :""}>직장전화</option>
								<option value="custname" ${searchVal.condition eq "custname" ? "selected" :""}>고객명</option>
							</select>
							</label>
                            <div class="col-sm-7">
                                <input type="text" name="keyword" id="keyword" class="form-control" value="${searchVal.keyword}"> 
                            </div>                                
							<div class="col-sm-3 w-100" style="padding-left: 0px;">
								<button class="btn btn-primary"  style="height: 22px;padding-top: 0px;padding-bottom: 0px;" >검색</button>
							</div>			
						</div>		
						</form:form>
					</div>
					<div class="col-mg-12 p-0 text-right" style="margin-bottom: 10px;">
						<button class="btn btn-primary btn-sm" type="button" id="custRegBtn">신규 등록</button>
						<input type="hidden" id="parentid" name="parentid" value="" />		
					</div>
					<div class="overflow-x w-100">
						<table class="table table-bordered table-hover">
							<colgroup>
								<col width="100px;">
								<col width="120px;">
								<col width="120px;">
								<col width="120px;">
								<col width="300px;">
							</colgroup>
							<thead>
								<tr>
									<th>고객명</th>
									<th>휴대전화</th>
									<th>집전화</th>
									<th>직장전화</th>
									<th>주소</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${custList }">
									<tr style="cursor: pointer;" onClick="javascript:vocCustSelected(this);" value="${list.CUSTNO }"> 
										<td id="custname" style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${list.CUSTNAME}</td>
										<td>${list.MOBILE}</td>
										<td>${list.HOMTEL }</td>
										<td>${list.WRKTEL }</td>
										<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${list.HOMADDR_}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>		
					
					<div class="m-auto">
						<c:choose>
						<c:when test="${page.totalRows ne 0 }"> 
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
						</c:when>
						</c:choose>
					</div>
					
					<h4 class="float-right">&middot; 총 자료수 : ${page.totalRows }건</h4>
				</div>
			</div>		
		</div>
	</div>

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_vc.js"></script>

</body>
</html>