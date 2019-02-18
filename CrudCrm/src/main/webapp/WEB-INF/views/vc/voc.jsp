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
<%@ include file="/WEB-INF/views/template/inc/voclinkinc.jsp"%>
<link href="${pageContext.request.contextPath}/resources/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
</head>
	<body>
    <div id="wrap" style="margin-top: 0px;">
        <div class="ibox-top">
            <div class="ibox-content clearfix">
            <div class="cti" style="display:none">
           		 서버아이피: <input type="text" name="cti_server_ip" id="cti_server_ip" value="127.0.0.1">
				웹소켓아이피: <input type="text" name="cti_server_socket_ip" id="cti_server_socket_ip" value="203.239.159.133">
				서버포트: <input type="text" name="cti_server_port" id="cti_server_port" value="7070">
				<input type="button" value="웹소켓접속" onclick="webSocketGo();">
				<input type="button" value="웹소켓끊기" onclick="func_logout();goWebSocketDisconnect();">
				<br/>
				아이디 : <input type="text" name="cti_login_id" id="cti_login_id" value="crud01">
				비밀번호 : <input type="text" name="cti_login_pwd" id="cti_login_pwd" value="0000">
				전화번호 : <input type="text" name="cti_login_ext" id="cti_login_ext" value="07042622864">
				<input type="hidden" name="checkGroupValue" id="checkGroupValue" value="N">
				<input type="hidden" name="checkGroupValue2" id="checkGroupValue2" value="N">
				<span id="outCallNum">07042622886</span>
				<input type="checkbox" class="check" id="did" onclick="javascript:didCheck();">
				<div>
					<textarea id="messages" cols="150" rows="10"></textarea>
					<input type="button" value="로그초기화" onclick="javascript:document.getElementById('messages').value='';">
					<select name="callGroup" id="callGroup" style="width:131px;" onchange="javascrpt:changeGroup();"></select>
				</div>
            </div>
                    <ul class="top-btn">
                    	<li>수신번호 </li>
                        <li><input name="makeCallNum" id="makeCallNum" type="text" style="width:90px;ime-mode:disabled" onKeyPress="return CheckNumeric();" onPaste="return fnPaste();" class="cti_input"></li>
                        <li class="liBtn"><button onclick="javascript:didCheckMakeCall();" class="btn btn-primary btn-sm" id="dialingBtn">걸기 <i class="fa fa-phone"></i></button></li>
                        <li class="liBtn"><button onclick="javascript:func_answer();" class="btn btn-primary btn-sm" id="answerBtn">받기 <i class="fa fa-phone"></i></button></li>
                        <li class="liBtn"><button onclick="javascript:func_pickup();" class="btn btn-primary btn-sm" id="pickupBtn">당겨받기 <i class="fa fa-phone"></i></button></li>
                        <li class="liBtn"><button onclick="javascript:func_hangup();" class="btn btn-primary btn-sm" id="hangUpBtn">끊기 <i class="fa fa-phone"></i></button></li>
                        <li class="liBtn"><button onClick="javascript:func_hold();" class="btn btn-primary btn-sm status" id="restBtn">보류 <i class="fa fa-times-circle"></i></button></li>
                        <li class="liBtn"><button onClick="javascript:func_unhold();" class="btn btn-primary btn-sm status" id="restBtn">보류해제 <i class="fa fa-times-circle-o"></i></button></li>
                        &nbsp; |&nbsp;
                        <li class="liBtn"><button onClick="javascript:func_changeTellerStatus('0300');"class="btn btn-primary btn-sm status" id="waitingBtn">대기 <i class="fa fa-spinner"></i></button></li>
                        <li class="liBtn"><button onClick="javascript:func_changeTellerStatus('R001');" class="btn btn-primary btn-sm status" id="restBtn">휴식 <i class="fa fa-coffee"></i></button></li>
                        <li class="liBtn"><button onClick="javascript:func_changeTellerStatus('W004');" class="btn btn-primary btn-sm status" id="postCleaningBtn">후처리 <i class="fa fa-phone"></i></button></li>&nbsp; | &nbsp;
                        <li class="liBtn"><button onClick="javascript:func_blindTransfer('','');" class="btn btn-primary btn-sm status" id="postCleaningBtn">블라인드호전환<i class="fa fa-mail-forward"></i></button></li>&nbsp; | &nbsp;
                        <li class="liBtn"><button onClick="javascript:func_threeWayCall();" class="btn btn-primary btn-sm status" id="postCleaningBtn">3자 통화<i class="fa fa-group"></i></button></li>&nbsp; | &nbsp;
                        <li><span id="timer">00 : 00 : 00</span></li>&nbsp; | &nbsp;
                        <li class="liBtn2"><span>상담창 상태</span>
                        <strong><span id="status">연결안됨</span></strong>
                        <li class="mr-2 ml-2"><strong>고객대기 <span id="cti_waitting_cnt">0</span></strong></li>
                        <li class="float-right">
                            <ul class="top-ul03">
                                <li onClick="window.open('notice.html','','resizable=yes,menubar=no,toolbar=yes,width=850,height=500,scrollbars=yes')">
                                    <i class="fa fa-bell"></i>
                                    <span class="li-text">3</span>
                                </li>
                                <li>
                                	<i id="menu" class="fa fa-bars"></i>
                                	<span id="vocLogInSpan"><i class="fa fa-power-off" style="color:#ff5555e8 ;" id="vocLogInBtn" onclick="vocLoginGo();"></i></span>
                                	<span id="vocLogOutSpan" style="display:none;"><i class="fa fa-power-off" style="color: #85ff00f5;" id="vocLogOutBtn" onclick="func_logout();"></i></span>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
        </div>
        <div class="wrapper wrapper-content" style="padding-top: 5px;">
            <div class="ibox clearfix">
           
                <div class="ibox-left">
                    <div class="ibox-content left-cont pt-0">
                    <div class="row alert alert-danger" id="blackDiv" style="margin-left: 0px;margin-right: 0px;padding-top: 6px;padding-bottom: 6px;display:none;">
                    	<b>블랙 리스트에 등록 되어 있는 고객입니다.</b>
                    </div>
                    <div id="custHiddenDiv">
                    	<input type="hidden" id="bcustno" name="bcustno" value="0" />
                    	<input type="hidden" id="blackcnt" name="blackcnt" value="0" />
                    	<input class="custInput" type="hidden" id="custno" name="custno" value="0" />
                    </div>
                        <table class="table table-bordered mb-2">              	
                            <colgroup>
                                <col style="width: 100px; background: #fafafa;">
                                <col style="width: auto; min-width: 250px;">
                                <col style="width: 100px; background: #fafafa;">
                                <col style="width: auto;min-width: 250px;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>검색번호</th>
                                    <td>	
                                        <input type="text" class="form-control" onkeyup="enterkey(this);" id="phone" name="phone" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                    </td>
                                    <th>고객명</th>
                                    <td>
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
            								<span class="input-group-addon"><a href="#"><i class="fa fa-search daumzip" id="homaddr1"></i></a>
            								</span>
            							</div>
            							<input type="text" class="form-control float-left mr-2 custInput" name="homaddr2" id="homaddr2" readonly style="width: 220px;">
            							<input type="text" class="form-control float-left custInput" name="homaddr3" id="homaddr3" style="width: 220px;">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
                            <div class="col-lg-4 col-sm-4 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
                             	<span id="regSpan"></span> 
                            </div>                                       
                            <div class="col-lg-4 col-sm-4 float-right text-right mb-2 w-100" style="padding-right: 0px;">    		
								<span id="addBlackSpan">
                            		<button class="btn btn-primary btn-sm" id="addBlackBtn" onClick="addBlack()">블랙 추가</button>
                            	</span>
                            	<span id="cancleBlackSpan" style="display:none;">
                            		<button class="btn btn-primary btn-sm" id="cancleBlackBtn" onClick="cancleBlack()">블랙 해제</button>
                            	</span>
                         	</div>
                         </div>
                        
                    </div>
                    <div class="ibox-content bot-cont">
                        
                        <div class="tabs-container">
                            <ul class="nav nav-tabs" role="tablist">
                                <li><a class="nav-link" onClick="javascript:tabTargetVocService(1);" data-toggle="tab" href="#tab1" id="tab1Btn">서비스</a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab2">강성고객이력</a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab3">콜백이력</a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab4">SMS</a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab5">MMS</a></li>
                                <li><a class="nav-link" data-toggle="tab" href="#tab6">LMS</a></li>
                                <li><a class="nav-link" onClick="javascript:tabTargetVocEmail(1);" data-toggle="tab" href="#tab7">이메일</a></li>
                            </ul>
                            <div class="tab-content">
                                <div role="tabpanel" id="tab1" class="tab-pane active">
                                    <div class="panel-body">
                                        <table class="table table-bordered" style="margin-bottom: 16px;">
                                            <thead>
                                                <tr>
                                                    <th>서비스명</th>
                                                    <th>접수일시</th>
                                                    <th>상담유형</th>
                                                    <th>접수자</th>
                                                    <th>고객명</th>
                                                    <th>접수제품</th>
                                                    <th>처리자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                        <div class="m-auto" style="text-align:center;padding-top:16px">
											<ul class="pagination"></ul>
										</div>
                                    </div>
                                </div>
                                <div role="tabpanel" id="tab2" class="tab-pane">
                                    <div class="panel-body">
                                        <table class="table table-bordered" style="margin-bottom: 16px;">
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
                                        <div class="m-auto" style="text-align:center;padding-top:16px">
											<ul class="pagination"></ul>
										</div>
                                    </div>
                                </div>
                                <div role="tabpanel" id="tab3" class="tab-pane">
                                    <div class="panel-body">
                                        <table class="table table-bordered" style="margin-bottom: 16px;">
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
                                        <div class="m-auto" style="text-align:center;padding-top:16px">
											<ul class="pagination"></ul>
										</div>
                                    </div>
                                </div>
                                <div role="tabpanel" id="tab4" class="tab-pane">
                                    <div class="panel-body">
                                        <table class="table table-bordered" style="margin-bottom: 16px;">
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
                                        <div class="m-auto" style="text-align:center;padding-top:16px">
											<ul class="pagination"></ul>
										</div>
                                    </div>
                                </div>
                                <div role="tabpanel" id="tab5" class="tab-pane">
                                    <div class="panel-body">
                                        <table class="table table-bordered" style="margin-bottom: 16px;">
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
                                        <div class="m-auto" style="text-align:center;padding-top:16px">
											<ul class="pagination"></ul>
										</div>
                                    </div>
                                </div>
                                <div role="tabpanel" id="tab6" class="tab-pane">
                                    <div class="panel-body">
                                        <table class="table table-bordered" style="margin-bottom: 16px;">
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
                                                <tr>
                                                    <td>2018-01-01 11:88:88</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>박진열</td>
                                                    <td>박진열</td>
                                                    <td>처리자</td>
                                                </tr>
                                                <tr>
                                                    <td>2018-01-01 11:88:88</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>박진열</td>
                                                    <td>박진열</td>
                                                    <td>처리자</td>
                                                </tr>
                                                <tr>
                                                    <td>2018-01-01 11:88:88</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>CRUD</td>
                                                    <td>박진열</td>
                                                    <td>박진열</td>
                                                    <td>처리자</td>
                                                </tr>
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
                                        <div class="m-auto" style="text-align:center;padding-top:16px">
											<ul class="pagination"></ul>
										</div>
                                    </div>
                                </div>
                                <div role="tabpanel" id="tab7" class="tab-pane">
                                    <div class="panel-body">
                                        <table class="table table-bordered" style="border-top: 1px solid #e7eaec;">
                                            <thead>
                                                <tr>
                                                	<th>제목</th>
                                                    <th>수신 주소</th>
                                                    <th>발신 주소</th>
                                                    <th>발송 일시</th>
                                                    <th>발송 타입</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                        <div class="m-auto" style="text-align:center;padding-top:16px">
											<ul class="pagination"></ul>
										</div>
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
                            <col style="width: 100px; background: #fafafa;">
                            <col style="width: auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>접수구분</th>
                                <td colspan="3">
                                    <div class="i-checks servicetype voc">
                                    	<c:forEach var="serviceType" items="${SERVICETYPE }">
                                    		<label class="mr-2 mb-0"><input type="radio" value="${serviceType.codeval }" id="servicetype" name="servicetype">${serviceType.codename}</label>
                                        </c:forEach>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>접수유형</th>
                                <td colspan="3" class="clearfix">
                                    <select class="form-control float-left mr-2 col-sm-5 voc" name="servicecode1" id="servicecode1">
                                        <option label="선택" value=""/>
                                        <c:forEach var="serviceCode1" items="${SERVICECODE1 }">
                                            <c:choose>
                                                <c:when test="${serviceInfo.SERVICECODE1 eq serviceCode1.codeval}">
                                                	<option selected label="${serviceCode1.codename }" value="${serviceCode1.codeval }"/>
                                                </c:when>
                                                <c:otherwise>
                                                	<option label="${serviceCode1.codename }" value="${serviceCode1.codeval }"/>
                                            	</c:otherwise>
                                        	</c:choose>
                                    	</c:forEach>
                                    </select>
                                    <select class="form-control float-left mr-2 col-sm-5 voc" name="servicecode2" id="servicecode2" upper ="servicecode1">
                                        <option label="선택" value=""/>
                                        
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>접수제품</th>
                                <td colspan="3">
                                    <div class="select-area mt-1">
                                        <!-- S: 이 영역을 계속 추가 하면 됨 -->
                                         <div class="select-box mb-1 product" style="height: 29px;">
                                            <select id="product11" name="product11"  class="form-control d-inline-block mr-2 voc">
                                            	<option value="">선택</option>
                                                <c:forEach var="productB" items="${productB }">
                                            		<option label="${productB.prdname }" value="${productB.prdno }"/>
                                    			</c:forEach>
                                            </select>
                                            <select id="product12" name="product12"  class="form-control d-inline-block mr-2 voc">
                                            	<option value="">선택</option>
                                            </select>
                                            <select id="product13" name="product13" class="form-control d-inline-block mr-2 voc">
                                            	<option value="">선택</option>
                                            </select>
                                            <button class="plus btn btn-primary d-inline-block btn-sm mr-2">추가</button>
                                            <button class="minus btn btn-primary d-inline-block btn-sm mr-2">삭제</button>
                                        </div>
                                        <!-- E: 이 영역을 계속 추가 하면 됨 -->
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>접수내용</th>
                                <td colspan="3">
                                    <input type="text"class="form-control voc" name="servicename" id="servicename" value="${vocInfo.SERVICENAME }">
                                </td>
                            </tr>
                            <tr>
                                <th>상담내용</th>
                                <td colspan="2">
                                    <textarea name="servicedesc" id="servicedesc" class="form-control voc" cols="1500" style="height: 350px; resize: none;"></textarea>
                                </td>
                                <td colspan="1" style="width: 150px;">
                                
								</td>
                            </tr>
                            <tr class="as">
                            	<th>방문일시</th>
                            	<td>
                            		<div class="input-group" data-autoclose="true">
                            			<span class="input-group-addon">
                                    		<span class="fa fa-calendar"></span>
                                		</span>
                                		<input type="text" class="form-control voc" readOnly="true" name="visitdate" id="visitdate" value="">
                            		</div>
                            	</td>
                            	<th>방문 기사</th>
                            	<td>
                            		<div class="input-group asowner" id="asowner_">
                            			<input type="text" class="form-control voc" autocomplete="off" name="asowner_" value="">
                                        <input type="hidden" name="asowner" class="voc" id="asowner" value="">
                                        <span class="input-group-addon">
                                        	<a><i class="fa fa-search"></i></a>
                                        </span>
                                	</div>
                                </td>
                            </tr>
                            <tr class="as">
                            	<th>방문지 주소</th>
                            	<td colspan="3">
            						<div class="input-group pl-0 float-left mr-2" style="width: 180px;">
            							<input type="text" class="form-control custInput daumzip voc" name="visitaddr1" id="visitaddr1" readonly>
            							<span class="input-group-addon"><a href="#"><i class="fa fa-search daumzip"></i></a></span>
            						</div>
            						<input type="text" class="form-control float-left mr-2 custInput voc" name="visitaddr2" id="visitaddr2" readonly style="width: 220px;">
            						<input type="text" class="form-control float-left custInput voc" name="visitaddr3" id="visitaddr3" style="width: 220px;">
            						<input type="radio" class="i-checks voc" value="" id="addrsame" name="addrsame">
            						<label>고객주소와 동일</label>
                                </td>                                
                            </tr>
                            <tr class="result">
                                <th>상담결과</th>
                                <td colspan="3">
                                    <div class="i-checks voc">
                                        <label class="mr-2 mb-0"><input type="radio" class="check" value="4" id="vocstep4" name="vocstep"> 처리</label>
                                        <!-- <label class="mb-0"><input type="radio" class="check" value="4" id="vocstep3" name="vocstep"> 상담예약</label>-->
                                        <label class="mr-2 mb-0"><input type="radio" class="check" value="6" id="vocstep6" name="vocstep"> 담당자 이관</label>
                                        <label class="mr-2 mb-0"><input type="radio" class="check" value="7" id="vocstep7" name="vocstep"> 상급자 이관</label>
                                    </div>
                                </td>
                            </tr>
                            <tr class="convey">
                            	<th>이관 담당자 </th>
                            	<td colspan="1">
                            		<div class="input-group owner" id="nextowner_">
                            			<input type="text" class="form-control voc" autocomplete="off" name="nextowner_" value="">
                                        <input type="hidden" name="nextowner voc" id="nextowner" value="">
                                        <span class="input-group-addon">
                                        	<a><i class="fa fa-search"></i></a>
                                        </span>
                                    </div>
                            	</td>
                            	<th>이관 사유</th>
                            	<td colspan="1">
                            		<select class="form-control voc" name="conveyreason" id="conveyreason">
										<option label="선택" value=""/>
                                       	<c:forEach var="conveyReason" items="${CONVEYREASON }">
                                       		<option label="${conveyReason.codename }" value="${conveyReason.codeval }"/>
                                       	</c:forEach>
                                    </select>
                            	</td>
                            </tr>
                            <tr class="convey">
                            	<th>비고</th>
                            	<td colspan="3">
                            		<textarea id="conveydesc" class="form-control voc" name="conveydesc" cols="80" rows="3"></textarea>
                            	</td>
                            </tr>
                            <tr class="adminconvey">
                            	<th>상급 담당자 </th>
                            	<td colspan="1">
                            		<div class="input-group adminowner" id="nextadminowner_">
                            			<input type="text" class="form-control voc" autocomplete="off" name="nextadminowner_" value="">
                                        <input type="hidden" name="nextadminowner voc" id="nextadminowner" value="">
                                        <span class="input-group-addon">
                                        	<a><i class="fa fa-search"></i></a>
                                        </span>
                                    </div>
                            	</td>
                            	<th>이관 사유</th>
                            	<td colspan="1">
                            		<select class="form-control voc" name="conveyreason" id="conveyreason">
										<option label="선택" value=""/>
                                       	<c:forEach var="conveyReason" items="${CONVEYREASON }">
                                       		<option label="${conveyReason.codename }" value="${conveyReason.codeval }"/>
                                       	</c:forEach>
                                    </select>
                            	</td>
                            </tr>
                            <tr class="adminconvey">
                            	<th>비고</th>
                            	<td colspan="3">
                            		<textarea id="conveydesc" class="form-control voc" name="conveydesc" cols="80" rows="3"></textarea>
                            	</td>
                            </tr>
                            <tr class="reservation">
                            	<th>예약 전화번호
                            	<td>
                            		<input type="text" class="form-control voc" autocomplete="off" id="reservphone" name="reservphone" value="">
                            	</td>
                            	<th>예약 일시
                            	<td>
                            		<div class="input-group date" data-autoclose="true">
                            			<span class="input-group-addon">
                                    		<span class="fa fa-calendar"></span>
                                		</span>
                                		<input type="text"  class="form-control date voc" name="reservdate" id="reservdate" value="">
                            		</div>	
                            	</td>
                            </tr>
                            <tr class="reservation">
                            	<th>예약 시간
                            	<td colspan="3">
                            		<div class="input-group p-0 ">
                                        <div class="d-flex clockpicker clock01 col-lg-5 col-md-5 p-0 col-5">
                                    	    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span><input type="text" class="form-control voc" autocomplete=off name="reservtimefrom" id="reservtimefrom" value="">
                                        </div>
                                        <h3 class="text-center col-lg-1 col-1 p-0">~</h3>
                                        <div class="d-flex clockpicker clock02 col-lg-5 col-md-5 p-0 col-5">
                                        	<span class="input-group-addon"><i class="fa fa-clock-o"></i></span><input type="text" class="form-control voc" autocomplete=off name="reservtimeto" id="reservtimeto" value="">
                                        </div>
                                    </div>
                            			
                            	</td>
                            </tr>
                            <tr>
                                <th>이력 및 메모</th>
                                <td colspan="3" >
                                    <textarea name="memo" id="memo" class="form-control voc" style="height: 150px; resize: none;"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
                        <div class="col-lg-4 col-sm-4 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
                          	<button class="btn btn-primary btn-sm note" id="email">메일 발송</button>
                          	<button class="btn btn-primary btn-sm" id="sms">SMS 발송</button>
                          	<button class="btn btn-primary btn-sm" id="kakao">Kakao 발송</button> 
                        </div>                                       
                        <div class="col-lg-4 col-sm-4 float-right text-right mb-2 w-100" style="padding-right: 0px;">    		
                           	<button id="create" class="btn btn-primary btn-large">추가</button>
                        	<button id="save" class="btn btn-primary btn-large">저장</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ibox-bottom">
            <div class="ibox-content clearfix">
                <h3 class="float-left">개인전광판</h3>
                <ul class="call-option float-left">
                    <li class="call-tit">평균통화</li>
                    <li class="yellow"><strong><span id="avgCall">0</span></strong></li>
                    <li class="call-tit">평균대기</li>
                    <li><strong><span id="avgWait">0</span></strong></li>
                    <li class="call-tit">응대율</li>
                    <li><strong><span id="ResponseRate">0%</span></strong></li>
                    <li class="call-tit">누적통화시간</li>
                    <li class="yellow"><strong><span id="sumCall">0</span></strong></li>
                    <li class="call-tit">O/B</li>
                    <li><strong>3 건</strong></li>
                    <li class="call-tit">미처리</li>
                    <li><strong>0</strong></li>
                    <li class="call-tit">콜백</li>
                    <li><strong>0</strong></li>
                    <li class="call-tit">통화분배시도</li>
                    <li><span id="transferTryCnt"><strong>0</strong></span></li>
                    <li class="call-tit">통화분배연결</li>
                    <li><span id="transferConnectCnt"><strong>0</strong></span></li>
                    <li class="call-tit">인바운드시도</li>
                    <li><span id="ibTryCnt"><strong>0</strong></span></li>
                    <li class="call-tit">인바운드연결<li>
                    <li><span id="ibConnectCnt"><strong>0</strong></span></li>
                    <li class="call-tit">아웃바운드시도</li>
                    <li><span id="obTryCnt"><strong>0</strong></span></li>
                    <li class="call-tit">아웃바운드연결</li>
                    <li><span id="obConnectCnt"><strong>0</strong></span></li>
                </ul>
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
<%@ include file="/WEB-INF/views/template/inc/vocjsinc.jsp"%>
<script src="${pageContext.request.contextPath}/resources/js/plugins/clockpicker/clockpicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/crud/crud_sv.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/crud/crud_vc.js"></script>
<script src="${pageContext.request.contextPath}/resources/crud/cti.js"></script>

<script>
var intervalId;//전역변수
function sessMaintain(){//세션유지용
 	$.ajax({
       		url: "/vc/sess",
        	method: "GET",
        	dataType: "json",
        	cache: false,
        	success: function (data) {	           		
        		alert.log('t');//테스트 종료후 삭제
        	}
 	});
}
function intervalFuncOn(){
	var timer = 1740000;//29분마다 실행
	this.intervalId = setInterval("sessMaintain()",timer);
}
function intervalFuncOff(){//세션 유지 타이머 함수 종료 
	clearInterval(this.intervalId);
	this.intervalId = null;
}

$(document).ready(function () {
	
	$('.convey').hide();
	$('.adminconvey').hide();
	$('.reservation').hide();
	$('.as').hide();
	$('.product .minus:first').remove();
	
	var url = window.location.pathname;
	vocContents("0",url);
});
 
 $('#servicecode1').change(function(){
	 upperCode('servicecode1'); 
 });
 
 $('[name*=product]').change(function(){
	 upperProduct(this);
 });

 function addBlack(){
	 var custno = $('#custno').val();
	 if(custno > 0 ){
		 openNewWindow('voc','/vc/black/post','voc',700,480);
	 }else{
	 	alert('대상이 선택되지 않았습니다.');
	 }
 }
 
 //블랙해제
 function cancleBlack(){
	 var custno = $('#custno').val();
	 var urlStr = '/vc/black/del/'+custno;
	 $.ajax({
	        url: urlStr,
	        method: "GET",
	        dataType: "json",
	        cache: false,
	        success: function (data) {
	        	$('#blackcnt').val(0);
	        	$('#addBlackSpan').show();
				$('#cancleBlackSpan').hide();
				$('#blackDiv').hide();
	        	alert("해제 되었습니다.");
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
 };

 var second = "0";
 var min = "00";
 var countdown = setInterval(function(){
         //0초면 초기화 후 이동되는 사이트
 		
         if(second == 60){
        	 second = 00;
        	 min ++;
         }
         
         if(second < "10"){
        	 second = "0"+second;
         }
 	var time = min+" : "+second;
 	$('#timer').text(time);
 	second++;//카운트 증가
     }, 1000);
</script>

	
</body>

</html>