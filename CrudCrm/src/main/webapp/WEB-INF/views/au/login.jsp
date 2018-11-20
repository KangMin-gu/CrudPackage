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
</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <img src="${pageContext.request.contextPath}/resources/img/crud/login.png" alt="" />

            </div>
            <h3>CRUD CRM 시스템에 오신 것을 환영합니다.</h3>
            
            
            <form:form class="m-t" role="form" action="${pageContext.request.contextPath}/login" method="post">
            	<input type="hidden" name="url" value="${url }"/>
                <div class="form-group">
                    <input id="userid" name="userid" type="text" class="form-control" placeholder="계정" autofocus="autofocus" required>
                </div>
                <div class="form-group">
                    <input id="userpassword" name="userpassword" type="password" class="form-control" placeholder="비밀번호" required>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">로그인</button>
               
                <p class="text-muted text-center"><small>고객센터 : 02-336-7800</small></p>   
                <p class="text-muted text-center"><small>주소: 서울특별시 마포구 독막로 10 성지빌딩 5층 509호</small></p>           
            </form:form>
            <p class="m-t"> <small>Copyright CRUD XaaS SYSTEM &copy; 2018</small> </p>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>

</body>

<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>				

</body>
</html>