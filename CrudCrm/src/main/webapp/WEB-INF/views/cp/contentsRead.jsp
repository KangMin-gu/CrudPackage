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
                            <a href="/campaign/contents">서식목록</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>서식 추가</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>		
		
		
<!-- Content -->		
<form:form action ="${pageContext.request.contextPath}/campaign/contents/${contentsInfo.NO }" method="POST">
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
            
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-title row">
                            <h4>기본정보</h4>
                        </div>
                        
                        <div class="ibox-content row">
                        	<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
								<div class="w-100 text-right mb-2">
                                	<form:form action="${pageContext.request.contextPath}/campaign/contents/${contentsInfo.NO }" method="POST">
                                		<a href="${pageContext.request.contextPath}/campaign/contents/post/${contentsInfo.NO }" class="btn btn-primary">수정</a>
										<button class="btn btn-primary" type="submit" value="삭제">삭제</button>
										<a href="${pageContext.request.contextPath}/campaign/contents" class="btn btn-primary">목록</a>
									</form:form>
                            	</div>
							</div>
														<div class="box1 col-lg-12 col-xl-8 p-0">
								<table class="table table-bordered mb-0">
									<colgroup>
                                    	<col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                    	<tr>
                                        	<th>서식명</th>
                                            <td>${contentsInfo.TITLE }</td>
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
                                        	<th>매체유형</th>
                                            <td>${contentsInfo.FORMTYPE_ }</td>
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
                                        	<th class="border-top-0">용도</th>
                                            <td class="border-top-0">
                                            	${contentsInfo.PURP }
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
                                            	<textarea name="content" id="content"  class="form-control summernote" style="resize:none; height: 8em;">${contentsInfo.CONTENT }</textarea>
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
		$('.summernote').summernote('disable',{
			height:400
		});
		
	});

	</script>		

</body>
</html>