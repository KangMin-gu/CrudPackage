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
<meta id="viewport" content="width=device-width, initial-scale=1" />
<title>CRUD SYSTEM</title>
<!-- link includ -->
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
<link href="${pageContext.request.contextPath}/resources/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
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
	                    <h2>캠페인 관리</h2>
	                    <ol class="breadcrumb">
	                        <li class="breadcrumb-item">
	                            <a href="/campaign">캠페인목록</a>
	                        </li>
	                        <li class="breadcrumb-item">
	                            <a href="/campaign/${campInfo.CAMPNO }">캠페인정보</a>
	                        </li>
	                        <li class="breadcrumb-item active">
	                            <strong>캠페인정보 수정</strong>
	                        </li>
	                    </ol>
	                </div> 
	                <div class="col-lg-2">
	
	                </div>
	            </div>		
		
		
<!-- Content -->		
        <div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                    <form:form action ="${pageContext.request.contextPath}/campaign/target/${campInfo.CAMPNO }" method="POST">
                    <div class="ibox">
                        <div class="ibox-title row border-0">
                            <h4>캠페인 정보</h4>
                            <div class="col-12 text-right mb-2">
    							<Button type="submit" class="btn btn-primary submit" id="submit" disabled >저 장</Button>
    							<a href="/campaign" class="btn btn-primary">목 록</a>
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
                                            <th>캠페인 명</th>
                                            <td>${campInfo.CAMPNAME }</td>
                                        </tr>
                                        <tr>
                                            <th>캠페인 기간</th>
                                            <td>${campInfo.CAMPDATE_ }</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>캠페인 유형</th>
                                            <td>${campInfo.CAMPTYPE_ }</td>
                                        </tr>
                                        <tr>
                                            <th>담당자</th>
                                            <td>${campInfo.OWNER_ }</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>진행단계</th>
                                            <td>${campInfo.CAMPSTEP_ }</td>
                                            <input type="hidden" name="campstep" id="campstep" class="form-control" value="2"/>
                                        </tr>
                                        <tr>
                                            <th>대상 고객수</th>
                                            <td>${targetCustCnt } 명</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="ibox-title row border-0">
                            <h4>대상 추출 </h4>
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
                                            <th>성별</th>
                                            <td>
                                               <select class="form-control" name="sex" id="sex">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="sex" items="${SEX }">
                                                		<c:choose>
                                                			<c:when test="${campTarget.SEX eq sex.codeval}">
                                                				<option selected label="${sex.codename }" value="${sex.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${sex.codename }" value="${sex.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>고객구분</th>
                                            <td>
                                                <select class="form-control" name="custgubun" id="custgubun">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="custGubun" items="${CUSTGUBUN }">
                                                		<c:choose>
                                                			<c:when test="${campTarget.CUSTGUBUN eq custGubun.codeval}">
                                                				<option selected label="${custGubun.codename }" value="${custGubun.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${custGubun.codename }" value="${custGubun.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>나이</th>
                                            <td>
                                                <input type="text" name="age1" id="age1" class="form-control float-left col-5" value="${campInfo.AGE1 }">
                                                <h3 class="text-center col-lg-1 col-1 p-0 m-0 float-left">~</h3>
                                                <input type="text" name="age2" id="age2" class="form-control float-left col-5" value="${campInfo.AGE2 }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>고객등급</th>
                                            <td>
                                                <select class="form-control" name="custgrade" id="custgrade">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="custGrade" items="${CUSTGRADE }">
                                                		<c:choose>
                                                			<c:when test="${campTarget.CUSTGRADE eq custGrade.codeval}">
                                                				<option selected label="${custGrade.codename }" value="${custGrade.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${custGrade.codename }" value="${custGrade.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>생일(월)</th>
                                            <td>
                                                <select class="form-control" name="birth" id="birth">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="birth" items="${BIRTH }">
                                                		<c:choose>
                                                			<c:when test="${campTarget.BIRTH eq birth.codeval}">
                                                				<option selected label="${birth.codename }" value="${birth.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${birth.codename }" value="${birth.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>활동등급</th>
                                            <td>
                                                <select class="form-control" name="actgrade" id="actgrade">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="actGrade" items="${ACTGRADE }">
                                                		<c:choose>
                                                			<c:when test="${campInfo.ACTGRADE eq actGrade.codeval}">
                                                				<option selected label="${actGrade.codename }" value="${actGrade.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${actGrade.codename }" value="${actGrade.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 col-xl-6 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">고객등록일</th>
                                            <td class="border-top-0">
                                                <div class="input-group p-0">
                                                    <div class="d-flex date date01 col-lg-5 col-md-5 p-0 col-5">
                                                      <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" name="regdate1" id="regdate1" class="form-control" value="${campInfo.REGDATE1 }">
                                                    </div>
                                                    <h3 class="text-center col-lg-1 col-1 p-0">~</h3>
                                                    <div class="d-flex date date02 col-lg-5 col-md-5 p-0 col-5">
                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" name="regdate2" id="regdate2" class="form-control" value="${campInfo.REGDATE2 }">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 col-xl-6 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">추출내용</th>
                                            <td class="border-top-0">
                                            	<div class="input-group camptarget">
                                                    <input type="text" class="form-control" autocomplete="off" name="camptargetno_" id="camptargetno_" value="">
                                                    <input type="hidden" name="camptargetno" id="camptargetno" value="0">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 col-xl-6 p-0 addr" style="display:block">
                                    <table class="table table-bordered mb-0 border-top-0">
                                        <colgroup>
                                            <col style="width: 110px; background: #fafafa;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th class="border-top-0">주소지 1</th>
                                                <td class="border-top-0">
                                                    <select class="form-control col-3 float-left mr-2" name="addr11" id="addr11">
                                            			<option label="선택" value=""/>
                                                		<c:forEach var="sido" items="${SIDO }">
                                                			<c:choose>
                                                				<c:when test="${campInfo.ADDR11 eq sido.codeval}">
                                                					<option selected label="${sido.codename }" value="${sido.codeval }"/>
                                                				</c:when>
                                                				<c:otherwise>
                                                					<option label="${sido.codename }" value="${sido.codeval }"/>
                                                				</c:otherwise>
                                                			</c:choose>
                                                		</c:forEach>
                                                	</select>
                                                    <select name="addr12" id="addr12" class="form-control col-3 float-left mr-2">
                                                        <option>소사구</option>
                                                        <option>소사구</option>
                                                        <option>소사구</option>
                                                        <option>소사구</option>
                                                    </select>
                                                    <select name="addr13" id="addr13" class="form-control col-3 float-left mr-2">
                                                        <option>괴안동</option>
                                                        <option>괴안동</option>
                                                        <option>괴안동</option>
                                                        <option>괴안동</option>
                                                    </select>
                                                    <a onclick="javascript:addAddr($(this))" style="height: 23px; font-size: 13px; padding: 0 0.75rem;">추가</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="box1 col-lg-12 col-xl-6 p-0 addr" style="display:none">
                                    <table class="table table-bordered mb-0 border-top-0">
                                        <colgroup>
                                            <col style="width: 110px; background: #fafafa;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th class="border-top-0">주소지 2</th>
                                                <td class="border-top-0">
                                                    <select class="form-control col-3 float-left mr-2" name="addr21" id="addr21">
                                            			<option label="선택" value=""/>
                                                		<c:forEach var="sido" items="${SIDO }">
                                                			<c:choose>
                                                				<c:when test="${campInfo.ADDR21 eq sido.codeval}">
                                                					<option selected label="${sido.codename }" value="${sido.codeval }"/>
                                                				</c:when>
                                                				<c:otherwise>
                                                					<option label="${sido.codename }" value="${sido.codeval }"/>
                                                				</c:otherwise>
                                                			</c:choose>
                                                		</c:forEach>
                                                	</select>
                                                    <select name="addr12" id="addr12" class="form-control col-3 float-left mr-2">
                                                        <option>소사구</option>
                                                        <option>소사구</option>
                                                        <option>소사구</option>
                                                        <option>소사구</option>
                                                    </select>
                                                    <select name="addr13" id="addr13" class="form-control col-3 float-left mr-2">
                                                        <option>괴안동</option>
                                                        <option>괴안동</option>
                                                        <option>괴안동</option>
                                                        <option>괴안동</option>
                                                    </select>
                                                    <a onclick="javascript:addAddr($(this))" style="height: 23px; font-size: 13px; padding: 0 0.75rem;">추가</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="box1 col-lg-12 col-xl-6 p-0 addr" style="display:none">
                                    <table class="table table-bordered mb-0 border-top-0">
                                        <colgroup>
                                            <col style="width: 110px; background: #fafafa;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th class="border-top-0">주소지 3</th>
                                                <td class="border-top-0">
                                                    <select class="form-control col-3 float-left mr-2" name="addr31" id="addr31">
                                            			<option label="선택" value=""/>
                                                		<c:forEach var="sido" items="${SIDO }">
                                                			<c:choose>
                                                				<c:when test="${campInfo.ADDR31 eq sido.codeval}">
                                                					<option selected label="${sido.codename }" value="${sido.codeval }"/>
                                                				</c:when>
                                                				<c:otherwise>
                                                					<option label="${sido.codename }" value="${sido.codeval }"/>
                                                				</c:otherwise>
                                                			</c:choose>
                                                		</c:forEach>
                                                	</select>
                                                    <select name="addr12" id="addr12" class="form-control col-3 float-left mr-2">
                                                        <option>소사구</option>
                                                        <option>소사구</option>
                                                        <option>소사구</option>
                                                        <option>소사구</option>
                                                    </select>
                                                    <select name="addr13" id="addr13" class="form-control col-3 float-left mr-2">
                                                        <option>괴안동</option>
                                                        <option>괴안동</option>
                                                        <option>괴안동</option>
                                                        <option>괴안동</option>
                                                    </select>
                                                    <a onclick="javascript:addAddr($(this))" style="height: 23px; font-size: 13px; padding: 0 0.75rem;">추가</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="box1 col-lg-12 col-xl-6 p-0 addr" style="display:none">
                                    <table class="table table-bordered mb-0 border-top-0">
                                        <colgroup>
                                            <col style="width: 110px; background: #fafafa;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th class="border-top-0">주소지 4</th>
                                                <td class="border-top-0">
                                                    <select class="form-control col-3 float-left mr-2" name="addr41" id="addr41">
                                            			<option label="선택" value=""/>
                                                		<c:forEach var="sido" items="${SIDO }">
                                                			<c:choose>
                                                				<c:when test="${campInfo.ADDR41 eq sido.codeval}">
                                                					<option selected label="${sido.codename }" value="${sido.codeval }"/>
                                                				</c:when>
                                                				<c:otherwise>
                                                					<option label="${sido.codename }" value="${sido.codeval }"/>
                                                				</c:otherwise>
                                                			</c:choose>
                                                		</c:forEach>
                                                	</select>
                                                    <select name="addr12" id="addr12" class="form-control col-3 float-left mr-2">
                                                        <option>소사구</option>
                                                        <option>소사구</option>
                                                        <option>소사구</option>
                                                        <option>소사구</option>
                                                    </select>
                                                    <select name="addr13" id="addr13" class="form-control col-3 float-left mr-2">
                                                        <option>괴안동</option>
                                                        <option>괴안동</option>
                                                        <option>괴안동</option>
                                                        <option>괴안동</option>
                                                    </select>
                                                    <a onclick="javascript:addAddr($(this))" style="height: 23px; font-size: 13px; padding: 0 0.75rem;">추가</button>
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

<!-- Content End -->
			
<!-- foot -->
			<div class="footer">
				<%@ include file="/WEB-INF/views/template/menu/foot.jsp"%>
			</div>
<!-- right side -->
		<div id="right-sidebar">
			<%@ include file="/WEB-INF/views/template/menu/rightside.jsp"%>
		</div>
</div>
<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_cp.js"></script><!-- summernote-->		
	<script src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script><!-- summernote-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script>
	
	window.onload = function () {
		
	}
	
	$(document).ready(function () {
		$('.summernote').summernote({});
		
		$('.date').datepicker({
			keyboardNavigation:false,
			forceParse:false,
			autoclose:true
		});
		enableSubmit();
		debugger;
		var length = $('.addr').length
		for (i = 2; i <= length; i++){
			if($('#addr'+i+'1').val().trim() == ''){
				$('#addr'+i+'1').parents('table').parent().css('display','none');
			}else{
				$('#addr'+i+'1').parents('table').parent().css('display','block');
			}
		}
	});

	</script>		

</body>
</html>