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
<meta id="viewport" content="width=device-width, initial-scale=1" />
<title>CRUD SYSTEM</title>
<!-- link includ -->
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
<link href="${pageContext.request.contextPath}/resources/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
</head>

<body>
<!-- Top -->    
	<div id="page-wrapper" class="gray-bg">
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>회원사 라이센스 관리</h2>
                </div>
            </div>		
<!-- Content -->		
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
            
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-title row">
                            <h4>기본정보</h4>
                        </div>
                        <form:form action="${pageContext.request.contextPath}/company/license/${memCompany.SITEID }" method="POST">
                        <div class="ibox-content row">
                        
                            <div class="w-100 text-right mb-2">
                                <button class="btn btn-primary save" id="save">저장</button>
                            </div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="sitename">회원사명*</label></th>
                                            <td><input type="text" class="form-control required" disabled name="sitename" id="sitename" value="${memCompany.SITENAME}"></td>
                                        </tr>
                                        <tr>
                                            <th><label for="sitename">라이센스제품</label></th>
                                            <td>
                                            	<select class="form-control col-12 float-left mr-12 required" name="licenseno" id="licenseno" value="">
                                            		<option value="">선택</option>
                                            	</select>
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
                                            <th><label for="bsno">최초가입일</label></th>
                                            <td height="40">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" disabled name="fregdate" id="fregdate" value="${memCompany.FREGDATE}">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="sitename">라이센스수량</label></th>
                                            <td><input type="text" class="form-control required" name="buycnt" id="buycnt" value=""></td>
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
                                            <th><label for="incno">총 구매량</label></th>
                                            <td><input type="text" class="form-control" disabled name="totalcnt" id="totalcnt" value="${memCompany.TOTALCNT}"></td>
                                        </tr>
                                        <tr>
                                            <th><label for="sitename">현재 사용량</label></th>
                                            <td><input type="text" class="form-control required" disabled name="sitename" id="sitename" value="${memCompany.SITENAME}"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        </form:form>
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
	<script src="${pageContext.request.contextPath}/resources/js/plugins/summernote/summernote-bs4.js"></script><!-- summernote-->
	<script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script><!-- datepicker-->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	
	$(document).ready(function () {
    	$.ajax({
        	url: "/license/menu",
        	method: "GET",
        	dataType: "json",
        	success: function (data) {
        		$.each(data, function(i){
        			$('#licenseno').append('<option value="'+data[i].LICENSENO+'">'+data[i].LICENSENAME+'</option>');	
        		})
        	},
        	error: function (request, status, error) {
            	alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        	}
    	});
	});
	
	$('#save').click(function(e){
		windows.close();
	});
	</script>		

</body>
</html>