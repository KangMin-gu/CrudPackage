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


  <!-- S: 영업관리 상세 -->
        <div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title row border-0">
                            <h4>기본정보</h4>
                        </div>
                        <div class="ibox-content row">
                            <div class="w-100 text-right mb-3">
                                <a href="javascript:void(0);" class="btn btn-primary">수정</a>
                                <a href="javascript:void(0);" class="btn btn-primary">목록</a>
                            </div>
                            <div class="box1 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>영업건명</th>
                                            <td>영업건명입니다.</td>
                                        </tr>
                                        <tr>
                                            <th>현단계</th>
                                            <td>계약성공종료</td>
                                        </tr>
                                        <tr>
                                            <th>예상수주일</th>
                                            <td>2018-01-01</td>
                                        </tr>
                                        <tr>
                                            <th>제품명</th>
                                            <td>제품명입니다</td>
                                        </tr>
                                        <tr>
                                            <th>카테고리</th>
                                            <td>카테고리</td>
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
                                            <th>영업담당자</th>
                                            <td>담당자</td>
                                        </tr>
                                        <tr>
                                            <th>현단계진입일</th>
                                            <td>2018-08-06</td>
                                        </tr>
                                        <tr>
                                            <th>예상수주액</th>
                                            <td>12313원</td>
                                        </tr>
                                        <tr>
                                            <th>실수주일</th>
                                            <td>2018-09-07</td>
                                        </tr>
                                        <tr>
                                            <th>시작일정</th>
                                            <td>2018-08-08</td>
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
                                            <th>거래처명</th>
                                            <td>거래처명입니다</td>
                                        </tr>
                                        <tr>
                                            <th>확률</th>
                                            <td>100%</td>
                                        </tr>
                                        <tr>
                                            <th>영업건구분</th>
                                            <td>영업건구분</td>
                                        </tr>
                                        <tr>
                                            <th>실수주액</th>
                                            <td>23123231원</td>
                                        </tr>
                                        <tr>
                                            <th>종료일정</th>
                                            <td>2018-09-09</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="ibox-title row">
                            <h4>부가사항</h4>
                        </div>
                        <div class="ibox-content row">
                            <div class="box1 col-lg-12 col-xl-6 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>NEEDS</th>
                                            <td><textarea name="textNote" id="textNote"  class="form-control" style="resize:none;" rows="4"></textarea></td>
                                        </tr>
                                        <tr>
                                            <th>고객사메모</th>
                                            <td><textarea name="textNote" id="textNote"  class="form-control" style="resize:none;" rows="4"></textarea></td>
                                        </tr>
                                        <tr>
                                            <th>거절사유</th>
                                            <td>
                                                <input type="text" class="form-control mb-1">
                                                <input type="text" class="form-control mb-1">
                                                <input type="text" class="form-control mb-1">
                                                <input type="text" class="form-control mb-1">
                                                <input type="text" class="form-control mb-1">
                                                <input type="text" class="form-control">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box1 col-lg-12 col-xl-6 p-0">
                                <table class="table table-bordered mb-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>SOULTION</th>
                                            <td><textarea name="textNote" id="textNote"  class="form-control" style="resize:none;" rows="4"></textarea></td>
                                        </tr>
                                        <tr>
                                            <th>영업메모</th>
                                            <td><textarea name="textNote" id="textNote"  class="form-control" style="resize:none;" rows="4"></textarea></td>
                                        </tr>
                                        <tr>
                                            <th>극복방안</th>
                                            <td>
                                                <input type="text" class="form-control mb-1">
                                                <input type="text" class="form-control mb-1">
                                                <input type="text" class="form-control mb-1">
                                                <input type="text" class="form-control mb-1">
                                                <input type="text" class="form-control mb-1">
                                                <input type="text" class="form-control">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="ibox-content border-top-0 pt-lg-0" style="margin-left: -15px; margin-right: -15px;">
                            <div class="tabs-container">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li><a class="nav-link active" data-toggle="tab" href="#tab1">관련고객</a></li>
                                    <li><a class="nav-link" data-toggle="tab" href="#tab2">영업</a></li>
                                    <li><a class="nav-link" data-toggle="tab" href="#tab3">고객접촉</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div role="tabpanel" id="tab1" class="tab-pane active">
                                        <div class="panel-body table-responsive">
                                            <div class="w-100 text-right mb-2">
                                                <a href="javascript:void(0);" class="btn btn-primary">추가</a>
                                            </div>
                                            <table class="table table-bordered">
                                                <colgroup>
                                                    <col style="width: 150px;"/>
                                                    <col style="width: 200px;"/>
                                                    <col style="width: 150px;"/>
                                                    <col style="width: 150px;"/>
                                                    <col style="width: 150px;"/>
                                                    <col style="width: 150px;"/>
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th>고객명</th>
                                                        <th>직장명</th>
                                                        <th>직책</th>
                                                        <th>키맨여부</th>
                                                        <th>핵심여부</th>
                                                        <th>관심여부</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>고객명</td>
                                                        <td>직장명입니다</td>
                                                        <td>직책</td>
                                                        <td>키맨여부</td>
                                                        <td>핵심여부</td>
                                                        <td>관심여부</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div role="tabpanel" id="tab2" class="tab-pane ">
                                        <div class="panel-body table-responsive">
                                            <div class="w-100 text-right mb-2">
                                                <a href="javascript:void(0);" class="btn btn-primary">추가</a>
                                            </div>
                                            <table class="table table-bordered">
                                                <colgroup>
                                                    <col style="width: 200px;"/>
                                                    <col style="width: 200px;"/>
                                                    <col style="width: 150px;"/>
                                                    <col style="width: 300px;"/>
                                                    <col style="width: 200px;"/>
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th>변경일</th>
                                                        <th>이전단계</th>
                                                        <th>이후단계</th>
                                                        <th>변경사유</th>
                                                        <th>등록자</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>2018-07-08</td>
                                                        <td>이전단계입니다</td>
                                                        <td>이후단계입니다</td>
                                                        <td>변경사유입니다</td>
                                                        <td>2018-01-10</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div role="tabpanel" id="tab3" class="tab-pane">
                                        <div class="panel-body table-responsive">
                                            <table class="table table-bordered">
                                                <colgroup>
                                                    <col style="width: 200px;"/>
                                                    <col style="width: 150px;"/>
                                                    <col style="width: 150px;"/>
                                                    <col style="width: 150px;"/>
                                                    <col style="width: 300px;"/>
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th>접촉일</th>
                                                        <th>접촉자</th>
                                                        <th>고객명</th>
                                                        <th>접촉매체</th>
                                                        <th>접촉메모</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>2018-04-05</td>
                                                        <td>접촉자</td>
                                                        <td>고객명</td>
                                                        <td>접촉매체</td>
                                                        <td>메모입니다</td>
                                                    </tr>
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
        <!-- E: 영업관리 상세 -->



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
