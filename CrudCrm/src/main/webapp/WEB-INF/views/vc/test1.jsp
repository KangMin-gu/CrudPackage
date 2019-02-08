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

<style>
body {
	background-color: #f3f3f4;
}
</style>



</head>
<body>
	<div class="wrapper">
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>콜백추가테스트</h2>

			</div>

		</div>

		<!-- S: 고객 목록 ppt p01-->
		<div class="wrapper wrapper-content  animated fadeInRight article">

			<div class="col-lg-12">
				<div class="ibox">

					<div class="ibox-content row">

							<input type="hidden" id="parentid" name="parentid" value="">
							<div class="w-100 text-right mb-3">
								<button class="btn btn-primary" type="button" onClick="testSubmit();">등록</button>
							</div>
							<div class="box1 col-lg-12 col-xl-4 p-0">
								<table class="table table-bordered mb-0">
								
									<colgroup>
										<col style="width: 110px; background: #fafafa;">
										<col style="width: auto;">
									</colgroup>
									<tbody>
									
										<tr>
											<th>발신자번호</th>
											<td><input type="text" class="form-control"id="CALLER" name="CALLER" > </td>
										</tr>
										<tr>
											<th>대표번호</th>
											<td><input type="text" class="form-control" id="TRUNK" name="TRUNK" ></td>
										</tr>
										<tr>
											<th>콜백번호</th>
											<td><input type="text" id="CALLBACK" name="CALLBACK" /></td>
										</tr>

										<tr>
											<th>호분배코드1</th>
											<td><input type="text" id="GCODE1" name="GCODE1"/></td>
										</tr>
										<tr>
											<th>호분배코드2</th>
											<td><input type="text" id="GCODE2" name="GCODE2"/></td>
										</tr>
										<tr>
											<th>호분배코드3</th>
											<td><input type="text" id="GCODE3" name="GCODE3"/></td>
										</tr>
										<tr>
											<th>요일1</th>
											<td><input type="text" id="DTWEEK" name="DTWEEK"/></td>
										</tr>
										<tr>
											<th>시간</th>
											<td><input type="text" id="TIME1" name="TIME1"/></td>
										</tr>
										<tr>
											<th>날짜</th>
											<td><input type="text" id="DATE1" name="DATE1"/></td>
										</tr>
									
									</tbody>
							
								</table>
							</div>
					</div>
				</div>

			</div>

		</div>
	</div>

	<!-- js includ -->
	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>



<script>
function testSubmit(){
	var CALLER = $('#CALLER').val();
	var TRUNK = $('#TRUNK').val();
	var CALLBACK = $('#CALLBACK').val();
	var GCODE1 = $('#GCODE1').val();
	var GCODE2 = $('#GCODE2').val();
	var GCODE3 = $('#GCODE3').val();
	var DTWEEK = $('#DTWEEK').val();
	var DATE1 = $('#DATE1').val();
	var TIME1 = $('#TIME1').val();
	var jsonPrm = {"CALLER":CALLER,"TRUNK":TRUNK,"CALLBACK":CALLBACK,"GCODE1":GCODE1,"GCODE2":GCODE2,"GCODE3":GCODE3,"DTWEEK":DTWEEK,"TIME1":TIME1,"DATE1":DATE1};
	$.ajax({
		url: "/vc/callback",
    	method: "POST",
    	dataType: "json",
    	data: jsonPrm,
    	cache: false,

		success : function(response) {
		}
	});
}
</script>
</body>
</html>