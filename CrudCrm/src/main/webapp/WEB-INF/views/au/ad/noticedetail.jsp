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
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/cust">목록</a></li>
						<li class="breadcrumb-item active"><strong>상세 정보</strong></li>
					</ol> 					
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
								<div class="ibox-title row">
									<h4>공지 정보</h4>
								</div>				
								<div class="ibox-content row">													
									<div class="col-md-8 offset-md-2">
										<h3>${noticeInfo.SUBJECT}</h3>
									</div>																							                        		                            	           
								</div>
								<div class="row">
									<div class="col-md-8 offset-md-2">
										${noticeInfo.HEADER} | ${noticeInfo.USERNAME} | ${noticeInfo.REGDATE}
									</div>	
								</div>
								<div class="hr-line-dashed"></div>
								<div class="row">
									<div class="col-md-8 offset-md-2">
										${noticeInfo.CONTENT}
									</div>	
								</div>
								<div class="hr-line-dashed"></div>
								<div class="row">
									<div class="col-md-8 offset-md-2">																	
										<form:form action="${pageContext.request.contextPath}/notice/trash/${noticeInfo.ICNUM}" method="PUT">										
											<a href="${pageContext.request.contextPath}/notice" class="btn btn-primary">목록</a>									 			
											<c:if test="${CHKAUTH eq 20 || CHKAUTH eq 30 }">											
												<a href="${pageContext.request.contextPath}/notice/post/${noticeInfo.ICNUM }" class="btn btn-primary float-right" style="margin-left: 3px;">수정</a>
												<button class="btn btn-primary float-right">삭제</button>																																										
											</c:if>																							
										</form:form>												
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
		
	</script>
	
	
</body>
</html>