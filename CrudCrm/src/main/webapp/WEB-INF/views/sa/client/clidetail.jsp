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


 <!-- S: 거래처관리 상세-->
        <div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-content row">
                            <div class="w-100 text-right mb-3 mt-3">
                                <a href="javascript:void(0);" class="btn btn-primary">저장</a>
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
                                            <th>거래처명</th>
                                            <td>거래처명</td>
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
                                            <td>거래처호칭</td>
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
                                            <td>영업담당자</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-8 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">주소</th>
                                            <td class="border-top-0">경기도 부천시 소사구 괴안동</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">중요도</th>
                                            <td class="border-top-0">A</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">법인번호</th>
                                            <td class="border-top-0">1231231231</td>
                                        </tr>
                                        <tr>
                                            <th>대표전화</th>
                                            <td>010-1111-1111</td>
                                        </tr>
                                        <tr>
                                            <th>업태</th>
                                            <td>업태</td>
                                        </tr>
                                        <tr>
                                            <th>회사규모</th>
                                            <td>대기업</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">사업자번호</th>
                                            <td class="border-top-0">123123123</td>
                                        </tr>
                                        <tr>
                                            <th>팩스번호</th>
                                            <td>070-000-000</td>
                                        </tr>
                                        <tr>
                                            <th>업종</th>
                                            <td>업종</td>
                                        </tr>
                                        <tr>
                                            <th>밀착도</th>
                                            <td>A</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-lg-12 col-xl-4 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">대표자명</th>
                                            <td class="border-top-0">대표자명</td>
                                        </tr>
                                        <tr>
                                            <th>핸드폰</th>
                                            <td>010-1111-1111</td>
                                        </tr>
                                        <tr>
                                            <th>종목</th>
                                            <td>종목</td>
                                        </tr>
                                        <tr>
                                            <th>국내/국외</th>
                                            <td>국내</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="box2 col-12 p-0">
                                <table class="table table-bordered mb-0 border-top-0">
                                    <colgroup>
                                        <col style="width: 110px; background: #fafafa;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th class="border-top-0">메모</th>
                                            <td class="border-top-0">
                                                메모입니다. <br>
                                                메모입니다. <br>
                                                메모입니다. <br>
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
                                                    <col style="width: 150px;"/>
                                                    <col style="width: 200px;"/>
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th>영업건명</th>
                                                        <th>예상수주일</th>
                                                        <th>영업담당자</th>
                                                        <th>현단계</th>
                                                        <th>단계진입일</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>영업건명입니다</td>
                                                        <td>2018-01-10</td>
                                                        <td>담당자</td>
                                                        <td>현단계입니다</td>
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
        <!-- E: 거래처관리 상세 -->



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
