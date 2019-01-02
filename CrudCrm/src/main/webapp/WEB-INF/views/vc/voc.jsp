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
<title>INSPINIA | Article</title>
<%@ include file="/WEB-INF/views/template/inc/voclinkinc.jsp"%>
</head>

<body>
	<div id="wrapper">

		<div id="page-wrapper" class="gray-bg">
			<div class="ibox-top">
				<div class="ibox">
					<div class="ibox-content clearfix">
						<ul class="top-btn">
							<li>유입경로</li>
							<li><input type="text" class="form-control"></li>
							<li class="mr-2"><input type="text" class="form-control"></li>
							<li class="liBtn"><button class="btn btn-primary btn-sm">
									걸기 <i class="fa fa-phone"></i>
								</button></li>
							<li class="liBtn"><button class="btn btn-primary btn-sm">
									당겨받기 <i class="fa fa-phone"></i>
								</button></li>&nbsp; |&nbsp;
							<li class="liBtn"><button class="btn btn-primary btn-sm">
									대기 <i class="fa fa-spinner"></i>
								</button></li>
							<li class="liBtn"><button class="btn btn-primary btn-sm">
									휴식 <i class="fa fa-coffee"></i>
								</button></li>
							<li class="liBtn"><button class="btn btn-primary btn-sm">
									후처리 <i class="fa fa-phone"></i>
								</button></li>&nbsp; | &nbsp;
							<li>00 : 00 : 12</li>&nbsp; | &nbsp;
							<li class="liBtn2"><span>상담창 상태</span>
								<button class="btn btn-default btn-sm">Out연결</button></li>
							<li class="mr-2 ml-2"><strong>고객대기 <span>7</span></strong></li>
							<li>
								<ul class="top-ul02">
									<li class="tit02">옴니채널</li>
									<li><i class="fa fa-comment"></i> <span class="li-text">3</span>
									</li>
									<li><i class="fa fa-wifi"></i> <span class="li-text">3</span>
									</li>
									<li><i class="fa fa-envelope"></i> <span class="li-text">3</span>
									</li>
									<li><i class="fa fa-home"></i> <span class="li-text">3</span>
									</li>
								</ul>
							</li>
							<!-- <li style=" opacity: 0;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#callNormal">전화</button></li>
                            <li style=" opacity: 0;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#callBlack">강성고객</button></li> -->
							<li class="float-right">
								<ul class="top-ul03">
									<li
										onClick="window.open('notice.html','','resizable=yes,menubar=no,toolbar=yes,width=850,height=500,scrollbars=yes')">
										<i class="fa fa-bell"></i> <span class="li-text">3</span>
									</li>
									<li><i class="fa fa-power-off"></i></li>
									<li><i class="fa fa-bars"></i></li>
								</ul>
							</li>
						</ul>
						<!-- <div class="modal inmodal fade" id="callNormal" tabindex="-1" role="dialog"  aria-hidden="true">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title">전화가 왔습니다.</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p><i class="fa fa-phone"></i></p>
                                        <p class="call-text">
                                            <strong>고객명</strong>: 강민구<br>
                                            <strong>고객등급</strong>: 일반<br>
                                            <strong>전화번호</strong>: 010-1111-1111
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary">받기</button>
                                        <button type="button" class="btn btn-white" data-dismiss="modal">거절</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal inmodal fade" id="callBlack" tabindex="-1" role="dialog"  aria-hidden="true">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title">전화가 왔습니다.</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p><i class="fa fa-phone"></i></p>
                                        <p class="call-text">
                                            <strong>고객명</strong>: 강민구<br>
                                            <strong>고객등급</strong>: 강성고객<br>
                                            <strong>전화번호</strong>: 010-1111-1111
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary">받기</button>
                                        <button type="button" class="btn btn-white" data-dismiss="modal">거절</button>
                                    </div>
                                </div>
                            </div>
                        </div> -->
					</div>
				</div>
			</div>
			<!-- S: 고객 등록 ppt p02~p05 -->
			<div class="wrapper wrapper-content">
				<div class="ibox-left">
					<div class="ibox clearfix">
						<div class="ibox-content left-cont pt-0">
							<div class="ibox-title">
								<h4>발신자정보 조회</h4>
							</div>
							<table class="table table-bordered mb-2">
								<colgroup>
									<col style="width: 70px; background: #fafafa;">
									<col style="width: auto;">
									<col style="width: 70px; background: #fafafa;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>회원번호</th>
										<td><input type="text" class="form-control" disabled></td>
										<th>회원성명</th>
										<td><input type="text" class="form-control"></td>
									</tr>
									<tr>
										<th>주민번호</th>
										<td><input type="text" class="form-control"></td>
										<th>이메일</th>
										<td><input type="text" class="form-control"></td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td><input type="text" class="form-control"></td>
										<th>휴대폰</th>
										<td><input type="text" class="form-control"></td>
									</tr>
									<tr>
										<th>회원구분</th>
										<td><select class="form-control">
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
										</select></td>
										<th>회원성향</th>
										<td><select class="form-control">
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
										</select></td>
									</tr>
									<tr>
										<th>의뢰부서</th>
										<td><input type="text" class="form-control"></td>
										<th>담당자</th>
										<td><input type="text" class="form-control"></td>
									</tr>
									<tr>
										<th>협력부서</th>
										<td><input type="text" class="form-control"></td>
										<th>담당자</th>
										<td><input type="text" class="form-control"></td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="3"><input type="text" class="form-control"></td>
									</tr>
									<tr>
										<th>고객정보</th>
										<td colspan="3"><textarea name="" id=""
												class="form-control" style="resize: none; height: 7.6em;"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btn-area text-right">
								<button class="btn btn-primary btn-sm">기본정보수정</button>
							</div>
						</div>
						<div class="ibox-content right-cont pt-0">
							<div class="ibox-title">
								<h4>고객 상담접수</h4>
							</div>
							<table class="table table-bordered mb-2">
								<colgroup>
									<col style="width: 70px; background: #fafafa;">
									<col style="width: auto;">
									<col style="width: 70px; background: #fafafa;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>회원번호</th>
										<td><input type="text" class="form-control" disabled></td>
										<th>연락처</th>
										<td><input type="text" class="form-control"></td>
									</tr>
									<tr>
										<th>회원성명</th>
										<td><input type="text" class="form-control"></td>
										<th>채널구분</th>
										<td><select class="form-control">
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
										</select></td>
									</tr>
									<tr>
										<th>통화구분</th>
										<td><select class="form-control">
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
										</select></td>
										<th>처리상태</th>
										<td><select class="form-control">
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
										</select></td>
									</tr>
									<tr>
										<th>상담유형</th>
										<td style="border-right: none;"><select
											class="form-control">
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
										</select> <select class="form-control">
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
										</select> <select class="form-control">
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
										</select></td>
										<td colspan="2"
											style="background: #ffffff; border-left: none;"><textarea
												name="" id="" class="form-control"
												style="resize: none; height: 4.5em;"></textarea></td>
									</tr>
									<tr>
										<th>상담예약</th>
										<td colspan="3">
											<div class="input-group date float-left"
												style="width: 120px; margin-right: 5px;">
												<span class="input-group-addon"> <i
													class="fa fa-calendar"></i>
												</span> <input type="text" class="form-control" value="">
											</div> <select class="form-control float-left" style="width: 70px;">
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
										</select><span class="float-left" style="margin-right: 5px;">시</span> <select
											class="form-control float-left" style="width: 70px">
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
										</select>분
										</td>
									</tr>
									<tr>
										<th colspan="2" style="text-align: center;">문의내용</th>
										<th colspan="2" style="text-align: center;">답변내용</th>
									</tr>
									<tr>
										<td colspan="2" style="background: #ffffff;"><textarea
												name="" id="" class="form-control"
												style="resize: none; height: 4.5em;"></textarea></td>
										<td colspan="2" style="background: #ffffff;"><textarea
												name="" id="" class="form-control"
												style="resize: none; height: 4.5em;"></textarea></td>
									</tr>
									<tr>
										<th>접수</th>
										<td colspan="3">2017-03-16 / 18 : 50 : 17</td>
									</tr>
								</tbody>
							</table>
							<div class="btn-area text-right">
								<button class="btn btn-primary btn-sm">저장</button>
								<button class="btn btn-primary btn-sm">초기화</button>
							</div>
						</div>
						<div class="ibox-content bot-cont">
							<div class="tabs-container">
								<ul class="nav nav-tabs clearfix d-inline-block w-100"
									role="tablist">
									<li><a class="nav-link active" data-toggle="tab"
										href="#tab1">상담이력</a></li>
									<li><a class="nav-link" data-toggle="tab" href="#tab2">미처리이력</a></li>
									<li><a class="nav-link" data-toggle="tab" href="#tab3">콜백목록</a></li>
									<li><a class="nav-link" data-toggle="tab" href="#tab4">email</a></li>
									<li><a class="nav-link" data-toggle="tab" href="#tab5">sms</a></li>
									<li><a class="nav-link" data-toggle="tab" href="#tab6">kakao</a></li>
									<div class="btn-area float-right">
										<button class="btn btn-primary btn-sm">예약등록</button>
									</div>
								</ul>
								<div class="tab-content">
									<div role="tabpanel" id="tab1" class="tab-pane active">
										<div class="panel-body">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>&nbsp;</th>
														<th>접수일시</th>
														<th>회원번호</th>
														<th>고객명수</th>
														<th>발신번호</th>
														<th>처리유형</th>
														<th>상담유형</th>
														<th>처리상태</th>
														<th>문의내용</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
														<td>2018/11/11 12:18:15</td>
														<td>17088694</td>
														<td>김**</td>
														<td>032-123-1231</td>
														<td>일반</td>
														<td>상담됨 ></td>
														<td>완료</td>
														<td>주차관리</td>
													</tr>
													<tr>
														<td>2</td>
														<td>2018/11/11 12:18:15</td>
														<td>17088694</td>
														<td>김**</td>
														<td>032-123-1231</td>
														<td>일반</td>
														<td>상담됨 ></td>
														<td>완료</td>
														<td>주차관리</td>
													</tr>
													<tr>
														<td>3</td>
														<td>2018/11/11 12:18:15</td>
														<td>17088694</td>
														<td>김**</td>
														<td>032-123-1231</td>
														<td>일반</td>
														<td>상담됨 ></td>
														<td>완료</td>
														<td>주차관리</td>
													</tr>
													<tr>
														<td>4</td>
														<td>2018/11/11 12:18:15</td>
														<td>17088694</td>
														<td>김**</td>
														<td>032-123-1231</td>
														<td>일반</td>
														<td>상담됨 ></td>
														<td>완료</td>
														<td>주차관리</td>
													</tr>
													<tr>
														<td>5</td>
														<td>2018/11/11 12:18:15</td>
														<td>17088694</td>
														<td>김**</td>
														<td>032-123-1231</td>
														<td>일반</td>
														<td>상담됨 ></td>
														<td>완료</td>
														<td>주차관리</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div role="tabpanel" id="tab2" class="tab-pane">
										<div class="panel-body">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>&nbsp;</th>
														<th>접수일시</th>
														<th>회원번호</th>
														<th>고객명수</th>
														<th>발신번호</th>
														<th>처리유형</th>
														<th>상담유형</th>
														<th>처리상태</th>
														<th>문의내용</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
														<td>2018/11/11 12:18:15</td>
														<td>17088694</td>
														<td>김**</td>
														<td>032-123-1231</td>
														<td>일반</td>
														<td>상담됨 ></td>
														<td>완료</td>
														<td>주차관리</td>
													</tr>
													<tr>
														<td>2</td>
														<td>2018/11/11 12:18:15</td>
														<td>17088694</td>
														<td>김**</td>
														<td>032-123-1231</td>
														<td>일반</td>
														<td>상담됨 ></td>
														<td>완료</td>
														<td>주차관리</td>
													</tr>
													<tr>
														<td>3</td>
														<td>2018/11/11 12:18:15</td>
														<td>17088694</td>
														<td>김**</td>
														<td>032-123-1231</td>
														<td>일반</td>
														<td>상담됨 ></td>
														<td>완료</td>
														<td>주차관리</td>
													</tr>
													<tr>
														<td>4</td>
														<td>2018/11/11 12:18:15</td>
														<td>17088694</td>
														<td>김**</td>
														<td>032-123-1231</td>
														<td>일반</td>
														<td>상담됨 ></td>
														<td>완료</td>
														<td>주차관리</td>
													</tr>
													<tr>
														<td>5</td>
														<td>2018/11/11 12:18:15</td>
														<td>17088694</td>
														<td>김**</td>
														<td>032-123-1231</td>
														<td>일반</td>
														<td>상담됨 ></td>
														<td>완료</td>
														<td>주차관리</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div role="tabpanel" id="tab3" class="tab-pane">
										<div class="panel-body">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>일시</th>
														<th>전화번호</th>
														<th>시도횟수</th>
														<th>처리상태</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2018/11/11</td>
														<td>010-7777-7777</td>
														<td>123</td>
														<td><select class="form-control">
																<option>option 1</option>
																<option>option 2</option>
																<option>option 3</option>
																<option>option 4</option>
														</select></td>
													</tr>
													<tr>
														<td>2018/11/11</td>
														<td>010-7777-7777</td>
														<td>123</td>
														<td><select class="form-control">
																<option>option 1</option>
																<option>option 2</option>
																<option>option 3</option>
																<option>option 4</option>
														</select></td>
													</tr>
													<tr>
														<td>2018/11/11</td>
														<td>010-7777-7777</td>
														<td>123</td>
														<td><select class="form-control">
																<option>option 1</option>
																<option>option 2</option>
																<option>option 3</option>
																<option>option 4</option>
														</select></td>
													</tr>
													<tr>
														<td>2018/11/11</td>
														<td>010-7777-7777</td>
														<td>123</td>
														<td><select class="form-control">
																<option>option 1</option>
																<option>option 2</option>
																<option>option 3</option>
																<option>option 4</option>
														</select></td>
													</tr>
													<tr>
														<td>2018/11/11</td>
														<td>010-7777-7777</td>
														<td>123</td>
														<td><select class="form-control">
																<option>option 1</option>
																<option>option 2</option>
																<option>option 3</option>
																<option>option 4</option>
														</select></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div role="tabpanel" id="tab4" class="tab-pane">
										<div class="panel-body">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>발송일</th>
														<th>제목</th>
														<th>발송자</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2018/10/12</td>
														<td>ㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇ</td>
														<td>네글자임</td>
													</tr>
													<tr>
														<td>2018/10/12</td>
														<td>ㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇ</td>
														<td>네글자임</td>
													</tr>
													<tr>
														<td>2018/10/12</td>
														<td>ㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇ</td>
														<td>네글자임</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div role="tabpanel" id="tab5" class="tab-pane">
										<div class="panel-body">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>발송일</th>
														<th>내용</th>
														<th>발송자</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2018/11/12</td>
														<td>ㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇ</td>
														<td>네글자임</td>
													</tr>
													<tr>
														<td>2018/11/12</td>
														<td>ㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇ</td>
														<td>네글자임</td>
													</tr>
													<tr>
														<td>2018/11/12</td>
														<td>ㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇ</td>
														<td>네글자임</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div role="tabpanel" id="tab6" class="tab-pane">
										<div class="panel-body">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>발송일</th>
														<th>내용</th>
														<th>발송자</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>2018/09/12</td>
														<td>ㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇ</td>
														<td>네글자임</td>
													</tr>
													<tr>
														<td>2018/09/12</td>
														<td>ㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇ</td>
														<td>네글자임</td>
													</tr>
													<tr>
														<td>2018/09/12</td>
														<td>ㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇ</td>
														<td>네글자임</td>
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
				<div class="ibox-right">
					<div class="ibox clearfixt ml-0">
						<div class="ibox-title">
							<h4>고객정보</h4>
						</div>
						<div class="ibox-content">
							<ul class="pl-0 mb-2 right-ul">
								<li class="mr-2">
									<div class="i-checks">
										<label>회원번호 <input type="radio" name=""><i></i></label>
									</div>
								</li>
								<li class="mr-2">
									<div class="i-checks">
										<label>회원성명 <input type="radio" name=""><i></i></label>
									</div>
								</li>
								<li class="mr-2">
									<div class="i-checks">
										<label>전화번호 <input type="radio" name=""><i></i></label>
									</div>
								</li>
								<li class="mr-2">
									<div class="i-checks mr-2">
										<label>주민번호 <input type="radio" name=""><i></i></label>
									</div>
								</li>
								<li><input type="text" class="form-control"></li>
							</ul>
							<div class="table-area">
								<div class="table-box">
									<table class="table table-bordered">
										<colgroup>
											<col style="width: 50px;" />
											<col style="width: 100px;" />
											<col style="width: 100px;" />
											<col style="width: 150px;" />
											<col style="width: auto;" />
										</colgroup>
										<thead>
											<tr>
												<th width="50px">No.</th>
												<th width="100px">회원번호</th>
												<th width="100px">이름</th>
												<th width="150px">주민번호</th>
												<th width="auto">주소</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>15654654</td>
												<td>이름입니다</td>
												<td>123456-7894561</td>
												<td>주소입니다주소입니다주소입니다주소입니다주소입니다주소입니다</td>
											</tr>
											<tr>
												<td>1</td>
												<td>15654654</td>
												<td>이름입니다</td>
												<td>123456-7894561</td>
												<td>주소입니다주소입니다주소입니다주소입니다주소입니다주소입니다</td>
											</tr>
											<tr>
												<td>1</td>
												<td>15654654</td>
												<td>이름입니다</td>
												<td>123456-7894561</td>
												<td>주소입니다주소입니다주소입니다주소입니다주소입니다주소입니다</td>
											</tr>
											<tr>
												<td>1</td>
												<td>15654654</td>
												<td>이름입니다</td>
												<td>123456-7894561</td>
												<td>주소입니다주소입니다주소입니다주소입니다주소입니다주소입니다</td>
											</tr>
											<tr>
												<td>1</td>
												<td>15654654</td>
												<td>이름입니다</td>
												<td>123456-7894561</td>
												<td>주소입니다주소입니다주소입니다주소입니다주소입니다주소입니다</td>
											</tr>
											<tr>
												<td>1</td>
												<td>15654654</td>
												<td>이름입니다</td>
												<td>123456-7894561</td>
												<td>주소입니다주소입니다주소입니다주소입니다주소입니다주소입니다</td>
											</tr>
											<tr>
												<td>1</td>
												<td>15654654</td>
												<td>이름입니다</td>
												<td>123456-7894561</td>
												<td>주소입니다주소입니다주소입니다주소입니다주소입니다주소입니다</td>
											</tr>
											<tr>
												<td>1</td>
												<td>15654654</td>
												<td>이름입니다</td>
												<td>123456-7894561</td>
												<td>주소입니다주소입니다주소입니다주소입니다주소입니다주소입니다</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="ibox-content bot-cont">
						<div class="tabs-container">
							<ul class="nav nav-tabs clearfix d-inline-block w-100"
								role="tablist">
								<li><a class="nav-link active" data-toggle="tab"
									href="#rightTab1">통합 검색</a></li>
								<li><a class="nav-link" data-toggle="tab" href="#rightTab2">고객
										상세정보</a></li>
								<li><a class="nav-link" data-toggle="tab" href="#rightTab3">상담
										상세정보</a></li>
								<div class="btn-area float-right">
									<button class="btn btn-primary btn-sm">정보수정</button>
								</div>
							</ul>
							<div class="tab-content">
								<div role="tabpanel" id="rightTab1" class="tab-pane active">
									<div class="panel-body clearfix">
										<!-- <div class="panel-left">
                                        <div class="input-group">
                                            <input type="text" class="form-control">
                                            <span class="input-group-addon">
                                                <a href="javascript:void(0);"><i class="fa fa-search"></i></a>
                                            </span>
                                        </div>
                                    </div> -->
									</div>
								</div>
								<div role="tabpanel" id="rightTab2" class="tab-pane">
									<div class="panel-body"></div>
								</div>
								<div role="tabpanel" id="rightTab3" class="tab-pane">
									<div class="panel-body"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ibox-bottom">
				<div class="ibox">
					<div class="ibox-content clearfix">
						<h3 class="float-left">개인전광판</h3>
						<ul class="call-option float-left">
							<li class="call-tit">평균통화</li>
							<li class="yellow"><strong>00:01:30</strong></li>
							<li class="call-tit">평균대기</li>
							<li><strong>00:01:30</strong></li>
							<li class="call-tit">응대율</li>
							<li><strong>89%</strong></li>
							<li class="call-tit">누적통화시간</li>
							<li class="yellow"><strong>00:01:30</strong></li>
							<li class="call-tit">VB</li>
							<li><strong>20 건</strong></li>
							<li class="call-tit">O/B</li>
							<li><strong>3 건</strong></li>
							<li class="call-tit">미처리</li>
							<li><strong>0</strong></li>
							<li class="call-tit">콜백</li>
							<li><strong>0</strong></li>
							<li class="call-tit">예약</li>
							<li><strong>0</strong></li>
						</ul>
						<div class="btn-area float-right mr-3">
							<button class="btn btn-primary btn-sm">
								상담스크립트 <i class="fa fa-pen"></i>
							</button>
							<button class="btn btn-primary btn-sm ml-1">
								KMS <i class="fa fa-list-alt"></i>
							</button>
							<button class="btn btn-primary btn-sm ml-1">
								문자보내기 <i class="fa fa-envelope"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- E: 고객 등록 ppt p02~p05 -->


		</div>
	</div>
<%@ include file="/WEB-INF/views/template/inc/vocjsinc.jsp"%>
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
        });
</script>
	<!-- E: 추가 js -->
</body>

</html>
