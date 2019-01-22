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
                    <div class="ibox-content left-cont pt-0">
                        <table class="table table-bordered mb-2">
                            <colgroup>
                                <col style="width: 100px; background: #fafafa;">
                                <col style="width: auto;">
                                <col style="width: 100px; background: #fafafa;">
                                <col style="width: auto;">
                                <col style="width: 100px; background: #fafafa;">
                                <col style="width: 120PX;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>휴대전화</th>
                                    <td><input type="text"class="form-control"></td>
                                    <th>고객명</th>
                                    <td><input type="text"class="form-control"></td>
                                    <th>고객구분</th>
                                    <td>
                                        <select class="form-control">
                                            <option>option 2</option>
                                            <option>option 3</option>
                                            <option>option 4</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>집전화</th>
                                    <td><input type="text"class="form-control"></td>
                                    <th>관련고객</th>
                                    <td>
                                        <div class="input-group">
                                            <input type="text" class="form-control">
                                            <span class="input-group-addon">
                                                <a href="javascript:void(0);"><i class="fa fa-search"></i></a>
                                            </span>
                                        </div>
                                    </td>
                                    <th>등급</th>
                                    <td>
                                        <select class="form-control">
                                            <option>option 2</option>
                                            <option>option 3</option>
                                            <option>option 4</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td colspan="5">
                                        <input type="text"class="form-control">
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td colspan="5">
            							<div class="input-group pl-0 float-left mr-2" style="width: 180px;">
            								<input type="text" class="form-control" name="" id="">
            								<span class="input-group-addon"><a href="#"><i class="fa fa-search"></i></a>
            								</span>
            							</div>
            							<input type="text" class="form-control float-left mr-2" name="" id="" style="width: 220px;">
            							<input type="text" class="form-control float-left" name="" id="" style="width: 220px;">
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
                            <col style="width: 100px; background: #fafafa;">
                            <col style="width: auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>상담구분</th>
                                <td>
                                    <div class="i-checks">
                                    	<c:forEach var="serviceType" items="${SERVICETYPE }">
                                    		<label class="mr-2 mb-0 voc"><input type="radio" value="${serviceType.codeval }" id="servicetype" name="servicetype">${serviceType.codename}</label>
                                        </c:forEach>
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
                                    <select class="form-control float-left mr-2 col-sm-5 voc">
                                        <option>option 2</option>
                                        <option>option 3</option>
                                        <option>option 4</option>
                                    </select>
                                    <select class="form-control float-left col-sm-5 voc">
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
                                            <select id="goods11" name="goodsb1" class="form-control d-inline-block mr-2 voc">
                                                <option value="b11">option 2</option>
                                                <option value="b12">option 3</option>
                                                <option value="b13">option 4</option>
                                            </select>
                                            <select id="goods12 name="goodsm1" class="form-control d-inline-block mr-2 voc">
                                                <option value="m11">option 2</option>
                                                <option value="m12">option 3</option>
                                                <option value="m13">option 4</option>
                                            </select>
                                            <select id="goods13" name="goodss1" class="form-control d-inline-block mr-2 voc">
                                                <option value="s11">option 2</option>
                                                <option value="s12">option 3</option>
                                                <option value="s13">option 4</option>
                                            </select>
                                            <button class="plus btn btn-primary d-inline-block btn-sm mr-2">추가</button>
                                        </div>
                                        <div class="select-box mb-1">
                                            <select id="goods21" name="goodsb2" class="form-control d-inline-block mr-2 voc">
                                                <option>option 2</option>
                                                <option>option 3</option>
                                                <option>option 4</option>
                                            </select>
                                            <select id="goods22" name="goodsm2" class="form-control d-inline-block mr-2 voc">
                                                <option>option 2</option>
                                                <option>option 3</option>
                                                <option>option 4</option>
                                            </select>
                                            <select id="goods23" name="goodss2" class="form-control d-inline-block mr-2 voc">
                                                <option>option 2</option>
                                                <option>option 3</option>
                                                <option>option 4</option>
                                            </select>
                                            <button class="plus btn btn-primary d-inline-block btn-sm mr-2">추가</button>
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
                                <td colspan="3">
                                    <textarea name="servicedesc" id="servicedesc" class="form-control voc" style="height: 200px; resize: none;"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>상담결과</th>
                                <td colspan="3">
                                    <div class="i-checks">
                                        <label class="mr-2 mb-0"><input type="radio" class="check voc" value="2" id="vocstep2" name="vocstep"> 처리</label>
                                        <label class="mb-0"><input type="radio" class="check voc" value="3" id="vocstep3" name="vocstep"> 상담예약</label>
                                        <label class="mr-2 mb-0"><input type="radio" class="check voc" value="4" id="vocstep4" name="vocstep"> 담당자 이관</label>
                                        <label class="mr-2 mb-0"><input type="radio" class="check voc" value="5" id="vocstep5" name="vocstep"> 상급자 이관</label>
                                    </div>
                                </td>
                            </tr>
                            <tr class="convey">
                            	<th>이관 담당자 </th>
                            	<td colspan="1">
                            		<div class="input-group owner" id="nextowner_">
                            			<input type="text" class="form-control" autocomplete="off" name="nextowner_" value="">
                                        <input type="hidden" name="nextowner" id="nextowner" value="">
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
                            <tr class="reservation">
                            	<th>예약 전화번호
                            	<td>
                            		<input type="text" class="form-control voc" autocomplete="off" name="reservphone" value="">
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
                            <tr>
                                <th>이력 및 메모</th>
                                <td colspan="3" >
                                    <textarea name="memo" id="memo" class="form-control voc" style="height: 150px; resize: none;"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btn-area text-right">
                        <button id="save" class="btn btn-primary btn-large">저장</button>
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
<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
<%@ include file="/WEB-INF/views/template/inc/vocjsinc.jsp"%>
<script src="${pageContext.request.contextPath}/resources/crud/crud_sv.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/crud/crud_right.js"></script>

<script>
	
$(document).ready(function () {
	$('.convey').hide();
	$('.reservation').hide();
});

$('.check').on('ifChecked', function(event){

	
	var value = event.currentTarget.value;
	if(value == 4 || value == 5){
		$('.convey').show();
		$('.reservation').hide();
	}else if (value == 3){
		$('.convey').hide();
		$('.reservation').show();
	}else{
		$('.convey').hide();
		$('.reservation').hide();
	}

});


$(".plus").click(function(){
	var cloneCount = $('[name*="goodsb"]').length;
	var countP = cloneCount + 1;
    
    $('.select-area .select-box:last').clone(true).insertAfter('.select-area .select-box:last');
    $('.select-area .select-box:last').find('#goods'+cloneCount+1).attr('name','goods'+countP+1).attr('id','goods'+countP+1);
    $('.select-area .select-box:last').find('#goods'+cloneCount+2).attr('name','goods'+countP+2).attr('id','goods'+countP+1);
    $('.select-area .select-box:last').find('#goods'+cloneCount+3).attr('name','goods'+countP+3).attr('id','goods'+countP+1);
 }); 

	
</script>
	<!-- E: 추가 js -->
</body>

</html>
