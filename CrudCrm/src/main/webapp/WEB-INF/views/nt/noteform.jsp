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
<title>CRUD SYSTEM</title>
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
						<form:form action="/note/send" method="post"
							enctype="multipart/form-data">
							<div class="mail-box-header" style="padding-bottom:0px;">
						
								<div class="row">
									<div class="col-md-6 text-left">
										<h2>통지 발송</h2>
									</div>
									
		

									<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
										<div class="col-xl-8 col-lg-12 float-left alert w-100 alert-info" id="reqMsgDiv" style="height: 2rem; padding-top: 6px; overflow: hidden;">
											<span id="reqDefaultMsg" title="필수 입력값을 확인해 주세요." style=""><strong class="text-danger"> 필수 입력값을 확인해 주세요.</strong></span>
											<span id="reqSuccessMsg" style="display: none;"><strong>필수값이 정상적으로 입력 되었습니다.</strong></span>				
	                          			</div>
																	
										<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100"  style="padding-right: 0px;">
											<button class="btn btn-sm btn-primary submit" disabled id="submit" data-toggle="tooltip">
												<i class="fa fa-reply"></i> 발송
											</button>
											<a href="/note/inbox" class="btn btn-white btn-sm"
											data-toggle="tooltip"><i class="fa fa-times"></i> 취소</a>																		
										</div>										
									</div>
									
									<!-- 
									
									
	                          			
									<div class="col-md-6 text-right">
										<button class="btn btn-sm btn-primary submit" id="sub" data-toggle="tooltip">
											<i class="fa fa-reply"></i> 발송
										</button>
										<a href="mailbox.html" class="btn btn-white btn-sm"
											data-toggle="tooltip"><i class="fa fa-times"></i> 취소</a>
									</div>
									  -->							
								</div>
								
								
							</div>
							<div class="mail-box">
								        <c:if test="${fn:contains(curUrl,'forward')}">
								        	<c:set var="toUser" value="${fn:split(toList,',')}"></c:set>
								        	
								        	<input type="hidden" id="curUrl" value='${curUrl}' />     
								       		<input type="hidden" id="subject" value='${note.TITLE}' />
								       		<input type="hidden" id="content" value='${note.CONTENT}' />
								       		<input type="hidden" id="fromUser" value='${note.FROMUSERNAME}' />
								       		<span id="toUser" style="display:none">
												<c:forEach var="to" items="${toList}" varStatus="comma">																						
													 ${to.USERNAME}			 					 					
												<c:if test="${!comma.last }">,</c:if>																																	
												</c:forEach>								
											</span>
											<span id="ccUser">
												<c:forEach var="cc" items="${ccList }" varStatus="commaTwo">								
												${cc.USERNAME }										  										
												<c:if test="${!commaTwo.last }">,</c:if>	
												</c:forEach>
									 		</span>
									 		<input type="hidden" id="date" value="${note.REGDATE }" />
								       </c:if>

								<div class="mail-body">

									<!-- 받는이 -->
									<div class="form-group row" id="mysel">
										<label class="col-md-2 col-form-label" for="touser">받는이</label>
										<div class="col-md-10" id="toto" style="padding-left:0px;padding-right:0px;">
											<select data-placeholder=" " id="touser" name="touser" class="chosen-select" multiple="" style="width: 350px; display: none;" tabindex="-1">  											              
								                <c:forEach var="adminMail" items="${adminMail}" >
								                	<option value="${adminMail.USERNAME},${adminMail.USERNO},${adminMail.EMAIL}">
								                	${adminMail.USERNAME}</option>
								                </c:forEach>
								                
								               
								                <c:choose>								               
								                	<c:when test="${!fn:contains(curUrl,'forward')}">
								       				<option value="${replyUser.USERNAME},${replyUser.USERNO},${replyUser.EMAIL}" ${replyUser.USERNO ne "" ? "selected" :""}>
								       					${replyUser.USERNAME}
								       				</option>
								       				</c:when>
								       			</c:choose>
                							</select>
										</div>
									</div>


									<!-- 참조 -->
									<div class="form-group row">
										<label class="col-md-2 col-form-label" for="ccuser">참조</label>
										<div class="col-md-10" style="padding-left:0px;padding-right:0px;">
											<select data-placeholder=" " id="ccuser" name="ccuser" class="chosen-select" multiple="" style="width: 350px; display: none;" tabindex="-1">   						              
								                <c:forEach var="adminMail" items="${adminMail}" >
								                	<option value="${adminMail.USERNAME},${adminMail.USERNO},${adminMail.EMAIL}">
								                	${adminMail.USERNAME}</option>
								                	
								                </c:forEach>
                							</select>
										</div>
									</div>
									
									
									<div class="form-group row">
										<label class="col-md-2 col-form-label" for="title">제목</label>
										<div class="col-md-8" style="padding-left:0px;">
											<c:choose>
											
											 <c:when test="${fn:contains(curUrl,'forward')}">
												<input id="title" name="title" type="text"
													class="form-control" value="">
											</c:when>
											<c:otherwise>
												<input id="title" name="title" type="text"
													class="form-control  error validate allV required " value="">
											
											</c:otherwise>
											
											</c:choose>
											<!-- error validate allV required -->
											
										</div>
										<div class="col-md-2 text-left">
											<label for="col-form-label" for="important"
												style="margin-top: 7px;">중요 여부:</label> <input
												id="important" name="important" type="checkbox"
												class="i-checks" value="1">
										</div>
									</div>
								</div>
								<div class="mail-text h-200">
									<textarea class="summernote" id="content" name="content"
										style="height: 100px;"></textarea>
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
								
								<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100"  style="padding-right: 0px;">
											<button class="btn btn-sm btn-primary submit" disabled id="sub" data-toggle="tooltip">
												<i class="fa fa-reply"></i> 발송
											</button>
											<a href="mailbox.html" class="btn btn-white btn-sm"
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

	<script>
	
	
	
	$(document).ready(function() {
		$('#toto').css('border','1px solid #F5A9A9');

		
		
		$(document).on('mouseup','.chosen-container:eq(0)',function(){
			//받는사람이 없으면 
			debugger;
			if($('.search-choice').length <= 0){
				 $("#reqSuccessMsg").css("display","none");
				 $("#reqDefaultMsg").css("display","");
				 
				 $("#reqMsgDiv").removeClass("alert-success");		//기존에 있던 success 제거 (녹색창)
				 $("#reqMsgDiv").addClass("alert-info");			
				 $("#submit").attr("disabled","disabled");
				 $("#reqDefaultMsg").html("<strong style='color:red'>받는사람을 입력해주세요.</strong>");				
				return false;
			}else{			
				if(!$('#title').hasClass('error')){
				 $("#submit").removeAttr("disabled");
				 $("#reqDefaultMsg").css("display","none");
				 $("#reqSuccessMsg").css("display","");
				 $("#reqMsgDiv").removeClass("alert-info");		//기존에 있던 success 제거 (녹색창)
				 $("#reqMsgDiv").addClass("alert-success");	
				 $('#toto').css('border','');
				}
			}
		});
		
		
		
		$("#title").on({
			keyup:function(){
				debugger;
				if($('.search-choice').length <= 0){
					$("#reqSuccessMsg").css("display","none");
					$("#reqDefaultMsg").css("display","");
					
					$("#reqMsgDiv").removeClass("alert-success");		//기존에 있던 success 제거 (녹색창)
					 $("#reqMsgDiv").addClass("alert-info");	
					
					 $("#submit").attr("disabled","disabled");
					 $("#reqDefaultMsg").html("<strong style='color:red'>받는사람을 입력해주세요.</strong>");				
					return false;
				}
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
		
		
		
		//summernote에 넣을 내용 
		var forwardHtml = '';
		//현재 url값 
		var curUrl = $('#curUrl').val();
		debugger;
		var subject = $('#subject').val();
		var date = $('#date').val();
		var from = $('#fromUser').val();
		var to = $('#toUser')
		to = to.text().replace(/\n/g, "").replace(/(\s*)/g,"");
		var cc = $('#ccUser')
		cc = cc.text().replace(/\n/g, "").replace(/(\s*)/g,"");
		var content = $('#content').val();
		
		forwardHtml += '<br><p style="border-left:2px solid black;padding-left:10px;height:140px">-------------- Original Message -------------- <br>';
			forwardHtml += '<strong>Subject: </strong>&nbsp;' + subject + '<br>';
			forwardHtml += '<strong>Date: </strong>&nbsp;' + date + '<br>';
			forwardHtml += '<strong>From: </strong>&nbsp;' + from + '<br>';
			forwardHtml += '<strong>To: </strong>&nbsp;' + to + '<br>';
			forwardHtml += '<strong>Cc: </strong>&nbsp;' + cc + '<br>';
			forwardHtml += '<h4>' + content + '</h4><br></p><br>';
			
		if(curUrl.indexOf('forward') > 0){
			$('#title').attr('value','FW: '+subject)
			$('.summernote').summernote('code',forwardHtml);
		}
		
		
	
		
		
		
		
		$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
		
		
	});
	
	
	
	
	
	
</script>
</body>
</html>