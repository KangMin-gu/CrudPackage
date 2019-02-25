<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/gridstack/gridstack.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/gridstack/gridstack-extra.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboardset.css">
</head>

<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
		<!-- Top -->
		<div id="page-wrapper" class="gray-bg">
			<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>

			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>고객 관리</h2> 
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/cust">목록</a></li>
						<li class="breadcrumb-item active"><strong>상세 정보</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>
				
			<div class="wrapper wrapper-content animated fadeIn">
			<div class="row justify-content-md-center">
				<div class="col-lg-12" style="background: #ffffff;">		

					<div class="container-fluid">			 
				        <div class="row">
				            <div class="col-md-3">
				                <div class="sidebar">
				                    <div class="grid-stack-item"><div class="grid-stack-item-content">Drag me</div></div>
				                </div>
				            </div>
				            <div class="col-md-9">
				                <div class="trash">
				                </div>
				            </div>
				        </div>
			
			        <div class="row">
				            <div class="col-md-12">
				                <div class="grid-stack grid-stack-6" id="grid1">
				                
				                </div>
				            </div>
				            
				        </div>
			    	</div>
				</div>
			</div>
		</div>

			<div class="footer">
				<%@ include file="/WEB-INF/views/template/menu/foot.jsp"%>
			</div>
		</div>

		<div id="right-sidebar">
			<%@ include file="/WEB-INF/views/template/menu/rightside.jsp"%>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<%@ include file="/WEB-INF/views/template/inc/chartjsinc.jsp"%>
	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.0/lodash.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gridstack/gridstack.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gridstack/gridstack.jQueryUI.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gridstack/dashboardset.js"></script>
	<script>

	</script>
</body>
</html>