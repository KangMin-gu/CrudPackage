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
    <div id="wrap">
        <div class="ibox-top">
            <div class="ibox-content clearfix">
                    <ul class="top-btn">
                        <li>유입경로 </li>
                        <li><input type="text" class="form-control"></li>
                        <li class="mr-2"><input type="text" class="form-control"></li>
                        <li class="liBtn"><button class="btn btn-primary btn-sm">걸기 <i class="fa fa-phone"></i></button></li>
                        <li class="liBtn"><button class="btn btn-primary btn-sm">당겨받기 <i class="fa fa-phone"></i></button></li>&nbsp; |&nbsp;
                        <li class="liBtn"><button class="btn btn-primary btn-sm">대기 <i class="fa fa-spinner"></i></button></li>
                        <li class="liBtn"><button class="btn btn-primary btn-sm">휴식 <i class="fa fa-coffee"></i></button></li>
                        <li class="liBtn"><button class="btn btn-primary btn-sm">후처리 <i class="fa fa-phone"></i></button></li>&nbsp; | &nbsp;
                        <li>00 : 00 : 12</li>&nbsp; | &nbsp;
                        <li class="liBtn2"><span>상담창 상태</span> <button class="btn btn-default btn-sm">Out연결</button></li>
                        <li class="mr-2 ml-2"><strong>고객대기 <span>7</span></strong></li>
                        <li>
                            <ul class="top-ul02">
                                <li class="tit02">옴니채널</li>
                                <li>
                                    <i class="fa fa-comment"></i>
                                    <span class="li-text">3</span>
                                </li>
                                <li>
                                    <i class="fa fa-wifi"></i>
                                    <span class="li-text">3</span>
                                </li>
                                <li>
                                    <i class="fa fa-envelope"></i>
                                    <span class="li-text">3</span>
                                </li>
                                <li>
                                    <i class="fa fa-home"></i>
                                    <span class="li-text">3</span>
                                </li>
                            </ul>
                        </li>
                        <li class="float-right">
                            <ul class="top-ul03">
                                <li onClick="window.open('notice.html','','resizable=yes,menubar=no,toolbar=yes,width=850,height=500,scrollbars=yes')">
                                    <i class="fa fa-bell"></i>
                                    <span class="li-text">3</span>
                                </li>
                                <li><i class="fa fa-power-off"></i></li>
                                <li><i class="fa fa-bars"></i></li>
                            </ul>
                        </li>
                    </ul>
                </div>
        </div>
        <div class="wrapper wrapper-content">
            <div class="ibox clearfix">
                <div class="ibox-left">
                	<div class="ibox-content text-right" id="regDiv"></div>
                
                    <div class="ibox-content left-cont pt-0">
                        <table class="table table-bordered mb-2">
                            <colgroup>
                                <col style="width: 100px; background: #fafafa;">
                                <col style="width: auto; min-width: 250px;">
                                <col style="width: 100px; background: #fafafa;">
                                <col style="width: auto;min-width: 250px;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>수신번호</th>
                                    <td>	
                                        <input type="text" class="form-control" onkeyup="enterkey(this);" id="phone" name="phone" oninput="this.value = this.value.replace(/[^0-9. -]/g, '').replace(/(\..*)\./g, '$1');">
                                    </td>
                                    <th>고객명</th>
                                    <td>
                                    	<input class="custInput" type="hidden" id="custno" name="custno" value="0" />
                                    	<input type="text" class="form-control custInput" id="custname" name="custname">
                                    </td>
                                  </tr>
                                <tr>
                                	<th>휴대전화</th>
                                    <td>
                                    	<input type="text" class="form-control col-3 float-left mr-2 custInput" name="mobile1" id="mobile1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >        		
										<input type="text" class="form-control col-3 float-left mr-2 custInput" name="mobile2" id="mobile2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" > 
										<input type="text" class="form-control col-3 float-left mr-2 custInput" name="mobile3" id="mobile3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
                                    </td>
                                    <th>집전화</th>
                                    <td>
                                    	<input type="text" class="form-control col-3 float-left mr-2 custInput" name="homtel1" id="homtel1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >        		
										<input type="text" class="form-control col-3 float-left mr-2 custInput" name="homtel2" id="homtel2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" > 
										<input type="text" class="form-control col-3 float-left mr-2 custInput" name="homtel3" id="homtel3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
                                    </td>
                                </tr>
                                <tr>
                                    <th>고객구분</th>
                                    <td>
                                    	<select class="form-control custInput" name="custgubun" id="custgubun">
											<option value="0" ${custUpdate.CUSTGUBUN eq "0" ? "selected" :""}>선택</option>
											<c:forEach var="code" items="${CUSTGUBUN }">
                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                            </c:forEach>
										</select>
                                    </td>
                                    <th>관련고객</th>
                                    <td>
                                        <div class="input-group cust" id="relcustname">
                                            <input type="text" class="form-control" name="relcustname" readonly>
                                            <input class="custInput" type="hidden" id="relcustno" name="relcustno" value="0" />
                                            <span class="input-group-addon"><a href="#"><i class="fa fa-search cust"></i></a></span>
                                            <span class="input-group-addon"><a href="#"><i class="fa fa-times dataCancle"></i></a></span>  
                                        </div>
                                          
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td >
                                        <input type="text" class="form-control custInput" id="email" name="email" >
                                    </td>
                                    <th>등급</th>
                                    <td>
                                    	 <select class="form-control custInput" id="custgrade" name="custgrade">
											<option value="0" ${custUpdate.CUSTGRADE eq "0" ? "selected" :""}>선택</option>
											<c:forEach var="code" items="${CUSTGRADE }">
                                            	<option label="${code.codename }" value="${code.codeval }"/>
                                            </c:forEach>
										</select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td colspan="3">
            							<div class="input-group pl-0 float-left mr-2" style="width: 180px;">
            								<input type="text" class="form-control custInput daumzip" name="homaddr1" id="homaddr1" readonly>
            								<span class="input-group-addon"><a href="#"><i class="fa fa-search daumzip"></i></a>
            								</span>
            							</div>
            							<input type="text" class="form-control float-left mr-2 custInput" name="homaddr2" id="homaddr2" readonly style="width: 220px;">
            							<input type="text" class="form-control float-left custInput" name="homaddr3" id="homaddr3" style="width: 220px;">
                                    </td>
                                </tr>
                            	
                            </tbody>
                        </table>
                    </div>
                    <div class="ibox-content bot-cont">
                        <div class="btn-area text-right">
                            <button class="btn btn-primary btn-sm">SMS 발송</button>
                            <button class="btn btn-primary btn-sm">블랙추가</button>
                        </div>
                        <div class="tabs-container">
                            <ul class="nav nav-tabs" role="tablist">
                                <li><a class="nav-link active" data-toggle="tab" href="#tab1">상담이력</a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab2">강성고객이력</a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab3">콜백이력</a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab4">SMS</a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab5">MMS</a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab6">LMS</a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab7">이메일</a></li>
                            </ul>
                            <div class="tab-content">
                                <div role="tabpanel" id="tab1" class="tab-pane active">
                                    <div class="panel-body">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>접수일시1</th>
                                                    <th>상담구분</th>
                                                    <th>상담유형</th>
                                                    <th>접수자</th>
                                                    <th>고객명</th>
                                                    <th>접수제품</th>
                                                    <th>처리자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>2018-01-01 11:88:88</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>박진열</td>
                                                    <td>박진열</td>
                                                    <td>처리자</td>
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
                                                    <th>접수일시2</th>
                                                    <th>상담구분</th>
                                                    <th>상담유형</th>
                                                    <th>접수자</th>
                                                    <th>고객명</th>
                                                    <th>접수제품</th>
                                                    <th>처리자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>2018-01-01 11:88:88</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>박진열</td>
                                                    <td>박진열</td>
                                                    <td>처리자</td>
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
                                                    <th>접수일시3</th>
                                                    <th>상담구분</th>
                                                    <th>상담유형</th>
                                                    <th>접수자</th>
                                                    <th>고객명</th>
                                                    <th>접수제품</th>
                                                    <th>처리자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>2018-01-01 11:88:88</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>박진열</td>
                                                    <td>박진열</td>
                                                    <td>처리자</td>
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
                                                    <th>접수일시4</th>
                                                    <th>상담구분</th>
                                                    <th>상담유형</th>
                                                    <th>접수자</th>
                                                    <th>고객명</th>
                                                    <th>접수제품</th>
                                                    <th>처리자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>2018-01-01 11:88:88</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>박진열</td>
                                                    <td>박진열</td>
                                                    <td>처리자</td>
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
                                                    <th>접수일시5</th>
                                                    <th>상담구분</th>
                                                    <th>상담유형</th>
                                                    <th>접수자</th>
                                                    <th>고객명</th>
                                                    <th>접수제품</th>
                                                    <th>처리자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>2018-01-01 11:88:88</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>박진열</td>
                                                    <td>박진열</td>
                                                    <td>처리자</td>
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
                                                    <th>접수일시6</th>
                                                    <th>상담구분</th>
                                                    <th>상담유형</th>
                                                    <th>접수자</th>
                                                    <th>고객명</th>
                                                    <th>접수제품</th>
                                                    <th>처리자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>2018-01-01 11:88:88</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>박진열</td>
                                                    <td>박진열</td>
                                                    <td>처리자</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div role="tabpanel" id="tab7" class="tab-pane">
                                    <div class="panel-body">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>접수일시7</th>
                                                    <th>상담구분</th>
                                                    <th>상담유형</th>
                                                    <th>접수자</th>
                                                    <th>고객명</th>
                                                    <th>접수제품</th>
                                                    <th>처리자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>2018-01-01 11:88:88</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>박진열</td>
                                                    <td>박진열</td>
                                                    <td>처리자</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ibox-right">
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
                                <td>
                                    <div class="i-checks">
                                        <label class="mr-2 mb-0"><input type="radio" value="" name="a"> 문의</label>
                                        <label class="mb-0"><input type="radio" value="" name="a"> A/S</label>
                                    </div>
                                </td>
                                <th>상담 템플릿</th>
                                <td>
                                    <div class="input-group">
                                        <input type="text" class="form-control">
                                        <span class="input-group-addon">
                                            <a href="javascript:void(0);"><i class="fa fa-search"></i></a>
                                        </span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>상담유형</th>
                                <td colspan="3" class="clearfix">
                                    <select class="form-control float-left mr-2 col-sm-5">
                                        <option>option 2</option>
                                        <option>option 3</option>
                                        <option>option 4</option>
                                    </select>
                                    <select class="form-control float-left col-sm-5">
                                        <option>option 2</option>
                                        <option>option 3</option>
                                        <option>option 4</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>접수제품</th>
                                <td colspan="3">
                                    <div class="select-area mt-1">
                                        <!-- S: 이 영역을 계속 추가 하면 됨 -->
                                         <div class="select-box mb-1">
                                            <select class="form-control d-inline-block mr-2">
                                                <option>option 2</option>
                                                <option>option 3</option>
                                                <option>option 4</option>
                                            </select>
                                            <select class="form-control d-inline-block mr-2">
                                                <option>option 2</option>
                                                <option>option 3</option>
                                                <option>option 4</option>
                                            </select>
                                            <select class="form-control d-inline-block mr-2">
                                                <option>option 2</option>
                                                <option>option 3</option>
                                                <option>option 4</option>
                                            </select>
                                            <button class="btn btn-primary d-inline-block btn-sm mr-2">추가</button>
                                        </div>
                                        <!-- E: 이 영역을 계속 추가 하면 됨 -->
                                    </div>
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <th>접수내용</th>
                                <td colspan="3">
                                    <input type="text"class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <th>상담내용</th>
                                <td colspan="3">
                                    <textarea name="" id="" class="form-control" style="height: 200px; resize: none;"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>상담결과</th>
                                <td colspan="3">
                                    <div class="i-checks">
                                        <label class="mr-2 mb-0"><input type="radio" value="" name="b"> 완료</label>
                                        <label class="mr-2 mb-0"><input type="radio" value="" name="b"> 담당자 이관</label>
                                        <label class="mr-2 mb-0"><input type="radio" value="" name="b"> 상급자 이관</label>
                                        <label class="mb-0"><input type="radio" value="" name="b"> 상담예약</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>이력 및 메모</th>
                                <td colspan="3" >
                                    <textarea name="" id="" class="form-control" style="height: 150px; resize: none;"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btn-area text-right">
                        <button class="btn btn-primary btn-large">저장</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="ibox-bottom">
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
                    <button class="btn btn-primary btn-sm">상담스크립트 <i class="fa fa-pen"></i></button>
                    <button class="btn btn-primary btn-sm ml-1">KMS <i class="fa fa-list-alt"></i></button>
                    <button class="btn btn-primary btn-sm ml-1">문자보내기 <i class="fa fa-envelope"></i></button>
                </div>
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/views/template/inc/vocjsinc.jsp"%>
<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/crud/crud_vc.js"></script>
<script>



</script>

	
</body>

</html>
