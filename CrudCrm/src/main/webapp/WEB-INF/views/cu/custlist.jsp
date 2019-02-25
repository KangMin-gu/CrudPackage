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
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/jQueryUI/jquery-ui.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/crud/ideafavicon.ico">
<!-- S: 추가 CSS-->
<!-- Toastr style -->
<link href="${pageContext.request.contextPath}/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">
<!--radioBox-->
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
<!--datePicker-->
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<!-- Text spinners style -->
<link href="${pageContext.request.contextPath}/resources/css/plugins/textSpinners/spinners.css" rel="stylesheet">
</head>
<style>


#fixedtable tbody {
    display:block;
    height:600px;
    overflow:auto;
    overflow-x:hidden;
    width: 1620px;
}
#fixedtable thead, #fixedtable tbody tr {
    display:table;
    width:1620px;
    table-layout:fixed;
}
#fixedtable thead {
    width: 1620px;
}
#fixedtable tbody tr td{
    width: 40px;
}
</style>
<body>

	<div id="wrapper">
		
		<!-- leftside -->
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
		<!-- Top -->
		<div id="page-wrapper" class="gray-bg">
			<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>



			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<h2>고객 관리</h2>
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
							<div class="ibox-title">
	                            <h5>고객 목록<small>현재 사용자의 고객 리스트</small></h5>
	                            <div class="ibox-tools">
	                                <a class="collapse-link">
	                                    <i class="fa fa-chevron-up"></i>
	                                </a>
	                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
	                                    <i class="fa fa-wrench"></i>
	                                </a>
	                                <ul class="dropdown-menu dropdown-user">
	                                    <li><a href="#" class="dropdown-item">Config option 1</a>
	                                    </li>
	                                    <li><a href="#" class="dropdown-item">Config option 2</a>
	                                    </li>
	                                </ul>
	                                <a class="close-link">
	                                    <i class="fa fa-times"></i>
	                                </a>
	                            </div>
                        	</div>
                        	
                        	<div class="ibox-content">



						<div class="row">
                         	<div class="col-md-2">
                             	<div class="form-group row" id="data_5">
                             		<div class="col-md-4 b">
                             			<label class="font-normal"><strong>고객명</strong></label>
                             		</div>
                                	<div class="col-md-8 a"> 	                                              
                                		<input type="text" placeholder=".col-md-4" class="form-control">
                                	</div>                                                   
                            	</div>
                             </div>
                             <div class="col-md-3">
                             	<div class="form-group row" id="data_5">
                             		<div class="col-md-3 b">
                                		<label class="font-normal"><strong>휴대폰</strong></label>     
                                	</div>       
                                	<div class="col-md-9 a">                
                                		<input type="text" placeholder=".col-md-4" class="form-control">  
                                	</div>                                                          
                            	</div>
                             </div>
                             <div class="col-md-3">
                             	 <div class="form-group row" id="data_5">
	                             	 <div class="col-md-3 b">
		                                <label class="font-normal"><strong>이메일</strong></label>	
		                             </div>       
		                             <div class="col-md-9 a">                             
		                                <input type="text" placeholder=".col-md-4" class="form-control"> 
		                             </div>   	                                                        
                            	</div>
                             </div>
                             <div class="col-md-2">
                             	<div class="form-group row" id="data_5">
                             		<div class="col-md-4 b">
	                                	<label class="font-normal"><strong>담당자</strong></label>	
	                                </div>
	                             	<div class="col-md-8 a">   
	                                	<input type="text" placeholder=".col-md-4" class="form-control">   
	                              	</div>                         
                            	</div>
                             </div>
                             <div class="col-md-2">
                             	<div class="form-group row" id="data_5">
	                                <div class="col-md-4 b">
	                                	<label class="font-normal"><strong>직장명</strong></label>	
	                                </div>
	                             	<div class="col-md-8 a">   
	                                	<input type="text" placeholder=".col-md-4" class="form-control">   
	                              	</div>                           
                            	</div>
                             </div>
                        </div>    

<!-- ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ -->

						<div class="row">
                         	<div class="col-md-4">
                             	<div class="form-group row" id="data_5">
                             		<div class="col-md-2 b">
                             			<label class="font-normal"><strong>등록일</strong></label>
                             		</div>
                                	<div class="col-md-10 a"> 	                                              
                                			<div class="input-group p-0">
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
                                	</div>                                                   
                            	</div>
                             </div>
                             <div class="col-md-2">
                             	<div class="form-group row" id="data_5">
                             		<div class="col-md-4 b">
                                		<label class="font-normal"><strong>회원구분</strong></label>     
                                	</div>       
                                	<div class="col-md-8 a">                
                                		<select class="select2_demo_1 form-control">
	                                        <option value="1">Option 1</option>
	                                        <option value="2">Option 2</option>
	                                        <option value="3">Option 3</option>
	                                        <option value="4">Option 4</option>
	                                        <option value="5">Option 5</option>
	                                </select>  
                                	</div>                                                          
                            	</div>
                             </div>
                             <div class="col-md-2">
                             	 <div class="form-group row" id="data_5">
	                             	 <div class="col-md-4 b">
		                                <label class="font-normal"><strong>회원등급</strong></label>	
		                             </div>       
		                             <div class="col-md-8 a">                             
		                                <select class="select2_demo_1 form-control">
	                                        <option value="1">Option 1</option>
	                                        <option value="2">Option 2</option>
	                                        <option value="3">Option 3</option>
	                                        <option value="4">Option 4</option>
	                                        <option value="5">Option 5</option>
	                                </select> 
		                             </div>   	                                                        
                            	</div>
                             </div>
                             <div class="col-md-4">
                             	<div class="form-group row" id="data_5">
                             		<div class="col-md-2 b">
	                                	<label class="font-normal"><strong>정보활용</strong></label>	
	                                </div>
	                             	<div class="col-md-5 a">   	
	                                	<div class="i-checks">
											<label><input type="radio" value="0" id="infoagree" name="infoagree" checked="checked" ${searchVal.infoagree eq "0" ? "checked='checked'" :""} ><i></i> 동의</label> 
											<label><input type="radio"value="1" id="infoagree" name="infoagree" ${searchVal.infoagree eq "1" ? "checked='checked'" :""}><i></i> 거부</label>
											<label><input type="radio" value="2" id="infoagree" name="infoagree" ${searchVal.infoagree gt "1" ? "checked='checked'" :""}><i></i> 전체</label>
										</div>  
	                              	</div>
	                              	<div class="col-md-5">
	                              		<button type="submit" class="btn btn-sm btn-primary" data-style="zoom-in" id="submit" name="submit">검색</button>
										<button type="button" class="btn btn-sm btn-primary" id="searchResetBtn" name="searchResetBtn">초기화</button>	
	                              	</div>                         
                            	</div>
                             </div>
                        </div>

<div class="hr-line-dashed"></div>

						<div class="row">
							<div class="table-responsive">
	
									
									<table id="fixedtable" class="table table-bordered table-hover table-sm" style="border-top: 1px solid #EBEBEB;">						
										<colgroup>
											<col width="25px;">
											<col width="110px;">
											<col width="110px;">
											<col width="110px;">
											<col width="110px;">
											<col width="200px;">
											<col width="100px;">
											<col width="80px;">
											<col width="80px;">
											<col width="80px;">
											<col width="100px;">
										</colgroup>
																				
										<thead style="text-align:center;">
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
												<th>회원구분</th>
												<th>고객등급</th>
												<th>정보활용</th>
												<th>등록일</th>
											</tr>
										</thead>
										
										<tbody style="text-align:right;">
										<c:forEach var="list" items="${custList}"  > 
											<tr>
												<td style="text-align:center;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"><input type="checkbox" class="i-checks chksquare" id="custno"name="custno" value="${list.CUSTNO}"></td>
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
								</div>
                    		</div>
						</div>
					</div>
				</div>
			</div>



			<!-- foot -->
			<div class="footer">
				<%@ include file="/WEB-INF/views/template/menu/foot.jsp"%>
			</div>
		</div>
	</div>

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	
	<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery-ui/jquery-ui.min.js"></script> 		
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script><!-- radioBox-->	
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>	<!-- datePicker-->	
	<script src="${pageContext.request.contextPath}/resources/crud/crud_excelfile.js"></script><!-- excel file download -->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_cu.js"></script><!-- cust js -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.fixedheadertable.js"></script>
	<script>
		$('#headerFixTable').fixedHeaderTable({
			height: '200'
		
		});
		
		$(document).ready(function() {	
			$('#headerFixTable').fixedHeaderTable({
				height: '200',
				minWidth:'800',		
			});
			
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
					    
	    
		});
		
	</script>
</body>
</html>