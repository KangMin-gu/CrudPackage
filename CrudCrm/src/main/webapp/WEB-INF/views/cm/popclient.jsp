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
				<h2>직장 검색</h2>

			</div>

		</div>

		<!-- S: 고객 목록 ppt p01-->
		<div class="wrapper wrapper-content  animated fadeInRight article">

			<div class="col-lg-12">
				<div class="ibox">
					<div class="ibox-content row">
						<div class="box1 col-sm-6 col-xs-6 p-0">
							<form:form action="/popclient" method="GET">
								<div class="input-group">
									<input type="text" name="cliname" id="cliname"
										class="form-control" value="${searchVal.cliname}"> <span
										class="input-group-append">
										<Button type="submit" class="btn btn-primary">검색</Button>
									</span>
								</div>
							
						</div>
					</div>
				</div>
				<div class="ibox-content row border-top-0 ">

					<div class="overflow-x w-100">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>거래처명</th>
									<th>호칭명</th>
									<th>담당자</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${clientList}">

									<tr style="cursor: pointer;" onClick="toParentClient('${list.CLINO }','${list.CLINAME}');">
										<td>${list.CLINAME}</td>
										<td>${list.CALLNAME}</td>
										<td>${list.USERNAME}</td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					</form:form>
					
					<div class="m-auto">
						<ul class="pagination">
							<c:choose>
								<c:when test="${page.startPageNum ne 1 }">
									<li class="footable-page-arrow disabled"><a href="#"
										onclick="paging(${page.startPageNum-1 });">&laquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="javascript:">&laquo;</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="i" begin="${page.startPageNum }"
								end="${page.endPageNum }">
								<c:choose>
									<c:when test="${i eq page.pageNum }">
										<li class="footable-page active"><a href="#"
											onclick="paging(${i });">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#" onclick="paging(${i });">${i }</a></li>

									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${page.endPageNum lt page.totalPageCount }">
									<li><a href="#" onclick="paging(${page.endPageNum+1 });">&raquo;</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="javascript:">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<h4 class="float-right">&middot; 총 자료수 : ${page.totalRows }건</h4>
				</div>
			</div>
	
		</div>

	</div>

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	
	<script>
	
		
	function toParentClient(prm1,prm2){
		opener.document.getElementById('CLINO').value= prm1;
		opener.document.getElementById('CLINAME').value= prm2;
		window.close();
	}
				
			
	</script>
</body>
</html>