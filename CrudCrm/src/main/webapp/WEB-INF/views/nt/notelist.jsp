<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>CRUD SYSTEM</title>
<!-- link includ -->
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet"> <!--datePicker-->
<style>
	.active{
		background: black;
	}
</style>
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
						<div class="mail-box-header">				
							<form:form method="post" action="${pageContext.request.contextPath}/${url}">
									<div class="container-fluid">
										<div class="row">
											<div class="col-lg-3 "><h2>${NOTENAME }(${notReadVal })</h2></div> 
											<div class="col-lg-9 ">										
												<div class="container">
													<div class="row">
														<div class="col-lg-6">																													
															 <div class="input-group p-0">
			                                                    <div class="d-flex date date01 col-lg-5 col-md-5 p-0 col-5" style="height: 29px !important; max-height: 29px !important;">
			                                                      <span class="input-group-addon" style="padding:6px 12px;"><i class="fa fa-calendar"></i></span>
			                                                      <input id="startdate" name="startdate" type="text" class="form-control" placeholder="시작일" value="${startdate }">
			                                                    </div>
			                                                    <h3 class="text-center col-lg-1 col-1 p-0">~</h3>
			                                                    <div class="d-flex date date02 col-lg-5 col-md-5 p-0 col-5" style="height: 29px !important; max-height: 29px !important;">
			                                                      <span class="input-group-addon" style="padding:6px 12px;"><i class="fa fa-calendar"></i></span>
			                                                      <input id="enddate" name="enddate" type="text" class="form-control" placeholder="종료일" value="${enddate }">
			                                                    </div>
	                                                		</div>
														</div>
														<div class="col-lg-6">
															<div class="container">
																<div class="row">
																	<div class="d-flex col-lg-12">													
																		<select id="condition" name="condition" class="form-control" style="height: 29px !important; max-height: 29px !important;">										                                                                       
										                                    <option value="title">제목</option>
										                                    <option value="sender">보낸이</option>
							                                    		</select>						                                    		
 							                                 			<input id="keyword" name="keyword" type="text" class="form-control" id="keyword" name="keyword" value="${keyword }" placeholder="검색어">																	
																		<button type="submit" class="btn btn-sm btn-primary">검색</button>																						                                    		                                																																																														
																	</div>								
																</div>
															</div>																																													
														</div>														
													</div>																				
												</div>										
											</div>																			
										</div>
									</div>	
								</form:form>					
							<div class="mail-tools tooltip-demo m-t-md">
								<div class="btn-group float-right">
									<!--   <button class="btn btn-white btn-sm"><i class="fa fa-arrow-left"></i></button>
                        			<button class="btn btn-white btn-sm"><i class="fa fa-arrow-right"></i></button> -->
                        			
                        			<!-- 페이징 버튼 강조 표시 -->
									<ul class="pagination">
										<c:choose>
											<c:when test="${page.startPageNum ne 1 }">
												<li><a
													href="${pageContext.request.contextPath}/${url }?pageNum=${page.startPageNum-1 }&condition=${condition}&keyword=${keyword}&startdate=${startdate}&enddate=${enddate}">&laquo;</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&laquo;</a>
												</li>
											</c:otherwise>
										</c:choose>
										<c:forEach var="i" begin="${page.startPageNum }"
											end="${page.endPageNum }">
											<c:choose>
												<c:when test="${i eq page.pageNum }">
													<li class="active page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/${url }?pageNum=${i }&condition=${condition}&keyword=${keyword}&startdate=${startdate}&enddate=${enddate}">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li><a
														href="${pageContext.request.contextPath}/${url }?pageNum=${i }&condition=${condition}&keyword=${keyword}&startdate=${startdate}&enddate=${enddate}">${i }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${page.endPageNum lt page.totalPageCount }">
												<li><a
													href="${pageContext.request.contextPath}/${url }?pageNum=${page.endPageNum+1 }&condition=${condition}&keyword=${keyword}&startdate=${startdate}&enddate=${enddate}">&raquo;</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&raquo;</a>
												</li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
								<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="새로고침" 
									onclick="window.location.href='${pageContext.request.contextPath}/${url }?pageNum=${page.pageNum}&condition=${condition}&keyword=${keyword}&startdate=${startdate}&enddate=${enddate}'">
									<i class="fa fa-refresh"></i>
								</button>
								
								<c:set var="urls" value="${requestScope['javax.servlet.forward.request_uri']}" />							
								
								<c:if test="${urls  eq '/note/inbox' or urls eq '/note/import' or urls eq '/note/trash'}">
								<button id="eyeChk" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="읽음">
									<i class="fa fa-eye"></i>
								</button>
								</c:if>
								
								<c:if test="${urls  eq '/note/inbox' or urls eq '/note/import'}">
								<button id="importChk" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="중요 통지">
									<i class="fa fa-exclamation"></i>
								</button>
								</c:if>												
								
								<c:choose>
									<c:when test="${urls  eq '/note/inbox' or urls eq '/note/import'}">
										<button id="trashChk" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="휴지통으로 이동">
											<i class="fa fa-trash-o"></i>
										</button>
									</c:when>
									<c:when test="${urls eq '/note/trash' }">
										<button id="returnChk" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="보관함으로 이동">
											<i class="fa fa-retweet"></i>
										</button>
										<button id="deleteChk" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="삭제">
											<i class="fa fa-trash-o"></i>
										</button>
									</c:when>
									<c:otherwise>
										
									</c:otherwise>
								</c:choose>				
							</div>
						</div>
						
						<div class="mail-box">							
						<!-- 수정부분  -->
							<table class="table table-hover table-mail">
							<colgroup>
											<col width="35px;">
											<col width="150px;">
											<col width="100px;">
											<col width="100px;">
											<col width="50px;">
										
							</colgroup>
								<thead>
											<tr>
												<th style="padding-left:20px">
													<input type="checkbox" class="i-checks" id="icheckAll" name = "icheckAll" >
												</th>
												<th style="padding-left:12px">보낸이</th>
												<th>제목</th>
												<th>날짜</th>
												<th>첨부파일</th>
												
											
											</tr>
								</thead>
								<tbody>
									<c:forEach var="tmp" items="${noteList }">
										
										
										<tr
										<c:choose>
	                 						<c:when test="${tmp.READCHEK eq 0 }">class="unread"</c:when>
	                 						<c:otherwise>class="read"</c:otherwise>
	                 					</c:choose>
	                 					>
											<td class="check-mail"><input id="noticeid" name="noticeid" type="checkbox" class="i-checks chksquare" value="${tmp.NOTICEID }"></td>
											<td class="mail-ontact">${tmp.FROMUSERNAME }<c:if test="${tmp.IMPORTANT  eq  1 }"><span class="label label-danger float-right">!</span></c:if></td>
											<td class="mail-subject"><a href="${pageContext.request.contextPath}/${url }/${tmp.NOTICEID}">${tmp.TITLE }</a></td>
											<td class="text-right mail-date">
												<jsp:useBean id="toDay" class="java.util.Date" />
												<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" var="nowDate"/>
												<c:choose>
													<c:when test="${nowDate >  tmp.SENDDATE}">${tmp.SENDDATE }</c:when>
			                 						<c:otherwise>${tmp.SENDDATETIME }</c:otherwise>
												</c:choose>																	
											</td>
											
											<td class="text-right"><c:if test="${tmp.FILESEARCHKEY ne NULL }"><i class="fa fa-paperclip"></i></c:if></td>
										</tr>
										
									</c:forEach>
								</tbody>
							</table>							
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
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>	
<script>

$(document).ready(function(){
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
		
            // datePicker
            $('.date.date01, .date.date02').datepicker({           	
                todayBtn: "linked",
                format: "yyyy-mm-dd",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true,
                language: "kr"
            });         
});   

$('#eyeChk').click(function(){
	var checkArr=[]
	$("input[name='noticeid']:checked").each(function(i){
		checkArr.push($(this).val());
	});
	var allData = {"checkArr": checkArr };
	
	$.ajax({
        url:"eyechk",
        type:'GET',
        data: allData,
        success:function(data){          
            location.reload();
        },
        error:function(jqXHR, textStatus, errorThrown){
            		alert("통지가 선택되지 않았습니다.");
            		return false;
        }
        });
});

$("#importChk").click(function(){
	var checkArr=[]
	$("input[name='noticeid']:checked").each(function(i){
		checkArr.push($(this).val());
	});
	var allData = {"checkArr": checkArr };
	
	$.ajax({
        url:"importchk",
        type:'GET',
        data: allData,
        success:function(data){          
            location.reload();
        },
        error:function(jqXHR, textStatus, errorThrown){
        	alert("통지가 선택되지 않았습니다.");
    		return false;
        }
        });
});

$("#trashChk").click(function(){
	var checkArr=[]
	$("input[name='noticeid']:checked").each(function(i){
		checkArr.push($(this).val());
	});
	var allData = {"checkArr": checkArr };
	debugger;
	$.ajax({
        url:"trashchk",
        type:'GET',
        data: allData,
        success:function(data){          
            location.reload();
        },
        error:function(jqXHR, textStatus, errorThrown){
        	alert("통지가 선택되지 않았습니다.");
    		return false;
        }
        });
});
$("#deleteChk").click(function(){
	var checkArr=[]
	$("input[name='noticeid']:checked").each(function(i){
		checkArr.push($(this).val());
	});
	var allData = {"checkArr": checkArr };
	
	$.ajax({
        url:"delchk",
        type:'GET',
        data: allData,
        success:function(data){          
            location.reload();
        },
        error:function(jqXHR, textStatus, errorThrown){
        	alert("통지가 선택되지 않았습니다.");
    		return false;
        }
        });
});
$("#returnChk").click(function(){
	debugger;
	var checkArr=[]
	$("input[name='noticeid']:checked").each(function(i){
		checkArr.push($(this).val());
	});
	var allData = {"checkArr": checkArr };
	
	$.ajax({
        url:"returnchk",
        type:'GET',
        data: allData,
        success:function(data){          
            location.reload();
        },
        error:function(jqXHR, textStatus, errorThrown){
        	alert("통지가 선택되지 않았습니다.");
    		return false;
        }
        });
});
        
</script>
</body>
</html>