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
					<h2>내 정보</h2> 
					
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
								<!-- title-row -->
								<div class="ibox-title row">
									<h5>기본정보</h5>									
								</div>
								<!-- conten-row -->
								<div class="ibox-content row">
									
									<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
										<form:form action="/myinfo/${user.USERNO}" method="PUT">
																				
										<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
											<a href="/myinfo/post/${user.USERNO}" class="btn btn-primary">수 정</a>																			
										</div>
										</form:form>										
									</div>	
								<!--  -->
									<div class="box1 col-lg-4 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>		
											<tbody>
												<tr>
													<!-- 이름변경X -->
													<th>이름</th>
													<td>
														${user.USERNAME}
														
													</td>
												</tr>
												
												<tr>
													<th>직장명</th>
													<td>
														${user.SITENAME}
													</td>
												</tr>
												
												<tr>
													<th>아이디</th>
													<td>
														${user.USERID}
													</td>
												</tr>											
											</tbody>								
										</table>
									</div>
									<div class="box1 col-lg-4 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>		
											<tbody>
												<tr>
													
													<th>휴대전화</th>
													<td>												
														${user.MOBILE1}-${user.MOBILE2}-${user.MOBILE3} 
															
													</td>
												</tr>												
												<tr>
													<th>직책</th>
													<td>
														${user.USERDUTY}
													</td>
												</tr>
												<tr>
													
													<th>입사일자</th>
													<td>													
														${user.ENTERDATE}
													</td>
												</tr>		
																					
											</tbody>								
										</table>
									</div>
									<div class="box1 col-lg-4 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>		
											<tbody>
												<tr>													
													<th>직장전화</th>
													<td>
														<c:if test="${user.TELNO1 ne null}">													
														${user.TELNO}
														</c:if>
													</td>
												</tr>
																								
												<tr>
													<th>이메일</th>
													<td>
														${user.EMAIL}
													</td>
												</tr>													
												<tr>												
													<th>CTI</th>
													<td>													
														
													</td>
												</tr>												
											</tbody>								
										</table>
									</div>
																																			
									<div class="box1 col-lg-12 p-0">
                               			 <table class="table table-bordered mb-0">
                                  			  <colgroup>
                                       			 <col style="width: 100px; background: #fafafa;">
                                      			  <col style="width: auto;">
                                   			 </colgroup>
                                    		<tbody>
                                       			 <tr>
                                            		<th><label for="userdesc">사용자메모</label></th>
                                           		 	<td>
                                                		<textarea type="text" rows="8" class="form-control col-12 float-left mr-12" disabled name="userdesc" id="userdesc" value="${user.USERDESC}">${user.USERDESC}</textarea>                            
                                            		</td>
                                       			 </tr>
                                   			 </tbody>
                               			 </table>
                            		</div>							
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
	
	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script src="/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	
	<script>
	 $(document).ready(function () {
         // datePicker
         $('.input-group.date').datepicker({
             todayBtn: "linked",
             keyboardNavigation: false,
             forceParse: false,
             calendarWeeks: true,
             autoclose: true
         });
            
         
                     
     });
	
	</script>
	
	
</body>
</html>