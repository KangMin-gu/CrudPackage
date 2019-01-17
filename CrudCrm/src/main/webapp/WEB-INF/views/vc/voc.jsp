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
	<div class="col-lg-12" style="padding-left: 0px;padding-right: 0px;">
		<div id="page-wrapper" class="gray-bg">
			<div class="ibox-top">
				<div class="ibox">
					<div class="ibox-content clearfix">
						<ul class="top-btn">
							<li>유입경로</li>
							<li><input type="text" class="form-control" id="test" onchange="test(this)"></li>
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
			<div class="wrapper wrapper-content row">
				<div class="ibox-left col-lg-6">
					<div class="ibox clearfix">
						<div class="ibox-content pt-0 row">
							<div class="ibox-title">
								<h4>고객정보 조회</h4>
							</div>
							<div class="col-lg-12">
								<table class="table table-bordered mb-2">
									<colgroup>
										<col style="width: 100px; background: #fafafa;">
										<col style="width: auto;">
										<col style="width: 100px; background: #fafafa;">
										<col style="width: auto;">
										<col style="width: 100px; background: #fafafa;">
										<col style="width: auto;">
									</colgroup>
									<tbody>
										<tr>
											<th>발신번호</th>
											<td><input type="text" class="form-control" disabled></td>
											<th>고객명</th>
											<td><input type="text" class="form-control"></td>
											<th>고객구분</th>
											<td><select class="form-control"></select></td>
										</tr>
										<tr>
											<th>집전화</th>
											<td><input type="text" class="form-control"></td>
											<th>관련고객</th>
											<td><input type="text" class="form-control"></td>
											<th>고객등급</th>
											<td><input type="text" class="form-control"></td>
											
										</tr>
									</tbody>
								</table>
								<table class="table table-bordered mb-2">
									<colgroup>
										<col style="width: 100px; background: #fafafa;">
										<col style="width: auto;">
									</colgroup>
									<tbody>
										<tr>
											<th>이메일</th>
											<td><input type="text" class="form-control"></td>
										</tr>
										<tr>	
											<th>고객주소</th>
											<td class="border-top-0">
												<div class="input-group col-lg-3 pl-0 float-left">
													<input type="text" class="form-control daumzip" name="homaddr1" id="homaddr1" readonly > 
													<span class="input-group-addon"> <a href="#" ><i class="fa fa-search daumzip" id="homaddr1" ></i></a></span>
												</div> 
												<input type="text" class="form-control col-lg-4 float-left mr-3 mt-sx-1" name="homaddr2" id="homaddr2" readonly>
												<input type="text" class="form-control float-left col-lg-4 mt-sx-1 validate allV" name="homaddr3" id="homaddr3">
											</td>
										</tr>
										<tr>	
											<th>배송지주소</th>
											<td class="border-top-0">
												<div class="input-group col-lg-3 pl-0 float-left">
													<input type="text" class="form-control daumzip" name="wrkaddr1" id="wrkaddr1" readonly > 
													<span class="input-group-addon"> <a href="#" ><i class="fa fa-search daumzip" id="wrkaddr1" ></i></a></span>
												</div> 
												<input type="text" class="form-control col-lg-4 float-left mr-3 mt-sx-1" name="wrkaddr2" id="wrkaddr2" readonly>
												<input type="text" class="form-control float-left col-lg-4 mt-sx-1 validate allV" name="wrkaddr3" id="wrkaddr3">
											</td>
										</tr>
										<tr>
											<th>이력 및 메모</th>
											<td><textarea rows="5" cols="120"></textarea></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="btn-area text-right">
								<button class="btn btn-primary btn-sm">기본정보수정</button>
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
													
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					

				</div>
				<div class="ibox-left col-lg-6">
					<div class="ibox clearfix">
						<div class="ibox-content pt-0 row">
							<div class="ibox-title">
								<h4>고객정보 조회</h4>
							</div>
							<div class="col-lg-12">
							
								<table class="table table-bordered mb-2">
									<colgroup>
										<col style="width: 100px; background: #fafafa;">
										<col style="width: auto;">
										<col style="width: 100px; background: #fafafa;">
										<col style="width: auto;">
									</colgroup>
									<tbody>
									<tr>
										<th>상담구분</th>
										<td><input type="radio" /></td>
										<th>상담템플릿</th>
										<td><select></select></td>
									</tr>
									</tbody>
								</table>
								<table class="table table-bordered mb-2">
									<colgroup>
										<col style="width: 100px; background: #fafafa;">
										<col style="width: auto;">
									</colgroup>
									<tbody>
										<tr>
											<th>상담유형</th>
											<td><select></select></td>
											<td><select></select></td>
											<td><select></select></td>
										</tr>
										<tr>
											<th>접수제품</th>
											<td><input type="text" class="form-control"></td>
											<td><input type="text" class="form-control"></td>
											<td><input type="text" class="form-control"><button></button></td>
										</tr>
									</tbody>
								</table>
								<table class="table table-bordered mb-2">
									<colgroup>
										<col style="width: 100px; background: #fafafa;">
										<col style="width: auto;">
									</colgroup>
									<tbody>
										<tr>
											<th>접수내용</th>
											<td><textarea rows="5" cols="120"></textarea></td>
										</tr>
										<tr>
											<th>상담내용</th>
											<td><textarea rows="15" cols="120"></textarea></td>
										</tr>
										<tr>
											<th>상담결과</th>
											<td><input type="radio" /></td>
										</tr>
										<tr>
											<th>이력 및 메모</th>
											<td><textarea rows="5" cols="120"></textarea></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="btn-area text-right">
								<button class="btn btn-primary btn-sm">저장</button>
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
	</div>
<%@ include file="/WEB-INF/views/template/inc/vocjsinc.jsp"%>
<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

        
        $('#test').change(function(){
        	alert("test");
        });
</script>
	<!-- E: 추가 js -->
</body>

</html>
