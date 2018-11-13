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
                            <a href="/user">사용자목록</a>
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
                        <div id="wizard" role="application" class="wizard clearfix">
                        	<div class="steps clearfix">
                        		<ul role="tablist">
                        			<li role="tab" class="first current" aria-disabled="false" aria-selected="true">
                        				<a id="wizard-t-0" href="#wizard-h-0" aria-controls="wizard-p-0">
                        					<span class="current-info audible">current step: </span><span class="number">1.</span> 회원 정보
                        				</a>
                        			</li>
                        			<li role="tab" class="last" aria-disabled="false" aria-selected="false">
                        				<a id="wizard-t-1" href="#wizard-h-1" aria-controls="wizard-p-1">
                        					<span class="number">2.</span> Second Step
                        				</a>
                        			</li>
                        		</ul>
                        	</div>
                        	<div class="content clearfix">
                        		<h1 id="wizard-h-0" tabindex="-1" class="title current">First Step</h1>
                        		<section>
                        		<div class="step-content body current" id="wizard-p-0" role="tabpanel" aria-labelledby="wizard-h-0" aria-hidden="false">
                        			<div class="text-center m-t-md">
                        				<div class="w-100 text-right mb-2">
                                			<form:form action="${pageContext.request.contextPath}/user/${user.USERNO}" method="POST">
                                				<a href="${pageContext.request.contextPath}/user" class="btn btn-primary">목록</a>
                                				<a href="${pageContext.request.contextPath}/user/post/${user.USERNO}" class="btn btn-primary">수정</a>
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
                                            			<td>${user.MOBILE1 }-${user.MOBILE2 }-${user.MOBILE3 }</td>
                                        			</tr>
                                        			<tr>
                                            			<th><label for="enterdate">입사일자</label></th>
                                            			<td>${user.ENTERDATE }</td>
                                        			</tr>
                                        			<tr>
                                            			<th><label for="mobile">관리자여부</label></th>
                                            			<td>${user.CHKAUTH_}</td>
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
                                            			<td>${user.TELNO1 }-${user.TELNO2 }-${user.TELNO3 }</td>
                                        			</tr>
                                        			<tr>
                                            			<th><label for="mobile">역할</label></th>
                                            			<td>${user.CHKROLE_}</td>
                                        			</tr>
                                        			<tr>
                                            			<th><label for="mobile">사용여부</label></th>
                                            			<td>${user.ISDELETE_}</td>
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
                                            			<td>${user.EMAIL }</td>
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
                        		</section>
                        		<section>
                        			<div class="step-content body current" id="wizard-p-1" role="tabpanel" aria-labelledby="wizard-h-1" aria-hidden="true" style = "display:none">
                        				<div class="text-center m-t-md">
                        					<div class="w-100 text-right mb-2">
                            					<form:form action="${pageContext.request.contextPath}/ma/mc/${memCompany.SITEID}" method="POST">
                                					<a href="${pageContext.request.contextPath}/ma/mc" class="btn btn-primary">목록</a>
                                					<a href="${pageContext.request.contextPath}/ma/mc/post/${memCompany.SITEID}" class="btn btn-primary">수정</a>
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
                                            			<th>회원사명</th>
                                            			<td>${memCompany.SITENAME}</td>
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
                                            <th>사업자번호</th>
                                            <td>${memCompany.BSNO }</td>
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
                                            <th>법인번호</th>
                                            <td>${memCompany.INCNO }</td>
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
                                            <th class="border-top-0">직장주소</th>
                                            <td class="border-top-0">
                                                ${memCompany.ZIPCODE } ${memCompany.UPRADDRESS } ${memCompany.LWRADDRESS }
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
                                            <th class="border-top-0">대표자</th>
                                            <td class="border-top-0">${memCompany.PRSDNAME } </td>

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
                                            <th>휴대전화번호</th>
                                            <td>
                                                ${memCompany.MOBILE1 }-${memCompany.MOBILE2 }-${memCompany.MOBILE3 }
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
                                                ${memCompany.FREGDATE }
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
                                            <th>전화번호</th>
                                            <td>
                                                ${memCompany.TELNO1 }-${memCompany.TELNO2 }-${memCompany.TELNO3 }
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
                                            <th>팩스번호</th>
                                            <td>
                                                ${memCompany.FAXTEL1 }-${memCompany.FAXTEL2 }-${memCompany.FAXTEL3 }
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
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 8.3%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>회원사 메모</th>
                                            <td>
                                                <textarea type="text" class="form-control col-12 float-left mr-12 summernote">${memCompany.SITEMEMO }</textarea>                            
                                            </td>
                                            	<input type="hidden" id="siteid" name="siteid" value="${memCompany.SITEID }" />
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        				</div>
                        			</div>
                        		</section>
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
	<script src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script><!-- summernote-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/steps/jquery.steps.min.js"></script>
	<script>
	$(document).ready(function () {
		
		$('#wizard').steps({
			bodyTab : "section",
			autoFocus : true,
			transitionEffect : "slideLeft"
		});
		
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
	            url:"/user/idcheck/"+idcheck ,
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