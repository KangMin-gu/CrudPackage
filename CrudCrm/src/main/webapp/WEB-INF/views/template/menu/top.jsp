<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

		
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"><i class="fa fa-bars"></i> </a>
						
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<li><span class="m-r-sm text-muted welcome-message">CRUD CRM에 오신 <strong>${sessionScope.USERNAME }</strong>님 환영합니다.</span></li>
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="#" id='dropClick'> <i class="fa fa-envelope"></i>
								<span id="alarm" class="label label-warning"></span>
						</a>
							<ul class="dropdown-menu dropdown-messages" id="dropDown">
							
							</ul></li>

						<li>
						<a href="${pageContext.request.contextPath}/logout"> <i class="fa fa-sign-out"></i>로그아웃</a>
						</li>
					<!--	right sidebar 추후 추가기능
					<li><a class="right-sidebar-toggle"> <i
								class="fa fa-tasks"></i>
						</a></li>
					-->
					</ul>

				</nav>
			</div>
			<input type="hidden" id="hiddenSiteId" value="${SITEID }"/>
            <input type="hidden" id="hiddenUserNo" value="${USERNO }"/>