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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/gridstack/gridstack.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/gridstack/gridstack-extra.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboardset.css">
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>

</head>

<body>
	<div id="wrapper" >
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>

		<div class="container-fluid">
        <h1>메인 대쉬보드 설정</h1>

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
            <div class="col-md-6">
                <div class="grid-stack grid-stack-6" id="grid1">
                </div>
            </div>
            <div class="col-md-6">
                <div class="grid-stack grid-stack-6" id="grid2">
                </div>
            </div>
        </div>
    </div>

			


		</div>
  	</div>			
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.0/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.0/lodash.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gridstack/gridstack.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gridstack/gridstack.jQueryUI.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gridstack/dashboardset.js"></script>
</body>
</html>