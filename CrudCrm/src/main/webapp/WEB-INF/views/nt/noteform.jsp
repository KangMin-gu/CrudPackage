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
<link href="${pageContext.request.contextPath}/resources/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
</head>

<body>
	<div id="wrapper">
<!-- leftside -->	
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
<!-- Top -->    
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>           				
<!-- Content -->		
			<div class="wrapper wrapper-content">
        	<div class="row">
	            <div class="col-lg-2">
	                <%@ include file="/WEB-INF/views/template/menu/noteleftside.jsp"%>
	            </div>
            <div class="col-lg-10 animated fadeInRight">
	            <div class="mail-box-header">
	                <h2>
	                    ${CALLNAME }
	                </h2>
	            </div>
	            <form:form action="" method="post">
	                <div class="mail-box">
		                <div class="mail-body">		                    
		                        <div class="form-group row">
		                        	<label class="col-sm-2 col-form-label">받는이:</label>
		                            <div class="col-sm-10">
		                            	<input type="text" class="form-control">
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                        	<label class="col-sm-2 col-form-label">참조:</label>
		                            <div class="col-sm-10">
		                            	<input type="text" class="form-control">
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                        	<label class="col-sm-2 col-form-label">제목:</label>
		                            <div class="col-sm-10">
		                            	<input type="text" class="form-control" value="">
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                        	<label class="col-sm-2 col-form-label">첨부파일:</label>
		                            <div class="col-sm-10">
		                            	<input type="text" class="form-control" value="">
		                            </div>
		                        </div>	                 
		                </div>
		                <div class="mail-text h-200">
			                <div class="summernote" style="height:100px;"></div>
							<div class="clearfix"></div>
		                </div>                
		                <div class="mail-body text-right tooltip-demo">
		                        <a href="mailbox.html" class="btn btn-sm btn-primary" data-toggle="tooltip"><i class="fa fa-reply"></i> 발송</a>
		                        <a href="mailbox.html" class="btn btn-white btn-sm" data-toggle="tooltip"><i class="fa fa-times"></i> 취소</a>	                        
		                </div>
		                <div class="clearfix"></div>		                
		               </div>
	              </form:form>   
            	</div>
        	</div>
        </div>
<!-- Content End -->
	
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
<script src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script>
<script>
	$(document).ready(function() {
		$('.summernote').summernote();	
		$('.note-editable').css('height','300px');
	});
</script>
</body>
</html>