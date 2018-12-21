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
						<form:form action="/myinfo/post/${user.USERNO}" method="POST">						
							<div class="ibox">
								<!-- title-row -->
								<div class="ibox-title row">
									<h5>정보수정</h5>
									
								</div>
								<!-- conten-row -->
								<div class="ibox-content row">
									<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
										<div class="col-xl-8 col-lg-12 float-left alert alert-info w-100" id="reqMsgDiv" style="height:2.00rem;padding-top: 6px;overflow:hidden;display:none" >
											<span id="reqDefaultMsg" title="필수 입력값을 확인해 주세요.">
												<strong>필수 입력값을 확인해 주세요. </strong>
											</span>
											<span id="reqSuccessMsg" style="display:none;"><Strong>필수값이 정상적으로 입력 되었습니다.</Strong></span>				
	                          			</div>
										<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
											<Strong><span id="showMsg"></span></Strong>				
	                          			</div>																												
									</div>
								
									
									<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
										<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
											<Button type="submit" class="btn btn-primary submit" id="submit" >저 장</Button>
											<a href="/myinfo" class="btn btn-primary">취소</a>																			
										</div>										
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
														<input type="text" class="form-control float-left mr-2" disabled id='username' name='username' value="${user.USERNAME}"/>														
													</td>
												</tr>
												
												<tr>
													<th>직장명</th>
													<td>
														<input type="text" class="form-control float-left mr-2" disabled value="${user.SITENAME }"/>
													</td>
												</tr>
												
												<tr>
													<th>아이디</th>
													<td>
														<input type="text" class="form-control float-left mr-2" disabled id='userid' name='userid' value="${user.USERID}"/>
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
													<select class="form-control col-4 float-left mr-3 validate phone1 required" style="height: 1.45rem" name="mobile1" id="mobile1">
															<option value="" ${user.MOBILE1 eq "" ? "selected" :""}>선택</option>
															<option value="010" ${user.MOBILE1 eq "010" ? "selected" :""}>010</option>
															<option value="011" ${user.MOBILE1 eq "011" ? "selected" :""}>011</option>
															<option value="017" ${user.MOBILE1 eq "017" ? "selected" :""}>017</option>
													</select>
													<input type="text" class="form-control col-3 float-left mr-2 validate phone2 required" name="mobile2" id="mobile2" value="${user.MOBILE2}">
													<input type="text" class="form-control col-3 float-left mr-2 validate phone3 required" name="mobile3" id="mobile3" value="${user.MOBILE3}">
													</td>
												</tr>												
												<tr>
													<th>직책</th>
													<td>
														<input type="text" class="form-control float-left mr-2" id='userduty' name='userduty' value="${user.USERDUTY}"/>
													</td>
												</tr>
												<tr>
													
													<th>입사일자</th>
													<td>													
														<input type="text" class="form-control float-left mr-2" id='enterdate' name='enterdate' value="${user.ENTERDATE}"/>
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
													<select class="form-control col-4 float-left mr-3 validate phone2 required" style="height: 1.45rem" name="telno1" id="telno1">
														<option value="" ${user.TELNO1 eq "" ? "selected" :""}>선택</option>
														<option value="02" ${user.TELNO1 eq "02" ? "selected" :""}>02</option>
														<option value="070" ${user.TELNO1 eq "070" ? "selected" :""}>070</option>
														<option value="010" ${user.TELNO1 eq "010" ? "selected" :""}>010</option>
													</select>
													<input type="text" class="form-control col-3 float-left mr-2 validate phone2 required" name="telno2" id="telno2"  value="${user.TELNO2}">
													<input type="text" class="form-control col-3 float-left mr-2 validate phone2 required" name="telno3" id="telno3"  value="${user.TELNO3}">
													</td>
												</tr>
												
												<tr>
													<th>이메일</th>
													<td>
														<input type="text" class="form-control float-left mr-2 validate email required" id='email' name='email' value="${user.EMAIL}"/>
													</td>
												</tr>
												<tr>
													
													<th>비밀번호 변경</th>
													<td>													
														<input type="password" class="form-control float-left mr-2 validate userpassword required" name="userpassword" id="userpassword" />
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
													<th>CTI</th>
													<td>
														<input type="text" class="form-control"/>
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
                                                		<textarea type="text" rows="8" class="form-control col-12 float-left mr-12" name="userdesc" id="userdesc" value="${user.USERDESC}">${user.USERDESC}</textarea>                            
                                            		</td>
                                       			 </tr>
                                   			 </tbody>
                               			 </table>
                            		</div>							
								</div>
								
							</div>
							</form:form>
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
	<!-- 유효성 -->
	<!-- <script src="${pageContext.request.contextPath}/resources/crud/crud_validate.js"></script> -->
	
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