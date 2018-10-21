<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                       <img alt="image" class="rounded" src="${pageContext.request.contextPath}/resources/img/crud/crud_mark.png"/>                      <!--  <img alt="image" class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/crud/crud_saas_mark.png"/>-->
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="block m-t-xs font-bold">크루드 시스템</span>
                            <span class="text-muted text-xs block">강민구<b class="caret"></b></span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a class="dropdown-item" href="profile.html">내 정보</a></li>
                            <li><a class="dropdown-item" href="mailbox.html">내부통지</a></li>
                            <li class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="login.html">로그아웃</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        CRUD
                    </div>
                </li>
