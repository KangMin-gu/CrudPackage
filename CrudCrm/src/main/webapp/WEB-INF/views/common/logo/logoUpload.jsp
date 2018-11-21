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
            			<form id="logoForm" class="form-inline" enctype="multipart/form-data">
					<div class="col-xs-9">
						<div class="form-group">
							<div class="custom-file">
							    <input id="logo" name="logo" type="file" class="custom-file-input">
							    <label for="logo" class="custom-file-label">파일 선택...</label>
							</div>
                        </div>                                										
					</div>
					<div class="col-xs-3" style="margin-left:20px;">
						<div class="form-group">
							<button class="btn btn-white" id="logosubmit" >등록</button>
						</div>						
					</div>
				</form>
					<input type="hidden" id="path" value=""/>
					<input type="hidden" id="fileName" value=""/>
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