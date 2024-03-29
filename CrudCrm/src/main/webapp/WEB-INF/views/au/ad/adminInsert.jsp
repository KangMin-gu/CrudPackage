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
<title>IDEA CRM</title>
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
                    <h2>회원 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/ad/user">회원목록</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>회원추가</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>		
		
		
<!-- Content -->		
<form:form action ="${pageContext.request.contextPath}/ad/user/post" method="POST">
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
									<span id="reqDefaultMsg" title="필수 입력값을 확인해 주세요.&nbsp;&nbsp;(사용자명 : 입력이 필요합니다. 사용자ID : 입력이 필요합니다. 비밀번호 : 입력이 필요합니다. 관리자여부 : 선택해주세요 ) ">
										<strong>필수 입력값을 확인해 주세요.&nbsp;&nbsp;(사용자명 : 입력이 필요합니다. 사용자ID : 입력이 필요합니다. 비밀번호 : 입력이 필요합니다.) </strong>
									</span>
									<span id="reqSuccessMsg" style="display:none;"><Strong>필수값이 정상적으로 입력 되었습니다.</Strong></span>
													
	                        	</div>
								<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
									<Strong><span id="showMsg"> </span></Strong>
	                        	</div>
	                        														
								<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
									<Button type="submit" class="btn btn-primary submit" id="submit" disabled >저 장</Button>
									<a href="/ad/user" class="btn btn-primary">목 록</a>
								</div>
							</div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="username">사용자명</label></th>
                                            <td><input type="text" class="form-control error required validate nameV" maxlength="20" name="username" id="username" value="${user.USERNAME}"></td>
                                        </tr>
                                        <tr>
                                            <th><label for="mobile">휴대번호</label></th>
                                            <td>
                                                <select class="form-control col-3 float-left mr-3 error required validate phone1V phone-group" name="mobile1" id="mobile1">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="mobile" items="${MOBILE }">
                                                		<c:choose>
                                                			<c:when test="${user.TELNO1 eq mobile.codeval}">
                                                				<option selected label="${mobile.codename }" value="${mobile.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${mobile.codename }" value="${mobile.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                                <input type="text" class="form-control col-3 float-left mr-2 error required validate phone2V phone-group" maxlength="4" name="mobile2" id="mobile2" value="${user.MOBILE2 }">
                                                <input type="text" class="form-control col-3 float-left error required validate phone3V phone-group" maxlength="4" name="mobile3" id="mobile3" value="${user.MOBILE3 }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="telno">전화번호</label></th>
                                            <td>
                                                <select class="form-control col-3 float-left mr-3 validate phone1V phone-group" id="telno1" name="telno1">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="phone" items="${PHONE }">
                                                		<c:choose>
                                                			<c:when test="${user.TELNO1 eq phone.codeval}">
                                                				<option selected label="${phone.codename }" value="${phone.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${phone.codename }" value="${phone.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                                <input type="text" class="form-control col-3 float-left mr-2 validate phone2V phone-group" maxlength="4" name="telno2" id="telno2" value="${user.TELNO2 }">
                                                <input type="text" class="form-control col-3 float-left validate phone3V phone-group" maxlength="4" name="telno3" id="telno3" value="${user.TELNO3 }">
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
                                            <th><label for="bsno">사용자 ID</label></th>
                                            <td height="40">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" style="ime-mode:disabled;" maxlength="20" name="userid" id="userid" value="${user.USERID}">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="mobile">입사일자</label></th>
                                            <td>
                                                <div class="input-group">
                                            		<span class="input-group-addon">
                                    					<span class="fa fa-calendar"></span>
                                					</span>
                                            		<input type="text" class="form-control float-left date validate dateV" autocomplete="off" data-mask="9999-99-99" name="enterdate" id="enterdate" value="${user.ENTERDATE }">
                                            	</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="email">이메일</label></th>
                                            <td>
                                                <input type="text" class="form-control error required validate emailV" maxlength="50" name="email" id="email" value="${user.EMAIL }">
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
                                            <th><label for="incno">비밀번호</label></th>
                                            <td><input type="password" class="form-control error required validate passwordV" maxlength="20" name="userpassword" id="userpassword" value="${user.USERPASSWORD}"></td>
                                        </tr>
                                        <tr>
                                            <th class="border-top-0"><label for="userduty">직책</label></th>
                                            <td><input type="text" class="form-control validate stringV" maxlength="20" name="userduty" id="userduty" value="${user.USERDUTY }"></td>
                                        </tr>
                                        <tr>
                                            <th><label for="chkauth">관리자여부</label></th>
                                            <td>
                                            <select class="form-control" id="chkauth" name="chkauth">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="chkAuth" items="${CHKAUTH_ }">
                                                		<c:choose>
                                                			<c:when test="${user.CHKAUTH eq chkAuth.codeval}">
                                                				<option selected label="${chkAuth.codename }" value="${chkAuth.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${chkAuth.codename }" value="${chkAuth.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </select>
                                            </td>
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
                                            <th><label for="userdesc">사용자메모</label></th>
                                            <td>
                                                <textarea type="text" class="form-control col-12 float-left mr-12" name="userdesc" id="userdesc" value="${user.USERDESC }">${user.USERDESC }</textarea>                            
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
	<script src="${pageContext.request.contextPath}/resources/crud/crud_validate.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/jasny/jasny-bootstrap.min.js"></script>
	<script>
	$(document).ready(function () {
		$('.date').datepicker({
			keyboardNavigation:false,
			forceParse:false,
			autoclose:true
		});
		
		$('#userid').addClass('error');
		
	});
	$('#userid').keyup(function(e){
		id_check();
	});
	
	function id_check(){
		debugger;
		var idcheck = $('#userid').val();
		var check = $("#idcheck");
		var text ="";
		var test;
		if(idcheck.length < 5){
				text = 'ID는 5글자 이상 입력되어야 합니다.';
            	$('#showMsg').empty();
            	$('#showMsg').show();
            	$('#showMsg').append(text);
            	$('#userid').addClass('error');
				check.val(0);
		}else{
	        $.ajax({
	            url:"/user/idcheck/"+idcheck ,
	            method: "GET",
	            dataType: "json",
	            cache: false,
	            success:function(data){
	                if(data == 0){
	                	text = '사용 가능한 ID 입니다.';
	                	$('#showMsg').empty();
	                	$('#showMsg').show();
	                	$('#showMsg').append(text);
	                	$('#userid').removeClass('error');
	                	$('#showMsg').parent().parent().removeClass('alert-danger').addClass('alert-info');
	                	$('.submit').prop('disabled',false);
	                	test = true;
	                	return test;
	                }else{
	                	text = '이미 존재하고 있는 ID 이거나 입력되지 않았습니다.';
	                	$('#showMsg').empty();
	                	$('#showMsg').show();
	                	$('#showMsg').append(text);
	                	$('#showMsg').parent().parent().show();             
	                	$('#showMsg').parent().parent().removeClass('alert-info').addClass('alert-danger');
	                	$('.submit').prop('disabled',true);
	                		test = false
	                		return test;
	                }
	                return test;
	            },
	            error:function(request,status,error){
	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
	        });
		}
	}

	</script>		

</body>
</html>