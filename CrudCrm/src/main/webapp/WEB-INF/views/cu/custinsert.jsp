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
							
							<form:form action="/cust/post" method="POST" id="command">
							<div class="ibox">
								<div class="ibox-title row">
									<h4>기본정보</h4>
								</div>
								<div class="ibox-content row">	
													
									
									<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
										<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
	                              		 	<a class="alert-link" href="#">
												<span id="showMsg"></span>
											</a>										
	                          			</div>													
										<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
											<Button type="submit" class="btn btn-primary submit" id="submit"  disabled >저 장</Button>
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
												<tr>
													<th>고객명</th>
													<td>
														<input type="text" class="form-control error required validate name" name="custname" id="custname" placeholder="필수 입력" >
													</td>
												</tr>
												<tr>
													<th>직책</th>
													<td><input type="text" class="form-control validate simple" style="height: 1.45rem" name="duty" id="duty"></td>
												</tr>
												<tr>
													<th>직장전화</th>
													<td>
														<!-- form select 공통으로 변경 -->
														<select class="form-control col-4 float-left mr-3 validate phone1 " style="height: 1.45rem" name="wrktel1" id="wrktel1">
															<option value="">선택</option>
															<option value="02">02</option>
															<option value="070">070</option>
															<option value="010">010</option>
														</select>
														<input type="text" class="form-control col-3 float-left mr-2 validate phone2" name="wrktel2" id="wrktel2" > 
														<input type="text" class="form-control col-3 float-left validate phone3" name="wrktel3" id="wrktel3" >
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
														<div class="input-group cli">
															<!-- <input type="text" class="form-control" name="cliname" id="cliname" onClick="openPop('/popclient','client',600,700);"readonly> 
															<input type="hidden" name="clino" id="clino" value="0">
															<span class="input-group-addon"> 
																<a href="javascript:void(0);" onClick="openPop('/popclient','client',600,700);"><i class="fa fa-search"></i></a>
															</span> -->		
															<input type="text" class="form-control" autocomplete="off" name="cliname" id="cliname" readonly>
                                                    		<input type="hidden" name="clino" id="clino" value="0">
                                                    		<span class="input-group-addon">
                                                       			<a><i class="fa fa-search"></i></a>
                                                    		</span>
														</div>
													</td>
												</tr>
												<tr>
													<th>휴대전화</th><!-- form:select변경 -->
													<td>													
														<select class="form-control col-4 float-left mr-3 error validate required phone1" style="height: 1.40rem" name="mobile1" id="mobile1" >
															<option value="">선택</option>
															<option value="010">010</option>
															<option value="011">011</option>
															<option value="017">017</option>
														</select> 
														<input type="text" class="form-control col-3 float-left mr-2 error validate required phone2" name="mobile2" id="mobile2"  > 
														<input type="text" class="form-control col-3 float-left error validate required phone3" name="mobile3" id="mobile3"  >														
														<span id="msgRegular"></span>
													</td>
												</tr>
												<tr>
													<th>직장팩스</th>
													<td>
														<select class="form-control col-4 float-left mr-3 validate phone1" style="height: 1.45rem" name="wrkfax1" id="wrkfax1">
															<option value="">선택</option>
															<option value="010">010</option>
															<option value="011">011</option>
															<option value="017">017</option>
														</select> 
														<input type="text" class="form-control col-3 float-left mr-2 validate phone2" name="wrkfax2" id="wrkfax2" > 
														<input type="text" class="form-control col-3 float-left validate phone3" name="wrkfax3" id="wrkfax3" >
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
													<td><input type="text" class="form-control validate simple" name="deptname" id="deptname" ></td>
												</tr>
												<tr>
													<th>이메일</th>
													<td><input type="email" class="form-control validate email" style="height: 1.45rem" name="email" id="email" ></td>
												</tr>
												<tr>
													<th>홈페이지</th>
													<td><input type="text" class="form-control validate url"  style="height: 1.45rem" name="wrkurl" id="wrkurl" placeholder="ex) www.crudsystem.co.kr "></td>
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
														<input type="text" class="form-control float-left col-lg-4 mt-sx-1 validate addr" name="wrkaddr3" id="wrkaddr3">
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
														<div class="input-group owner">
															<input type="text" class="form-control" autocomplete="off" name="owner_" id="owner_" value="${SESSIONUSERNAME}" readonly>
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
															<select class="form-control col-4 float-left mr-3 validate phone1" style="height: 1.45rem" name="homtel1" id="homtel1">
																<option value="">선택</option>
																<option value="02">02</option>
																<option value="031">031</option>
															</select> 
															<input type="text" class="form-control col-3 float-left mr-2 validate phone2" name="homtel2" id="homtel2" > 
															<input type="text" class="form-control col-3 float-left validate phone3" name="homtel3" id="homtel3">
														</td>
													</tr>
													<tr>
														<th>결혼여부</th>
														<td>
															<select class="form-control" style="height: 1.45rem" name="married" id="married">
																<option value="0">선택</option>
																<option value="1">미혼</option>
																<option value="2">기혼</option>
															</select>
														</td>
													</tr>
													<tr>
														<th>결혼기념일</th>
														<td>
															<div class="input-group date">
																<span class="input-group-addon"> <i
																	class="fa fa-calendar"></i>
																</span><input type="text" class="form-control"  name="weddingday" id="weddingday" autocomplete="off">
															</div>
														</td>
													</tr>
													<tr>
														<th>취미</th>
														<td><input type="text" class="form-control validate simple" style="height: 1.45rem" name="hobby" id="hobby"> </td>
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
															<select class="form-control" style="height: 1.45rem" name="sex" id="sex">
																<option value="0">선택</option>
																<option value="1">남자</option>
																<option value="2">여자</option>
															</select>
														</td>
													</tr>
													<tr>
														<th>발송처</th>
														<td>
															<select class="form-control" style="height: 1.45rem" name="mailto" id="mailto">
																<option value="0" >선택</option>
																<option value="1">자택</option>
																<option value="2">직장</option>
															</select>	
														</td>
													</tr>
													<tr>
														<th>고객등급</th>
														<td>
															<select class="form-control" style="height: 1.52rem" name="custgrade" id="custgrade">
																<option value="0" >선택</option>
																<option value="1">일반</option>
																<option value="2">VIP</option>
																<option value="3">VVIP</option>
															</select>
														</td>
													</tr>
													<tr>
														<th>회원구분</th>
														<td>
															<select class="form-control" style="height: 1.45rem" name="custgubun" id="custgubun">
																<option value="0">선택</option>
																<option  value="1">회원</option>
																<option  value="2">비회원</option>
																<option  value="3">탈퇴회원</option>
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
																<input type="text" class="form-control" name="birth" id="birth" autocomplete="off">
															</div>
														</td>
													</tr>
													<tr>
														<th>양력/음력</th>
														<td>
															<select class="form-control" style="height: 1.45rem" name="solar" id="solar">
																<option value="0">선택</option>
																<option value="1">양력</option>
																<option value="2">음력</option>
															</select>
														</td>
													</tr>
													<tr>
														<th>직업</th>
														<td>
															<input type="text" class="form-control validate simple" style="height: 1.52rem;" name="job" id="job">
														</td>
													</tr>
													<tr>
														<th class="border-bottom-0">활동등급</th><!-- 컬럼생성필요 -->
														<td class="border-bottom-0">
															<select class="form-control" style="height: 1.45rem" name="actgrade" id="actgrade">
																<option value="0">선택</option>
																<option value="1">우수</option>
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
															<input type="text" class="form-control float-left col-lg-4 mt-sx-1 validate addr" name="homaddr3" id="homaddr3">
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
											<Button type="submit" class="btn btn-primary submit" id="submit" disabled >저 장</Button>
											<a href="/cust" class="btn btn-primary">목 록</a> 
										</div>
									</div>
								</div>
								</form:form>
<!-- 								<div class="ibox">
									<div class="ibox-title row border-0">
										<h4>고객 상세</h4>
									</div>
									<div class="ibox-content row">
										<div class="box1 col-lg-12 p-0">
											<div class="tabs-container">
												<ul class="nav nav-tabs" role="tablist">
													<li><a class="nav-link active" data-toggle="tab" href="#tab1">서비스</a></li>
													<li><a class="nav-link" data-toggle="tab" href="#tab2">영업</a></li>
													<li><a class="nav-link" data-toggle="tab" href="#tab3">캠페인</a></li>
													<li><a class="nav-link" data-toggle="tab" href="#tab4">접촉</a></li>
													<li><a class="nav-link" data-toggle="tab" href="#tab5">출처</a></li>
												</ul>
												<div class="tab-content">
													<div role="tabpanel" id="tab1"
														class="tab-pane active table-responsive">
														<div class="panel-body">
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th>제목</th>
																		<th>상태</th>
																		<th>서비스유형</th>
																		<th>접수일</th>
																		<th>접수자</th>
																		<th>처리일</th>
																		<th>담당자</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>제목입니다.</td>
																		<td>상태입니다</td>
																		<td>서비스유형임</td>
																		<td>2018/10/11</td>
																		<td>세글자</td>
																		<td>2018/10/11</td>
																		<td>세글자</td>
																	</tr>
																	<tr>
																		<td>제목입니다.</td>
																		<td>상태입니다</td>
																		<td>서비스유형임</td>
																		<td>2018/10/11</td>
																		<td>세글자</td>
																		<td>2018/10/11</td>
																		<td>세글자</td>
																	</tr>
																	<tr>
																		<td>제목입니다.</td>
																		<td>상태입니다</td>
																		<td>서비스유형임</td>
																		<td>2018/10/11</td>
																		<td>세글자</td>
																		<td>2018/10/11</td>
																		<td>세글자</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div role="tabpanel" id="tab2" class="tab-pane table-responsive">
														<div class="panel-body">
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th>예상수주일</th>
																		<th>영업건명</th>
																		<th>상담건</th>
																		<th>영업담당자</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>203일</td>
																		<td>영업건명입니다</td>
																		<td>상담건입니다</td>
																		<td>담당자</td>
																	</tr>
																	<tr>
																		<td>203일</td>
																		<td>영업건명입니다</td>
																		<td>상담건입니다</td>
																		<td>담당자</td>
																	</tr>
																	<tr>
																		<td>203일</td>
																		<td>영업건명입니다</td>
																		<td>상담건입니다</td>
																		<td>담당자</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div role="tabpanel" id="tab3" class="tab-pane table-responsive">
														<div class="panel-body">
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th>캠페인명</th>
																		<th>프로젝트</th>
																		<th>시작일</th>
																		<th>종료일</th>
																		<th>채널매체</th>
																		<th>결과</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>캠페인명입니다</td>
																		<td>프로젝트입니다</td>
																		<td>2018/10/12</td>
																		<td>2018/11/22</td>
																		<td>채널메체입니다</td>
																		<td>결과입니다</td>
																	</tr>
																	<tr>
																		<td>캠페인명입니다</td>
																		<td>프로젝트입니다</td>
																		<td>2018/10/12</td>
																		<td>2018/11/22</td>
																		<td>채널메체입니다</td>
																		<td>결과입니다</td>
																	</tr>
																	<tr>
																		<td>캠페인명입니다</td>
																		<td>프로젝트입니다</td>
																		<td>2018/10/12</td>
																		<td>2018/11/22</td>
																		<td>채널메체입니다</td>
																		<td>결과입니다</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div role="tabpanel" id="tab4" class="tab-pane table-responsive">
														<div class="panel-body">
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th>접촉일</th>
																		<th>접촉자</th>
																		<th>접촉유형</th>
																		<th>접촉매체</th>
																		<th>접촉결과</th>
																		<th>접촉내용</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>2018/10/11</td>
																		<td>접촉자임</td>
																		<td>접촉유형입니다</td>
																		<td>접촉매체입니다</td>
																		<td>접촉결과입니다</td>
																		<td>접촉내용입니다</td>
																	</tr>
																	<tr>
																		<td>2018/10/11</td>
																		<td>접촉자임</td>
																		<td>접촉유형입니다</td>
																		<td>접촉매체입니다</td>
																		<td>접촉결과입니다</td>
																		<td>접촉내용입니다</td>
																	</tr>
																	<tr>
																		<td>2018/10/11</td>
																		<td>접촉자임</td>
																		<td>접촉유형입니다</td>
																		<td>접촉매체입니다</td>
																		<td>접촉결과입니다</td>
																		<td>접촉내용입니다</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div role="tabpanel" id="tab5" class="tab-pane table-responsive">
														<div class="panel-body">
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th>등록일</th>
																		<th>출처명</th>
																		<th>출처메모</th>
																		<th>출처회원번호</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>2018/10/11</td>
																		<td>출처명입니다</td>
																		<td>출처메모입니다출처메모입니다출처메모입니다</td>
																		<td>1568951615</td>
																	</tr>
																	<tr>
																		<td>2018/10/11</td>
																		<td>출처명입니다</td>
																		<td>출처메모입니다출처메모입니다출처메모입니다</td>
																		<td>1568951615</td>
																	</tr>
																	<tr>
																		<td>2018/10/11</td>
																		<td>출처명입니다</td>
																		<td>출처메모입니다출처메모입니다출처메모입니다</td>
																		<td>1568951615</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div> -->
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
	<script src="/resources/js/plugins/iCheck/icheck.min.js"></script>
	<!-- datePicker-->
	<script src="/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<!-- daum 주소 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	

	
	<script>	
 
        $(document).ready(function () {
      	
        	//********필수 값 실시간 체크*********************************        	      
        	
        	$('#mobile1').change(function() {//셀렉트박스 change 메서드
        		var state = $('#mobile1 option:selected').val();
        		if(state == '') {//값이없다면
        			$('#mobile1').addClass('error');//에러 태두리
        			$('.submit').prop("disabled",true);//submit 비활성화
        		} else {
        			$('#mobile1').removeClass('error');
        			enableSubmit();
        		}
        	});
        	//****************************************필수값 체크 끝 ********
        	
        
       	
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
            
          	//주소 받아오기
            $('.daumzip').click(function(e){
      			 
      		     new daum.Postcode({
      		         oncomplete: function(data) {
      		        	var clickId = e.currentTarget.id;//클릭한 id값 을 받아온다
      		        	var head = clickId.substr(0,clickId.indexOf('addr'));//id의 헤더만 잘라낸다. ex)homaddr1-> hom
    		        	
      		        	$("#"+head+"addr1").val(data.zonecode);
    		        	$("#"+head+"addr2").val(data.roadAddress);
    		        	$("#"+head+"addr3").val(data.buildingName);
                  
      		         }
      		     }).open();
      		 });

        });
    </script>
	<!-- E: 추가 js -->
</body>
</html>