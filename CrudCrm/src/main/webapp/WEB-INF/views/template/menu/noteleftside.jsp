<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="ibox ">
                    <div class="ibox-content mailbox-content">
                        <div class="file-manager">
                            <a class="btn btn-block btn-primary compose-mail" href="${pageContext.request.contextPath}/note/send">통지 작성</a>
                            <div class="space-25"></div>
                            <h5>Folders</h5>
                            <ul class="folder-list m-b-md" style="padding: 0">
                                <li><a href="${pageContext.request.contextPath}/note/inbox"> <i class="fa fa-inbox "></i> 받은 통지함 <span class="label label-warning float-right" id="noteAlarm"> </span> </a></li>
                                <li><a href="${pageContext.request.contextPath}/note/outbox"> <i class="fa fa-envelope-o"></i> 보낸 통지함</a></li>
                                <li><a href="${pageContext.request.contextPath}/note/import"> <i class="fa fa-certificate"></i> 중요 통지함 <span class="label label-danger float-right" id="noteImportant"> </span></a></li>   
                                <li><a href="${pageContext.request.contextPath}/note/trash"> <i class="fa fa-trash-o"></i> 휴지통</a></li>                             
                                <!-- <li><a href="${pageContext.request.contextPath}/note/set"> <i class="fa fa-cog"></i>카테고리 설정</a></li> -->                               
                            </ul>
                            <!-- 
                            <h5>Categories</h5>
                            <ul class="category-list" style="padding: 0">
	                            <c:forEach var="tmp" items="${category }">
									 <li><a href="#"><i class="fa fa-circle text-warning"></i> ${tmp.CATEGORY } </a></li>   	                            		
								</c:forEach>                                                                 
                            </ul>	     
                             -->                 
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>