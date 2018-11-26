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

<!-- S: 추가 CSS-->
<!-- Toastr style -->
<link href="${pageContext.request.contextPath}/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">

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
					<h2>고객관리</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item active" ><strong>목록</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>

 <!-- S: 거래처관리 리스트-->
        <div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content row">
                            <div class="w-100 text-right mb-3 mt-3">
                                <a href="javascript:void(0);" class="btn btn-primary">검색</a>
                                <a href="javascript:void(0);" class="btn btn-primary">초기화</a>
                            </div>
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>거래처명</th>
                                            <td><input type="text" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>업종</th>
                                            <td><input type="text" class="form-control"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>거래처호칭</th>
                                            <td><input type="text" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>중요도</th>
                                            <td>
                                                <select class="form-control" style="height: 23px;">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>영업담당자</th>
                                            <td>
                                                <div class="input-group">
                                                    <input type="text" class="form-control">
                                                    <span class="input-group-addon">
                                                        <a href="javascript:void(0);"><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>밀착도</th>
                                            <td>
                                                <select class="form-control" style="height: 23px;">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="w-100 text-right mt-3">
                                <a href="javascript:void(0);" class="btn btn-primary">추가</a>
                                <a href="javascript:void(0);" class="btn btn-primary">엑셀다운로드</a>
                            </div>
                        </div>
                        <div class="ibox-content row border-top-0 pt-lg-0">
                            <div class="table-responsive">
                            <table class="table table-bordered" style="border-top: 1px solid #e7eaec;">
                                <colgroup>
                                    <col style="width: 120px"/>
                                    <col style="width: 150px"/>
                                    <col style="width: 150px"/>
                                    <col style="width: 150px"/>
                                    <col style="width: 120px"/>
                                    <col style="width: 100px"/>
                                    <col style="width: 100px"/>
                                    <col style="width: 200px"/>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>거래처명</th>
                                        <th>거래처 호칭</th>
                                        <th>주소</th>
                                        <th>업종</th>
                                        <th>담당자</th>
                                        <th>중요도</th>
                                        <th>밀착도</th>
                                        <th>거래처메모</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>CRUDSYSTEM</td>
                                        <td>CRUD</td>
                                        <td>서울특별시</td>
                                        <td>업종입니다</td>
                                        <td>박진열</td>
                                        <td>A</td>
                                        <td>A</td>
                                        <td>CRUDSYSTEM이다!!!</td>
                                    </tr>
                                    <tr>
                                        <td>CRUDSYSTEM</td>
                                        <td>CRUD</td>
                                        <td>서울특별시</td>
                                        <td>업종입니다</td>
                                        <td>박진열</td>
                                        <td>A</td>
                                        <td>A</td>
                                        <td>CRUDSYSTEM이다!!!</td>
                                    </tr>
                                    <tr>
                                        <td>CRUDSYSTEM</td>
                                        <td>CRUD</td>
                                        <td>서울특별시</td>
                                        <td>업종입니다</td>
                                        <td>박진열</td>
                                        <td>A</td>
                                        <td>A</td>
                                        <td>CRUDSYSTEM이다!!!</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                            </table>
                            </div>
                            <div class="m-auto">
                                <ul class="pagination">
                                    <li class="footable-page-arrow disabled"><a data-page="first" href="#first">«</a></li>
                                    <li class="footable-page-arrow disabled"><a data-page="prev" href="#prev">‹</a></li>
                                    <li class="footable-page active"><a data-page="0" href="#">1</a></li>
                                    <li class="footable-page"><a data-page="1" href="#">2</a></li>
                                    <li class="footable-page-arrow"><a data-page="next" href="#next">›</a></li>
                                    <li class="footable-page-arrow"><a data-page="last" href="#last">»</a></li>
                                </ul>
                            </div>
                           <h4 class="float-right">&middot; 총 자료수 : 3건</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- E: 거래처관리 리스트 -->


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
