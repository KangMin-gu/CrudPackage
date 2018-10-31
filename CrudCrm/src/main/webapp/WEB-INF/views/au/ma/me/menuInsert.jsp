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
<meta id="viewport" content="width=device-width, initial-scale=1" />
<title>CRUD SYSTEM</title>
<!-- link includ -->
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
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
                    <h2>메뉴 추가</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/">메인</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="/ma/me">메뉴목록</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>메뉴추가</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>		
		
		
<!-- Content -->		
<form:form action ="${pageContext.request.contextPath}/ma/me/post" method="POST">
			<div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
            
                <div class="col-lg-12" style="background: #ffffff;">
                    <div class="ibox">
                        <div class="ibox-title row">
                            <h4>기본정보</h4>
                        </div>
                        
                        <div class="ibox-content row">
                            <div class="w-100 text-right mb-2">
                                <a href="${pageContext.request.contextPath}/ma/me/${menu.MENUNO}" class="btn btn-primary">취소</a>
                                <button class="btn btn-primary">메뉴저장</button>
                            </div>
                            <div class="box1 col-lg-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 25%; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>메뉴명</th>
                                            <td><input type="text" class="form-control" name="menuname" id="menuname" value="${menu.MENUNAME}"></td>
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
                                            <th>메뉴 값</th>
                                            <td height="40">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" name="menuval" id="menuval" value="${menu.MENUVAL}">
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
                                            <th>라이센스명</th>
                                            <td><select class="form-control col-12 float-left mr-12" name="licenseno" id="licenseno">
                                                    <option value=1 <c:if test='${menu.LICENSENO eq 1}'>selected</c:if>>고객라이센스</option>
                                                    <option value=2 <c:if test='${menu.LICENSENO eq 2}'>selected</c:if>>영업라이센스</option>
                                                    <option value=3 <c:if test='${menu.LICENSENO eq 3}'>selected</c:if>>서비스라이센스</option>
                                                    <option value=4 <c:if test='${menu.LICENSENO eq 4}'>selected</c:if>>캠페인라이센스</option>
                                                    <option value=5 <c:if test='${menu.LICENSENO eq 5}'>selected</c:if>>VOC라이센스</option>
                                                    <option value=6 <c:if test='${menu.LICENSENO eq 6}'>selected</c:if>>리포트라이센스</option>
                                                    <option value=7 <c:if test='${menu.LICENSENO eq 7}'>selected</c:if>>관리자라이센스</option>
                                                </select></td>
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
                                            <th class="border-top-0">사용여부</th>
                                            <td><select class="form-control col-12 float-left mr-12" name="isdelete" id="isdelete">
                                                    <option value=0 <c:if test='${menu.ISDELETE eq 0}'>selected</c:if>>사용</option>
                                                    <option value=1 <c:if test='${menu.ISDELETE eq 1}'>selected</c:if>>미사용</option>
                                                </select></td>
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
                                            <th class="border-top-0">메뉴 설명</th>
                                            <td><textarea name="menudesc" id="menudesc" value=""></textarea></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
  </form:form>
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

</body>
</html>