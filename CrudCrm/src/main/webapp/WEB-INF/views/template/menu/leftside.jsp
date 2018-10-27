<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                       <a href="${pageContext.request.contextPath}/">
                       <img alt="image" class="rounded" src="${pageContext.request.contextPath}/resources/img/crud/crud_mark.png"/>
                       </a>                     
                        <!--  <img alt="image" class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/crud/crud_saas_mark.png"/>-->
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="block m-t-xs font-bold">${SITENAME }</span>
                            <span class="text-muted text-xs block">${USERNAME }<b class="caret"></b></span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a class="dropdown-item" href="profile.html">내 정보</a></li>
                            <li><a class="dropdown-item" href="mailbox.html">내부통지</a></li>
                            <li class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        <a href="${pageContext.request.contextPath}/">CRUD</a>
                    </div>
                </li>
 	
                <c:set var="urls" value="${requestScope['javax.servlet.forward.request_uri']}" />
                             
					<li <c:if test="${fn:substring(urls, 0, 3)  eq '/' }"> class="active"</c:if>>
	                   <a href="${pageContext.request.contextPath}/"><i class="fa fa-th-large"></i> <span class="nav-label">메인</span></a>
	                </li>
    			
    			
	            <c:if test="${cm eq '10000'}">
	                <li <c:if test="${fn:substring(urls, 0, 3)  eq '/cm' }"> class="active"</c:if>>
	                    <a href="#"><i class="fa fa-users"></i> <span class="nav-label">고객관리</span><span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                        <li><a href="form_basic.html">고객 관리</a></li>                        
	                    </ul>
	                </li>
                </c:if> 
                
				
                <c:if test="${sa  eq '20000'}">
	                <li <c:if test="${fn:substring(urls, 0, 3)  eq '/sa' }"> class="active"</c:if>>
	                    <a href="#"><i class="fa fa-handshake-o"></i> <span class="nav-label">영업관리</span><span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                        <li><a href="form_basic.html">영업 관리</a></li>
	                        <li><a href="form_basic.html">거래처 관리</a></li>
	                        <li><a href="form_basic.html">영업 일정</a></li>                        
	                    </ul>
	                </li>
      			</c:if>
      			
      			
                <c:if test="${sv  eq '30000' }">
	                <li <c:if test="${fn:substring(urls, 0, 3)  eq '/sv' }"> class="active"</c:if>>
	                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">서비스관리</span><span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                        <li><a href="form_basic.html">서비스 접수</a></li>
	                        <li><a href="form_basic.html">서비스 처리</a></li>
	                        <li><a href="form_basic.html">서비스 이관</a></li>
	                        <li><a href="form_basic.html">서비스 일정</a></li>   
	                        <li><a href="form_basic.html">서비스 포탈</a></li>                                              
	                    </ul>
	                </li>
                </c:if>
                
               
                <c:if test="${cp  eq '40000' }">
					<li<c:if test="${fn:substring(urls, 0, 3) eq '/cp' }"> class="active"</c:if>>
	                    <a href="#"><i class="fa fa-envelope-o"></i> <span class="nav-label">캠페인</span><span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                        <li><a href="form_basic.html">캠페인 관리</a></li>
	                        <li><a href="form_basic.html">양식 관리</a></li>
	                        <li><a href="form_basic.html">캠페인 일정</a></li>                                     
	                    </ul>
	                </li>
                </c:if>
                
              
                <c:if test="${vc  eq '50000' }">
	               <li <c:if test="${fn:substring(urls, 0, 3) eq '/vc' }"> class="active"</c:if>>
	                    <a href="#"><i class="fa fa-phone"></i> <span class="nav-label">VOC</span><span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                        <li><a href="${pageContext.request.contextPath}/vc/voc">VOC</a></li>
	                        <li><a href="${pageContext.request.contextPath}/vc/satis">고객만족도 관리</a></li>  
	                        <li><a href="form_basic.html">콜백 관리</a></li>   
	                    </ul>
	                </li>
                </c:if>
                
                
                <c:if test="${rp  eq '60000' }">
	                <li <c:if test="${fn:substring(urls, 0, 3) eq '/rp' }"> class="active"</c:if>>
	                    <a href="#"><i class="fa fa-line-chart"></i> <span class="nav-label">리포트</span><span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                        <li><a href="form_basic.html">고객 </a></li>
	                        <li><a href="form_basic.html">영업</a></li>
	                        <li><a href="form_basic.html">서비스</a></li>
	                        <li><a href="form_basic.html">CTR</a></li>
	                        <li><a href="form_basic.html">VOC</a></li>    
	                    </ul>
	                </li>
                </c:if>
                
               
            	<c:if test="${au  eq '90000' }">
	                <c:if test="${CHK_AUTH eq '20' || CHK_AUTH eq '30'}">
		                <li <c:if test="${fn:substring(urls, 0, 3) eq '/au/ad' }"> class="active"</c:if>>
		                    <a href="#"><i class="fa fa-cog"></i> <span class="nav-label">관리자</span><span class="fa arrow"></span></a>
		                    <ul class="nav nav-second-level collapse">
		                        <li><a href="form_basic.html">회원 관리</a></li>
		                        <li><a href="form_basic.html">회원사 코드관리</a></li>
		                        <li><a href="form_basic.html">회원사 관리</a></li>
		                        <li><a href="form_basic.html">서비스 관리</a></li>
		                        <li><a href="form_basic.html">VOC 관리</a></li>
		                    </ul>
		                </li>
	                </c:if>
                </c:if>		
                		
	            <c:if test="${CHK_AUTH eq '30'}">
		           <li <c:if test="${fn:substring(urls, 0, 3) eq '/au/ma' }"> class="active"</c:if>>
		              <a href="#"><i class="fa fa-cogs"></i> <span class="nav-label">CRUD 관리자</span><span class="fa arrow"></span></a>
		              <ul class="nav nav-second-level collapse">
		                 <li><a href="form_basic.html">회원사 관리</a></li>
		                 <li><a href="form_basic.html">공통코드</a></li>
		                 <li><a href="form_basic.html">라이센스 관리</a></li>
		              </ul>
		            </li>
	            </c:if>
             </ul>
        </div>
    </nav>
