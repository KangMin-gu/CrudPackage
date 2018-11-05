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
<link
	href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css"
	rel="stylesheet">
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
							<div class="float-right tooltip-demo">
								<a href="mail_compose.html" class="btn btn-white btn-sm"
									data-toggle="tooltip" data-placement="top" title="Reply"><i
									class="fa fa-reply"></i> Reply</a> <a href="#"
									class="btn btn-white btn-sm" data-toggle="tooltip"
									data-placement="top" title="Print email"><i
									class="fa fa-print"></i> </a> <a href="mailbox.html"
									class="btn btn-white btn-sm" data-toggle="tooltip"
									data-placement="top" title="Move to trash"><i
									class="fa fa-trash-o"></i> </a>
							</div>
							<h2>${note.TITLE }</h2>
							<div class="mail-tools tooltip-demo m-t-md">


								<h5>
									<span class="float-right font-normal">${note.REGDATE }</span> 					
									<span class="font-normal">보낸이: </span>${note.FROMUSER } "<${note.EMAIL }>"
								</h5>
							</div>
						</div>
						<div class="mail-box">
							<div class="mail-body">
								${note.CONTENTS }
							</div>
							<div class="mail-attachment">
								<p>
									<span><i class="fa fa-paperclip"></i> 첨부파일 - </span> <a href="#">다운로드</a> 
								</p>

								<div class="attachment">
									<div class="file-box">
										<div class="file">
											<a href="#"> <span class="corner"></span>

												<div class="icon">
													<i class="fa fa-file"></i>
												</div>
												<div class="file-name">
													Document_2014.doc <br /> <small>Added: Jan 11, 2014</small>
												</div>
											</a>
										</div>
									</div>					
									<div class="file-box">
										<div class="file">
											<a href="#"> <span class="corner"></span>
												<div class="image">
													<img alt="image" class="img-fluid" src="img/p2.jpg">
												</div>
												<div class="file-name">
													My feel.png <br /> <small>Added: Jan 7, 2014</small>
												</div>
											</a>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="mail-body text-right tooltip-demo">
								<a class="btn btn-sm btn-white" href="mail_compose.html"><i
									class="fa fa-reply"></i> Reply</a> <a class="btn btn-sm btn-white"
									href="mail_compose.html"><i class="fa fa-arrow-right"></i>
									Forward</a>
								<button title="" data-placement="top" data-toggle="tooltip"
									type="button" data-original-title="Print"
									class="btn btn-sm btn-white">
									<i class="fa fa-print"></i> Print
								</button>
								<button title="" data-placement="top" data-toggle="tooltip"
									data-original-title="Trash" class="btn btn-sm btn-white">
									<i class="fa fa-trash-o"></i> Remove
								</button>
							</div>
							<div class="clearfix"></div>
						</div>
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
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script>
	
</body>
</html>