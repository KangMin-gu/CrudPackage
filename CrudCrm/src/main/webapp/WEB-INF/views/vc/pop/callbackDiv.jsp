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
<%@ include file="/WEB-INF/views/template/inc/voclinkinc.jsp"%>
<link href="${pageContext.request.contextPath}/resources/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet"> <!--radioBox-->
</head>
	<body>
        <div class="wrapper wrapper-content">
                <div class="ibox-left col-6">
                	<h2>콜백 리스트</h2>
                        <div class="ibox-content row">
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>콜백번호</th>
                                            <td class="border-top-0">
                                                <div class="input-group cli" id="clino_">
                                                    <input type="text" class="form-control reset" readonly autocomplete="off" name="clino_" value="${search.clino_ }">
                                                    <input type="hidden" class="reset" name="callback" value="${search.callback }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="ibox-content row border-top-0 pt-lg-0 tooltip-demo">
                            <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                            	<colgroup>
                            		<col style="width: 3%;">
                            		<col style="width: 15%;">
                            		<col style="width: 7%;">                            		                            		                            		                            		                            		                            		                            		
                            	</colgroup>                            
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="i-checks chksquare" name="icheckAll" id="icheckAll"></th>
                                        <th>접수일자</th>
                                        <th>발신번호</th>
                                        <th>콜백번호</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="callBackList" items="${callBackList }">
                                    <tr>
                                        <td><input type="checkbox" class="i-checks chksquare" name="callbackno" id="callbackno" value="${callBackList.CALLBACKNO }"></td>
                                        <td>${callBackList.RECEIVEDATE_}</td>
                                        <td>${callBackList.CALLER }</td>
                                        <td>${callBackList.CALLBACK }</td>
                                    </tr>
                                </c:forEach>
                                       
                                </tbody>
                                <tfoot>
                            </table>
                            </div>
                            <div class="m-auto">
                                <ul class="pagination">
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ibox-right col-6">
                	<h2>사용자 리스트</h2>
                        <div class="ibox-content row">
                            <div class="box2 col-lg-6 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>사용자</th>
                                            <td class="border-top-0">
                                                <div class="input-group ctiowner" id="ctiowner_">
                                                    <input type="text" class="form-control reset" readonly autocomplete="off" name="ctiowner_" value="${search.ctiowner_ }">
                                                    <input type="hidden" class="reset" name="ctiowner" value="${search.ctiowner }">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="ibox-content row border-top-0 pt-lg-0 tooltip-demo">
                            <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                            	<colgroup>
                            		<col style="width: 3%;">
                            		<col style="width: 15%;">
                            		<col style="width: 7%;">                            		                            		                            		                            		                            		                            		                            		
                            	</colgroup>                            
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="i-checks chksquare" name="icheckAll" id="icheckAll"></th>
                                        <th>사용자명</th>
                                        <th>사용자ID</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        
                                    </tr> 
                                </tbody>
                            </table>
                            </div>
                            <div class="m-auto">
                                <ul class="pagination">
                                   
                                </ul>
                            </div>
                        </div>
                    </div>

<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
<%@ include file="/WEB-INF/views/template/inc/vocjsinc.jsp"%>
<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script> <!-- radioBox-->
<script src="${pageContext.request.contextPath}/resources/crud/crud_vc.js"></script>

<script>
$(document).ready(function () {
	
	callBackList(1);
	ctiUserList(1);
	
});
</script>

	
</body>

</html>
