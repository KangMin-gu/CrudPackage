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
<link href="${pageContext.request.contextPath}/resources/css/plugins/steps/jquery.steps.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/dualListbox/bootstrap-duallistbox.min.css" rel="stylesheet">
</head>

<body>
<style>
	.wizard > .content > .body{width: 100%; height: auto; background: #ffffff; padding: 2.5%; float: left; position: initial;}
</style>
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
					<div class="ibox-content row">
                        <div id="wizard" style="height:500px">                        
                            <h1>회원정보</h1> 
                            <div class="step-content table-responsive">
                            	<div class="w-100 text-right mb-2">
                                	<form:form action="${pageContext.request.contextPath}/ad/user/${user.USERNO}" method="POST">
                                		<a href="${pageContext.request.contextPath}/ad/user" class="btn btn-primary">목록</a>
                                		<a href="${pageContext.request.contextPath}/ad/user/post/${user.USERNO}" class="btn btn-primary">수정</a>
										<button class="btn btn-primary" type="submit" value="삭제">삭제</button>
									</form:form>
                            	</div>
								<table class="table table-bordered">
                                    <colgroup>
                                        <col style="width: auto; background: #fafafa;">
                                        <col style="width: auto;">
                                        <col style="width: auto; background: #fafafa;">
                                        <col style="width: auto;">
                                        <col style="width: auto; background: #fafafa;">
                                        <col style="width: auto;">                                                                                                                   
                                    </colgroup>							
									<tbody>
										<tr>
											<th>사용자명*</th>
											<td>${user.USERNAME}</td>
											<th>사용자 ID</th>
											<td>${user.USERID}</td>		
											<th>비밀번호</th>
											<td></td>	
										</tr>
										<tr>
											<th>휴대전화번호</th>
											<td>${user.MOBILE }</td>
											<th>입사일자</th>
											<td>${user.ENTERDATE }3</td>
											<th>직책</th>
											<td>${user.USERDUTY}</td>	
										</tr>
										<tr>
											<th>전화번호</th>
											<td>${user.TELNO }</td>
											<th>이메일</th>
											<td>${user.EMAIL }</td>
											<th>관리자여부</th>
											<td>${user.CHKAUTH_ }</td>	
										<tr>
										<tr>
											<th>메모</th>										
											<td colspan="5">
												<textarea rows="10" type="text" class="form-control" disabled name="userdesc" id="userdesc" value="">${user.USERDESC }</textarea>											
											</td>
										</tr>
								</table>
                            </div>

                            <h1>메뉴권한부여</h1>
                            <div class="step-content">
                            	<div class="w-100 text-right mb-2">
                                		<a href="${pageContext.request.contextPath}/ad/user" class="btn btn-primary">목록</a>
                                		<a href="${pageContext.request.contextPath}/ad/user/menu/${user.USERNO}" class="btn btn-primary">메뉴부여</a>
                            	</div>
								<table class="table table-bordered">
                                    <colgroup>
                                        <col style="width: auto; background: #fafafa;">
                                        <col style="width: auto;">
                                        <col style="width: auto; background: #fafafa;">
                                        <col style="width: auto;">
                                        <col style="width: auto; background: #fafafa;">
                                        <col style="width: auto;">                                                                                                                  
                                    </colgroup>							
									<tbody>
										<tr>
											<th>사용자명*</th>
											<td>${user.USERNAME}</td>
											<th>사용자 ID</th>
											<td>${user.USERID}</td>		
											<th>관리자여부</th>
											<td>${user.CHKAUTH_ }</td>
										</tr>
										<tr>
											<th>휴대전화번호</th>
											<td>${user.MOBILE }</td>
											<th>입사일자</th>
											<td>${user.ENTERDATE }</td>
											<th>직책</th>
											<td>${user.USERDUTY}</td>	
										</tr>
								</table>
								<div>
									<select class="form-control dual_select" name="usermenuno" id="usermenuno" disabled multiple="" style="display: none;">
	                                             <c:forEach var="menu" items="${menu}">
	                                             	<c:forEach var="userMenu" items="${userMenu }">
	                                             		<c:if test="${menu.MENUNO == userMenu.MENUNO }"><option value="${menu.MENUNO }" selected>${menu.MENUNAME }</option></c:if>
												</c:forEach>
												<option value="${menu.MENUNO }">${menu.MENUNAME }</option>
										</c:forEach>
									</select> 
								</div>
                            </div>
                        </div> 	
                    </div>
                </div>
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
	<script src="${pageContext.request.contextPath}/resources/js/plugins/steps/jquery.steps.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/dualListbox/jquery.bootstrap-duallistbox.js"></script>
	<script>
	$(document).ready(function () {
		
		$('#wizard').steps({
			headerTag: "h1",
			enableAllSteps: true,
		    enablePagination: false
		});
		$('.content').css('height','500px');
		
		 $('.dual_select').bootstrapDualListbox({
             selectorMinimalHeight: 160
         });
		 
		 $(".bootstrap-duallistbox-container").find("*").prop("disabled",true);
		 
			var unselected = $('select[name="usermenuno_helper1"] option');
			var selected = $('select[name="usermenuno_helper2"] option');
			var this_value="";
			var selected_value ="";
			$.each(selected,function(){
				selected_value = $(this).val();
				$.each(unselected,function(){
					this_value= $(this).val();
					if(this_value == selected_value){
						$(this).remove();
					}
				});
			});
			var unselected = $('select[name="usermenuno_helper1"] option');
			$('.box1 .info').text('Showing all ' + unselected.length)
	});

	</script>		

</body>
</html>