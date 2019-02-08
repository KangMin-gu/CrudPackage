<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
								<a href="/note/send?noteid=${note.NOTICEID}" class="btn btn-white btn-sm"
									data-toggle="tooltip" data-placement="top" title="Reply"><i
									class="fa fa-reply"></i> 답장</a> 
									
									<!-- trash가 들어오면 true가 됨  -->
									<c:if test="${!fn:contains(referUrl,'trash')}">
									<a href="/note/intrash/${note.NOTICEID}"
									class="btn btn-white btn-sm" data-toggle="tooltip"
									data-placement="top" title="Move to trash"><i
									class="fa fa-trash-o"></i> </a>
									</c:if>
							</div>
							<h2>${note.TITLE }</h2>
							<div class="mail-tools tooltip-demo m-t-md">
								<h5>
									<span class="float-right font-normal">${note.REGDATE }</span> 					
									<span class="font-normal">보낸이:&nbsp; </span>${note.FROMUSERNAME }<br/>									
									<span class="font-normal">받는이:&nbsp;
									<c:forEach var="to" items="${toList }" varStatus="comma">																						
											 ${to.USERNAME }			 					 					
										<c:if test="${!comma.last }">,</c:if>																																	
									</c:forEach>								
									</span><br/>
									
									<span class="font-normal">참조:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<c:forEach var="cc" items="${ccList }" varStatus="commaTwo">								
										${cc.USERNAME }										  										
										<c:if test="${!commaTwo.last }">,</c:if>	
									</c:forEach>
									 </span><br/>
								</h5>
							</div>
						</div>
						<div class="mail-box">
							<div class="mail-body">
								${note.CONTENT }
							</div>
							<div class="mail-attachment">	
								
								<c:forEach var="file" items="${noteFile }">		
									<c:if test="${file.ORGFILENAME ne null}">																	
										<p>	<span><i class="fa fa-paperclip"></i> 첨부파일</span></p>
									</c:if>
								</c:forEach>
								
								<div class="attachment">
								
								<c:forEach var="file" items="${noteFile}">
									<div class="file-box">
										<div class="file">
											<a href="${pageContext.request.contextPath}/note/download/${file.FILEID}"> <span class="corner"></span>
												<div class="icon">
													<i class="fa fa-file"></i>
												</div>
												<div class="file-name">
													${file.ORGFILENAME } <br /> <small>${file.REGDATE }</small>
												</div>
												<div>
													<input type="hidden" value="${file.FILESEARCHKEY}"/>
												</div>												
											</a>
										</div>
									</div>	
								</c:forEach>
																		
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="mail-body text-right tooltip-demo">
								<a class="btn btn-sm btn-white" href="/note/send?noteid=${note.NOTICEID}"><i class="fa fa-reply"></i> 답장</a> 
									<a class="btn btn-sm btn-white"
									href="/note/send?noteid=${note.NOTICEID}"><i class="fa fa-arrow-right"></i>전달</a>									
										<!-- 휴지통에서는 완전삭제 -->
									<c:choose>							
										<c:when test="${fn:contains(referUrl,'trash')}">
											<a class="btn btn-sm btn-white"
											href="/note/indelete/${note.NOTICEID}"><i class="fa fa-trash-o"></i>
											완전삭제</a>
										</c:when>										
										<c:otherwise>
											<a class="btn btn-sm btn-white"
											href="/note/intrash/${note.NOTICEID}"><i class="fa fa-trash-o"></i>
											삭제</a>
										</c:otherwise>
									</c:choose>								
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
	
	<!-- url 값이 popnote면 창이 닫침  -->
	<script>
$(document).ready(function() {
			var url = $('#referUrl').val();
			if(url.indexOf("pop") != -1){
				self.close();
				alert("전송되었습니다.")
			}	
	});
	</script>
</body>
</html>