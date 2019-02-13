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
                    <h2>서식 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/ad/content">서식목록</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="/ad/content/${contentsInfo.CONTENTNO }">서식정보</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>서식 정보 수정</strong>
                        </li>
                    </ol>
                </div>
            </div>		
		
		
<!-- Content -->		
<form:form action ="${pageContext.request.contextPath}/ad/content/post/${contentsInfo.CONTENTNO }" method="POST" commandName="contentDto">
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
									<span id="reqDefaultMsg" title="필수 입력값을 확인해 주세요.&nbsp;&nbsp;(서식명 : 입력이 필요합니다.) ">
										<strong>필수 입력값을 확인해 주세요.&nbsp;&nbsp;(서식명 : 입력이 필요합니다.)</strong>
									</span>
									<span id="reqSuccessMsg" style="display:none;"><Strong>필수값이 정상적으로 입력 되었습니다.</Strong></span>				
	                        	</div>
								<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
									<Strong><span id="showMsg"></span></Strong>				
	                        	</div>													
								<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
									<Button type="submit" class="btn btn-primary submit" id="submit" disabled >저장</Button>
									<a href="/ad/contents/${contentInfo.CONTENTNO }" class="btn btn-primary">취소</a>
									<a href="/ad/contents/" class="btn btn-primary">목록</a>
								</div>
							</div>
							<div class="box1 col-lg-12 col-xl-6 p-0">
								<table class="table table-bordered mb-0">
									<colgroup>
                                    	<col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                    	<tr>
                                        	<th>서식명</th>
                                            <td><input type="text" name="title" id="title" class="form-control validate required error allV" value="${contentInfo.TITLE }"></td>
                                        </tr>
                                    </tbody>
                                </table>
                             </div>
                             <div class="box2 col-lg-12 col-xl-3 p-0">
                             	<table class="table table-bordered mb-0">
                             		<colgroup>
                             			<col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                    	<tr>
                                        	<th>사용화면</th>
                                            <td>
                                            	<select class="form-control" name="menutype" id="menutype" style="height: 22px !important">
                                            		<option label="선택" value=""/>
                                            		<option label="VOC" value="1"/>
                                            		<option label="캠페인" value="2"/>
                                            	</select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                             <div class="box2 col-lg-12 col-xl-3 p-0">
                             	<table class="table table-bordered mb-0">
                             		<colgroup>
                             			<col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                    	<tr>
                                        	<th>발송매체</th>
                                            <td>
												<form:select class="form-control validate error required checkV" path="formtype" style="height: 22px !important">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="formType" items="${FORMTYPE }">
                                                		<c:choose>
                                                			<c:when test="${contentInfo.FORMTYPE eq formType.codeval}">
                                                				<option selected label="${formType.codename }" value="${formType.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${formType.codename }" value="${formType.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </form:select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                             <div class="box2 col-lg-12 p-0">
                             	<table class="table table-bordered border-top-0 mb-0">
                             		<colgroup>
                                    	<col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                    	<tr>
                                        	<th class="border-top-0">비고</th>
                                            <td class="border-top-0">
                                            	<textarea name="content" id="content"  class="form-control summernote" style="resize:none; height: 8em;">${contentInfo.CONTENT }</textarea>
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
	<script>
	$(document).ready(function () {
		$('.summernote').summernote({
			height:400
		});
		enableSubmit();
		
	});

	</script>		

</body>
</html>