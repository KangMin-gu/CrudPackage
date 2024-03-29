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
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
</head>

<body>
<!-- Top -->    
<!-- Content -->		
		
            <div class="row justify-content-md-center">
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                    <form:form action="/convey" method="POST">
                        <div class="ibox-content row body">
                            <div class="w-100 text-right mb-2">
                            	<button class="btn btn-primary submit" id="svSave">저장</button>
                            </div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="rcvno">서비스명</label></th>
                                            <td>
                                            	<input type="text" class="form-control" disabled name="servicename" id="servicename" value="${serviceInfo.SERVICENAME}">
                                            	<input type="hidden" class="form-control" name="serviceno" id="serviceno" value="${serviceInfo.SERVICENO}" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="conveydate">이관일자</label></th>
                                            <td>
                                            	<div class="input-group pl-0 float-left date">
                                            		<span class="input-group-addon">
                                                		<i class="fa fa-calendar"></i>
                                                	</span>
                                                	<input type="text" class="form-control float-left date" autocomplete="off" name="conveydate" id="conveydate" value="${serviceInfo.CONVEYDATE }">
                                                </div>
											</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="rcvdate">접수일</label></th>
                                            <td height="40">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" disabled name="receptiondate" id="receptiondate" value="${serviceInfo.RECEPTIONDATE_ }">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="conveyreason">이관사유</label></th>
                                            <td class="border-top-0">
                                                <select class="form-control" name="conveyreason" id="conveyreason">
                                            		<option label="선택" value=""/>
                                                	<c:forEach var="conveyReason" items="${CONVEYREASON }">
                                                		<option label="${conveyReason.codename }" value="${conveyReason.codeval }"/>
                                                	</c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="prevowner">현담당자</label></th>
                                            <td>
                                            	<input type="text" class="form-control" disabled name="prevowner_" id="prevowner_" value="${serviceInfo.OWNER_ }">
                                            	<input type="hidden" class="form-control" name="prevowner" id="prevowner" value="${serviceInfo.OWNER }">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="nextowner">이관담당자</label></th>
                                            <td>
                                            	<div class="input-group owner" id="nextowner_">
                                                    <input type="text" class="form-control" autocomplete="off" name="nextowner_" value="">
                                                    <input type="hidden" name="nextowner" id ="nextowner"value="0">
                                                    <span class="input-group-addon">
                                                        <a><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box4 col-lg-12 p-0">
                                <table class="table table-bordered border-top-0  mb-0">
                                    <colgroup>
                                        <col style="width: 8.3%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="conveydesc">비고</label></th>
                                            <td>
                                            	<textarea id="conveydesc" name="conveydesc" cols="140" rows="9"></textarea>
                                            	<input type="hidden" id="no" name="no"/>
                                           </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </form:form>
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
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="${pageContext.request.contextPath}/resources/crud/crud_sv.js"></script>
	<script>
	
		$(document).ready(function () {
			
			$('.date').datepicker({
				keyboardNavigation:false,
				forceParse:false,
				autoclose:true
			});
		});
	</script>
	
</body>
</html>