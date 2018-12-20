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
								<div class="w-100 text-left mb-2">
                                	<a href="${pageContext.request.contextPath}/campaign/cust" class="btn btn-primary">목록</a>
                            	</div>
							</div>
							<div class="box1 col-lg-12 p-0 mt-5">
								<div class="tabs-container">
                                	<ul class="nav nav-tabs" role="tablist">
                                    	<li><a class="nav-link tabcust active" onclick="javaacript:tabTargetCust(1);" data-toggle="tab" href="#tab1">추출 대상자</a></li>
                                    </ul>
                                    <div class="tab-content">
                                    	<div role="tabpanel" id="tab1" class="tab-pane active">
											<div class="panel-body table-responsive">				
												<div class="box1 col-xl-3 p-0">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label" style="padding-top: 3px;"><strong>고객명</strong></label>
														<div class="col-sm-8">
                                        					<div class="input-group">                                        						
                                        						<input type="text" class="form-control" id="custname" name="custname" value="${search.custname }"> 
                                        						<span class="input-group-append"> 
                                        							<a onclick="javaacript:tabTargetCust(1)" class="btn btn-primary" style="padding-top: 2px;">검색 </a>
                                        						</span>
                                        					</div>
                                    					</div>
                                					</div>
												</div>		
												<table class="table table-bordered">
													<colgroup>
														<col style="width: 130px;" />
														<col style="width: 130px;" />
														<col style="width: 130px;" />
														<col style="width: 200px;" />
														<col style="width: 100px;" />
														<col style="width: 100px;" />
														<col style="width: 100px;" />
														<col style="width: 300px;" />
													</colgroup>
													<thead>
														<tr>
															<th>고객명</th>
															<th>고객ID</th>
															<th>전화번호</th>
															<th>이메일</th>
															<th>정보활용동의</th>
															<th>고객구분</th>
															<th>고객등급</th>
															<th>주소</th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
												<div class="m-auto" style="float:center;">
													<ul class="pagination">
													</ul> 
												</div> 
											</div>									
										</div>
									</div>
									<input type="hidden" id="campno" name="campno" value="${campno }" />
								</div>
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

<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_cp.js"></script>
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