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
<link href="${pageContext.request.contextPath}/resources/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/select2/select2.min.css" rel="stylesheet">
</head>

<body>
	<div id="wrapper">
<!-- leftside -->	
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>

        </div>
<!-- Top -->    
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>

            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>서비스 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/service">서비스 목록</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>서비스 추가</strong>
                        </li>
                    </ol>
                </div>
            </div>		
		
		
<!-- Content -->		
		<form:form action ="${pageContext.request.contextPath}/service/post" method="POST">
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-title row">
                            <h4>기본정보</h4>
                            <div class="ibox-tools">
                            	<a class="collapse-link">
                                	<i class="fa fa-chevron-up"></i>
                            	</a>
                        	</div>
                        </div>
                        
                        <div class="ibox-content row">
                        	<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
								<div class="col-xl-8 col-lg-12 float-left alert alert-info w-100" id="reqMsgDiv" style="height:2.00rem;padding-top: 6px;overflow:hidden;" >
									<span id="reqDefaultMsg" title="필수 입력값을 확인해 주세요.&nbsp;&nbsp;(서비스명 : 입력이 필요합니다., 접수유형 : 선택해주세요 ) ">
										<strong>필수 입력값을 확인해 주세요.&nbsp;&nbsp;(서비스명 : 입력이 필요합니다., 접수유형 : 선택해주세요 ) </strong>
									</span>
									<span id="reqSuccessMsg" style="display:none;"><Strong>필수값이 정상적으로 입력 되었습니다.</Strong></span>				
	                        	</div>
								<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
									<Strong><span id="showMsg"></span></Strong>				
	                        	</div>													
								<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
									<Button type="submit" class="btn btn-primary submit" disabled >저 장</Button>
									<a href="/service" class="btn btn-primary">목 록</a>
								</div>
							</div>
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="clino">거래처명</label></th>
                                            <td class="border-top-0">
                                                <div class="input-group cli" id="clino_">
                                                    <input type="text" class="form-control reset" autocomplete="off" name="clino_" value="${serviceInfo.CLINO_ }">
                                                    <input type="hidden" class="reset" name="clino" value="0">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="prsdname">대표자명</label></th>
                                            <td><input type="text" class="form-control" disabled name="prsdname" id="prsdname" value="${serviceInfo.PRSDNAME }"></td>
                                        </tr>
                                        <tr>
                                            <th><label for="custname">고객명</label></th>
                                            <td class="border-top-0">
                                                <div class="input-group cust" id="custno_">
                                                    <input type="text" class="form-control reset" autocomplete="off" name="custno_" value="${serviceInfo.CUSTNAME }">
                                                    <input type="hidden" class="reset" name="custno" value="0">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="border-top-0">고객주소</th>
                                            <td class="border-top-0">
                                            	<input type="text" class="form-control" disabled name="custaddress" id="custaddress" value="${serviceInfo.CUSTADDRESS }">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>사업자등록번호</th>
                                            <td style="height: 43px;"><input type="text" class="form-control" disabled name="bsno" id="bsno" value="${serviceInfo.BSNO }"></td>
                                        </tr>
                                        <tr>
                                            <th>대표전화번호</th>
                                            <td style="height: 43px;">
                                            	<input type="text" class="form-control" disabled name="clitelno" id="clitelno" value="${serviceInfo.CLITELNO }">
											</td>
                                        </tr>
                                        <tr>
                                            <th>직장명</th>
                                            <td style="height: 43px;"><input type="text" class="form-control" disabled name="company" id="company" value="${serviceInfo.COMPANY }"></td>
                                        </tr>
                                        <tr>
                                            <th class="border-top-0">휴대전화번호</th>
                                            <td class="border-top-0">
                                                <input type="text" class="form-control" disabled name="mobile" id="mobile" value="${serviceInfo.MOBILE }">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>법인번호</th>
                                            <td style="height: 43px;"><input type="text" class="form-control" disabled name="incno" id="incno" value="${serviceInfo.INCNO }"></td>
                                        </tr>
                                        <tr>
                                            <th>홈페이지</th>
                                            <td style="height: 43px;"><input type="text" class="form-control" disabled name="homepage" id="homepage" value="${serviceInfo.HOMEPAGE }"></td>
                                        </tr>
                                        <tr>
                                            <th>직책</th>
                                            <td style="height: 43px;"><input type="text" class="form-control" disabled name="duty" id="duty" value="${serviceInfo.DUTY }"></td>
                                        </tr>
                                        <tr>
                                            <th>이메일</th>
                                            <td style="height: 43px;"><input type="text" class="form-control" disabled name="email" id="email" value="${serviceInfo.EMAIL }"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>


                        </div>

                    </div>
                </div>
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-title row">
                            <h4>접수 정보</h4>
                            <div class="ibox-tools">
                            	<a class="collapse-link">
                                	<i class="fa fa-chevron-up"></i>
                            	</a>
                        	</div>
                        </div>
                        
                        <div class="ibox-content row">
                            
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th style="height: 45px;">접수유형</th>
                                            <td>
                                            	<select class="form-control float-left error required validate number" name="rcvtype" id="rcvtype">
                                            		<option value="0">선택</option>
                                                    <option value=1 <c:if test='${serviceInfo.RCVTYPE eq 1}'>selected</c:if>>문의</option>
                                                    <option value=2 <c:if test='${serviceInfo.RCVTYPE eq 2}'>selected</c:if>>개선</option>
                                                    <option value=3 <c:if test='${serviceInfo.RCVTYPE eq 3}'>selected</c:if>>오류</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>접수일</th>
                                            <td style="height: 42px;">
                                            	<input type="text" class="form-control date" disabled id="rcvdate_">
                                            	<input type="hidden" class="form-control date" name="rcvdate" id="rcvdate">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>서비스유형</th>
                                            <td>
                                            	<select class="form-control float-left select2" name="rcvcode" id="rcvcode">
                                            		<option value="0">선택</option>
                                                    <option value=1 <c:if test='${serviceInfo.RCVCODE eq 1}'>selected</c:if>>클라1</option>
                                                    <option value=2 <c:if test='${serviceInfo.RCVCODE eq 2}'>selected</c:if>>클라2</option>
                                                    <option value=3 <c:if test='${serviceInfo.RCVCODE eq 3}'>selected</c:if>>클라3</option>
                                                </select>
											</td>
                                        </tr>
                                        <tr>
                                            <th style="height: 42px;">접수시간</th>
                                            <td>
                                            	<div class="input-group clockpicker" data-autoclose="true">
                                            		<span class="input-group-addon">
                                    					<span class="fa fa-clock-o"></span>
                                					</span>
                                					<input type="text" class="form-control" autocomplete="off" name="rcvtime" id="rcvtime" value="${serviceInfo.RCVTIME }">
                            					</div>	
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th style="height: 45px;">접수자</th>
                                            <td>
                                            	<div class="input-group">
                                                    <input type="text" class="form-control error required validate name" disabled name="rcvowner_" id="rcvowner_" value="${sessionScope.USERNAME }">
                                                    <input type="hidden" name="rcvowner" id="rcvowner" value="${sessionScope.USERNO }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>처리상태</th>
                                            <td style="height: 42px;">
                                            	<select class="form-control float-left" name="prcstate" id="prcstate">
                                            		<option value="0">선택</option>
                                                    <option value=1 <c:if test='${serviceInfo.PRCSTATE eq 1}'>selected</c:if>>접수</option>
                                                    <option value=2 <c:if test='${serviceInfo.PRCSTATE eq 2}'>selected</c:if>>이관</option>
                                                    <option value=3 <c:if test='${serviceInfo.PRCSTATE eq 3}'>selected</c:if>>완료</option>
                                                </select>
											</td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                            <div class="box4 col-lg-12 col-xl-8 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">서비스명</th>
                                            <td class="border-top-0" style="height: 42px;">
                                            	<input type="text" class="form-control error required validate string" name="rcvname" id="rcvname" value="${serviceInfo.RCVNAME }">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box4 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                        	<th class="border-top-0">접수매체</th>
                                        	<td class="border-top-0">
                                        		<select class="form-control float-left" name="rcvchannel" id="rcvchannel">
                                            		<option value="0">선택</option>
                                                    <option value=10 <c:if test='${serviceInfo.RCVCHANNEL eq 10}'>selected</c:if>>전화</option>
                                                    <option value=20 <c:if test='${serviceInfo.RCVCHANNEL eq 20}'>selected</c:if>>SMS</option>
                                                    <option value=30 <c:if test='${serviceInfo.RCVCHANNEL eq 30}'>selected</c:if>>메일</option>
                                                </select>
                                        	</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">서비스내용</th>
                                            <td class="border-top-0">
                                                <textarea name="rcvdesc" class="form-control" id="rcvdesc">${serviceInfo.RCVDESC }</textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">메모</th>
                                            <td class="border-top-0">
                                                <textarea name="rcvopinion" id="rcvopinion">${serviceInfo.RCVOPINION }</textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>
                </div>
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-title row">
                            <h4>처리 정보</h4>
                            <div class="ibox-tools">
                            	<a class="collapse-link">
                                	<i class="fa fa-chevron-up"></i>
                            	</a>
                        	</div>
                        </div>
                        
                        <div class="ibox-content row">
                            
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>처리유형</th>
                                            <td>
                                            	<select class="form-control float-left select2" name="ractcode" id="ractcode">
                                            		<option value=0>선택</option>
                                                    <option value=1 <c:if test='${serviceInfo.RACTCODE eq 1}'>selected</c:if>>option1</option>
                                                    <option value=2 <c:if test='${serviceInfo.RACTCODE eq 2}'>selected</c:if>>option2</option>
                                                    <option value=3 <c:if test='${serviceInfo.RACTCODE eq 3}'>selected</c:if>>option3</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>처리일</th>
                                            <td style="height: 45px;">
                                            	<div class="input-group">
                                            		<span class="input-group-addon">
                                    					<span class="fa fa-calendar"></span>
                                					</span>
                                            		<input type="text" class="form-control date" autocomplete="off" name="ractdate" id="ractdate" value="${serviceInfo.RACTDATE }">
                                            	</div>
                                            </td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>처리 시간</th>
                                            <td style="height: 45px;">
                                            	<div class="input-group clockpicker" data-autoclose="true">
                                            		<span class="input-group-addon">
                                    					<span class="fa fa-clock-o"></span>
                                					</span>
                                					<input type="text" class="form-control" autocomplete="off" name="racttime" id="racttime" value="${serviceInfo.RACTTIME }">
                            					</div>	
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered border-top-0 border-bottom-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0 border-bottom-0">담당자</th>
                                            <td class="border-top-0 border-bottom-0">
                                            	<div class="input-group owner">
                                                    <input type="text" class="form-control" autocomplete="off" name="ractowner_" id="ractowner_" value="${serviceInfo.RACTOWNER_ }">
                                                    <input type="hidden" name="ractowner" id="ractowner" value="0">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="box1 col-lg-12 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>처리내용</th>
                                            <td>
                                                <textarea name="ractdesc" id="ractdesc">${serviceInfo.RACTDESC }</textarea>
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
        </form:form>
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
	</div>

<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>		
	<script src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script><!-- summernote-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/clockpicker/clockpicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/select2/select2.full.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_sv.js"></script>
	<script>
		$(document).ready(function () {

			$('.select2').select2();
			var date = today();
			
			$('.clockpicker').clockpicker();
			
			$('#rcvdesc').summernote({
				height:200
			});
			$('#rcvopinion').summernote({
				height:200
			});
			$('#ractdesc').summernote({
				height:200
			});
			
			$('.date').datepicker({
				keyboardNavigation:false,
				forceParse:false,
				autoclose:true
			});
			$('#rcvdate').val(date);
			$('#rcvdate_').val(date);
		});
	

		
	</script>
</body>
</html>