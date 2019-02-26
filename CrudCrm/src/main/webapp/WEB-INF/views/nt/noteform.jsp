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
						<form:form action="/note/send" method="post" enctype="multipart/form-data" id="form">
							<div class="mail-box-header" style="padding-bottom:0px;">
						
								<div class="row">
									<div class="col-md-6 text-left">
										<h2>통지 발송</h2>
									</div>
									
		

										<div class="box col-sm-6" style="padding-left: 0px;padding-right: 0px;">							
																	
										<div class="col-sm-6 float-right text-right mb-2 w-100"  style="padding-right: 0px;">
											<button class="btn btn-sm btn-primary submit" id="submit" data-toggle="tooltip">
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
										<div class="col-md-10" style="padding-left:0px;">
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
										<div class="col-md-10" style="padding-left:0px;">
											<select id="ccuser" name="ccuser" class="chosen-select" multiple="multiple" style="width: 350px; display: none;" tabindex="-1">   						              
								                <c:forEach var="adminMail" items="${adminMail}" >
								                	<option value="${adminMail.USERNO}">${adminMail.USERNAME}</option>								                	
								                </c:forEach>
                							</select>
										</div>
									</div>
									
									
										<div class="form-group row">
											<label class="col-md-2 col-form-label" for="title">제목</label>
											<div class="col-md-10" style="padding-left:0px;">	
												<input id="title" name="title" type="text" class="form-control" value="">
											</div>								
										</div>
										
										<div class="form-group row">
											<label class="col-md-2 col-form-label" for="title">중요</label>
											<div class="col-md-8" style="padding-left:0px;">	
												<input type="checkbox" class="i-checks" name="important" id="important" value="1">
											</div>											
										</div>
								</div>
								
									<div class="mail-text h-200">
										<textarea class="summernote" id="content" name="content"
											style="height: 100px;"></textarea>
										<div class="clearfix"></div>
									</div>
								
								</form:form>	
																								
									<div class="mail-body">
										<div class="form-group row custom-file">
											<label class="col-lg-1 col-form-label" for="file">첨부파일</label>
											<div class="col-md-6">
												<input id="filesChk" name="file" class="form-control" type="file" multiple/>										
												<p class="help-block">크기 50MB 이하의 파일 선택</p>											
											</div>
										</div>								
									</div>
							
								</div>
								<div class="clearfix"></div>
							</div>		
					</div>
				</div>
		
			<!-- Content End -->
			
			<!-- foot -->
			
		<div>	
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
	<script src="${pageContext.request.contextPath}/resources/js/plugins/validate/jquery.validate.min.js"></script>
	<script>
	<!-- radioBox-->
	
	
	
	$(document).ready(function() {
		
		$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });

		//chosen
		$('.chosen-select').chosen(
				{
					width:"100%",
					search_contains : true
				}
				);
		
		$('.summernote').summernote();
		$('.note-editable').css('height','300px');
	
		$('#submit').click(function(){
			var touser = $('#touser').val();
			var size = touser.length;
			alert(size);
			if(size == 0 ){
				$('#touser_chosen').css('border', '1px dotted #cc5965');
				
			}else{
				$('#touser_chosen').css('border', '');
				
			}
		});
		
		$("#form").validate({				
              rules: {                  
                  title: {
                      required: true                    
                  }                  
              }
          });
		});
	
	
	
	
	
	
</script>
</body>
</html>