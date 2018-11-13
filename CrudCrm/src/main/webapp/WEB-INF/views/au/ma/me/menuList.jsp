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
    </div>
<!-- Top -->    
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>

            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>메뉴 관리</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/">메인</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>메뉴 목록</strong>
                        </li>
                    </ol>
                </div>
            </div>		
		
		
<!-- Content -->		
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                
                    <div class="ibox">
                    <form:form action="${pageContext.request.contextPath}/ma/me" method="POST">
                        <div class="ibox-content row">
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered">
                                    <colgroup>
                                        <col style="width: 30%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>메뉴명</th>
                                            <td>
                                                <div class="input-group">
                                                    <input type="text" class="form-control reset" name="menuName" id="menuName" value="${search.menuName }">
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
                                            <th>메뉴값</th>
                                            <td>
                                                <div class="input-group">
                                                    <input type="text" class="form-control reset" name="menuVal" id="menuVal" value="${search.menuVal }">

                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="w-100 text-right">
                                <button class="btn btn-primary resets">초기화</button>
                                <button class="btn btn-primary">메뉴검색</button>
                                
                            </div>
                        </div>
                        </form:form>
                        <div class="ibox-content row border-top-0 pt-lg-0">
                            <div class="w-100 text-right mb-2">
                            
                                <div class="d-inline-block mt-sx-1">
                                <a href="javascript:void(0);" class="btn btn-primary">엑셀다운로드</a>
                                </div>
                             
                            </div>
                            <div class="overflow-x w-100 head">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="i-checks" name=""></th>
                                        <th>메뉴명</th>
                                        <th>메뉴값</th>
                                        <th>연결라이센스</th>
                                        <th>등록일시</th>
                                        <th>등록자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="menu" items="${menuList }">
                                    <tr value="${menu.MENUNO}">
                                        <td><input type="checkbox" class="i-checks" name="menuno" id="menuno" value="${menu.MENUNO }"></td>
                                        <td>${menu.MENUNAME}</td>
                                        <td>${menu.MENUVAL }</td>
                                        <td>${menu.LICENSENO_ }</td>
                                        <td>${menu.REGDATE }</td>
                                        <td>${menu.REGUSER_ }</td>
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
													<li class="active"><a
														onclick="javascript:paging(${i})">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li><a onclick="javascript:paging(${i})">${i }</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${page.endPageNum lt page.totalPageCount }">
												<li><a onclick="javascript:paging(${page.endPageNum+1 })"></a>
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
                                            <th><label for="menuname">메뉴명</label></th>
                                            <td><input type="text" class="form-control required" name="menuname" id="menuname" value="${menu.MENUNAME}"></td>
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
                                            <th><label for="menuval">메뉴 값</label></th>
                                            <td height="40">
                                                <div class="input-group">
                                                    <input type="text" class="form-control required" name="menuval" id="menuval" value="${menu.MENUVAL}">
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
                                            <th><label for="licenseno">라이센스명</label></th>
                                            <td>
                                            
                                            	<select class="form-control col-12 float-left mr-12 required" name="licenseno" id="licenseno" value="${menu.LICENSENO }">
                                            		<option value="">선택</option>
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
                                            <th class="border-top-0"><label for="isdelete">사용여부</label></th>
                                            <td><select class="form-control col-12 float-left mr-12 required" name="isdelete" id="isdelete">
                                            		<option>선택</option>
                                                    <option value=0 <c:if test='${menu.ISDELETE eq 0}'>selected</c:if>>사용</option>
                                                    <option value=1 <c:if test='${menu.ISDELETE eq 1}'>selected</c:if>>미사용</option>
                                                </select></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box4 col-lg-8 p-0">
                                <table class="table table-bordered border-top-0  mb-0">
                                    <colgroup>
                                        <col style="width: 12.4%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0"><label for="menudesc">메뉴설명</label></th>
                                            <td>
                                            	<input type="text" class="form-control" name="menudesc" id="menudesc" value="${menu.MENUDESC}">
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
	
	$(document).ready(function () {
		
    	$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
		
        $.ajax({
            url: "/ma/li/ajax",
            method: "POST",
            dataType: "json",
            success: function (data) {
            	debugger;
            	$.each(data, function(i){
            		$('.body #licenseno').append('<option value="'+data[i].LICENSENO+'">'+data[i].LICENSENAME+'</option>');	
            	})
            	

            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
		
	});
	
	</script>
</body>
</html>