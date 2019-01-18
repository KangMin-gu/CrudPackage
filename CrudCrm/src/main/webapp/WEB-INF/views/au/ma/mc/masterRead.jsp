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
                    <c:if test="${sessionScope.CHKAUTH eq '30' }">
                        <li class="breadcrumb-item">
                            <a href="/ma/company">회원사목록</a>
                        </li>
                    </c:if>   
                        <li class="breadcrumb-item active">
                            <strong>회원사 정보</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>		
		
		
<!-- Content -->		
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-title row">
                            <h4>기본정보</h4>
                        </div>
                        
                        <div class="ibox-content row tooltip-demo">
                        	<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
                           		<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" ><%-- 
                              		<a href="${pageContext.request.contextPath}/ma/company" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="목록"><i class="fa fa-list"></i></a> --%>
                                   	<a href="#" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="내부통지"><i class="fa fa-envelope"></i></a>
                                   	<a href="#" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="SMS" style="padding-top: 5px;padding-bottom: 5px;height: 33px;width: 39px;"><i class="fa fa-mobile" style="font-size:20px;"></i></a>                                    
                                </div>
                                <div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
                              		<form:form action="${pageContext.request.contextPath}/ma/company/${memCompany.SITEID}" method="POST">
                            			<c:if test="${sessionScope.CHKAUTH eq '30' }">
                            				<a href="${pageContext.request.contextPath}/ma/company/post/${memCompany.SITEID}" class="btn btn-primary">수정</a>
											<button class="btn btn-primary" type="submit" value="삭제">삭제</button>
											<a href="${pageContext.request.contextPath}/ma/company" class="btn btn-primary">목록</a>
										</c:if>
									</form:form>
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
                                            <th>회원사명</th>
                                            <td>${memCompany.SITENAME}</td>
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
                                            <th>사업자번호</th>
                                            <td>${memCompany.BSNO }</td>
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
                                            <td><c:if test="${memCompany.INCNO !='-'}">
                                            ${memCompany.INCNO }</c:if></td>
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
                                            <th class="border-top-0">직장주소</th>
                                            <td class="border-top-0">
                                                ${memCompany.ADDR1 } ${memCompany.ADDR2 } ${memCompany.ADDR3 }
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
                                            <th class="border-top-0">대표자</th>
                                            <td class="border-top-0">${memCompany.PRSDNAME } </td>
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
                                            <th class="border-top-0">휴대전화번호</th>
                                            <td class="border-top-0">
                                                ${memCompany.MOBILE }
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>이메일</th>
                                            <td>
                                                ${memCompany.EMAIL }
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>업태</th>
                                            <td>
                                                ${memCompany.COTYPE }
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>최초가입일</th>
                                            <td>
                                                ${memCompany.FREGDATE_ }
                                            </td>
                                        </tr>
                                        <c:if test="${sessionScope.SITEID eq '1' }">
                                        <tr>
                                            <th>아이디</th>
                                            <td>
                                                ${memCompany.ADMINID }
                                            </td>
                                        </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">전화번호</th>
                                            <td class="border-top-0">
                                                ${memCompany.TELNO }
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>기업규모</th>
                                            <td>
                                                ${memCompany.SITESIZE_ }
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>업종</th>
                                            <td>
                                                ${memCompany.BSCOND }
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>서비스상태</th>
                                            <td>
                                                ${memCompany.ISDELETE_ }
                                            </td>
                                        </tr>
                                        <c:if test="${sessionScope.SITEID eq '1' }">
                                        <tr>
                                            <th>비밀번호</th>
                                            <td>
                                                <a href="javascript:void(0)" onclick="adminPwdConfirm(${SITEID}, '${memCompany.ADMINID }', ${memCompany.OWNER })" class="btn btn-xs btn-primary" >비밀번호 초기화</a>
                                            </td>
                                        </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">팩스번호</th> 
                                            <td class="border-top-0">
                                                ${memCompany.FAXTEL }
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="border-top-0">영업담당자</th>
                                            <td class="border-top-0">
                                                ${memCompany.OWNER_ }                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>종목</th>
                                            <td>
                                                ${memCompany.BSTYPE }
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>회원사로고</th>
                                            <td>
                                                
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-12 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">회원사 메모</th>
                                            <td class="border-top-0">
                                                <textarea type="text" disabled class="form-control col-12 float-left mr-12">${memCompany.SITEMEMO }</textarea>                            
                                            </td>	
                                            	<input type="hidden" id="siteid" name="siteid" value="${memCompany.SITEID }" />
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                    <c:if test="${sessionScope.CHKAUTH eq '30' }">
                    <div class="ibox">
                            <div class="ibox-title row border-0">
                                <h4>회원사 상세</h4>
                            </div>
                            <div class="ibox-content row">
                                <div class="box1 col-lg-12 p-0">
                                    <div class="tabs-container">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li><a class="nav-link li active" data-toggle="tab" href="#tab1">라이센스</a></li>
                                            <li><a class="nav-link" data-toggle="tab" href="#tab2">서비스단가</a></li>
                                            <li><a class="nav-link user" data-toggle="tab" href="#tab3">사용자</a></li>
                                        </ul>
                                        <div class="tab-content">
                                            <div role="tabpanel" id="tab1" class="tab-pane active overflow-x">
                                                <div class="panel-body">
                                                	<div>
                                                        <button class="btn btn-primary create" value="추가">추가</button>
                                                    </div><br/>
                                                    <table class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>라이센스명</th>
                                                                <th>단가</th>
                                                                <th>구매량</th>
                                                                <th>만기일</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div role="tabpanel" id="tab2" class="tab-pane overflow-x">
                                                <div class="panel-body">
                                                    <table class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>년/월</th>
                                                                <th>부가서비스</th>
                                                                <th>건당금액</th>
                                                                <th>발송수</th>
                                                                <th>단가</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>203일</td>
                                                                <td>영업건명입니다</td>
                                                                <td>상담건입니다</td>
                                                                <td>담당자</td>
                                                                <td>담당자</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div role="tabpanel" id="tab3" class="tab-pane overflow-x">
                                                <div class="panel-body">
                                                    <table class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>사용자명</th>
                                                                <th>사용자ID</th>
                                                                <th>직책</th>
                                                                <th>이메일</th>
                                                                <th>사용여부</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                
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
                        </c:if>
                </div>
            </div>
        </div>
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
	<script src="${pageContext.request.contextPath}/resources/crud/crud_ma.js"></script><!-- summernote-->
	<script>
		
		$('.create').click(function(e){
			var siteid = $('#siteid').val();
			var name ="회원사라이센스"
			var url = "/ma/company/license/"+siteid
			var target = e.currentTarget.id;
			var x = "1300"
			var y = "500"
			openNewWindow(name,url,e,x,y);
		});
		
		function adminPwdConfirm(siteId, adminId, managerNo){
			var isValid = confirm("비밀번호를 정말 초기화 하시겠습니까?");
			if(isValid){
				location.href = "/adminpwdreset/"+siteId+"?adid="+adminId+"&mano="+managerNo;
				return true;
			}else{
				return false;
			}
		}
	
	</script>
</body>
</html>