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
                    <h2>VOC리포트 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active">
                            <strong>VOC리포트 목록</strong>
                        </li>
                    </ol>
                </div>
            </div>		
		
		
<!-- Content -->		
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content row border-top-0 pt-lg-0 tooltip-demo">
                            <div class="overflow-x w-100">
                            <table class="table table-bordered table-hover">
                                <colgroup>
                            		<col style="width: 20%;">
                            		<col style="width: 700%;">                   		                            		                            		                            		                            		                            		                            		
                            	</colgroup>  
                                <thead>
                                    <tr>
                                        <th class="tablecenter">리포트명</th>
                                        <th class="tablecenter">리포트정보</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="vcReportList" items="${vcReportList }">
                                    <tr>
                                        <td><a href="${pagecontext.request.contextpath}/vc/report/${vcReportList.REPORTNO }">${vcReportList.REPORTNAME}</a></td>
                                        <td>${vcReportList.REPORTDESC }</td>
                                    </tr>
                                </c:forEach>
                                       
                                </tbody>
                                <tfoot>
                            </table>
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
	<script src="${pageContext.request.contextPath}/resources/crud/crud_excelfile.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script> <!-- radioBox-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/jasny/jasny-bootstrap.min.js"></script>
	<script>
    $( document ).ready(function() {
    	
    	$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    	
        $('.date').datepicker({
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true
        });
    });
    
    $('.resets').click(function(e){
    	e.preventDefault();
    	$('.reset').val('');
    });

	</script>			

</body>
</html>