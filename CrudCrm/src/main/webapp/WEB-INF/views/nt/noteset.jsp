<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

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
						<div class="ibox ">
		                    <div class="ibox-title">
		                        <h5>카테고리 정보<small> 바로 검색가능한 사용자 카테고리를 등록합니다.</small></h5>
		                        <div class="ibox-tools">
		                            <a class="collapse-link">
		                                <i class="fa fa-chevron-up"></i>
		                            </a>		                    		                       
		                        </div>
		                    </div>
		                    <div class="ibox-content">
		                        <div class="row">
		                        	<div class="col-md-12">
		                        		<div class="container">
		                        			<div class="row">
		                        				<div class="col-lg-12">
		                        					<!--<form:form>	
			                        					<div class="form-group row">							                        
									                        <div class="col-md-12">
										                        <div class="row">						                                           						                            
										                        	<button class="btn btn-danger " type="button"><i class="fa fa-check"></i>&nbsp;삭제</button>
										                        </div>
															</div>
							                             </div>
						                             </form:form>   -->
						                              <form:form>
								                            <div class="form-group row">								                            	
							                                    <div class="col-md-10">
							                                        <div class="row">						                                           							                                            
							                                            <div class="col-md-4"><button class="btn btn-danger" type="button"><i class="fa fa-times"></i>&nbsp;삭제</button></div>
							                                        </div>
							                                    </div>
							                                </div>
						                                </form:form>               					
			                        					<table class="table table-bordered">
							                        	 <colgroup>
					                                            <col style="width: 2%; background: #fafafa;">
					                                            <col style="width: 40%; background: #fefefe;">
					                                            <col style="width: 10%;">                                           
					                                       </colgroup>
							                                <thead>
							                                    <tr>
							                                        <th><input type="checkbox" class="i-checks" name=""></th>
							                                        <th>카테고리명</th>                                   
							                                        <th>등록일</th>		                                      
							                                    </tr>
							                                </thead>
							                                <tbody>
							                                <c:forEach var="tmp" items="${category }">
									                             <tr>
							                                        <td><input type="checkbox" class="i-checks" name=""></td>                                 
							                                        <td>${tmp.CATEGORY }</td>
							                                        <td>${tmp.REGDATE }a</td>
							                                    </tr>	                            		
									                        </c:forEach>                                                          
							                                </tbody>
							                                <tfoot>
							                            </table>
							                            <form:form>
								                            <div class="form-group row">
								                            	<label class="col-md-2 col-form-label" for="category">카테고리</label>
							                                    <div class="col-md-10">
							                                        <div class="row">						                                           
							                                            <div class="col-md-3"><input type="text" id="category" name="category" class="form-control"></div>
							                                            <div class="col-md-4"><button class="btn btn-primary " type="button"><i class="fa fa-check"></i>&nbsp;등록</button></div>
							                                        </div>
							                                    </div>
							                                </div>
						                                </form:form>							                         
			                        				</div>
			                        			</div>
			                        		</div>		                        	
			                        	</div>
			                        </div>
			                    </div>
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
<script>
$(document).ready(function(){
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
    });  
});   
</script>	
</body>
</html>