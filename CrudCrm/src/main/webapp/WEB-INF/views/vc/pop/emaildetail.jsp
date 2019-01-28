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
				<h2>메일 상세</h2>
			</div>
		</div>
	</div>
	<div class="mail-box">
	
		<div class="mail-body">

			<!-- 보내는이 -->
			<div class="form-group row">
				<label class="col-md-2 col-form-label" for="ccuser">보내는이</label>
				<div class="col-md-10" style="padding-left: 0px; padding-right: 0px;">
					<input class="form-control" type="text" value="${emailDetailMap.FROMEMAIL }" readonly>
				</div>
			</div>

			<!-- 받는이 -->
			<div class="form-group row">
				<label class="col-md-2 col-form-label" for="touser">받는이</label>
				<div class="col-md-10" style="padding-left: 0px; padding-right: 0px;">
					<input class="form-control" type="text" value="${emailDetailMap.TOEMAIL }" readonly>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-md-2 col-form-label" for="title">제목</label>
				<div class="col-md-10" style="padding-left: 0px;">
					<input class="form-control" type="text" value="${emailDetailMap.SUBJECT }" readonly>
				</div>
			</div>
		</div>
		<div class="mail-text h-200">
			<div class="mail-body">
			${emailDetailMap.CONTENT }
			</div>
			<div class="clearfix"></div>
		</div>

		<div class="mail-attachment">

			<c:forEach var="file" items="${emailDetailMap.replyFile }">
				<c:if test="${file.ORGFILENAME ne null}">
					<p>
						<span><i class="fa fa-paperclip"></i> 첨부파일</span>
					</p>
				</c:if>
			</c:forEach>

			<div class="attachment">

				<c:forEach var="file" items="${emailDetailMap.replyFile}">
					<div class="file-box">
						<div class="file">
							<a
								href="${pageContext.request.contextPath}/note/download/${file.FILEID}">
								<span class="corner"></span>
								<div class="icon">
									<i class="fa fa-file"></i>
								</div>
								<div class="file-name">
									${file.ORGFILENAME } <br /> <small>${file.REGDATE }</small>
								</div>
								<div>
									<input type="hidden" value="${file.FILESEARCHKEY}" />
								</div>
							</a>
						</div>
					</div>
				</c:forEach>

				<div class="clearfix"></div>
			</div>
		</div>


		<div class="clearfix"></div>
	</div>



	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script>		
	<script src="${pageContext.request.contextPath}/resources/js/plugins/chosen/chosen.jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script>
<script>
	$(document).ready(function() {
		
		$('.i-checks').iCheck({
        	checkboxClass: 'icheckbox_square-green',
       		radioClass: 'iradio_square-green',
    	});
	});
</script>
</body>
</html>