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
						<li><span class="m-r-sm text-muted welcome-message">CRUD CRM에 오신 <strong>강민구</strong>님 환영합니다.</span></li>
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="#"> <i class="fa fa-envelope"></i>
								<span class="label label-warning">16</span>
						</a>
							<ul class="dropdown-menu dropdown-messages">
								<li>
									<div class="dropdown-messages-box">
										<a class="dropdown-item float-left" href="profile.html"> <img
											alt="image" class="rounded-circle"
											src="${pageContext.request.contextPath}/resources/img/a7.jpg">
										</a>
										<div>
											<small class="float-right">46h ago</small> <strong>Mike
												Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
											<small class="text-muted">3 days ago at 7:58 pm -
												10.06.2014</small>
										</div>
									</div>
								</li>
								<li class="dropdown-divider"></li>
								<li>
									<div class="dropdown-messages-box">
										<a class="dropdown-item float-left" href="profile.html"> <img
											alt="image" class="rounded-circle"
											src="${pageContext.request.contextPath}/resources/img/a4.jpg">
										</a>
										<div>
											<small class="float-right text-navy">5h ago</small> <strong>Chris
												Johnatan Overtunk</strong> started following <strong>Monica
												Smith</strong>. <br> <small class="text-muted">Yesterday
												1:21 pm - 11.06.2014</small>
										</div>
									</div>
								</li>
								<li class="dropdown-divider"></li>
								<li>
									<div class="dropdown-messages-box">
										<a class="dropdown-item float-left" href="profile.html"> <img
											alt="image" class="rounded-circle"
											src="${pageContext.request.contextPath}/resources/img/profile.jpg">
										</a>
										<div>
											<small class="float-right">23h ago</small> <strong>Monica
												Smith</strong> love <strong>Kim Smith</strong>. <br> <small
												class="text-muted">2 days ago at 2:30 am -
												11.06.2014</small>
										</div>
									</div>
								</li>
								<li class="dropdown-divider"></li>
								<li>
									<div class="text-center link-block">
										<a href="mailbox.html" class="dropdown-item"> 
											<iclass="fa fa-envelope"></i> <strong>Read AllMessages</strong>
										</a>
									</div>
								</li>
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