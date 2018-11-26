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
<link href="${pageContext.request.contextPath}/resources/css/plugins/datapicker/datepicker3.css" rel="stylesheet"> <!--datePicker-->
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


  <!-- S: 영업관리 추가/수정 -->
        <div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row justify-content-md-center">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title row border-0">
                            <h4>기본정보</h4>
                        </div>
                        <div class="ibox-content row">
                            <div class="w-100 text-right mb-3">
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
                                            <th>영업건명<sup>*</sup></th>
                                            <td><input type="text" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>현단계<sup>*</sup></th>
                                            <td>
                                                <select class="form-control" style="height: 23px;">
                                                    <option value="">계약성공종료</option>
                                                    <option value="">계약중</option>
                                                    <option value="">제안서제출</option>
                                                    <option value="">접촉중</option>
                                                    <option value="">문의</option>
                                                    <option value="">중도포기</option>
                                                    <option value="">경쟁실패</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>예상수주일</th>
                                            <td>
                                                <div class="input-group p-0">
                                                    <div class="d-flex date date01">
                                                      <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>제품명</th>
                                            <td><input type="text" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>카테고리</th>
                                            <td>
                                                <select class="form-control" style="height: 23px;">
                                                    <option value="">카테고리</option>
                                                    <option value="">카테고리</option>
                                                    <option value="">카테고리</option>
                                                    <option value="">카테고리</option>
                                                </select>
                                            </td>
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
                                            <th>영업담당자<sup>*</sup></th>
                                            <td><input type="text" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>현단계진입일</th>
                                            <td>
                                                <div class="input-group p-0">
                                                    <div class="d-flex date date01">
                                                      <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>예상수주액</th>
                                            <td><input type="text" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>실수주일</th>
                                            <td>
                                                <div class="input-group p-0">
                                                    <div class="d-flex date date01">
                                                      <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" value="">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>시작일정</th>
                                            <td>
                                                <select class="form-control" style="height: 23px;">
                                                    <option value="">카테고리</option>
                                                    <option value="">카테고리</option>
                                                    <option value="">카테고리</option>
                                                    <option value="">카테고리</option>
                                                </select>
                                            </td>
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
                                            <th>거래처명<sup>*</sup></th>
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
                                            <th>확률</th>
                                            <td><input type="text" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>영업건구분</th>
                                            <td><input type="text" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>실수주액</th>
                                            <td><input type="text" class="form-control"></td>
                                        </tr>
                                        <tr>
                                            <th>종료일정</th>
                                            <td><input type="text" class="form-control"></td>
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
                    </div>
                </div>
            </div>
        </div>
        <!-- E: 영업관리 추가/수정 -->

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
	 <script src="${pageContext.request.contextPath}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script> <!-- datePicker-->
	 <script>
	 $(document).ready(function(){
		 // datePicker
         $('.date.date01, .date.date02').datepicker({
             todayBtn: "linked",
             keyboardNavigation: false,
             forceParse: false,
             calendarWeeks: true,
             autoclose: true
         });
	 });
	 </script>
</body>
</html>
