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

<!-- S: 추가 CSS-->
<!-- Toastr style -->
<link href="${pageContext.request.contextPath}/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">
<!--radioBox-->
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<!--datePicker-->
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
	<!-- ui -->
<%-- <link href="${pageContext.request.contextPath}/resources/js/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet"> --%>
<!-- Text spinners style -->
<link href="${pageContext.request.contextPath}/resources/css/plugins/textSpinners/spinners.css" rel="stylesheet">
<script>


</script>
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
					<h2>고객관리</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item active" ><strong>목록</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>


			<!-- Content -->
			<!-- S: 고객 목록 ppt p01-->
			<div class="wrapper wrapper-content  animated fadeInRight article">
				<div class="row justify-content-md-center">
					<div class="col-lg-12">
						<div class="ibox">
							<form:form id="command" class="searchForm" action="/cust" method="POST" commandName="custDto">
							<span id="selectpage" name="selectpage"> </span>
							
								<div class="ibox-content row">
									<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
                        				<div class="col-xl-8 col-lg-12 float-left alert alert-danger w-100" id="msgDiv" style="height:2.00rem;padding-top: 6px;display:none;" >
		                        			<a class="alert-link" href="#">
                        						<span id="showMsg"></span>
                        					</a>
                        				</div>
                        				<div class="w-100 text-right">
											<button type="submit" class="btn btn-primary" data-style="zoom-in" id="submit" name="submit">검 색</button>
											<button type="button" class="btn btn-primary" id="searchResetBtn" name="searchResetBtn">초기화</button> 
										</div>
									</div>
																
									
									<div class="row"><br><br></div>
								
									<div class="box1 col-lg-12 col-xl-6 p-0">
										<table class="table table-bordered mb-0">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">												
											</colgroup>
											<tbody>
												<tr>
													<th>등록일</th>
													<td colspan="3">
														<div class="input-group p-0  " style="max-height: 26px; height: 26px;">
                                                    		<div class="d-flex date date01 col-lg-5 col-md-5 p-0 col-5">
                                                      			<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                      			<input type="text" class="form-control" id="fromregdt" name="fromregdt"  autocomplete="off" value="${searchVal.fromregdt }">
                                                    		</div>
                                                    		<h3 class="text-center col-lg-1 col-1 p-0">~</h3>
                                                    		<div class="d-flex date date02 col-lg-5 col-md-5 p-0 col-5">
                                                        		<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                        		<input type="text" class="form-control" id="toregdt" name="toregdt"  autocomplete="off" value="${searchVal.toregdt }">
                                                    		</div>
                                                		</div>	
													</td>
												</tr>
											
												<tr>
													<th>고객명</th>
													<td><input type="text" class="form-control" id="custname" name="custname" value="${searchVal.custname}"></td>
													<th>휴대폰</th>
													<td><input type="number" class="form-control" id="mobile" name="mobile" value="${searchVal.mobile}"></td>													
												</tr>
												<tr>
													<th>담당자</th>
													<td>
														<div class="input-group owner" id="owner_" >
															<input type="text" class="form-control" autocomplete="off" name="owner_" value="${searchVal.owner_}" readonly>
                                                    		<input type="hidden" name="owner" id="owner" value="${searchVal.owner}">
                                                    		<span class="input-group-addon">
                                                       			<a><i class="fa fa-search"></i></a>
                                                    		</span>
														</div>
													</td>
													<th>직장명</th>
													<td>
														<div class="input-group cli" id="cliname" >
															<input type="text" class="form-control" autocomplete="off" name="cliname" value="${searchVal.cliname}" readonly>
                                                    		<input type="hidden" name="clino" id="clino" value="${searchVal.clino }">
                                                    		<span class="input-group-addon">
                                                       			<a><i class="fa fa-search"></i></a>
                                                    		</span>
														</div>
													</td>
													
												</tr>
												
											</tbody>
										</table>
									</div>
									<div class="box2 col-lg-12 col-xl-6 p-0">
										<table class="table table-bordered">
											<colgroup>
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">
												<col style="width: 100px; background: #fafafa;">
												<col style="width: auto;">												
											</colgroup>
											<tbody>
												<tr>
													<th>고객구분</th>
													<td>
														<select class="form-control" style="height: 1.45rem" name="custgubun" id="custgubun">
															<option value="0" ${searchVal.custgubun eq "0" ? "selected" :""}>선택</option>
															<c:forEach var="custGubun" items="${CUSTGUBUN }">
                                                      			<c:choose>
                                                         			<c:when test="${searchVal.custgubun eq custGubun.codeval}">
                                                            			<option selected label="${custGubun.codename }" value="${custGubun.codeval }"/>
                                                         			</c:when>
                                                         			<c:otherwise>
                                                            			<option label="${custGubun.codename }" value="${custGubun.codeval }"/>
                                                         			</c:otherwise>
                                                      			</c:choose>
                                                   			</c:forEach>
														</select>
													</td>	 	
													<th>고객등급</th>
													<td>
														<select class="form-control" style="height: 1.52rem" name="custgrade" id="custgrade">
															<option value="0" ${searchVal.custgrade eq "0" ? "selected" :""}>선택</option>
																<c:forEach var="custGrade" items="${CUSTGRADE }">
                                                      			<c:choose>
                                                         			<c:when test="${searchVal.custgrade eq custGrade.codeval}">
                                                            			<option selected label="${custGrade.codename }" value="${custGrade.codeval }"/>
                                                         			</c:when>
                                                         			<c:otherwise>
                                                            			<option label="${custGrade.codename }" value="${custGrade.codeval }"/>
                                                         			</c:otherwise>
                                                      			</c:choose>
                                                   			</c:forEach>
														</select>
													</td>	
												</tr>
												<tr>
													<th>이메일</th>
													<td colspan="3"><input type="text" class="form-control" id="email" name="email" value="${searchVal.email}"></td>
												</tr>
												
												<tr>
													<th>정보활용</th>
													<td colspan="3">
														<div class="i-checks" style="height: 1.60rem;">
															<label class="pr-lg-3 mb-0">
															<input type="radio" value="0" id="infoagree" name="infoagree"  class="pr-lg-1" checked="checked" ${searchVal.infoagree eq "0" ? "checked='checked'" :""} ><i></i> 동의</label> 
																<label class="pr-lg-3 mb-0">
																<input type="radio"value="1" id="infoagree" name="infoagree" class="pr-lg-1" ${searchVal.infoagree eq "1" ? "checked='checked'" :""}><i></i> 거부</label>
																<label class="mb-0"><input type="radio" value="2" id="infoagree" name="infoagree" class="pr-lg-1" ${searchVal.infoagree gt "1" ? "checked='checked'" :""}><i></i> 전체</label>
														</div>
													</td>
												</tr>												
											</tbody>
										</table>
									</div>
									
								</div>
								
							</form:form>
							
							<form:form id="commandcheck" class="searchForm" action="/cust" method="PUT">
							<div class="ibox-content row border-top-0 pt-lg-0 tooltip-demo">
																
								<div class="box col-12" style="padding-left: 0px;padding-right: 0px;">
                              		<div class="col-xl-4 col-lg-12 float-left mb-2 w-100" style="height:2.00rem;padding-left: 0px;" >
                                    	<!-- <a href="/custexcel" class="btn btn-default" data-toggle="tooltip" data-placement="right" title="엑셀다운로드"><i class="fa fa-file-excel-o" ></i></a>      -->             
                             			
                             			<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal4"  id="excelBtn" ><i class="fa fa-file-excel-o" ></i></button>
                             		</div>                                       
                              		<div class="col-xl-4 col-lg-12 float-right text-right mb-2 w-100" style="padding-right: 0px;">
                                		<span id="checkVal"></span>
										<a href="/cust/post" class="btn btn-primary">추 가</a> 										
										<button class="btn btn-primary delete">삭 제</button>				
                              		</div>
                           		</div>
								
								
								
								
								
								
								
								
								
								
								
							<!-- <button id="btn-excel">엑셀 다운로드</button>  -->
                            <!--   파일 생성중 보여질 진행막대를 포함하고 있는 다이얼로그 입니다.  -->
                             <!-- <div title="Data Download modal fade" id="preparing-file-modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" > 
                             	<div id="progressbar" style="width: 100%; height: 22px; margin-top: 20px;"></div> 
                             </div>   -->
                             <!-- 에러발생시 보여질 메세지 다이얼로그 입니다. -->
                             <!-- <div title="Error" id="error-modal" style="display: none;"> <p>생성실패.</p> </div> -->
								
							
							
                            <div class="modal inmodal" id="myModal4" tabindex="-1" role="dialog"  aria-hidden="true" data-backdrop="static">
                                <div class="modal-dialog" >
                                    <div class="modal-content animated fadeIn">
                                        <div class="modal-header">
                                            <div class="h1 m-t-xs text-navy">
                                				<span class="loading hamburger"></span>
                            				</div>
                                        </div>
                                        <div class="modal-body" style="text-align:center">
                                        	<p><strong>엑셀 다운로드 중 입니다.</strong></p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal" id="modalCloseBtn" style="display: none;">확인</button>
                                        </div>
                                    </div>
                                </div>
                            </div> 
							
							
							
								
								
								
								
								
								<div class="table-responsive">
									<table class="table table-bordered table-hover" style="border-top: 1px solid #EBEBEB;">
															
										<colgroup>
											<col width="40px;">
											<col width="100px;">
											<col width="180px;">
											<col width="100px;">
											<col width="120px;">
											<col width="180px;">
											<col width="80px;">
											<col width="80px;">
											<col width="80px;">
											<col width="80px;">
											<col width="100px;">
										</colgroup>
																				
										<thead>
											<tr>
												<th>
													<input type="checkbox" class="i-checks" id="icheckAll" name = "icheckAll" >
												</th>
												<th>고객명</th>
												<th>직장</th>
												<th>부서</th>
												
												<th>휴대폰</th>
												<th>이메일</th>
												
												<th>담당자</th>
												<th>고객구분</th>
												<th>고객등급</th>
												<th>정보활용</th>
												<th>등록일</th>
											</tr>
										</thead>
										
										<tbody>
										<c:forEach var="list" items="${custList}"  > 
											<tr>
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"><input type="checkbox" class="i-checks chksquare" id="custno"name="custno" value="${list.CUSTNO}"></td>
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"><a href="/cust/view/${list.CUSTNO}">${list.CUSTNAME }</a></td>
												<td style="text-overflow: ellipsis;">${list.CLINAME }</td>
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${list.DEPTNAME }</td>
												
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">
													<c:choose>
														<c:when test="${fn:trim(list.MOBILE) eq '--'}"></c:when>
														<c:otherwise>${list.MOBILE }</c:otherwise>
													</c:choose>
												</td>
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${list.EMAIL }</td>
												
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">${list.OWNER_}</td>
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">
												<c:choose>
													<c:when test="${list.CUSTGUBUN eq 1 }">회원</c:when>
													<c:when test="${list.CUSTGUBUN eq 2 }">비회원</c:when>
													<c:when test="${list.CUSTGUBUN eq 3 }">탈퇴회원</c:when>
												</c:choose>
												</td>
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">
												<c:choose>
													<c:when test="${list.CUSTGRADE eq 1 }">일반</c:when>
													<c:when test="${list.CUSTGRADE eq 2 }">VIP</c:when>
													<c:when test="${list.CUSTGRADE eq 3 }">VVIP</c:when>
												</c:choose>
												</td>
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;">
												<c:choose>
													<c:when test="${list.INFOAGREE eq 0 }">동의</c:when>
													<c:when test="${list.INFOAGREE eq 1 }">거부</c:when>
												</c:choose>
												</td>
												<td>${list.REGDATE }</td>
											</tr> 
											</c:forEach>
											<!-- foreach끝 -->
											
										</tbody>
										<tfoot>
									</table>
								</div>
								<div class="m-auto">
									 
								</form:form>
								<ul class="pagination">
										<c:choose>
											<c:when test="${page.startPageNum ne 1 }">
												<li class="footable-page-arrow disabled">	
													<a href='/cust?custname=${searchVal.custname}&owner=${searchVal.owner}&owner_=${searchVal.owner_}&clino=${searchVal.clino}&mobile=${searchVal.mobile}&email=${searchVal.email}&custgubun=${searchVal.custgubun}&custgrade=${searchVal.custgrade}&fromregdt=${searchVal.fromregdt}&toregdt=${searchVal.toregdt}&infoagree=${searchVal.infoagree}&pageNum=${page.startPageNum-1 }' >&laquo;</a>													
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
													<li class="footable-page active">
													<a href = '/cust?custname=${searchVal.custname}&owner=${searchVal.owner}&owner_=${searchVal.owner_}&clino=${searchVal.clino}&mobile=${searchVal.mobile}&email=${searchVal.email}&custgubun=${searchVal.custgubun}&custgrade=${searchVal.custgrade}&fromregdt=${searchVal.fromregdt}&toregdt=${searchVal.toregdt}&infoagree=${searchVal.infoagree}&pageNum=${i }'>${i }</a>
													</li>
												</c:when>
												<c:otherwise>
													<li>
													<a href = '/cust?custname=${searchVal.custname}&owner=${searchVal.owner}&owner_=${searchVal.owner_}&clino=${searchVal.clino}&mobile=${searchVal.mobile}&email=${searchVal.email}&custgubun=${searchVal.custgubun}&custgrade=${searchVal.custgrade}&fromregdt=${searchVal.fromregdt}&toregdt=${searchVal.toregdt}&infoagree=${searchVal.infoagree}&pageNum=${i }'>${i }</a>
													</li>
														
												</c:otherwise>
											</c:choose>
										</c:forEach>
										
										<c:choose>
											<c:when test="${page.endPageNum lt page.totalPageCount }">
												<li>
												<a href = '/cust?custname=${searchVal.custname}&owner=${searchVal.owner}&owner_=${searchVal.owner_}&clino=${searchVal.clino}&mobile=${searchVal.mobile}&email=${searchVal.email}&custgubun=${searchVal.custgubun}&custgrade=${searchVal.custgrade}&fromregdt=${searchVal.fromregdt}&toregdt=${searchVal.toregdt}&infoagree=${searchVal.infoagree}&pageNum=${page.endPageNum+1 }'>&raquo;</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&raquo;</a>
												</li>
											</c:otherwise>
										</c:choose>
									</ul>  
															
								</div>
								<h4 class="float-right">&middot; 총 자료수 : ${page.totalRows }건</h4>
		
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- E: 고객 목록 ppt p01-->
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
	
	<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery-ui/jquery-ui.min.js"></script> 
	
	<!-- S: 추가 js-->
	<!-- radioBox-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script>
	<!-- datePicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>	
	<!-- file download -->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_file.js"></script>

	<script>

		$(document).ready(function() {	
			
			// icecks
			$('.i-checks').iCheck({
				checkboxClass : 'icheckbox_square-green',
				radioClass : 'iradio_square-green'
			});
			
			// 서치박스 리셋 라디오,셀렉스박스 제어를 위해 개별 파라미터 설정
			$("#searchResetBtn").click(function(){	
				$('#custname').val('');
				$('#mobile').val('');
				$('#email').val('');
				$('[name="cliname"]').val('');
				$('#clino').val(0);
				$('[name="owner_"]').val('');
				$('#owner').val(0);
				$('#custgubun').val(0);
				$('#custgrade').val(0);
				$('#fromregdt').val('');
				$('#toregdt').val('');
				$('#infoagree').iCheck('check');								
			});
			
			// datePicker
			$('.date.date01, .date.date02').datepicker({
				todayBtn : "linked",
				keyboardNavigation : false,
				forceParse : false,
				calendarWeeks : true,
				autoclose : true
			});
			
			
			//샘플 프로그레시브
		    $("#btn-excel").on("click", function () {
		    	debugger;
		    	var $preparingFileModal = $("#preparing-file-modal");
		        $preparingFileModal.dialog({ modal: true });
		        $("#progressbar").progressbar({value: false});
		        $.fileDownload("/custexcel", {
		            successCallback: function (url) {
		                $preparingFileModal.dialog('close');
		            },
		            failCallback: function (responseHtml, url) {
		                $preparingFileModal.dialog('close');
		                $("#error-modal").dialog({ modal: true });
		            }
		        });
		        // 버튼의 원래 클릭 이벤트를 중지 시키기 위해 필요합니다.
		        return false;
		    });
		    
		    //엑셀다운
		    $("#excelBtn").on("click", function () {
		    	debugger;
		    	var $myModal = $("#myModal4");
		        $myModal.dialog({ modal: true });
	        
		        $.fileDownload("/custexcel", {
		            successCallback: function (url) {
		            	$myModal.dialog('close');
		            	$('#modalCloseBtn').trigger('click');  
		            },
		            failCallback: function (responseHtml, url) {
		            	$('#modalCloseBtn').trigger('click');
		                $myModal.dialog('close');
		            }
		        });
		   
		    });
		    
		    
		  

		 
		});

	</script>
	




	
</body>
</html>