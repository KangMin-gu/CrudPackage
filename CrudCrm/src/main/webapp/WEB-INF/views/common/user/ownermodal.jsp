<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="ownerModal" role="dialog">
	<!-- modal-lg  | default | modal-sm -->	
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">담당자 </h4>
        <button type="button" class="close" data-dismiss="modal"><span>&times;</span><span class="sr-only"></span></button>
      </div>
      <div class="modal-body">
      <form action="${pageContext.request.contextPath}/common/owner" method="GET">
		  <div class="container">
			  <div class="row">
				  <div class="col-lg-12">
					  <table class="table table-bordered">
						  <thead>
						  		<tr>
						  			<th>담당자명</th>
                                	<th>담당자ID</th>
                                	<th>부서</th>
                                	<th>전화번호</th>
                                	<th>Email</th>
                            	</tr>
						  </thead>
						  <tbody>

						  </tbody>
					  </table>
				  </div>
				  <div class="col"><ul class="pagination"></ul></div>
			  </div>
		  </div>
      </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>	
</div><!-- /.modal -->