<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link
	href="${pageContext.request.contextPath}/resources/css/reconfirm.css"
	media="all" rel="stylesheet" type="text/css" />
<title>CRUD SYSTEM</title>
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
</head>

<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
		<div id="page-wrapper" class="gray-bg">
			<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>
			<div class="wrapper wrapper-content animated fadeIn">

				<form:form method="POST"
					action="${pageContext.request.contextPath}/reconfirm">
					<input type="hidden" name="url" value="${url }"/>
					<table class="body-wrap">				
						<tr>
							<td></td>
							<td class="container" width="600">
								<div class="content">
									<table class="main" width="100%" cellpadding="0"
										cellspacing="0">
										<tr>
											<td class="alert alert-good">사용하시는 계정의 비밀번호를 입력해주세요.</td>
										</tr>
										<tr>
											<td class="content-wrap">
												<table width="100%" cellpadding="0" cellspacing="0">
													<tr>
														<td class="content-block" align="center">사용자 정보 보호를
															위해 비밀번호를 재확인 합니다.</td>
													</tr>
													<tr>
														<td class="content-block" align="center">사용자 계정 :
															${USERID }</td>
														<input type="hidden" id="userid" name="userid" value="${USERID }"/>
													</tr>
													<tr>
														<td class="content-block" align="center">
															<div class="col-lg-10">
																<input id="userpassword" name="userpassword" type="password" placeholder="Password"
																	class="form-control">
															</div>
														</td>
													</tr>
													<tr>
														<td class="content-block" align="center">
															<button type="submit"
																class="btn btn-primary block full-width m-b">확인</button>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
							</td>
							<td></td>
						</tr>
					</table>
				</form:form>
			</div>

			<div class="footer">
				<%@ include file="/WEB-INF/views/template/menu/foot.jsp"%>
			</div>
		</div>

		<div id="right-sidebar">
			<%@ include file="/WEB-INF/views/template/menu/rightside.jsp"%>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script>

	</script>
</body>
</html>