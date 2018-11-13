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
                            <a href="/au">사용자목록</a>
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
                            <div class="w-100 text-right mb-2">
                                <form:form action="${pageContext.request.contextPath}/au/${user.USERNO}" method="POST">
                                	<a href="${pageContext.request.contextPath}/au" class="btn btn-primary">목록</a>
                                	<a href="${pageContext.request.contextPath}/au/post/${user.USERNO}" class="btn btn-primary">수정</a>
									<button class="btn btn-primary" type="submit" value="삭제">삭제</button>
								</form:form>
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
                                            <td height="40">${user.USERID}</td>
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
                                            <td></td>
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
                                                ${user.MOBILE1 }-${user.MOBILE2 }-${user.MOBILE3 }
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="enterdate">입사일자</label></th>
                                            <td>${user.ENTERDATE }</td>
                                        </tr>
                                        <tr>
                                            <th><label for="mobile">관리자여부</label></th>
                                            <td>
                                                ${user.CHKAUTH_}
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
                                            <td>${user.TELNO1 }-${user.TELNO2 }-${user.TELNO3 }
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="mobile">역할</label></th>
                                            <td>
                                                ${user.CHKROLE_}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="mobile">사용여부</label></th>
                                            <td>
                                                ${user.ISDELETE_}
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
                                            <th><label for="email">이메일</label></th>
                                            <td>
                                                ${user.EMAIL }
                                            </td>
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
                                            <th><label for="userdesc">사용자메모</label></th>
                                            <td>
                                                <textarea type="text" class="form-control col-12 float-left mr-12 summernote" name="userdesc" id="userdesc" value="${user.USERDESC }">${user.USERDESC }</textarea>                            
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
	<script>
	$(document).ready(function () {
		$('.summernote').summernote({});
		$('.summernote').summernote('disable');
	});
	$('#userid').keyup(function(){
		var idcheck = $('#userid').val();
		var check = $("#idcheck");
		if(idcheck.length <=5){
			if(check.val() != 1){
				var msg = '5글자 이상 입력해주세요';
				check.val(1);
			}
		}else{
	        $.ajax({
	            url:"/au/idcheck/"+idcheck ,
	            method: "GET",
	            dataType: "json",
	            success:function(data){
	                if(data == 0){
	                	var msg = '사용 가능한 ID 입니다.';
	                }else{
	                	var msg = '이미 존재하고 있는 ID 입니다.'
	                }
	                $('.idcheck').text(msg);
	            },
	            error:function(request,status,error){
	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
	        });
		}
		$('.idcheck').text(msg);
	});

	</script>		

</body>
</html>