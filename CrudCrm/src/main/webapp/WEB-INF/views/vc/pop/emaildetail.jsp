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



		<div class="mail-tools tooltip-demo m-t-md">
			<h5>
				<span class="float-right font-normal">${note.REGDATE }</span> 
				<span
					class="font-normal">보낸이:&nbsp; </span>${note.FROMUSERNAME }<br /> 
					<span class="font-normal">받는이:&nbsp;> </span><br /> 
				<span class="font-normal">참조:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
				</span><br />
			</h5>
		</div>

		<div class="mail-box">
			<div class="mail-body">${note.CONTENT }</div>
			<div class="mail-attachment">

				<c:forEach var="file" items="${noteFile }">
					<c:if test="${file.ORGFILENAME ne null}">
						<p>
							<span><i class="fa fa-paperclip"></i> 첨부파일</span>
						</p>
					</c:if>
				</c:forEach>

				<div class="attachment">

					<c:forEach var="file" items="${noteFile}">
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
			


	</div>
		</div>

		<!-- js includ -->
		<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
</body>
</html>