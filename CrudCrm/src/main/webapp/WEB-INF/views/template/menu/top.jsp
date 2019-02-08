<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

		
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">			
						<a id="sideBarStatus" class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"><i class="fa fa-bars"></i> </a>						
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<!-- <li><span class="m-r-sm text-muted welcome-message">CRUD CRM에 오신 <strong>${sessionScope.USERNAME }</strong>님 환영합니다.</span></li> -->
						<li class="dropdown">
							<a class="dropdown-toggle count-info" data-toggle="dropdown" href="#" id='dropClick'> 
								<i class="fa fa-envelope"></i>
								<span id="alarm" class="label label-warning"></span>
							</a>
							<ul class="dropdown-menu dropdown-messages" id="dropDown">							
							</ul>
						</li>
						<!-- 공지사항 알람기능추가 -->
						<li class="dropdown">
			                <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
			                    <i class="fa fa-bell"></i>  <span class="label label-danger">8</span>
			                </a>
			                <ul class="dropdown-menu dropdown-alerts">
			                    <li>
			                        <a href="mailbox.html">
			                            <div>
			                                <i class="fa fa-envelope fa-fw"></i> You have 16 messages
			                                <span class="float-right text-muted small">4 minutes ago</span>
			                            </div>
			                        </a>
			                    </li>
			                    <li class="dropdown-divider"></li>
			                    <li>
			                        <a href="profile.html">
			                            <div>
			                                <i class="fa fa-twitter fa-fw"></i> 3 New Followers
			                                <span class="float-right text-muted small">12 minutes ago</span>
			                            </div>
			                        </a>
			                    </li>
			                    <li class="dropdown-divider"></li>
			                    <li>
			                        <a href="grid_options.html">
			                            <div>
			                                <i class="fa fa-upload fa-fw"></i> Server Rebooted
			                                <span class="float-right text-muted small">4 minutes ago</span>
			                            </div>
			                        </a>
			                    </li>
			                    <li class="dropdown-divider"></li>
			                    <li>
			                        <div class="text-center link-block">
			                            <a href="notifications.html">
			                                <strong>See All Alerts</strong>
			                                <i class="fa fa-angle-right"></i>
			                            </a>
			                        </div>
			                    </li>
			                </ul>
			            </li>
			            <!-- 공지사항 알람기능추가 -->
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
			<input type="hidden" id="hiddenSideStates" value="${SIDESTATES }"/>
			<input type="hidden" id="hiddenUserId" value="${USERID }"/>
			<input type="hidden" id="hiddenSiteId" value="${SITEID }"/>
            <input type="hidden" id="hiddenUserNo" value="${USERNO }"/>