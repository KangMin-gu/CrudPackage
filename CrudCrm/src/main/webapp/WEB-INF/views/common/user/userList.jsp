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
</head>

<body>
<!-- Top -->    
	<div id="page-wrapper" class="gray-bg">	
<!-- Content -->		
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                
                    <div class="ibox">
                    <form:form action="${pageContext.request.contextPath}/common/user" method="POST">
                        <div class="ibox-content row">
                            <div class="box2 col-lg-4 p-0">
                                <table class="table table-bordered">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>담당자명</th>
                                            <td>
                                                <div class="input-group">
                                                    <input type="text" class="form-control reset" name="username" id="username" value="${search.userName }">
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="w-100 text-right">
                                <button class="btn btn-primary resets">초기화</button>
                                <button class="btn btn-primary">사용자검색</button>
                                
                            </div>
                        </div>
                        </form:form>
                        <div class="ibox-content row border-top-0 pt-lg-0">
                            <div class="overflow-x w-100">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>담당자명</th>
                                        <th>담당자ID</th>
                                        <th>부서</th>
                                        <th>전화번호</th>
                                        <th>Email</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${user }">
                                
                                    <tr onclick="javascript:parentOwnerUser(this)" value=${user.USERNO }>
                                    	<td id="username">${user.USERNAME }</td>
                                        <td id="userid">${user.USERID }</td>
                                        <td id="dept">${user.DEPT }</td>
                                        <td id="mobile">${user.MOBILE }</td>
                                        <td id="email">${user.EMAIL }</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                            </table>
                            </div>
                            <div class="m-auto">
                                <ul class="pagination">
                                    <c:choose>
											<c:when test="${page.startPageNum ne 1 }">
												<li><a onclick="javascript:paging(${page.startPageNum-1})">&laquo;</a>
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
														onclick="javascript:paging(${i})">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li><a onclick="javascript:paging(${i})">${i }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${page.endPageNum lt page.totalPageCount }">
												<li><a onclick="javascript:paging(${page.endPageNum+1 })"></a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&raquo;</a>
												</li>
											</c:otherwise>
										</c:choose>
                                </ul>
                            </div>
                           <h4 class="float-right">&middot; 총 자료수 : ${totalRows }</h4>
                        </div>
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

</body>
</html>