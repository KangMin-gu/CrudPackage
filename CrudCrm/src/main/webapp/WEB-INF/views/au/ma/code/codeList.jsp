<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>CRUD SYSTEM</title>
<!-- link includ -->
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
<link href="${pageContext.request.contextPath}/resources/css/plugins/iCheck/custom.css" rel="stylesheet"> <!--radioBox-->
</head>

<body>
	<div id="wrapper">
<!-- leftside -->	
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
    
<!-- Top -->    
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>

            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>코드 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active">
                            <strong>코드 목록</strong>
                        </li>
                    </ol>
                </div>
            </div>		
		
		
<!-- Content -->		
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                
                    <div class="ibox">
                    <form:form action="${pageContext.request.contextPath}/ad/code" method="POST">
                        <div class="ibox-content row">
                            <div class="box1 col-lg-12 col-xl-12 p-0">                        
                                <table class="table border-0">
                                    <tbody>
                                        <tr>
                                            <td class="border-0">
												<a href="javascript:void(0);" id="" class="btn btn-primary mb-1 button">이관목록</a>
												<a href="javascript:void(0);" id="CUSTGUBUN" class="btn btn-primary mb-1 button">회원구분</a>
												<a href="javascript:void(0);" id="CUSTGRADE" class="btn btn-primary mb-1 button">고객등급</a>
												<a href="javascript:void(0);" id="FRIENDLY" class="btn btn-primary mb-1 button">친밀도</a>
												<a href="javascript:void(0);" id="" class="btn btn-primary mb-1 button">캠페인유형</a>
												<a href="javascript:void(0);" id="" class="btn btn-primary mb-1 button">서비스채널</a>
												<a href="javascript:void(0);" id="" class="btn btn-primary mb-1 button">중요도</a>
												<a href="javascript:void(0);" id="" class="btn btn-primary mb-1 button">영업단계</a>												
                                            </td>
                                        </tr>                                   
                                    </tbody>
                                </table> 
                            </div>                                            
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>코드명</th>
                                            <td>
                                                <div class="input-group">
                                                    <input type="text" class="form-control" name="codename" id="codename" value="${search.codename }">
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                            <div class="box2 col-lg-4 p-0">
                                <table class="table table-bordered">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>그룹코드</th>
                                            <td>
                                                <div class="input-group">
                                                    <input type="text" class="form-control" name="codegrp" id="codegrp" value="${search.codegrp }">
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div>
                            	<button class="search btn btn-primary" style="height:38.61px">검색</button>
                            </div>
                        </div>
                        </form:form>
                        <div class="ibox-content row border-top-0 pt-lg-0">
                            <div class="overflow-x w-100 head">
                            <table class="table table-bordered table-hover">
                                <colgroup>
                            		<col style="width: 15px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">
                            		<col style="width: 100px;">                         		                            		                            		                            		                            		                            		                            		
                            	</colgroup>  
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="i-checks" name=""></th>
                                        <th>그룹코드</th>
                                        <th>코드명</th>
                                        <th>코드 값</th>
                                        <th>상위 그룹코드</th>
                                        <th>사용여부</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="code" items="${codeList }">
                                    <tr value="${code.CODENO}">
                                        <td><input type="checkbox" class="i-checks" name="codeno" id="codeno" value="${code.CODENO }"></td>
                                        <td><a>${code.CODEGRP}</a></td>
                                        <td>${code.CODENAME }</td>
                                        <td>${code.CODEVAL }</td>
                                        <td>${code.UPPERCODENAME }</td>
                                        <td>${code.ISDELETE_ }</td>
                                    </tr>
                                </c:forEach>
                                       
                                </tbody>
                                <tfoot>
                            </table>
                            </div>
                            <div class="m-auto">
                                <ul class="pagination">
                                    <c:choose>
											<c:when test="${page.startPageNum ne 1 }">
												<li><a onclick="javascript:paging(${page.startPageNum-1})">&laquo;</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&laquo;</a>
												</li>
											</c:otherwise>
										</c:choose>
										<c:forEach var="i" begin="${page.startPageNum }"
											end="${page.endPageNum }">
											<c:choose>
												<c:when test="${i eq page.pageNum }">
													<li class="footable-page active"><a
														onclick="javascript:paging(${i})">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li><a onclick="javascript:paging(${i})">${i }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${page.endPageNum lt page.totalPageCount }">
												<li><a onclick="javascript:paging(${page.endPageNum+1 })">&raquo;</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a href="javascript:">&raquo;</a>
												</li>
											</c:otherwise>
										</c:choose>
                                </ul>
                            </div>
                           <h4 class="float-right">&middot; 총 자료수 : ${totalRows }</h4>
                        </div>
                        <div class="row justify-content-md-center">
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-content row body">
                            <div class="w-100 text-right mb-2">
                                <button class="btn btn-primary" id="reset">초기화</button>
                            	<button class="btn btn-primary" id="create">추가</button>
                            	<button class="btn btn-primary" id="save">저장</button>
                            	<button class="btn btn-primary" id="update">수정</button>
                            	<button class="btn btn-primary" id="cancel">취소</button>
                                <button class="btn btn-primary" id="delete">삭제</button>
                            </div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="codegrp">코드그룹명</label></th>
                                            <td><input type="text" class="form-control required"  name="codegrp" id="codegrp" value="${code.CODEGRP}"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="menuval">코드 명</label></th>
                                            <td height="40">
                                                <div class="input-group">
                                                    <input type="text" class="form-control required" name="codename" id="codename" value="${code.CODENAME}">
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box3 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="licenseno">코드 값</label></th>
                                            <td>
                                            	<input type="text" class="form-control required" name="codeval" id="codeval" value="${code.CODEVAL}">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box4 col-lg-4 p-0">
                                <table class="table table-bordered border-top-0  mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0"><label for="isdelete">사용여부</label></th>
                                            <td>
                                            	<select class="form-control col-12 float-left mr-12 required select2" name="isdelete" id="isdelete">
                                                    <option value=0 <c:if test='${code.ISDELETE eq 0}'>selected</c:if>>사용</option>
                                                    <option value=1 <c:if test='${code.ISDELETE eq 1}'>selected</c:if>>미사용</option>
                                                </select>
                                           </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box4 col-lg-4 p-0">
                                <table class="table table-bordered border-top-0  mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0"><label for="menudesc">상위그룹코드 명</label></th>
                                            <td>
                                            	<input type="text" class="form-control" name="uppercodegrp_" id="uppercodegrp_" value="${code.UPPERCODEGRP_}">
                                            	<input type="hidden" class="form-control" name="uppercodegrp" id="uppercodegrp" value="${code.UPPERCODEGRP}">
                                            </td>
                                        </tr>
                                        <input type="hidden" id="no" name="no"/>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                </div>
                    </div>
                    
                </div>
            </div>
        </div>
        </div>
<!-- Content End -->

			
<!-- foot -->
			<div class="footer">
				<%@ include file="/WEB-INF/views/template/menu/foot.jsp"%>
			</div>
		</div>
<!-- right side -->
		<div id="right-sidebar">
			<%@ include file="/WEB-INF/views/template/menu/rightside.jsp"%>
		</div>
	</div>

<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/crud/crud_ma.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js"></script> <!-- radioBox-->
	
	<script>
    $( document ).ready(function() {
    	
    	$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
	
		$('#uppercodegrp_').click(function(e){
			if($('#uppercodegrp_').attr('readonly') != 'readonly'){
				openNewWindow('상위코드','/common/code',e.target.id,'600','800')	
			}
			
		});
	</script>
	
</body>
</html>