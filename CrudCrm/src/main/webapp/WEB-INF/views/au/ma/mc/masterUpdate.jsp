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
    </div>
<!-- Top -->    
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>

            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>회원사 수정</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/">메인</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="/ma/mc">회원사목록</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="/ma/mc/${memCompany.SITEID }">회원사정보</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>회원사 수정</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>		
		
		
<!-- Content -->		
<form:form action ="${pageContext.request.contextPath}/ma/mc/post/${memCompany.SITEID }" method="PUT">
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
            
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-title row">
                            <h4>기본정보</h4>
                        </div>
                        
                        <div class="ibox-content row">
                            <div class="w-100 text-right mb-2">
                                <a href="${pageContext.request.contextPath}/ma/mc/${memCompany.SITEID}" class="btn btn-primary">취소</a>
                                <button class="btn btn-primary save">회원사저장</button>
                            </div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="sitename">회원사명*</label></th>
                                            <td><input type="text" class="form-control required" name="sitename" id="sitename" value="${memCompany.SITENAME}"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="bsno">사업자번호</label></th>
                                            <td height="40">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" name="bsno" id="bsno" value="${memCompany.BSNO}">
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="incno">법인번호</label></th>
                                            <td><input type="text" class="form-control" name="incno" id="incno" value="${memCompany.INCNO}"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box4 col-lg-8 p-0">
                                <table class="table table-bordered border-top-0  mb-0">
                                    <colgroup>
                                        <col style="width: 12.4%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0"><label for="zipcode">직장주소</label></th>
                                            <td class="border-top-0">
                                                <div class="input-group col-lg-3 pl-0 float-left">
                                                    <input type="text" class="form-control daumzip" name="zipcode" id="zipcode" value="${memCompany.ZIPCODE}">
                                                    <span class="input-group-addon">
                                                        <a href="javascript:void(0);"><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                                <input type="text" class="form-control col-lg-3 float-left mr-3 mt-sx-1" name="upraddress" id="upraddress" value="${memCompany.UPRADDRESS}">
                                                <input type="text" class="form-control float-left col-lg-5 mt-sx-1" name="lwraddress" id="lwraddress" value="${memCompany.LWRADDRESS}">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered border-top-0 ">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0"><label for="prsdname">대표자명</label></th>
                                            <td class="border-top-0">
                                               <input type="text" class="form-control" name="prsdname" id="prsdname" value="${memCompany.PRSDNAME }">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="mobile">휴대전화번호</label></th>
                                            <td>
                                                <select class="form-control col-3 float-left mr-3" name="mobile1" id="mobile1">
                                                    <option value=010 <c:if test='${memCompany.MOBILE1 eq 010}'>selected</c:if>>010</option>
                                                    <option value=011 <c:if test='${memCompany.MOBILE1 eq 011}'>selected</c:if>>011</option>
                                                    <option value=016 <c:if test='${memCompany.MOBILE1 eq 016}'>selected</c:if>>016</option>
                                                    <option value=017 <c:if test='${memCompany.MOBILE1 eq 017}'>selected</c:if>>017</option>
                                                </select>
                                                <input type="text" class="form-control col-3 float-left mr-2" name="mobile2" id="mobile2" value="${memCompany.MOBILE2 }">
                                                <input type="text" class="form-control col-3 float-left" name="mobile3" id="mobile3" value="${memCompany.MOBILE3 }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="email">이메일</label></th>
                                            <td>
                                                <input type="text" class="form-control" name="email" id="email" value="${memCompany.EMAIL }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="sitename">업태</label></th>
                                            <td>
                                                <input type="text" class="form-control" name="cotype" id="cotype" value="${memCompany.COTYPE }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="fregdate">최초가입일</label></th>
                                            <td>
                                                <input type="text" class="form-control date" name="fregdate" id="fregdate" value="${memCompany.FREGDATE }">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="telno">전화번호</label></th>
                                            <td>
                                                <select class="form-control col-3 float-left mr-3" name="telno1" id="telno1" >
                                                    <option value=02 <c:if test='${memCompany.TELNO1 eq 02}'>selected</c:if>>02</option>
                                                    <option value=031 <c:if test='${memCompany.TELNO1 eq 031}'>selected</c:if>>031</option>
                                                    <option value=032 <c:if test='${memCompany.TELNO1 eq 032}'>selected</c:if>>032</option>
                                                </select>
                                                <input type="text" class="form-control col-3 float-left mr-2" name="telno2" id="telno2" value="${memCompany.TELNO2 }">
                                                <input type="text" class="form-control col-3 float-left" name="telno3" id="telno3" value="${memCompany.TELNO3 } ">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="sitesize">기업규모</label></th>
                                            <td>
                                                <select class="form-control float-left" name="sitesize" id ="sitesize">
                                                    <option value="">선택</option>
                                                    <option value=1 <c:if test='${memCompany.SITESIZE eq 1}'>selected</c:if>>대기업</option>
                                                    <option value=2 <c:if test='${memCompany.SITESIZE eq 2}'>selected</c:if>>중견기업</option>
                                                    <option value=3 <c:if test='${memCompany.SITESIZE eq 3}'>selected</c:if>>중소기업</option>
                                                    <option value=4 <c:if test='${memCompany.SITESIZE eq 4}'>selected</c:if>>소기업</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="bscond">업종</label></th>
                                            <td>
                                                <input type="text" class="form-control" name="bscond" id="bscond" value="${memCompany.BSCOND }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="isdelete">서비스상태</label></th>
                                            <td>
                                               <select class="form-control float-left required" name="isdelete" id="isdelete">
                                                    <option value="">선택</option>
                                                    <option value=0 <c:if test='${memCompany.ISDELETE eq 0}'>selected</c:if>>사용</option>
                                                    <option value=1 <c:if test='${memCompany.ISDELETE eq 1}'>selected</c:if>>미사용</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="faxtel">팩스번호</label></th>
                                            <td>
                                                <select class="form-control col-3 float-left mr-3" name="faxtel1" id="faxtel1">
                                                    <option value=02 <c:if test='${memCompany.FAXTEL1 eq 02}'>selected</c:if>>02</option>
                                                    <option value=031 <c:if test='${memCompany.FAXTEL2 eq 031}'>selected</c:if>>031</option>
                                                    <option value=032 <c:if test='${memCompany.FAXTEL3 eq 032}'>selected</c:if>>032</option>
                                                </select>
                                                <input type="text" class="form-control col-3 float-left mr-2" name="faxtel2" id="faxtel2" value="${memCompany.FAXTEL2 }">
                                                <input type="text" class="form-control col-3 float-left" name="faxtel3" id="faxtel3" value="${memCompany.FAXTEL3 }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="border-top-0"><label for="owner">영업담당자</label></th>
                                            <td class="border-top-0">
                                                <div class="input-group owner">
                                                    <input type="text" class="form-control required" name="owner_" id="owner_" value="${memCompany.OWNER_ }">
                                                    <input type="hidden" name="owner" id="owner" value="${memCompany.OWNER }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr> 
                                        <tr>
                                            <th><label for="bstype">종목</label></th>
                                            <td>
                                                <input type="text" class="form-control" name="bstype" id="bstype" value="${memCompany.BSTYPE }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="sitelogo">사이트로고</label></th>
                                            <td>
                                                <input type="text" class="form-control" name="sitelogo" id="sitelogo" value="${memCompany.SITELOGO }">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-12 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 9%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="sitememo">회원사메모</label></th>
                                            <td>
                                                <textarea type="text" class="form-control col-12 float-left mr-12 summernote" name="sitememo" id="sitememo" value="${memCompany.SITEMEMO }">${memCompany.SITEMEMO }</textarea>                            
                                            </td>
                                            <td>
                                            <input type="hidden" name="siteid" id="siteid"  value="${memCompany.SITEID }">
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
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	$(document).ready(function () {
		$('.summernote').summernote({});
		$('.date').datepicker({
			keyboardNavigation:false,
			forceParse:false,
			autocolse:true
			
		});
		 $('.daumzip').click(function(e){
			 debugger;
		     //obj => button 정보
		     new daum.Postcode({
		         oncomplete: function(data) {
		        	 
		        	 $('#'+e.currentTarget.id).parent().parent().find("#zipcode").val(data.zonecode);
		        	 $('#'+e.currentTarget.id).parent().parent().find("#upraddress").val(data.roadAddress);
		        	 $('#'+e.currentTarget.id).parent().parent().find("#lwraddress").val(data.buildingName);
		             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		             // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		         }
		     }).open();
		 });
	});
	
	$('.owner').click(function(e){
		debugger;
		openNewWindow('/common/user',e.target.id);
	});
		
	</script>		

</body>
</html>