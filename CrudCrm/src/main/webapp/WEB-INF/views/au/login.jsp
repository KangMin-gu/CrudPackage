<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
        <div style="margin-top:100px;">
            <div>
            	<a href="${pageContext.request.contextPath}/">
            		<img style="width:300px;" src="${pageContext.request.contextPath}/resources/img/crud/welcomlogo.png" alt="" />
            	</a>               
            </div>
            <h4>SaaS IDEA가 19년 2월 오픈 하였습니다.</h4>
            <small>고객 만족을 위해 최선을 다하겠습니다.</small>                   
            <form:form class="m-t" role="form" action="${pageContext.request.contextPath}/login" method="post">
            	<input type="hidden" name="url" value="${url }"/>
                <div class="form-group">
                    <input id="userid" name="userid" type="text" class="form-control" placeholder="계정" autofocus="autofocus" required>
                </div>
                <div class="form-group">
                    <input id="userpassword" name="userpassword" type="password" class="form-control" placeholder="비밀번호" required>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">로그인</button>         
            </form:form>
            <br/>
            <div class="container">
           		<div class="row justify-content-between">
           			<div class="col-xs-4">공지사항</div>
           			<div class="col-xs-4">
           				<a class="btn btn-primary btn-xs" href="">전체</a>
           			</div>
           		</div>
           		<br/>
           		<div class="row">
           			<div class="col-xs-12">
						<table class="table">
							<colgroup>
								<col style="width: 50px;">
								<col style="width: 150px;">
								<col style="width: 100px;">												
							</colgroup>							
							<tbody>
								   <c:forEach var="crudNotice" items="${crudNotice }">
								   		<tr>
								   			<td>${crudNotice.ICNUM }</td>
											   <c:choose>
										       		<c:when test="${fn:length(crudNotice.SUBJECT) > 14}">
										            	<td><c:out value="${fn:substring(crudNotice.SUBJECT,0,13)}"/>....</td>
										           	</c:when>
										           <c:otherwise>
										            	<td><c:out value="${crudNotice.SUBJECT}"/></td>
										           </c:otherwise> 
										       </c:choose>													
											<td>${crudNotice.REGDATE }</td>
										</tr>
								   </c:forEach> 							
							</tbody>
						</table>
           			</div>
           		</div>
           	</div>
        </div>
    </div>
<p class="text-muted text-center"><small>고객센터 : 02-336-7800 주소: 서울특별시 마포구 독막로 10 성지빌딩 5층 509호</small></p>               
<p class="text-muted text-center"> <small>Copyright CRUD XaaS SYSTEM &copy; 2018</small> </p>

    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>

</body>

<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>				

</body>
</html>