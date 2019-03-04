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
<link
	href="${pageContext.request.contextPath}/resources/css/plugins/chosen/chosen.css"
	rel="stylesheet">
	<style>
body {
	background-color: #f3f3f4;
}
</style>
</head>

<body>
	<div id="wrapper">
			<!-- Content -->
			<div class="wrapper wrapper-content">
				<div class="row">
					<div class="col-lg-12 animated fadeInRight article">
						<form:form action="/mail/send" method="post"
							enctype="multipart/form-data">
							<div class="mail-box-header">
								<div class="row">
									<div class="col-md-6 text-left">
										<h2>메일 발송</h2>
									</div>
									<div class="col-md-6 text-right">
										<button class="btn btn-sm btn-primary" id="sub" data-toggle="tooltip">
											<i class="fa fa-reply"></i> 발송
										</button>
										<a href="mailbox.html" class="btn btn-white btn-sm"
											data-toggle="tooltip"><i class="fa fa-times"></i> 취소</a>
									</div>
								</div>
							</div>
							<div class="mail-box">


								<div class="mail-body">

									<!-- 받는이 -->
									<div class="form-group row" id="mysel">
										<label class="col-md-2 col-form-label" for="touser">받는이:</label>
										<div class="col-md-10">
											<input type="text" name="custmail" id="custmail" class="form-control" value="">
										</div>
									</div>
									<!-- 참조 -->
									<div class="form-group row">
										<label class="col-md-2 col-form-label" for="ccuser">참조:</label>
										<div class="col-md-10">
											<select data-placeholder=" " id="ccuser" name="ccuser" class="chosen-select" multiple="" style="width: 350px; display: none;" tabindex="-1">   						              
								                <c:forEach var="adminMail" items="${adminMail}" >
								                	<option value="${adminMail.EMAIL}">
								                	${adminMail.USERNAME}</option>
								                </c:forEach>
                							</select>
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-md-2 col-form-label" for="title">제목:</label>
										<div class="col-md-8">
											<input id="title" name="title" type="text"
												class="form-control" value="">
										</div>
									</div>
								</div>
								
								<div class="mail-text h-200">
									<textarea class="summernote" id="content" name="content"
										style="height: 300px;">
	
										</textarea>
									<div class="clearfix"></div>
								</div>
								<div class="mail-body">
									<div class="form-group row">
										<label class="col-lg-1 col-form-label" for="file">첨부파일</label>
										<div class="col-md-6">
											<input id="file" name="file" class="form-control" type="file"
												multiple>
											<p class="help-block">크기 200Mbyte 이하의 파일 선택</p>
										</div>
									</div>
								</div>
								<div class="mail-body text-right tooltip-demo">
								
								
									
										<button class="btn btn-sm btn-primary" id="sub" data-toggle="tooltip" >
											<i class="fa fa-reply"></i> 발송
										</button>
									
									
									
									<a href="mailbox.html" class="btn btn-white btn-sm"
										data-toggle="tooltip"><i class="fa fa-times"></i> 취소</a>
								</div>
								<div class="clearfix">
								<input type="hidden" name="custno" id="custno">
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<!-- Content End -->

			
		

		
	</div>

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	
	
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script>
		
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/chosen/chosen.jquery.js"></script>
<script src='https://cloud.tinymce.com/stable/tinymce.min.js'></script>
	<script>
	
	$(document).ready(function() {
		// 고객의 이메일 정보를 해당 받는 이의 이메일로 넣음.
		$('#custmail').val(opener.$('#email').val());
		$('#custno').val(opener.$('#custno').val());
		// tinymce -> 에디터
		tinymce.init({
		      selector: '#content',  // change this value according to your HTML
		      toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link imageupload | print preview media fullpage | forecolor backcolor emoticons',
		      setup: function(editor) {

		              // create input and insert in the DOM
		              var inp = $('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
		              $(editor.getElement()).parent().append(inp);

		              // add the image upload button to the editor toolbar
		              editor.addButton('imageupload', {
		                text: 'image',  
		                icon: 'image',
		                onclick: function(e) { // when toolbar button is clicked, open file select modal
		                  inp.trigger('click');
		                }
		              });

		              // when a file is selected, upload it to the server
		              inp.on("change", function(e){
		            	  minymceUploadFile($(this), editor);
		              });
		      }
		    });
		
		//chosen
		$('.chosen-select').chosen(
				{
					width:"100%",
					search_contains : true
				}
				);

		$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
		
		$('#sub').click(function(e){
			
			self.close();
			
		});
		
		
	});
	
</script>
</body>
</html>