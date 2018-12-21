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
                    <h2>캠페인 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/campaign">캠페인목록</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="/campaign/${campInfo.CAMPNO }">캠페인정보</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>캠페인정보 수정</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>		
		
		
<!-- Content -->		
<form:form action ="${pageContext.request.contextPath}/campaign/post/${campInfo.CAMPNO }" method="POST" commandName="campaignDto" enctype="multipart/form-data">
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
									<span id="reqDefaultMsg" title="필수 입력값을 확인해 주세요.&nbsp;&nbsp;(캠페인명 : 입력이 필요합니다.) ">
										<strong>필수 입력값을 확인해 주세요.&nbsp;&nbsp;(캠페인명 : 입력이 필요합니다.)</strong>
									</span>
									<span id="reqSuccessMsg" style="display:none;"><Strong>필수값이 정상적으로 입력 되었습니다.</Strong></span>				
	                        	</div>
								<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
									<Strong><span id="showMsg"></span></Strong>				
	                        	</div>													
								<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
									<Button type="submit" class="btn btn-primary submit" id="submit" disabled >저 장</Button>
									<a href="/campaign/${campInfo.CAMPNO }" class="btn btn-primary">취소</a>
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
                                        	<th>캠페인명</th>
                                            <td><input type="text" name="campname" id="campname" class="form-control validate required error allV" value="${campInfo.CAMPNAME }"></td>
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
                                        	<th>캠페인유형</th>
                                            <td>
                                            	<form:select class="form-control validate checkV" path="camptype" style="height: 22px !important">
                                            		<option label="선택" value="0"/>
                                                	<c:forEach var="campType" items="${CAMPTYPE }">
                                                		<c:choose>
                                                			<c:when test="${campInfo.CAMPTYPE eq campType.codeval}">
                                                				<option selected label="${campType.codename }" value="${campType.codeval }"/>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<option label="${campType.codename }" value="${campType.codeval }"/>
                                                			</c:otherwise>
                                                		</c:choose>
                                                	</c:forEach>
                                                </form:select>
                                            </td>
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
                                			<th>진행단계</th>
                                        	<td><input type="text" name="campstep_" id="campstep_" disabled class="form-control" value="접수">
                                        		<input type="hidden" name="campstep" id="campstep" class="form-control" value="0"/>
                                        	</td>
                                        	
                                    	</tr>
                                	</tbody>
                            	</table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-8 p-0">
                            	<table class="table table-bordered border-top-0 mb-0">
                                	<colgroup>
                                    	<col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                   	<tbody>
                                    	<tr>
                                        	<th class="border-top-0">발송기간</th>
                                            <td class="border-top-0">
                                            	<div class="input-group p-0">
                                                	<div class="d-flex date date01 col-lg-5 col-md-5 p-0 col-5">
                                                    	<span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" autocomplete="off" name="startdate" id="startdate" class="form-control" value="${campInfo.STARTDATE }">
                                                    </div>
                                                    <h3 class="text-center col-lg-1 col-1 p-0">~</h3>
                                                    <div class="d-flex date date02 col-lg-5 col-md-5 p-0 col-5">
                                                    	<span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" autocomplete="off" name="enddate" id="enddate" class="form-control" value="${campInfo.ENDDATE }">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                            	<table class="table table-bordered border-top-0 mb-0">
                                	<colgroup>
                                    	<col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                    	<tr>
                                        	<th class="border-top-0">담당자</th>

                                            <td class="border-top-0 border-bottom-0">
                                            	<div class="input-group owner">
                                                    <input type="text" class="form-control" autocomplete="off" name="owner_" id="owner_" value="${campInfo.OWNER_ }">
                                                    <input type="hidden" name="owner" id="owner" value="${campInfo.OWNER }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
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
                                            	<textarea name="campdesc" id="campdesc"  class="form-control summernote" style="resize:none; height: 8em;" value="${campInfo.CAMPDESC }">${campInfo.CAMPDESC }</textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <input type="hidden" name="campno" id="campno" value="${campInfo.CAMPNO }">
                            </div>
                            <div class="box2 col-lg-12 p-0">
                             	<table class="table table-bordered border-top-0 mb-0">
                             		<colgroup>
                                    	<col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                    	<tr>
                                        	<th class="border-top-0">첨부파일</th>
                                            <td class="border-top-0">
                                            	<div class="col-md-6">
													<input id="file" name="file" class="form-control" type="file" multiple>
														<p class="help-block">크기 200Mbyte 이하의 파일 선택</p>
												</div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="mail-attachment">
                            		<!-- <input type="hidden" value="${campFile.FILESEARCHKEY }"/>  -->
												<p>	<span><i class="fa fa-paperclip"></i> 첨부파일</span></p>
												<div class="attachment">
													<c:forEach var="file" items="${campFile }">
														<div class="file-box">
															<div class="file">
																<a href="${pageContext.request.contextPath}/campaign/download/${file.FILEID}"> <span class="corner"></span>
																	<div class="icon">
																		<i class="fa fa-file"></i>
																	</div>
																	<div class="file-name">
																		${file.ORGFILENAME } <br /> <small>${file.REGDATE }</small>
																	</div>
																</a>
															</div>
														</div>	
													</c:forEach>										
													<div class="clearfix"></div>
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
</div>
<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>		
	<script src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script><!-- summernote-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script>
	
	window.onload = function () {
		enableSubmit();
	}
	
	$(document).ready(function () {
		$('.summernote').summernote({});
		
		$('.date').datepicker({
			keyboardNavigation:false,
			forceParse:false,
			autoclose:true
		});
		
	});

	</script>		

</body>
</html>