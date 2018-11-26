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
<link href="${pageContext.request.contextPath}/resources/css/plugins/dualListbox/bootstrap-duallistbox.min.css" rel="stylesheet">
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
                    <h2>사용자 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/">메인</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="/ad/user">사용자목록</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="/ad/user/${user.USERNO }">사용자정보</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>사용자수정</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>		
		
		
<!-- Content -->		
<form:form action ="${pageContext.request.contextPath}/ad/user/menu" method="POST">
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
            
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-title row">
                            <h4>기본정보</h4>
                        </div>
                        
                        <div class="ibox-content row">
                            <div class="w-100 text-right mb-2">
                                <a href="${pageContext.request.contextPath}/ad/user/${user.USERNO}" class="btn btn-primary">취소</a>
                                <button class="btn btn-primary save">저장</button>
                            </div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="username">사용자명*</label></th>
                                            <td>${user.USERNAME}</td>
                                        </tr>
                                        <tr>
                                            <th><label for="mobile">휴대전화번호</label></th>
                                            <td>${user.MOBILE }</td>
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
                                            <th><label for="bsno">사용자 ID</label></th>
                                            <td height="40">
                                                <div>${user.USERID}</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="mobile">입사일자</label></th>
                                            <td>${user.ENTERDATE }</td>
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
                                            <th><label for="mobile">관리자여부</label></th>
                                            <td>${user.CHKAUTH_ }</td>
                                        </tr>
                                        <tr>
                                            <th class="border-top-0"><label for="userduty">직책</label></th>
                                            <td>${user.USERDUTY }</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-12 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 8.3%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="userdesc">메뉴 부여</label></th>
                                            <td>
                                                <select class="form-control dual_select" name="usermenuno" id="usermenuno" multiple="" style="display: none;">
                                                <c:forEach var="menu" items="${menu}">
                                                	<c:forEach var="userMenu" items="${userMenu }">
                                                		<c:if test="${menu.MENUNO == userMenu.MENUNO }"><option value="${menu.MENUNO }" selected>${menu.MENUNAME }</option></c:if>
														</c:forEach>
														<option value="${menu.MENUNO }">${menu.MENUNAME }</option>
												</c:forEach>
												
                                                </select>                            
                                            </td>
                                        </tr>
                                        <input type="hidden" name="userno" id ="userno" value="${user.USERNO }"/>
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
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/dualListbox/jquery.bootstrap-duallistbox.js"></script>
	<script>
	$(document).ready(function () {
		
		$('.date').datepicker({
			keyboardNavigation:false,
			forceParse:false,
			autocolse:true
		});	
		
		$('.dual_select').bootstrapDualListbox({
            selectorMinimalHeight: 160
        });
		// selectbox 하나로 처리해야해서 기존에 선택했던 값인지 아닌지 확인이 필요했음..
		var unselected = $('#usermenuno option:not(:selected)')
		var selected = $('#usermenuno option:selected');
		var this_value="";
		var selected_value="";
		
		//위에 jstl로 2중 foreach를 사용해서 이중포문 안쓰려고 헀는데 selected된 값과 selected되지 않은 값이 동시에 만들어져서
		// selected가 아닌 값을 지우면 동시에 사라지는 현상이 생겨서 어쩔수없이 다시 2중 each문을 사용해서 selected 값과 selected가 아닌 값을 비교해서 selected가 아닌 값을 remove
		$.each(selected,function(index){
			selected_value = $(this).val();
			$.each(unselected,function(index){
				this_value = $(this).val();
				if(selected_value == this_value){
					$(this).remove();
				}
			});
		});
		// bootstrapDaulListbox의 제공기능중 하나로 option 값을 지웠을때 새로고침을 해주는 역할
		$('.dual_select').bootstrapDualListbox('refresh',true);
	});
	
	</script>		

</body>
</html>