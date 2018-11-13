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
						<li class="breadcrumb-item"><a href="/">메인</a></li>
						<li class="breadcrumb-item"><a href="/custlist">고객 목록</a></li>
						<li class="breadcrumb-item"><a href="/custdetail/${custUpdate.CUSTNO}">고객 상세</a></li>
						<li class="breadcrumb-item active"><strong>고객 수정</strong></li>
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
							<form:form action="/custform/${custUpdate.CUSTNO}" method="POST">
							<input type="hidden" name="DENYNO" value="${custUpdate.DENYNO}">
							<div class="ibox">
								<div class="ibox-title row">
									<h4>기본정보</h4>
								</div>
								<div class="ibox-content row">								
									<div class="w-100 text-right mb-2">
										<Button type="submit" class="btn btn-primary">고객저장</Button>
										<a href="/custlist" class="btn btn-primary">고객목록</a>
									</div>
									<div class="box1 col-lg-4 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th>고객명</th>
													<td>
														<input type="text" class="form-control" name="CUSTNAME" id="CUSTNAME"  value="${custUpdate.CUSTNAME}" minlength="2" maxlength="30" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)"  required >
													</td>
												</tr>
												<tr>
													<th>직책</th>
													<td><input type="text" class="form-control" name="DUTY" id="DUTY" value="${custUpdate.DUTY}"></td>
												</tr>
												<tr>
													<th>직장전화</th>
													<td>
														<!-- form select 공통으로 변경 -->
														<select class="form-control col-4 float-left mr-3 " style="height: 1.45rem" name="WRKTEL1" id="WRKTEL1">
															<option value="" ${custUpdate.WRKTEL1 eq "" ? "selected" :""}>선택</option>
															<option value="02" ${custUpdate.WRKTEL1 eq "02" ? "selected" :""}>02</option>
															<option value="070" ${custUpdate.WRKTEL1 eq "070" ? "selected" :""}>070</option>
															<option value="010" ${custUpdate.WRKTEL1 eq "010" ? "selected" :""}>010</option>
														</select>
														<input type="number" class="form-control col-3 float-left mr-2 inputs" name="WRKTEL2" id="WRKTEL2" minlength="3" maxlength="4"  value="${custUpdate.WRKTEL2}"> 
														<input type="number" class="form-control col-3 float-left inputs" name="WRKTEL3" id="WRKTEL3" minlength="3" maxlength="4" value="${custUpdate.WRKTEL3}">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box2 col-lg-4 p-0">
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
														<div class="input-group">
															<input type="text" class="form-control" name="CLINAME" id="CLINAME" readonly value="${custUpdate.CLINAME }" 
															onClick="openPop('/popclient','client',600,700);" > 
															<input type="hidden" name="CLINO" id="CLINO" value="${searchVal.CLINO eq null ? 0 :searchVal.CLINO}">
															<span class="input-group-addon"> 
																<a href="#" onClick="openPop('/popclient','client',600,700);"><i class="fa fa-search"></i></a>
															</span>
														</div>
													</td>
												</tr>
												<tr>
													<th>휴대전화</th><!-- form:select변경 -->
													<td>
														<select class="form-control col-4 float-left mr-3" style="height: 1.45rem" name="MOBILE1" id="MOBILE1" required>
															<option value="" ${custUpdate.MOBILE1 eq "" ? "selected" :""}>선택</option>
															<option value="010" ${custUpdate.MOBILE1 eq "010" ? "selected" :""}>010</option>
															<option value="011" ${custUpdate.MOBILE1 eq "011" ? "selected" :""}>011</option>
															<option value="017" ${custUpdate.MOBILE1 eq "017" ? "selected" :""}>017</option>
														</select> 
														<input type="number" class="form-control col-3 float-left mr-2 inputs" name="MOBILE2" id="MOBILE2" minlength="3" maxlength="4"  value="${custUpdate.MOBILE2 }" required> 
														<input type="number" class="form-control col-3 float-left inputs" name="MOBILE3" id="MOBILE3" minlength="3" maxlength="4"  value="${custUpdate.MOBILE3 }" required>
													</td>
												</tr>
												<tr>
													<th>직장팩스</th>
													<td>
														<select class="form-control col-4 float-left mr-3" style="height: 1.45rem" name="WRKFAX1" id="WRKFAX1">
															<option value="" ${custUpdate.WRKFAX1 eq "" ? "selected" :""}>선택</option>
															<option value="010" ${custUpdate.WRKFAX1 eq "010" ? "selected" :""}>010</option>
															<option value="011" ${custUpdate.WRKFAX1 eq "011" ? "selected" :""}>011</option>
															<option value="017" ${custUpdate.WRKFAX1 eq "017" ? "selected" :""}>017</option>
														</select> 
														<input type="number" class="form-control col-3 float-left mr-2 inputs" name="WRKFAX2" id="WRKFAX2" minlength="3" maxlength="4"  value="${custUpdate.WRKFAX2 }"> 
														<input type="number" class="form-control col-3 float-left inputs" name="WRKFAX3" id="WRKFAX3" minlength="3" maxlength="4"  value="${custUpdate.WRKFAX3 }">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box3 col-lg-4 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th>부서</th>
													<td><input type="text" class="form-control" name="DEPTNAME" id="DEPTNAME"  value="${custUpdate.DEPTNAME }"></td>
												</tr>
												<tr>
													<th>이메일</th>
													<td><input type="email" class="form-control" name="EMAIL" id="EMAIL" value="${custUpdate.EMAIL }" ></td>
												</tr>
												<tr>
													<th>홈페이지</th>
													<td><input type="text" class="form-control" name="WRKURL" id="WRKURL" value="${custUpdate.WRKURL }"></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box4 col-lg-8 p-0">
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
															<input type="text" class="form-control daumzip" name="WRKADDR1" id="WRKADDR1" value="${custUpdate.WRKADDR1 }" readonly> <span
																class="input-group-addon"> <a href="#" ><i class="fa fa-search daumzip " id="WRKADDR1"></i></a>
															</span>
														</div> 
														<input type="text" class="form-control col-lg-4 float-left mr-3 mt-sx-1" name="WRKADDR2" id="WRKADDR2" value="${custUpdate.WRKADDR2}" readonly>
														<input type="text" class="form-control float-left col-lg-4 mt-sx-1" name="WRKADDR3" id="WRKADDR3" value="${custUpdate.WRKADDR3 }">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="box5 col-lg-4 p-0">
										<table class="table table-bordered border-top-0 ">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th class="border-top-0">담당자</th>
													<td class="border-top-0">
														<div class="input-group">
															<input type="hidden" name="OWNER" id="OWNER" value="${custUpdate.OWNER}"> 
															<input type="text" class="form-control"  name="OWNERNAME" id="OWNERNAME" value="${custUpdate.OWNERNAME}" onClick="openPop('/popowner','owner',600,700);" readonly> 
															<span class="input-group-addon"> 
															<a href="#" onClick="openPop('/popowner','owner',600,700);" ><i class="fa fa-search"></i></a>
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
										<div class="box1 col-lg-4 p-0">
											<table class="table table-bordered mb-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th>자택전화</th>
														<td>
															<select class="form-control col-4 float-left mr-3" style="height: 1.45rem" name="HOMTEL1">
																<option value="" ${custUpdate.HOMTEL1 eq "" ? "selected" :""}>선택</option>
																<option value="02" ${custUpdate.HOMTEL1 eq "02" ? "selected" :""}>02</option>
																<option value="031" ${custUpdate.HOMTEL1 eq "031" ? "selected" :""}>031</option>
															</select> 
															<input type="text" class="form-control col-3 float-left mr-2 inputs" name="HOMTEL2" minlength="3" maxlength="4" value="${custUpdate.HOMTEL2 }"> 
															<input type="text" class="form-control col-3 float-left inputs" name="HOMTEL3" minlength="3" maxlength="4" value="${custUpdate.HOMTEL3 }">
														</td>
													</tr>
													<tr>
														<th>결혼여부</th>
														<td>
															<select class="form-control" style="height: 1.45rem" name="MARRIED">
																<option value="0" ${custUpdate.MARRIED eq "0" ? "selected" :""}>선택</option>
																<option value="1" ${custUpdate.MARRIED eq "1" ? "selected" :""}>미혼</option>
																<option value="2" ${custUpdate.MARRIED eq "2" ? "selected" :""}>기혼</option>
															</select>
														</td>
													</tr>
													<tr>
														<th>결혼기념일</th>
														<td>
															<div class="input-group date">
																<span class="input-group-addon"> <i
																	class="fa fa-calendar"></i>
																</span><input type="text" class="form-control" name="WEDDINGDAY" id="WEDDINGDAY" value="${custUpdate.WEDDINGDAY }" autocomplete="off">
															</div>
														</td>
													</tr>
													<tr>
														<th>취미</th>
														<td><input type="text" class="form-control" name="HOBBY" id="HOBBY" value="${custUpdate.HOBBY }"> </td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box2 col-lg-4 p-0">
											<table class="table table-bordered mb-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th>성별</th>
														<td>
															<select class="form-control" style="height: 1.45rem" name="SEX" id="SEX">
																<option value="0" ${custUpdate.SEX eq "0" ? "selected" :""}>선택</option>
																<option value="1" ${custUpdate.SEX eq "1" ? "selected" :""}>남자</option>
																<option value="2" ${custUpdate.SEX eq "2" ? "selected" :""}>여자</option>
															</select>
														</td>
													</tr>
													<tr>
														<th>발송처</th>
														<td>
															<select class="form-control" style="height: 1.45rem" name="MAILTO" id="MAILTO">
																<option value="0" ${custUpdate.MAILTO eq "0" ? "selected" :""} >선택</option>
																<option value="1" ${custUpdate.MAILTO eq "1" ? "selected" :""}>자택</option>
																<option value="2" ${custUpdate.MAILTO eq "2" ? "selected" :""}>직장</option>
															</select>	
														</td>
													</tr>
													<tr>
														<th>고객등급</th>
														<td>
															<select class="form-control" style="height: 1.5rem" name="CUSTGRADE" id="CUSTGRADE">
																<option value="0" ${custUpdate.CUSTGRADE eq "0" ? "selected" :""}>선택</option>
																<option value="1" ${custUpdate.CUSTGRADE eq "1" ? "selected" :""}>일반</option>
																<option value="2" ${custUpdate.CUSTGRADE eq "2" ? "selected" :""}>VIP</option>
																<option value="3" ${custUpdate.CUSTGRADE eq "3" ? "selected" :""}>VVIP</option>
															</select>
														</td>
													</tr>
													<tr>
														<th>회원구분</th>
														<td>
															<select class="form-control" style="height: 1.45rem" name="CUSTGUBUN" id="CUSTGUBUN">
																<option value="0" ${custUpdate.CUSTGUBUN eq "0" ? "selected" :""}>선택</option>
																<option  value="1" ${custUpdate.CUSTGUBUN eq "1" ? "selected" :""}>회원</option>
																<option  value="2" ${custUpdate.CUSTGUBUN eq "2" ? "selected" :""}>비회원</option>
																<option  value="3" ${custUpdate.CUSTGUBUN eq "3" ? "selected" :""}>탈퇴회원</option>
															</select>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box3 col-lg-4 p-0">
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
																<span class="input-group-addon"> <i
																	class="fa fa-calendar"></i>
																</span> 
																<input type="text" class="form-control" name="BIRTH" id="BIRTH" autocomplete="off" value="${custUpdate.BIRTH}">
															</div>
														</td>
													</tr>
													<tr>
														<th>양력/음력</th>
														<td>
															<select class="form-control" style="height: 1.45rem" name="SOLAR" id="SOLAR">
																<option value="0" ${custUpdate.SOLAR eq "0" ? "selected" :""}>선택</option>
																<option value="1" ${custUpdate.SOLAR eq "1" ? "selected" :""}>양력</option>
																<option value="2" ${custUpdate.SOLAR eq "2" ? "selected" :""}>음력</option>
															</select>
														</td>
													</tr>
													<tr>
														<th>직업</th>
														<td>
															<input type="text" class="form-control" style="height: 1.5rem;" name="JOB" id="JOB" value="${custUpdate.JOB}">
														</td>
													</tr>
													<tr>
														<th class="border-bottom-0">활동등급</th><!-- 컬럼생성필요 -->
														<td class="border-bottom-0">
															<select class="form-control" style="height: 1.45rem" name="ACTGRADE" id="ACTGRADE">
																<option value="0" ${custUpdate.ACTGRADE eq "0" ? "selected" :""}>선택</option>
																<option value="1" ${custUpdate.ACTGRADE eq "1" ? "selected" :""}>우수</option>
															</select>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box4 col-lg-8 p-0">
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
																<input type="text" class="form-control daumzip" name="HOMADDR1" id="HOMADDR1" value="${custUpdate.HOMADDR1}" readonly> 
																<span class="input-group-addon"> 
																	<a href="javascript:void(0);"><i class="fa fa-search daumzip" id="HOMADDR1"></i></a>
																</span>
															</div> 
															<input type="text" class="form-control col-lg-4 float-left mr-3 mt-sx-1" name="HOMADDR2" id="HOMADDR2" value="${custUpdate.HOMADDR2}" readonly>
															<input type="text" class="form-control float-left col-lg-4 mt-sx-1" name="HOMADDR3" id="HOMADDR3" value="${custUpdate.HOMADDR3}">
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="box4-2 col-lg-4 p-0">
											<table class="table table-bordered m-0 border-top-0">
												<colgroup>
													<col style="width: 100px; background: #fafafa;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<th class="border-top-0">정보활용</th>
													<td class="border-top-0">
														<div class="i-checks" style="height: 1.45rem;">
															<label class="pr-lg-3 mb-0">
															<input type="radio" value="0" id="INFOAGREE" name="INFOAGREE"  class="pr-lg-1"  ${custUpdate.INFOAGREE eq "0" ? "checked" : ""}><i></i> 동의</label> 
																<label class="pr-lg-3 mb-0">
																<input type="radio"
																value="1" id="INFOAGREE" name="INFOAGREE" class="pr-lg-1"  ${custUpdate.INFOAGREE eq "1" ? "checked" : ""}><i></i>
																거부</label>
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
																<input id="emailChec1" type="checkbox" class="i-checks" name="DENYMAILNEWS" id="DENYMAILNEWS" value="1"  ${custUpdate.DENYMAILNEWS eq "1" ? "checked='checked'" : ""}>
																<label for="emailChec1"> 뉴스레터</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="emailChec2" type="checkbox" class="i-checks" name="DENYMAILSEMINAR" id="DENYMAILSEMINAR" value="1" ${custUpdate.DENYMAILSEMINAR eq "1" ? "checked='checked'" : ""}>
																<label for="emailChec2"> 세미나</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="emailChec3" type="checkbox" class="i-checks" name="DENYMAILAD" id="DENYMAILAD"  value="1" ${custUpdate.DENYMAILAD eq "1" ? "checked='checked'" : ""}>
																<label for="emailChec3"> 광고</label>
															</div>
														</td>
													</tr>
													<tr>
														<th>SMS 거부</th>
														<td>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="smsCheck1" type="checkbox" class="i-checks" name="DENYSMSSEMINAR" id="DENYSMSSEMINAR"  value="1" ${custUpdate.DENYSMSSEMINAR eq "1" ? "checked='checked'" : ""}>
																<label for="smsCheck1"> 세미나</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="smsCheck2" type="checkbox" class="i-checks"  name="DENYSMSNOMAL" id="DENYSMSNOMAL" value="1"  ${custUpdate.DENYSMSNOMAL eq "1" ? "checked='checked'" : ""}>
																<label for="smsCheck2"> 일반</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="smsCheck3" type="checkbox" class="i-checks" name="DENYSMSAD" id="DENYSMSAD"  value="1" ${custUpdate.DENYSMSAD eq "1" ? "checked='checked'" : ""}>
																<label for="smsCheck3"> 광고</label>
															</div>
														</td>
													</tr>
													<tr>
														<th>DM 거부</th>
														<td>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="dmCheck1" type="checkbox" class="i-checks" name="DENYDMNEWS" id="DENYDMNEWS"  value="1" ${custUpdate.DENYDMNEWS eq "1" ? "checked='checked'" : ""}>
																<label for="dmCheck1"> 뉴스레터</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="dmCheck2" type="checkbox" class="i-checks" name="DENYDMSEMINAR" id="DENYDMSEMINAR"  value="1" ${custUpdate.DENYDMSEMINAR eq "1" ? "checked='checked'" : ""}>
																<label for="dmCheck2"> 세미나</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="dmCheck3" type="checkbox" class="i-checks" name="DENYDMAD" id="DENYDMAD"  value="1" ${custUpdate.DENYDMAD eq "1" ? "checked='checked'" : ""}>
																<label for="dmCheck3"> 광고</label>
															</div>
														</td>
													</tr>
													<tr>
														<th>전화 거부</th>
														<td>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="callCheck1" type="checkbox" class="i-checks" name="DENYTELNEWS" id="DENYTELNEWS"  value="1" ${custUpdate.DENYTELNEWS eq "1" ? "checked='checked'" : ""}>
																<label for="callCheck1"> 뉴스거부</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="callCheck2" type="checkbox" class="i-checks" name="DENYTELSEMINAR" id="DENYTELSEMINAR"  value="1" ${custUpdate.DENYTELSEMINAR eq "1" ? "checked='checked'" : ""}> 
																<label for="callCheck2"> 세미나거부</label>
															</div>
														</td>
													</tr>
													<tr>
														<th>기타</th>
														<td>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="etcCheck1" type="checkbox" class="i-checks" name="DENYFAX" id="DENYFAX"  value="1" ${custUpdate.DENYFAX eq "1" ? "checked='checked'" : ""}>
																<label for="etcCheck1"> FAX거부</label>
															</div>
															<div class="checkbox float-left col-lg-2 p-0">
																<input id="etcCheck2" type="checkbox" class="i-checks" name="DENYVISIT" id="DENYVISIT"  value="1" ${custUpdate.DENYVISIT eq "1" ? "checked='checked'" : ""}>
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
														<td class="border-top-0"><textarea name="MEMO"
																id="MEMO" class="form-control"
																style="resize: none; height: 8em;">${custUpdate.MEMO }</textarea></td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="w-100 text-right">
											<Button type="submit" class="btn btn-primary">고객저장</Button>
											<a href="/custlist" class="btn btn-primary">고객목록</a> 
										</div>
									</div>
								</div>
								</form:form>
								<div class="ibox">
									<div class="ibox-title row border-0">
										<h4>고객 상세</h4>
									</div>
									<div class="ibox-content row">
										<div class="box1 col-lg-12 p-0">
											<div class="tabs-container">
												<ul class="nav nav-tabs" role="tablist">
													<li><a class="nav-link active" data-toggle="tab"
														href="#tab1">서비스</a></li>
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
								</div>
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
	
	
	
	<!-- Jquery Validate -->
    <script src="/resources/js/plugins/validate/jquery.validate.min.js"></script>
    <script>
	//공백입력금지
	 function noSpaceForm(obj) { // 공백사용못하게
        var str_space = /\s/;  // 공백체크
        if(str_space.exec(obj.value)) { //공백 체크            
            obj.focus();
            obj.value = obj.value.replace(' ',''); // 공백제거
            return false;
        }
    }
    
         $(document).ready(function(){
			
        });
    </script>
	
	
	
	<script>

	
	
	
        $(document).ready(function () {
            // radioBox
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
            
            //전화번호 입력폼 
            $(function() {
                $(".inputs").keyup (function () {
                    var charLimit = $(this).attr("maxlength");
                    if (this.value.length >= charLimit) {
                        $(this).next('.inputs').focus();
                        return false;
                    }
                });
            });
            
            
            $('.daumzip').click(function(e){
   			 
   		     //obj => button 정보
   		     new daum.Postcode({
   		         oncomplete: function(data) {
   		        	
   		        	if (e.currentTarget.id == 'WRKADDR1'){
   		        		$('#WRKADDR1').val(data.zonecode);
   		        		$('#WRKADDR2').val(data.roadAddress);
   		        		$('#WRKADDR3').val(data.buildingName);
   		        	}else if(e.currentTarget.id == 'HOMADDR1'){
   		        		$('#HOMADDR1').val(data.zonecode);
   		        		$('#HOMADDR2').val(data.roadAddress);
   		        		$('#HOMADDR3').val(data.buildingName);
   		        	}
               
   		         	}
   		     	}).open();
   		 	});
        
       	   //탬플릿 유효성체크 
       	    $("#command").validate({
         		 rules: {
         	   	  	CUSTNAME: {
                		required: true,
                   	    minlength: 2,
                    	maxlength: 30,                       
                	}                  
            	}
        	});
            
        
            
                         
        });
    </script>
	<!-- E: 추가 js -->
</body>
</html>