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
		<div class="row wrapper border-bottom white-bg page-heading">
        	<div class="col-lg-12">
            	<h2>회원사 로고 등록</h2>
                    <small>170x48 사이즈의 jpg, png 파일만 업로드 가능합니다.</small>
            </div>
            
            <div class="col-lg-12">
            	<div class="row">
            		<div class="container">
            			<form id="logoForm" action="/logo/fileupload" method="post" class="form-inline" enctype="multipart/form-data">
					<div class="col-xs-9">
						<div class="form-group">
							<div class="custom-file">
							    <input id="sFile" name="sFile" type="file" class="custom-file-input">
							    <label id="sFileName" for="sFile" class="custom-file-label">파일 선택...</label>
							    <input type="hidden" name="fileSearchKey" id="fileSearchKey" />
							</div>
                        </div>                                										
					</div>
					<div class="col-xs-3" style="margin-left:20px;">
						<div class="form-group">
							<input id="logosubmit" class="btn btn-white" type="submit" value="전송"/>
						</div>						
					</div>
				</form>
            		</div>
				</div>
            </div>
        </div>
     </div>
<!-- Content-->


<!-- Content End -->	
            
            
<!-- foot -->
			<div class="footer">
				<%@ include file="/WEB-INF/views/template/menu/foot.jsp"%>
			</div>
		</div>
		
<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>				
<script>
</script>
</body>
</html>