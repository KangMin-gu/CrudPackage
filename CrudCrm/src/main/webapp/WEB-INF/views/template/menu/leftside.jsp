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
                       <img alt="image" class="rounded" src="${pageContext.request.contextPath}/${SITELOGO }"/>
                       </a>                     
                        <!--  <img alt="image" class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/crud/crud_saas_mark.png"/>-->
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="block m-t-xs font-bold">${SITENAME }</span>
                            <span class="text-muted text-xs block">${USERNAME }<b class="caret"></b></span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/myinfo/${sessionScope.USERNO}">내 정보</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/import/${sessionScope.SITEID}">공지사항</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/note/inbox">내부통지</a></li>
                            <li class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        <a href="${pageContext.request.contextPath}/">${CALLNAME }</a>
                    </div>
                </li>
 	
                <c:set var="urls" value="${requestScope['javax.servlet.forward.request_uri']}" />
                             
					<li <c:if test="${fn:substring(urls, 0, 3)  eq '/' }"> class="active"</c:if>>
	                   <a href="${pageContext.request.contextPath}/"><i class="fa fa-th-large"></i> <span class="nav-label">메인</span></a>
	                </li>
    			
    			
	            <c:if test="${cm eq '10000'}">
	                <li <c:if test="${fn:substring(urls, 0, 5)  eq '/cust' }"> class="active"</c:if>>
	                    <a href="#"><i class="fa fa-users"></i> <span class="nav-label">고객관리</span><span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                    <c:if test="${cm1 eq '11000'}">
	                        <li><a href="/cust">고객 관리</a></li>
	                    </c:if>                        
	                    </ul>
	                </li>
                </c:if> 
                

                <c:if test="${sa  eq '20000'}">
	                <li <c:if test="${fn:substring(urls, 0, 6)  eq '/sales' }"> class="active"</c:if>>
	                    <a href="#"><i class="fa fa-handshake-o"></i> <span class="nav-label">영업관리</span><span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                    	<c:if test="${sa1 eq '21000'}">
	                        	<li><a href="/sales">영업 관리</a></li>
	                        </c:if>
	                        <c:if test="${sa2 eq '22000'}">
	                        	<li><a href="/sales/client">거래처 관리</a></li>
	                        </c:if>
	                        <c:if test="${sa3 eq '23000'}">
	                        	<li><a href="/sales/cal">영업 일정</a></li>
	                        </c:if>                        
	                    </ul>
	                </li>
      			</c:if>
      			
                <c:if test="${sv  eq '30000' }">
	                <li <c:if test="${fn:substring(urls, 0, 8)  eq '/service' }"> class="active"</c:if>>
	                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">서비스관리</span><span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                    	<c:if test="${sv1 eq '31000'}">
	                        	<li><a href="${pageContext.request.contextPath}/service">서비스 접수</a></li>
	                        </c:if>
	                        <c:if test="${sv2 eq '32000'}">
	                        	<li><a href="${pageContext.request.contextPath}/service/convey">서비스 이관</a></li>
	                        </c:if>
	                        <c:if test="${sv3 eq '33000'}">
	                        	<li><a href="${pageContext.request.contextPath}/service/cal">서비스 일정</a></li>
	                        </c:if>
	                    </ul>
	                </li>
                </c:if>
                
                <c:if test="${cp  eq '40000' }">
					<li<c:if test="${fn:substring(urls, 0, 9) eq '/campaign' }"> class="active"</c:if>>
	                    <a href="#"><i class="fa fa-envelope-o"></i> <span class="nav-label">캠페인</span><span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                    	<c:if test="${cp1 eq '41000'}">
	                        	<li><a href="${pageContext.request.contextPath}/campaign">캠페인 관리</a></li>
	                        </c:if>
	                        <c:if test="${cp2 eq '42000'}">
	                        	<li><a href="${pageContext.request.contextPath}/campaign/cust">캠페인 추출 대상</a></li>
	                        </c:if>
	                        <c:if test="${cp3 eq '43000'}">
	                        	<li><a href="${pageContext.request.contextPath}/campaign/contents">양식 관리</a></li>
	                        </c:if>
	                        <c:if test="${cp4 eq '44000'}">
	                        	<li><a href="${pageContext.request.contextPath}/campaign/cal">캠페인 일정</a></li>
	                        </c:if>                                     
	                    </ul>
	                </li>
                </c:if>
                
              
                <c:if test="${vc  eq '50000' }">
	               <li <c:if test="${fn:substring(urls, 0, 3) eq '/vc' }"> class="active"</c:if>>
	                    <a href="#"><i class="fa fa-phone"></i> <span class="nav-label">VOC</span><span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level collapse">
	                    	<c:if test="${vc1 eq '51000'}">
	                        	<li><a href="${pageContext.request.contextPath}/vc/voc">VOC</a></li>
	                        </c:if>
	                        
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
                
		       	<c:if test="${CHKAUTH eq '20' || CHKAUTH eq '30'}">
			   		<li <c:if test="${fn:substring(urls, 0, 3) eq '/ad' }"> class="active"</c:if>>
			   			<a href="#"><i class="fa fa-cog"></i> <span class="nav-label">관리자</span><span class="fa arrow"></span></a>
			   			<ul class="nav nav-second-level collapse">
			   				<li><a href="${pageContext.request.contextPath}/ad/user">회원 관리</a></li>			   				
			   				<li><a href="${pageContext.request.contextPath}/ad/code">코드 관리</a></li>
			   				<li><a href="${pageContext.request.contextPath}/ad/company/${sessionScope.SITEID}">회원사 관리</a></li>
			   				<li><a href="${pageContext.request.contextPath}/ad/sitenotice">공지사항 관리</a></li>
			   			</ul>
			   		</li>
		       	</c:if>
		       	
		       	<c:if test="${CHKAUTH eq '30'}">
			     	<li <c:if test="${fn:substring(urls, 0, 3) eq '/ma' }"> class="active"</c:if>>
			     	<a href="#"><i class="fa fa-cogs"></i> <span class="nav-label">CRUD 관리자</span><span class="fa arrow"></span></a>
			        <ul class="nav nav-second-level collapse">
						<li><a href="${pageContext.request.contextPath}/ma/company">회원사 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/ma/code">공통코드</a></li>
						<li><a href="${pageContext.request.contextPath}/ma/license">라이센스 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/ma/menu">메뉴 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/ma/allnotice">전체 공지사항 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/ma/sitechk">접속 유저 확인</a></li>
					</ul>
			        </li>
		      	</c:if>
             </ul>
        </div>
    </nav>