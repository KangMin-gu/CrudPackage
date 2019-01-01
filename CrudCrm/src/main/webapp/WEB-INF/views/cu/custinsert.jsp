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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>CRUD SYSTEM</title>
<!-- link includ -->
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>

<!-- Toastr style -->
<link href="/resources/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">

<!-- S: 추가 CSS-->
<link href="/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<!--radioBox-->
<link href="/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<!--datePicker-->
<!-- E: 추가 CSS-->
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
					<h2>고객관리</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/cust">목록</a></li>
						<li class="breadcrumb-item active"><strong>추가</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<!-- Content -->
			<div class="wrapper wrapper-content animated fadeIn">
				<!-- S: 고객 등록 ppt p02~p05 -->
				<div class="wrapper wrapper-content  animated fadeInRight article">
					<div class="row justify-content-md-center">
						<div class="col-lg-12" style="background: #ffffff;">
							
							<form:form action="/cust/post" method="POST" id="command" commandName="custDto">
							<div class="ibox">
								<div class="ibox-title row">
									<h4>기본정보</h4>
								</div>
								<div class="ibox-content row">	
													
							
									<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
										<div class="col-xl-8 col-lg-12 float-left alert alert-info w-100" id="reqMsgDiv" style="height:2.00rem;padding-top: 6px;overflow:hidden;" >
											<span id="reqDefaultMsg" >
												<strong>필수 입력값을 확인해 주세요. </strong>
											</span>
											<span id="reqSuccessMsg" style="display:none;"><Strong>필수값이 정상적으로 입력 되었습니다.</Strong></span>				
	                          			</div>
										<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
											<Strong><span id="showMsg"></span></Strong>				
	                          			</div>													
										<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
											<Button type="submit" class="btn btn-primary submit"  >저 장</Button>
											<a href="/cust" class="btn btn-primary">목 록</a>
										</div>
									</div>
									
									
									<div class="box1 col-lg-12 col-xl-4 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr style="border-color:red">
													<th>고객명&nbsp;<b>&#42;</b></th>
													<td>
														<input type="text" class="form-control error validate required nameV" name="custname" id="custname" placeholder="필수 입력" >
													</td>
												</tr>
												<tr>
													<th>직책</th>
													<td><input type="text" class="form-control validate allV" style="height: 1.45rem" name="duty" id="duty"></td>
												</tr>
												<tr>
													<th>직장전화</th>
													<td>
														<select class="form-control col-3 float-left mr-3 validate phone1V phone-group" id="wrktel1" name="wrktel1">
															<option value="" >선택</option>
															<c:forEach var="code" items="${PHONE }">
                                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                                   			</c:forEach>
                                                		</select>	
														<input type="text" class="form-control col-3 float-left mr-2 validate phone2V phone-group" name="wrktel2" id="wrktel2" > 
														<input type="text" class="form-control col-3 float-left validate phone3V phone-group" name="wrktel3" id="wrktel3" >
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box2 col-lg-12 col-xl-4 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th>직장명</th>
													<!-- cli로 변경  -->
													<td >
														<div class="input-group cli" id="cliname">
															<input type="text" class="form-control" autocomplete="off" name="cliname"  readonly>
                                                    		<input type="hidden" name="clino" id="clino" value="0">
                                                    		<span class="input-group-addon">
                                                       			<a><i class="fa fa-search"></i></a>
                                                    		</span>
														</div>
													</td>
												</tr>
												<tr id="ttt">
													<th>휴대전화&nbsp;<b>&#42;</b></th>
													<td>
                                                		<select class="form-control col-3 float-left mr-3 validate phone1V phone-group error required" id="mobile1" name="mobile1" >
															<option value="" >선택</option>
															<c:forEach var="code" items="${MOBILE1 }">
                                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                                   			</c:forEach>
														</select>
                                                		
														<input type="text" class="form-control col-3 float-left mr-2 error validate phone2V phone-group required" name="mobile2" id="mobile2"  > 
														<input type="text" class="form-control col-3 float-left error validate phone3V phone-group required" name="mobile3" id="mobile3"  >														
														<span id="msgRegular"></span>
													</td>
												</tr>
												<tr>
													<th>직장팩스</th>
													<td>
														 <select class="form-control col-3 float-left mr-3 validate phone1V phone-group" style="height: 1.45rem" id="wrkfax1" name="wrkfax1" >
                                                   	 	 	<option value="" >선택</option>
															<c:forEach var="code" items="${FAX }">
                                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                                   			</c:forEach>
                                                		 </select>
													
														<input type="text" class="form-control col-3 float-left mr-2 validate phone2V phone-group" name="wrkfax2" id="wrkfax2" > 
														<input type="text" class="form-control col-3 float-left validate phone3V phone-group" name="wrkfax3" id="wrkfax3" >
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box3 col-lg-12 col-xl-4 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th>부서</th>
													<td><input type="text" class="form-control validate allV" name="deptname" id="deptname" ></td>
												</tr>
												<tr>
													<th>이메일</th>
													<td><input type="email" class="form-control validate emailV" style="height: 1.45rem" name="email" id="email" ></td>
												</tr>
												<tr>
													<th>홈페이지</th>
													<td><input type="text" class="form-control validate homepageV"  style="height: 1.45rem" name="wrkurl" id="wrkurl" placeholder="ex) www.crudsystem.co.kr "></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box4 col-lg-12 col-xl-8 p-0">
										<table class="table table-bordered border-top-0  mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th class="border-top-0">직장주소</th>
													<td class="border-top-0">
														<div class="input-group col-lg-3 pl-0 float-left">
															<input type="text" class="form-control daumzip" name="wrkaddr1" id="wrkaddr1" readonly > 
															<span class="input-group-addon"> <a href="#" ><i class="fa fa-search daumzip" id="wrkaddr1" ></i></a>
															</span>
														</div> 
														<input type="text" class="form-control col-lg-4 float-left mr-3 mt-sx-1" name="wrkaddr2" id="wrkaddr2" readonly>
														<input type="text" class="form-control float-left col-lg-4 mt-sx-1 validate allV" name="wrkaddr3" id="wrkaddr3">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box5 col-lg-12 col-xl-4 p-0">
										<table class="table table-bordered border-top-0 ">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th class="border-top-0">담당자</th>
													<td class="border-top-0">
														<div class="input-group owner" id="owner_" >
															<input type="text" class="form-control" autocomplete="off" name="owner_" value="${SESSIONUSERNAME}" readonly>
                                                    		<input type="hidden" name="owner" id="owner" value="${SESSIONUSERNO}">
                                                    		<span class="input-group-addon">
                                                       			<a><i class="fa fa-search"></i></a>
                                                    		</span>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>	
								</div>
							
								<div class="ibox mb-0">
									<div class="ibox-title row border-0">
										<h4>부가정보</h4>
										<div class="ibox-tools">
											<a class="collapse-link"> <i class="fa fa-chevron-up"></i> </a>
										</div>
									</div>
									<div class="ibox-content row">
										<div class="box1 col-lg-12 col-xl-4 p-0">
											<table class="table table-bordered mb-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th>자택전화</th>
														<td>
															<select class="form-control col-3 float-left mr-3 validate phone1V phone-group" style="height: 1.45rem" id="homtel1" name="homtel1">
																<option value="" >선택</option>
																<c:forEach var="code" items="${PHONE }">
                                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                                   				</c:forEach>
                                                			</select>	
															<input type="text" class="form-control col-3 float-left mr-2 validate phone2V phone-group" name="homtel2" id="homtel2" > 
															<input type="text" class="form-control col-3 float-left validate phone3V phone-group" name="homtel3" id="homtel3">
														</td>
													</tr>
													<tr>
														<th>결혼여부</th>
														<td>
															<select class="form-control" style="height: 1.45rem" id="married" name="married">
                                                				<option value="0" >선택</option>
																<c:forEach var="code" items="${MARRIED }">
                                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                                   				</c:forEach>
                                                			</select>	
														</td>
													</tr>
													<tr>
														<th>결혼기념일</th>
														<td>
															<div class="input-group date">
																<span class="input-group-addon"> <i
																	class="fa fa-calendar"></i>
																</span>
																<input type="text" class="form-control validate dateV"  name="weddingday" id="weddingday" autocomplete="off" data-mask="9999-99-99">
															</div>
														</td>
													</tr>
													<tr>
														<th>취미</th>
														<td><input type="text" class="form-control validate allV" style="height: 1.45rem" name="hobby" id="hobby"> </td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box2 col-lg-12 col-xl-4 p-0">
											<table class="table table-bordered mb-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th>성별</th>
														<td>
															<select class="form-control" style="height: 1.45rem" id="sex" name="sex">
                                                				<option value="0" >선택</option>
																<c:forEach var="code" items="${SEX }">
                                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                                   				</c:forEach>
                                                			</select>	
														</td>
													</tr>
													<tr>
														<th>발송처</th>
														<td>
															<select class="form-control" style="height: 1.45rem" id="mailto" name="mailto">
                                                				<option value="0" >선택</option>
																<c:forEach var="code" items="${MAILTO }">
                                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                                   				</c:forEach>
                                                			</select>	
														</td>
													</tr>
													<tr>
														<th>고객등급</th>
														<td>
															<select class="form-control" style="height: 1.52rem" id="custgrade" name="custgrade">
                                                				<option value="0" >선택</option>
																<c:forEach var="code" items="${CUSTGRADE }">
                                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                                   				</c:forEach>
                                                			</select>	
														</td>
													</tr>
													<tr>
														<th>회원구분</th>
														<td>
															<select class="form-control" style="height: 1.45rem" id="custgubun" name="custgubun">
                                                				<option value="0" >선택</option>
																<c:forEach var="code" items="${CUSTGUBUN }">
                                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                                   				</c:forEach>
                                                			</select>	
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box3 col-lg-12 col-xl-4 p-0">
											<table class="table table-bordered mb-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th>생일</th>
														<td>
															<div class="input-group date" style="height: 1.45rem;">
																<span class="input-group-addon"> <i class="fa fa-calendar"></i> </span> 
																<input type="text" class="form-control validate dateV beforeV" name="birth" id="birth" autocomplete="off" data-mask="9999-99-99">
															</div>
														</td>
													</tr>
													<tr>
														<th>양력/음력</th>
														<td>
															<select class="form-control" style="height: 1.45rem" id="solar" name="solar">
																<option value="0" >선택</option>
																<c:forEach var="code" items="${SOLAR }">
                                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                                   				</c:forEach>
                                                			</select>	
														</td>
													</tr>
													<tr>
														<th>직업</th>
														<td>
															<input type="text" class="form-control validate allV" style="height: 1.52rem;" name="job" id="job">
														</td>
													</tr>
													<tr>
														<th class="border-bottom-0">활동등급</th><!-- 컬럼생성필요 -->
														<td class="border-bottom-0">
															<select class="form-control" style="height: 1.45rem" id="actgrade" name="actgrade">
																<option value="0" >선택</option>
																<c:forEach var="code" items="${ACTGRADE }">
                                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                                   				</c:forEach>
                                                			</select>	
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box4 col-lg-12 col-xl-8 p-0">
											<table class="table table-bordered m-0 border-top-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th class="border-top-0">자택주소</th>
														<td class="border-top-0">
															<div class="input-group col-lg-3 pl-0 float-left">
																<input type="text" class="form-control daumzip" name="homaddr1" id="homaddr1" readonly> 
																<span class="input-group-addon"> 
																	<a href="#"><i class="fa fa-search daumzip" id="homaddr1"></i></a>
																</span>
															</div> 
															<input type="text" class="form-control col-lg-4 float-left mr-3 mt-sx-1" name="homaddr2" id="homaddr2" readonly>
															<input type="text" class="form-control float-left col-lg-4 mt-sx-1 validate allV" name="homaddr3" id="homaddr3">
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box4-2 col-lg-12 col-xl-4 p-0">
											<table class="table table-bordered m-0 border-top-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<th class="border-top-0">정보활용</th>
													<td class="border-top-0">
														<div class="i-checks" style="height: 1.40rem;">
															<label class="pr-lg-3 mb-0">
																<input type="radio" value="0" id="infoagree" name="infoagree"  class="pr-lg-1" checked ><i></i> 동의
															</label> 
															<label class="pr-lg-3 mb-0">
																<input type="radio" value="1" id="infoagree" name="infoagree" class="pr-lg-1"><i></i>거부
															</label>
														</div>
													</td>
												</tbody>
											</table>
										</div>										
										<div class="box5 col-lg-12 p-0">
											<table class="table table-bordered mb-0 border-top-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: 100px; background: #fefefe;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th rowspan="5" class="border-top-0">접촉 거부</th>
														<th class="border-top-0">EMAIL 거부</th>
														<td class="border-top-0">
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="emailChec1" type="checkbox" class="i-checks" name="denymailnews" id="denymailnews" value="1">
																<label for="emailChec1"> 뉴스레터</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="emailChec2" type="checkbox" class="i-checks" name="denymailseminar" id="denymailseminar" value="1">
																<label for="emailChec2"> 세미나</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="emailChec3" type="checkbox" class="i-checks" name="denymailad" id="denymailad"  value="1">
																<label for="emailChec3"> 광고</label>
															</div>
														</td>
													</tr>
													<tr>
														<th>SMS 거부</th>
														<td>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="smsCheck1" type="checkbox" class="i-checks" name="denysmsseminar" id="denysmsseminar"  value="1">
																<label for="smsCheck1"> 세미나</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="smsCheck2" type="checkbox" class="i-checks"  name="denysmsnomal" id="denysmsnomal" value="1">
																<label for="smsCheck2"> 일반</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="smsCheck3" type="checkbox" class="i-checks" name="denysmsad" id="denysmsad"  value="1">
																<label for="smsCheck3"> 광고</label>
															</div>
														</td>
													</tr>
													<tr>
														<th>DM 거부</th>
														<td>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="dmCheck1" type="checkbox" class="i-checks" name="denydmnews" id="denydmnews"  value="1">
																<label for="dmCheck1"> 뉴스레터</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="dmCheck2" type="checkbox" class="i-checks" name="denydmseminar" id="denydmseminar"  value="1">
																<label for="dmCheck2"> 세미나</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="dmCheck3" type="checkbox" class="i-checks" name="denydmad" id="denydmad"  value="1">
																<label for="dmCheck3"> 광고</label>
															</div>
														</td>
													</tr>
													<tr>
														<th>전화 거부</th>
														<td>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="callCheck1" type="checkbox" class="i-checks" name="denytelnews" id="denytelnews"  value="1">
																<label for="callCheck1"> 뉴스거부</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="callCheck2" type="checkbox" class="i-checks" name="denytelseminar" id="denytelseminar"  value="1"> 
																<label for="callCheck2"> 세미나거부</label>
															</div>
														</td>
													</tr>
													<tr>
														<th>기타</th>
														<td>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="etcCheck1" type="checkbox" class="i-checks" name="denyfax" id="denyfax"  value="1">
																<label for="etcCheck1"> FAX거부</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="etcCheck2" type="checkbox" class="i-checks" name="denyvisit" id="denyvisit"  value="1">
																<label for="etcCheck2"> 방문거부</label>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box6 col-lg-12 p-0">
											<table class="table table-bordered border-top-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th class="border-top-0">메모</th>
														<td class="border-top-0">
															<textarea name="memo" id="memo" class="form-control" style="resize: none; height: 8em;"></textarea>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="w-100 text-right">
											<Button type="submit" class="btn btn-primary submit"  disabled >저 장</Button>
											<a href="/cust" class="btn btn-primary">목 록</a> 
										</div>
									</div>
								</div>
								</form:form>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- E: 고객 등록 ppt p02~p05 -->
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
	

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	
	<!-- S: 추가 js-->
	<!-- radioBox-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script>
	<!-- datePicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<!-- daum 주소 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- 유효성 -->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_validate.js"></script>
	 <!-- Input Mask-->
    <script src="${pageContext.request.contextPath}/resources/js/plugins/jasny/jasny-bootstrap.min.js"></script>

	
	<script>	
 
        $(document).ready(function () {
      	   
       	
            // icheck css
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });

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
	<!-- E: 추가 js -->
</body>
</html>