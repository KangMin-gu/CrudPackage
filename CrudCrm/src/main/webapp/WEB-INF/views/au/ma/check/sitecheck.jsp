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
<link href="${pageContext.request.contextPath}/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">
<!--radioBox-->
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<!--datePicker-->
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<!-- Text spinners style -->
<link href="${pageContext.request.contextPath}/resources/css/plugins/textSpinners/spinners.css" rel="stylesheet">
<script>


</script>
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
                    <h2>접속중인 사용자</h2>
                </div>
            </div>
          
         			<!-- Content -->
			<!-- S: 고객 목록 ppt p01-->
			<div class="wrapper wrapper-content  animated fadeInRight article">
				<div class="row justify-content-md-center">
					<div class="col-lg-12">
						<div class="ibox-content">
							<div class="ibox-content row border-top-0 pt-lg-0 tooltip-demo">																
								<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">                                                             							
								<div class="table-responsive">
									<table class="table table-bordered table-hover" style="border-top: 1px solid #EBEBEB;">
															
										<colgroup>
											<col width="100px;">
											<col width="100px;">
											<col width="120px;">
											<col width="180px;">
											<col width="180px;">
											<col width="180px;">
											<col width="100px;">									
										</colgroup>
																				
										<thead>
											<tr>
												<th>사용자 계정</th>
												<th>사용자명</th>
												<th>직장</th>											
												<th>이메일</th>
												<th>전화번호</th>												
												<th>휴대폰</th>																					
												<th>강제종료</th>
											</tr>
										</thead>
										
										<tbody>
										<c:forEach var="tmp" items="${sessionList }"  > 
											<tr>
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${tmp.USERID }</td>
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${tmp.USERNAME }</a></td>												
												<td>${tmp.SITENAME }</td>
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${tmp.EMAIL }</td>					
												<td>${tmp.TELNO }</td>
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">
													<c:choose>
														<c:when test="${fn:trim(tmp.MOBILE) eq '--'}"></c:when>
														<c:otherwise>${tmp.MOBILE }</c:otherwise>
													</c:choose>
												</td>					
												<td><a class="btn btn-xs btn-primary" href="${pageContext.request.contextPath}/ma/sitecehck/${tmp.USERID }">강제종료</a></td>
											</tr> 
											</c:forEach>
											<!-- foreach끝 -->											
										</tbody>
										<tfoot>
									</table>
								</div>
								<h4 class="float-right">&middot; 총 이용자수 : ${count }명</h4>		
							</div>
						</div>
					</div>
				</div>
			</div>   
 		</div> 
			<!-- E: 고객 목록 ppt p01-->
			<!-- Content End -->
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
	
	<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery-ui/jquery-ui.min.js"></script> 		
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script><!-- radioBox-->	
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>	<!-- datePicker-->	
	<script src="${pageContext.request.contextPath}/resources/crud/crud_file.js"></script><!-- file download -->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_cu.js"></script><!-- cust js -->

	<script>
	</script>
</body>
</html>