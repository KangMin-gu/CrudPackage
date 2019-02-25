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
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>IDEA CRM</title>
<!-- link includ -->
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
<link
	href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/plugins/summernote/summernote-bs4.css"
	rel="stylesheet">
<!-- choosen -->
<link
	href="${pageContext.request.contextPath}/resources/css/plugins/chosen/chosen.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">
</head>

<body>
	<div id="wrapper">
		<!-- leftside -->
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
		<!-- Top -->
		<div id="page-wrapper" class="gray-bg">
			<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>
			<!-- Content -->
			<div class="wrapper wrapper-content">
				<div class="row">
					<div class="col-lg-2">
						<%@ include file="/WEB-INF/views/template/menu/noteleftside.jsp"%>
					</div>
					<div class="col-lg-10 animated fadeInRight">
						<form:form action="/note/send" method="post" enctype="multipart/form-data">
							<div class="mail-box-header" style="padding-bottom:0px;">
						
								<div class="row">
									<div class="col-md-6 text-left">
										<h2>통지 발송</h2>
									</div>
									
		

										<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
											<div class="col-xl-8 col-lg-12 float-left alert w-100 alert-info" id="reqMsgDiv" style="height: 2rem; padding-top: 6px; overflow: hidden;">
												<span id="reqDefaultMsg" title="필수 입력값을 확인해 주세요." style=""><strong class="text-danger">받는이 및 제목을 입력해 주세요.</strong></span>
												<span id="reqSuccessMsg" style="display: none;"><strong>받는이 및 제목이 입력되었습니다.</strong></span>				
		                          			</div>
																	
										<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100"  style="padding-right: 0px;">
											<button class="btn btn-sm btn-primary submit" disabled id="submit" data-toggle="tooltip">
												<i class="fa fa-reply"></i> 발송
											</button>
											<a href="/note/inbox" class="btn btn-white btn-sm"
											data-toggle="tooltip"><i class="fa fa-times"></i> 취소</a>																		
										</div>										
									</div>														
								</div>
								
								
							</div>
							<div class="mail-box">
								<div class="mail-body">

									<!-- 받는이 -->
									<div class="form-group row" id="mysel">
										<label class="col-md-2 col-form-label" for="touser">받는이</label>
										<div class="col-md-10" id="toto" style="padding-left:0px;padding-right:0px;">
											<select id="touser" name="touser" class="chosen-select" multiple="multiple" style="width: 350px; display: none;" tabindex="-1">  											              
								                <c:forEach var="adminMail" items="${adminMail}" >
								                	<option value="${adminMail.USERNO}">${adminMail.USERNAME}</option>								                	
								                </c:forEach>
                							</select>
										</div>
									</div>


									<!-- 참조 -->
									<div class="form-group row">
										<label class="col-md-2 col-form-label" for="ccuser">참조</label>
										<div class="col-md-10" style="padding-left:0px;padding-right:0px;">
											<select id="ccuser" name="ccuser" class="chosen-select" multiple="multiple" style="width: 350px; display: none;" tabindex="-1">   						              
								                <c:forEach var="adminMail" items="${adminMail}" >
								                	<option value="${adminMail.USERNO}">${adminMail.USERNAME}</option>								                	
								                </c:forEach>
                							</select>
										</div>
									</div>
									
									
									<div class="form-group row">
										<label class="col-md-2 col-form-label" for="title">제목</label>
										<div class="col-md-8" style="padding-left:0px;">	
											<input id="title" name="title" type="text" class="form-control" value="">
										</div>
										<div class="checkbox float-left col-lg-2 p-0">
																<input type="checkbox" class="i-checks" name="important" id="important" value="1">
																<label for="important">중요 여부</label>
										</div>
									</div>
								</div>
								<div class="mail-text h-200">
									<textarea class="summernote" id="content" name="content"
										style="height: 100px;"></textarea>
									<div class="clearfix"></div>
								</div>
																	
								<div class="mail-body">
									<div class="form-group row custom-file">
										<label class="col-lg-1 col-form-label" for="file">첨부파일</label>
										<div class="col-md-6">
											<input id="filesChk" name="file" class="form-control" type="file" multiple/>										
											<p class="help-block">크기 50MB 이하의 파일 선택</p>											
										</div>
									</div>								
								</div>
								
	
								<div class="mail-body text-right tooltip-demo">
								


										<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100"  style="padding-right: 0px;">
											<button class="btn btn-sm btn-primary submit" disabled id="submit" data-toggle="tooltip">
												<i class="fa fa-reply"></i> 발송
											</button>
											<a href="/note/inbox" class="btn btn-white btn-sm"
											data-toggle="tooltip"><i class="fa fa-times"></i> 취소</a>																		
										</div>

								</div>
								<div class="clearfix"></div>
							</div>
						</form:form>				
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
	
	
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script>
		
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/chosen/chosen.jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_upload.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/jasny/jasny-bootstrap.min.js"></script>
	<script>
	<!-- radioBox-->
	
	
	
	$(document).ready(function() {
		
		$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
		
		
		//처음 진입시 받는이,제목 빨간색 테두리 
		$('#toto').css('border','1px solid #F5A9A9');
		$('#title').css('border','1px solid #F5A9A9');
		
		//제목 공백체크
		//var blank = /[\s]/g;
		
		
		//통지발송 본문에 커서 존재시 
		$('.wrapper').mouseover(function(){
			//받는이가 있으면 
			if($('.search-choice').length > 0){
				//테두리를 없앰 
				$('#toto').css('border','');
				
				//받는이가 있고 제목이 없으면 
				if($('#title').val() != ""){
					 $("#submit").removeAttr("disabled");
					 $("#reqDefaultMsg").css("display","none");
					 $("#reqSuccessMsg").css("display","");
					 $("#reqMsgDiv").removeClass("alert-info");		//기존에 있던 success 제거 (녹색창)
					 $("#reqMsgDiv").addClass("alert-success");	
				}
			}else{			//받는이 없으면 테두리 재생성 
				$('#toto').css('border','1px solid #F5A9A9');
				 $("#reqSuccessMsg").css("display","none");		    //success 제거 
				 $("#reqDefaultMsg").css("display","");
				 $("#reqMsgDiv").removeClass("alert-success");
				 $("#reqMsgDiv").addClass("alert-info");			
				 $("#submit").attr("disabled","disabled");
			}
			
			
			//제목여부 
			if($('#title').val() != ""){
				//제목 테두리 제거 
				$('#title').css('border','');
				
				//받는이가 있고 제목이 있으면 
				if($('.search-choice').length > 0){
					 $("#submit").removeAttr("disabled");
					 $("#reqDefaultMsg").css("display","none");
					 $("#reqSuccessMsg").css("display","");
					 $("#reqMsgDiv").removeClass("alert-info");		//기존에 있던 success 제거 (녹색창)
					 $("#reqMsgDiv").addClass("alert-success");	
					 
				}
				
			}else{			//제목 없으면 
				 $('#title').css('border','1px solid #F5A9A9');
				 $("#reqSuccessMsg").css("display","none");		    //success 제거 
				 $("#reqDefaultMsg").css("display","");
				 $("#reqMsgDiv").removeClass("alert-success");
				 $("#reqMsgDiv").addClass("alert-info");			
				 $("#submit").attr("disabled","disabled");
				
			}
			

		})

		//chosen
		$('.chosen-select').chosen(
				{
					width:"100%",
					search_contains : true
				}
				);
		
		$('.summernote').summernote();
		$('.note-editable').css('height','300px');
	
		
	});
	
	
	
	
	
	
</script>
</body>
</html>