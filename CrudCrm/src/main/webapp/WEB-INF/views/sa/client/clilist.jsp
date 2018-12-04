<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

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
					<h2>거래처관리</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><strong>목록</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>

			<!-- S: 거래처관리 리스트-->
			<div class="wrapper wrapper-content  animated fadeInRight article">
				<div class="row justify-content-md-center">
					<div class="col-lg-12">
						<div class="ibox">
							<form:form id="command" action="/sales/client" method="GET">
								<div class="ibox-content row">

									<div class="w-100 text-right mb-3 mt-3">
										<Button type="submit" class="btn btn-primary">검색</Button>
										<a href="javascript:void(0);" class="btn btn-primary resets">초기화</a>
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
													<td><input type="text" class="form-control reset"
														id="cliname" name="cliname" value="${searchVal.cliname }"></td>
												</tr>
												<tr>
													<th>업종</th>
													<td><input type="text" class="form-control reset"
														id="bstype" name="bstype" value="${searchVal.bstype }"></td>
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
													<td><input type="text" class="form-control reset"
														id="callname" name="callname"
														value="${searchVal.callname }"></td>
												</tr>
												<tr>
													<th>중요도</th>
													<td>
														<select class="form-control reset" style="height: 23px;" id="importance" name="importance">
															<option value="0" ${searchVal.importance eq "0" ? "selected" :""}>선택</option>
															<option value="1" ${searchVal.importance eq "1" ? "selected" :""}>A</option>
															<option value="2" ${searchVal.importance eq "2" ? "selected" :""}>B</option>
															<option value="3" ${searchVal.importance eq "3" ? "selected" :""}>C</option>
															<option value="4" ${searchVal.importance eq "4" ? "selected" :""}>D</option>
															<option value="5" ${searchVal.importance eq "5" ? "selected" :""}>E</option>
													</select></td>
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
															<input class="reset owner" type="text" class="form-control" id="username" name="username" value="${searchVal.username }" readonly> 
															<input class="reset" type="hidden" id="owner" name="owner" value="${searchVal.owner }" /> 
															<span class="input-group-addon"> 
																<a href="javascript:void(0);"><i class="fa fa-search owner"></i></a>
															</span>
														</div>
													</td>
												</tr>
												<tr>
													<th>밀착도</th>
													<td>
														<select class="form-control reset" style="height: 23px;" id="friendly" name="friendly">
															<option value="0" ${searchVal.friendly eq "0" ? "selected" :""}>선택</option>
															<option value="1" ${searchVal.friendly eq "1" ? "selected" :""}>A</option>
															<option value="2" ${searchVal.friendly eq "2" ? "selected" :""}>B</option>
															<option value="3" ${searchVal.friendly eq "3" ? "selected" :""}>C</option>
															<option value="4" ${searchVal.friendly eq "4" ? "selected" :""}>D</option>
															<option value="5" ${searchVal.friendly eq "5" ? "selected" :""}>E</option>
														</select>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
							</form:form>
							<div class="w-100 text-right mt-3">
								<a href="/sales/client/post" class="btn btn-primary">추가</a> 
								<a href="javascript:void(0);" class="btn btn-primary">엑셀다운로드</a>
							</div>
						</div>
						<div class="ibox-content row border-top-0 pt-lg-0">
							<div class="table-responsive">
								<table class="table table-bordered"
									style="border-top: 1px solid #e7eaec;">
									<colgroup>
										<col width="180px;">
										<col width="120px;">
										<col width="400px;">
										<col width="80px;">
										<col width="100px;">
										<col width="70px;">
										<col width="70px;">
										<col width="200px;">
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

										<c:forEach var="list" items="${clientList}">
											<tr>
												<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" title="${list.CLINAME }">
													<a href="/sales/client/view/${list.CLINO }">${list.CLINAME }</a>
												</td>
												<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" title="${list.CALLNAME }">${list.CALLNAME }</td>
												<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" title="${list.ADDR }">${list.ADDR }</td>
												<td>${list.BSTYPE }</td>
												<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" title="${list.USERNAME }">${list.USERNAME }</td>
												<td>
													<c:choose>
														<c:when test="${list.IMPORTANCE eq 1 }">A</c:when>
														<c:when test="${list.IMPORTANCE eq 2 }">B</c:when>
														<c:when test="${list.IMPORTANCE eq 3 }">C</c:when>
														<c:when test="${list.IMPORTANCE eq 4 }">D</c:when>
														<c:when test="${list.IMPORTANCE eq 5 }">E</c:when>
														<c:when test="${list.IMPORTANCE eq 6 }">F</c:when>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${list.FRIENDLY eq 1 }">A</c:when>
														<c:when test="${list.FRIENDLY eq 2 }">B</c:when>
														<c:when test="${list.FRIENDLY eq 3 }">C</c:when>
														<c:when test="${list.FRIENDLY eq 4 }">D</c:when>
														<c:when test="${list.FRIENDLY eq 5 }">E</c:when>
														<c:when test="${list.FRIENDLY eq 6 }">F</c:when>
													</c:choose>
												</td>
												<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" title="${list.MEMO }">${list.MEMO}</td>
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
											<li class="footable-page-arrow disabled">
												<a href='/sales/client?cliname=${searchVal.cliname }&callname=${searchVal.callname }&username=${searchVal.username }&owner=${searchVal.owner }&bstype=${searchVal.bstype}&importance=${searchVal.importance }&friendly=${searchVal.friendly }&pageNum=${page.startPageNum-1 }'>&laquo;</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a href="javascript:">&laquo;</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="i" begin="${page.startPageNum }"
										end="${page.endPageNum }">
										<c:choose>
											<c:when test="${i eq page.pageNum }">
												<li class="footable-page active">
													<a href='/sales/client?cliname=${searchVal.cliname }&callname=${searchVal.callname }&username=${searchVal.username }&owner=${searchVal.owner }&bstype=${searchVal.bstype}&importance=${searchVal.importance }&friendly=${searchVal.friendly }&pageNum=${i }'>${i }</a>
												</li>
											</c:when>
											<c:otherwise>
												<li>
													<a href='/sales/client?cliname=${searchVal.cliname }&callname=${searchVal.callname }&username=${searchVal.username }&owner=${searchVal.owner }&bstype=${searchVal.bstype}&importance=${searchVal.importance }&friendly=${searchVal.friendly }&pageNum=${i }'>${i }</a>
												</li>

											</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:choose>
										<c:when test="${page.endPageNum lt page.totalPageCount }">
											<li>
												<a href='/sales/client?cliname=${searchVal.cliname }&callname=${searchVal.callname }&username=${searchVal.username }&owner=${searchVal.owner }&bstype=${searchVal.bstype}&importance=${searchVal.importance }&friendly=${searchVal.friendly }&pageNum=${page.endPageNum+1 }'>&raquo;</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a href="javascript:">&raquo;</a></li>
										</c:otherwise>
									</c:choose>
								</ul>

							</div>
							<h4 class="float-right">&middot; 총 자료수 : ${page.totalRows }건</h4>
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
