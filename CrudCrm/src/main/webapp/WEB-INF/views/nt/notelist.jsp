<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>CRUD SYSTEM</title>
<!-- link includ -->
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
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
							
							<form:form method="post" action="${pageContext.request.contextPath}/note/inbox" class="float-right mail-search">							
								<div class="input-group">
									<select id="condition" name="condition" class="form-control mr-4">
	                                    <option value="titleContent">제목+내용</option>	                                    
	                                    <option value="title">제목</option>
	                                    <option value="sender">보낸이</option>
	                                    <option value="sendDate">수신일</option>  
                                    </select>
									
									<input id="keyword" name="keyword" type="text" class="form-control form-control-sm" id="keyword" name="keyword" value="${keyword }" placeholder="검색어">
									<div class="input-group-btn">
										<button type="submit" class="btn btn-sm btn-primary">검색</button>
									</div>
								</div>
							</form:form> 
							<h2>${NOTENAME } (${notReadVal })</h2>
							<div class="mail-tools tooltip-demo m-t-md">
								<div class="btn-group float-right">
									<!--   <button class="btn btn-white btn-sm"><i class="fa fa-arrow-left"></i></button>
                        			<button class="btn btn-white btn-sm"><i class="fa fa-arrow-right"></i></button> -->
									<ul class="pagination">
										<c:choose>
											<c:when test="${page.startPageNum ne 1 }">
												<li><a
													href="${pageContext.request.contextPath}/note/inbox?pageNum=${page.startPageNum-1 }&">&laquo;</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&laquo;</a>
												</li>
											</c:otherwise>
										</c:choose>
										<c:forEach var="i" begin="${page.startPageNum }"
											end="${page.endPageNum }">
											<c:choose>
												<c:when test="${i eq page.pageNum }">
													<li class="active"><a
														href="${pageContext.request.contextPath}/note/inbox?pageNum=${i }">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li><a
														href="${pageContext.request.contextPath}/note/inbox?pageNum=${i }">${i }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${page.endPageNum lt page.totalPageCount }">
												<li><a
													href="${pageContext.request.contextPath}/note/inbox?pageNum=${page.endPageNum+1 }">&raquo;</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&raquo;</a>
												</li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>

								<button class="btn btn-white btn-sm" data-toggle="tooltip"
									data-placement="left" title="새로고침">
									<i class="fa fa-refresh"></i>
								</button>
								<button class="btn btn-white btn-sm" data-toggle="tooltip"
									data-placement="top" title="읽은 통지">
									<i class="fa fa-eye"></i>
								</button>
								<button class="btn btn-white btn-sm" data-toggle="tooltip"
									data-placement="top" title="중요 통지">
									<i class="fa fa-exclamation"></i>
								</button>
								<button class="btn btn-white btn-sm" data-toggle="tooltip"
									data-placement="top" title="휴지통으로 이동">
									<i class="fa fa-trash-o"></i>
								</button>

							</div>
						</div>
						<div class="mail-box">
							<jsp:useBean id="toDay" class="java.util.Date" />
							<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" var="nowDate"/>
							<table class="table table-hover table-mail">
								<tbody>
									<c:forEach var="tmp" items="${noteList }">
										<tr<c:choose>
	                 						<c:when test="${tmp.READCHEK eq 0 }">class="unread"</c:when>
	                 						<c:otherwise>class="read"</c:otherwise>
	                 					</c:choose>>
											<td class="check-mail"><input type="checkbox" class="i-checks" value="${tmp.NOTICEID }"></td>
											<td class="mail-ontact">${tmp.SENDER }<c:if test="${tmp.IMPORTANT  eq  1 }"><span class="label label-danger float-right">!</span></c:if></td>
											<td class="mail-subject"><a href="${pageContext.request.contextPath}/note/${tmp.NOTICEID}">${tmp.TITLE }</a></td>
											<td class="text-right mail-date">
												<c:choose>
													<c:when test="${nowDate >  tmp.SENDDATE}">${tmp.SENDDATE }</c:when>
			                 						<c:otherwise>${tmp.SENDDATETIME }</c:otherwise>
												</c:choose>																	
											</td>
											<td class="text-right"><c:if test="${tmp.FILEPATH ne null }"><i class="fa fa-paperclip"></i></c:if></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
<script>
        $(document).ready(function(){
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });        
</script>
</body>
</html>