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
                    <h2>회원사 관리</h2>
                    <ol class="breadcrumb">
                    <c:set var="auth" value="${sessionScope.USERAUTH}" />
                    <c:if test="${auth eq '30' }">
                        <li class="breadcrumb-item">
                            <a href="/ma/company">회원사목록</a>
                        </li>
                    </c:if>
                        <li class="breadcrumb-item">
                            <a href="/ma/company/${memCompany.SITEID }">회원사정보</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>회원사 수정</strong>
                        </li>
                    </ol>
                </div>

            </div>		
		
		
<!-- Content -->		
	<form action="${pageContext.request.contextPath}/ma/company/post/${memCompany.SITEID }" method="POST" enctype="multipart/form-data">
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
            
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-title row">
                            <h4>기본정보</h4>
                        </div>
                        
                        <div class="ibox-content row">
                        	<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
                        		<div class="col-xl-8 col-lg-12 float-left alert alert-info w-100" id="reqMsgDiv" style="height:2.00rem;padding-top: 6px;overflow:hidden;" >
									<span id="reqDefaultMsg" title="필수 입력값을 확인해 주세요.&nbsp;&nbsp;(회원사명 : 한글,영어,숫자로 입력해 주세요. 영업담당자 : 지정해주세요.) ">
										<strong>필수 입력값을 확인해 주세요.&nbsp;&nbsp;(회원사명 : 한글,영어,숫자로 입력해 주세요. 영업담당자 : 지정해주세요.) </strong>
									</span>
									<span id="reqSuccessMsg" style="display:none;"><Strong>필수값이 정상적으로 입력 되었습니다.</Strong></span>				
	                        	</div>
								<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
									<Strong><span id="showMsg"></span></Strong>				
	                        	</div>
                            	<div class="w-100 text-right mb-2">
                                	<a href="${pageContext.request.contextPath}/ma/company/${memCompany.SITEID}" class="btn btn-primary">취소</a>
                                	<button class="btn btn-primary submit" disabled>저장</button>
                                	<a href="${pageContext.request.contextPath}/ma/company" class="btn btn-primary">목록</a>
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
                                            <th><label for="sitename">회원사명*</label></th>
                                            <td><input type="text" class="form-control error required validate allV" maxlength="20" name="sitename" id="sitename" value="${memCompany.SITENAME}"></td>
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
                                            <th><label for="bsno">사업자번호</label></th>
                                            <td height="40">
                                                <div class="input-group">
                                                    <input type="text" class="form-control validate bsno1V bsno-group" maxlength="3" name="bsno1" id="bsno1" value="${memCompany.BSNO1}"> -
                                                    <input type="text" class="form-control validate bsno2V" maxlength="2" name="bsno2" id="bsno2" value="${memCompany.BSNO2}"> -
                                                    <input type="text" class="form-control validate bsno3V" maxlength="5" name="bsno3" id="bsno3" value="${memCompany.BSNO3}">
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
                                            <th><label for="incno">법인번호</label></th>
                                            <td>
                                            	<div class="input-group">
                                            		<input type="text" class="form-control validate incno1V incno-group" maxlength="6" name="incno1" id="incno1" value="${memCompany.INCNO1}"> -
                                            		<input type="text" class="form-control validate incno2V" maxlength="7" name="incno2" id="incno2" value="${memCompany.INCNO2}">
                                            	</div>
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
                                            <th class="border-top-0"><label for="zipcode">직장주소</label></th>
                                            <td class="border-top-0">
                                                <div class="input-group col-lg-3 pl-0 float-left">
                                                    <input type="text" class="form-control daumzip" readonly autocomplete="off" name="addr1" id="addr1" value="${memCompany.ADDR1}">
                                                    <span class="input-group-addon">
                                                        <a href="javascript:void(0);"><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                                <input type="text" class="form-control col-lg-3 float-left mr-3 mt-sx-1" readonly name="addr2" id="addr2" value="${memCompany.ADDR2}">
                                                <input type="text" class="form-control float-left col-lg-5 mt-sx-1" maxlength="50" name="addr3" id="addr3" value="${memCompany.ADDR3}">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered border-top-0 mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0"><label for="prsdname">대표자명</label></th>
                                            <td class="border-top-0">
                                               <input type="text" class="form-control validate nameV" maxlength="20" name="prsdname" id="prsdname" value="${memCompany.PRSDNAME }">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class=" border-top-0"><label for="mobile">휴대번호</label></th>
                                            <td class="border-top-0">
                                            	<select class="form-control col-3 float-left mr-3 validate phone1V phone-group" style="height: 1.45rem" name="mobile1" id="mobile1">
													<option value="">선택</option>
													<c:forEach var="mobile" items="${MOBILE }">
                                                    	<c:choose>
                                                        	<c:when test="${memCompany.MOBILE1 eq mobile.codeval}">
                                                            	<option selected label="${mobile.codename }" value="${mobile.codeval }"/>
                                                         	</c:when>
                                                         	<c:otherwise>
                                                            	<option label="${mobile.codename }" value="${mobile.codeval }"/>
                                                         	</c:otherwise>
                                                      	</c:choose>
                                                   	</c:forEach>
												</select>
                                                <input type="text" class="form-control col-3 float-left mr-2 validate phone2V" maxlength="4" name="mobile2" id="mobile2" value="${memCompany.MOBILE2 }">
                                                <input type="text" class="form-control col-3 float-left validate phone3V" maxlength="4" name="mobile3" id="mobile3" value="${memCompany.MOBILE3 }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="email">이메일</label></th>
                                            <td>
                                                <input type="text" class="form-control validate emailV" maxlength="50" name="email" id="email" value="${memCompany.EMAIL }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="sitename">업태</label></th>
                                            <td>
                                                <input type="text" class="form-control validate stringV" maxlength="20" name="cotype" id="cotype" value="${memCompany.COTYPE }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="fregdate">최초가입일</label></th>
                                            <td>
                                                <input type="text" class="form-control date dateV" disabled data-autoclose="true" name="fregdate" id="fregdate" value="${memCompany.FREGDATE_ }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="adminid">아이디</label></th>
                                            <td>
                                                <input type="text" class="form-control" maxlength="20" name="adminid" id="adminid" value="${memCompany.ADMINID }" disabled>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width:110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0"><label for="telno">전화번호</label></th>
                                            <td class="border-top-0">
                                            	<select class="form-control col-3 float-left mr-3 validate phone1V phone-group" style="height: 1.45rem" name="telno1" id="telno1">
													<option value="">선택</option>
													<c:forEach var="phone" items="${PHONE }">
                                                    	<c:choose>
                                                        	<c:when test="${memCompany.TELNO1 eq phone.codeval}">
                                                            	<option selected label="${phone.codename }" value="${phone.codeval }"/>
                                                         	</c:when>
                                                         	<c:otherwise>
                                                            	<option label="${phone.codename }" value="${phone.codeval }"/>
                                                         	</c:otherwise>
                                                      	</c:choose>
                                                   	</c:forEach>
												</select>
                                                <input type="text" class="form-control col-3 float-left mr-2 validate phone2V"  maxlength="4" name="telno2" id="telno2" value="${memCompany.TELNO2 }">
                                                <input type="text" class="form-control col-3 float-left validate phone3V" maxlength="4" name="telno3" id="telno3" value="${memCompany.TELNO3 }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="sitesize">기업규모</label></th>
                                            <td>
                                            	<select class="form-control float-left mr-3" style="height: 1.45rem" name="sitesize" id="sitesize">
													<option value="0">선택</option>
													<c:forEach var="companySize" items="${COMPANYSIZE }">
                                                    	<c:choose>
                                                        	<c:when test="${memCompany.SITESIZE eq companySize.codeval}">
                                                            	<option selected label="${companySize.codename }" value="${companySize.codeval }"/>
                                                         	</c:when>
                                                         	<c:otherwise>
                                                            	<option label="${companySize.codename }" value="${companySize.codeval }"/>
                                                         	</c:otherwise>
                                                      	</c:choose>
                                                   	</c:forEach>
												</select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="bscond">업종</label></th>
                                            <td>
                                                <input type="text" class="form-control validate stringV" maxlength="20" name="bscond" id="bscond" value="${memCompany.BSCOND }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="isdelete">서비스상태</label></th>
                                            <td>
                                            	<select class="form-control float-left mr-3" disabled style="height: 1.45rem" name="isdelete" id="isdelete">
													<option value="">선택</option>
													<c:forEach var="isDelete" items="${ISDELETE }">
                                                    	<c:choose>
                                                        	<c:when test="${memCompany.ISDELETE eq isDelete.codeval}">
                                                            	<option selected label="${isDelete.codename }" value="${isDelete.codeval }"/>
                                                         	</c:when>
                                                         	<c:otherwise>
                                                            	<option label="${isDelete.codename }" value="${isDelete.codeval }"/>
                                                         	</c:otherwise>
                                                      	</c:choose>
                                                   	</c:forEach>
												</select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="adminpassword">비밀번호</label></th>
                                            <td>
                                               <input type="password" class="form-control" name="adminpassword" id="adminpassword" disabled>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-12 col-xl-4 p-0 ">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px !important; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0"><label for="faxtel">팩스번호</label></th>
                                            <td class="border-top-0">
                                            	<select class="form-control col-3 float-left mr-3 validate phone1V phone-group" style="height: 1.45rem" name="faxtel1" id="faxtel1">
													<option value="">선택</option>
													<c:forEach var="fax" items="${FAX }">
                                                    	<c:choose>
                                                        	<c:when test="${memCompany.FAXTEL1 eq fax.codeval}">
                                                            	<option selected label="${fax.codename }" value="${fax.codeval }"/>
                                                         	</c:when>
                                                         	<c:otherwise>
                                                            	<option label="${fax.codename }" value="${fax.codeval }"/>
                                                         	</c:otherwise>
                                                      	</c:choose>
                                                   	</c:forEach>
												</select>
                                                <input type="text" class="form-control col-3 float-left mr-2 validate phone2V" maxlength="4" name="faxtel2" id="faxtel2" value="${memCompany.FAXTEL2 }">
                                                <input type="text" class="form-control col-3 float-left validate phone3V" maxlength="4" name="faxtel3" id="faxtel3" value="${memCompany.FAXTEL3 }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="border-top-0"><label for="owner">영업담당자</label></th>
                                            <td class="border-top-0">
                                                <div class="input-group owner" id="owner_">
                                                    <input type="text" class="form-control error required validate nameV" autocomplete="off" name="owner_" value="${memCompany.OWNER_ }">
                                                    <input type="hidden" name="owner" value="${memCompany.OWNER }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="bstype">종목</label></th>
                                            <td>
                                                <input type="text" class="form-control validate stringV" maxlength="20" name="bstype" id="bstype" value="${memCompany.BSTYPE }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="sitelogo">회원사로고</label></th>
                                            <td>  
                                            <!-- 	<div class="input-group poplogo">-->
                                            	<div class="input-group ">
                                            		<!-- <input class="form-control" type="text" id="filename" name="filename" disabled />
                                            		<button type="button" id="searchKey" class="btn btn-light btn-xs">로고 등록</button>
                                            		<input type="hidden" id="fileSearchKey" name="fileSearchKey" />-->
                                            		<input class="form-control" type="file" name="files" id="logoChk"/>
                                            	</div>                                                 											
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="adminpasswordchk">비밀번호 확인</label></th>
                                            <td>
                                                <input type="password" class="form-control" name="adminpasswordchk" id="adminpasswordchk" disabled>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-12 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0"><label for="sitememo">회원사메모</label></th>
                                            <td class="border-top-0">
                                                <textarea type="text" class="form-control col-12 float-left mr-12" name="sitememo" id="sitememo" value="${memCompany.SITEMEMO }">${memCompany.SITEMEMO }</textarea>                            
                                            </td>
                                            <input type="hidden" name="siteid" id="siteid"  value="${memCompany.SITEID }">
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
  </form>
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
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_upload.js"></script>
	<script>
	$(document).ready(function () {
		
		$('.date').datepicker({
			keyboardNavigation:false,
			forceParse:false,
			autoclose:true
			
		});

		 enableSubmit();
	});
	
	</script>		

</body>
</html>