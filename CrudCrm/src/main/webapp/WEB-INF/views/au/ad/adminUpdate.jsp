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
                    <h2>사용자 관리</h2>
                    <ol class="breadcrumb">
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
<form:form action ="${pageContext.request.contextPath}/ad/user/post/${user.USERNO }" method="PUT">
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
										<strong>필수 입력값을 확인해 주세요.&nbsp;&nbsp;(사용자명 : 입력이 필요합니다. 사용자ID : 입력이 필요합니다. 비밀번호 : 입력이 필요합니다. 관리자여부 : 선택해주세요 ) </strong>
									</span>
									<span id="reqSuccessMsg" style="display:none;"><Strong>필수값이 정상적으로 입력 되었습니다.</Strong></span>
													
	                        	</div>
								<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
									<Strong><span id="showMsg"></span></Strong>
									<Strong><span id="idCheckMsg"></span></Strong>				
	                        	</div>													
								<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
									<Button type="submit" class="btn btn-primary submit" id="submit" disabled >저 장</Button>
									<a href="/ad/user/${user.USERNO }" class="btn btn-primary">취소</a>
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
                                            <th><label for="username">사용자명*</label></th>
                                            <td><input type="text" class="form-control error required validate name"  name="username" id="username" value="${user.USERNAME}"></td>
                                        </tr>
                                        <tr>
                                            <th><label for="mobile">휴대번호</label></th>
                                            <td>
                                                <select class="form-control col-3 float-left mr-3 validate phone1 phone-group" name="mobile1" id="mobile1">
                                                	<option value= <c:if test='${user.MOBILE1 eq 0}'>selected</c:if>>선택</option>
                                                    <option value=010 <c:if test='${user.MOBILE1 eq 010}'>selected</c:if>>010</option>
                                                    <option value=011 <c:if test='${user.MOBILE1 eq 011}'>selected</c:if>>011</option>
                                                    <option value=016 <c:if test='${user.MOBILE1 eq 016}'>selected</c:if>>016</option>
                                                    <option value=017 <c:if test='${user.MOBILE1 eq 017}'>selected</c:if>>017</option>
                                                </select>
                                                <input type="text" class="form-control col-3 float-left mr-2 validate phone2 phone-group" name="mobile2" id="mobile2" value="${user.MOBILE2 }">
                                                <input type="text" class="form-control col-3 float-left validate phone3 phone-group" name="mobile3" id="mobile3" value="${user.MOBILE3 }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="telno">전화번호</label></th>
                                            <td>
                                                <select class="form-control col-3 float-left mr-3 validate phone1 phone-group" name="telno1" id="telno1" >
                                                	<option value= <c:if test='${user.TELNO1 eq 0}'>selected</c:if>>선택</option>
                                                    <option value=02 <c:if test='${user.TELNO1 eq 02}'>selected</c:if>>02</option>
                                                    <option value=031 <c:if test='${user.TELNO1 eq 031}'>selected</c:if>>031</option>
                                                    <option value=032 <c:if test='${user.TELNO1 eq 032}'>selected</c:if>>032</option>
                                                </select>
                                                <input type="text" class="form-control col-3 float-left mr-2 validate phone2 phone-group" name="telno2" id="telno2" value="${user.TELNO2 }">
                                                <input type="text" class="form-control col-3 float-left validate phone3 phone-group" name="telno3" id="telno3" value="${user.TELNO3 }">
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
                                                    <input type="text" class="form-control error required validate name"  name="userid" id="userid" value="${user.USERID}">
                                                </div>
                                                <input type="hidden" class="form-control"  name="idcheck" id="idcheck" value="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="mobile">입사일자</label></th>
                                            <td>
                                                <div class="input-group">
                                            		<span class="input-group-addon">
                                    					<span class="fa fa-calendar"></span>
                                					</span>
                                            		<input type="text" class="form-control float-left date" autocomplete="off" name="enterdate" id="enterdate" value="${user.ENTERDATE }">
                                            	</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="email">이메일</label></th>
                                            <td>
                                                <input type="text" class="form-control validate email" name="email" id="email" value="${user.EMAIL }">
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
                                            <td><input type="password" class="form-control error required validate string"  name="userpassword" id="userpassword" value="${user.USERPASSWORD}"></td>
                                        </tr>
                                        <tr>
                                            <th class="border-top-0"><label for="userduty">직책</label></th>
                                            <td><input type="text" class="form-control validate simple" name="userduty" id="userduty" value="${user.USERDUTY }"></td>
                                        </tr>
                                        <tr>
                                            <th><label for="mobile">관리자여부</label></th>
                                            <td>
                                                <select class="form-control float-left error required validate check" name="chkauth" id="chkauth">
                                                    <option value=10 <c:if test='${user.CHKAUTH eq 10}'>selected</c:if>>일반사용자</option>
                                                    <option value=20 <c:if test='${user.CHKAUTH eq 20}'>selected</c:if>>관리자사용자</option>
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
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script>
	window.onload = function () {
		enableSubmit();
	}
	$(document).ready(function () {
		
		$('.date').datepicker({
			keyboardNavigation:false,
			forceParse:false,
			autoclose:true
		});	
	});
	
	</script>		

</body>
</html>