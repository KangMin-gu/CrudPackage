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
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
</head>

<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
    
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>
	 ${pageContext.request.contextPath} 

			<div class="wrapper wrapper-content animated fadeIn">
				<div class="p-w-md m-t-sm">
					<div class="row">

						<div class="col-sm-4">
							<h1 class="m-b-xs">26,900</h1>
							<small> Sales in current month </small>
							<div id="sparkline1" class="m-b-sm"></div>
							<div class="row">
								<div class="col-4">
									<small class="stats-label">Pages / Visit</small>
									<h4>236 321.80</h4>
								</div>

								<div class="col-4">
									<small class="stats-label">% New Visits</small>
									<h4>46.11%</h4>
								</div>
								<div class="col-4">
									<small class="stats-label">Last week</small>
									<h4>432.021</h4>
								</div>
							</div>

						</div>
						<div class="col-sm-4">
							<h1 class="m-b-xs">98,100</h1>
							<small> Sales in last 24h </small>
							<div id="sparkline2" class="m-b-sm"></div>
							<div class="row">
								<div class="col-4">
									<small class="stats-label">Pages / Visit</small>
									<h4>166 781.80</h4>
								</div>

								<div class="col-4">
									<small class="stats-label">% New Visits</small>
									<h4>22.45%</h4>
								</div>
								<div class="col-4">
									<small class="stats-label">Last week</small>
									<h4>862.044</h4>
								</div>
							</div>


						</div>
						<div class="col-sm-4">

							<div class="row m-t-xs">
								<div class="col-6">
									<h5 class="m-b-xs">Income last month</h5>
									<h1 class="no-margins">160,000</h1>
									<div class="font-bold text-navy">
										98% <i class="fa fa-bolt"></i>
									</div>
								</div>
								<div class="col-6">
									<h5 class="m-b-xs">Sals current year</h5>
									<h1 class="no-margins">42,120</h1>
									<div class="font-bold text-navy">
										98% <i class="fa fa-bolt"></i>
									</div>
								</div>
							</div>


							<table class="table small m-t-sm">
								<tbody>
									<tr>
										<td><strong>142</strong> Projects</td>
										<td><strong>22</strong> Messages</td>

									</tr>
									<tr>
										<td><strong>61</strong> Comments</td>
										<td><strong>54</strong> Articles</td>
									</tr>
									<tr>
										<td><strong>154</strong> Companies</td>
										<td><strong>32</strong> Clients</td>
									</tr>
								</tbody>
							</table>



						</div>

					</div>

					<div class="row">
						<div class="col-lg-12">
							<div class="small float-left col-md-3 m-l-lg m-t-md">
								<strong>Sales char</strong> have evolved over the years
								sometimes.
							</div>
							<div class="small float-right col-md-3 m-t-md text-right">
								<strong>There are many</strong> variations of passages of Lorem
								Ipsum available, but the majority have suffered.
							</div>
							<div class="flot-chart m-b-xl">
								<div class="flot-chart-content" id="flot-dashboard5-chart"></div>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-lg-12">
							<div class="ibox">



								<div class="ibox-content">

									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-form-label" for="product_name">Project
													Name</label> <input type="text" id="product_name"
													name="product_name" value="" placeholder="Project Name"
													class="form-control">
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label class="col-form-label" for="price">Name</label> <input
													type="text" id="price" name="price" value=""
													placeholder="Name" class="form-control">
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label class="col-form-label" for="quantity">Company</label>
												<input type="text" id="quantity" name="quantity" value=""
													placeholder="Company" class="form-control">
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-form-label" for="status">Status</label> <select
													name="status" id="status" class="form-control">
													<option value="1" selected="">Completed</option>
													<option value="0">Pending</option>
												</select>
											</div>
										</div>
									</div>

									<div class="table-responsive">
										<table class="table table-striped">

											<tbody>
												<tr>
													<td>1</td>
													<td>Master project</td>
													<td>Patrick Smith</td>
													<td>$892,074</td>
													<td>Inceptos Hymenaeos Ltd</td>
													<td><strong>20%</strong></td>
													<td>Jul 14, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
												</tr>
												<tr>
													<td>2</td>
													<td>Alpha project</td>
													<td>Alice Jackson</td>
													<td>$963,486</td>
													<td>Nec Euismod In Company</td>
													<td><strong>40%</strong></td>
													<td>Jul 16, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
												</tr>
												<tr>
													<td>3</td>
													<td>Betha project</td>
													<td>John Smith</td>
													<td>$996,824</td>
													<td>Erat Volutpat</td>
													<td><strong>75%</strong></td>
													<td>Jul 18, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
												</tr>
												<tr>
													<td>4</td>
													<td>Gamma project</td>
													<td>Anna Jordan</td>
													<td>$105,192</td>
													<td>Tellus Ltd</td>
													<td><strong>18%</strong></td>
													<td>Jul 22, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
												</tr>
												<tr>
													<td>2</td>
													<td>Alpha project</td>
													<td>Alice Jackson</td>
													<td>$674,803</td>
													<td>Nec Euismod In Company</td>
													<td><strong>40%</strong></td>
													<td>Jul 16, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
												</tr>
												<tr>
													<td>1</td>
													<td>Master project</td>
													<td>Patrick Smith</td>
													<td>$174,729</td>
													<td>Inceptos Hymenaeos Ltd</td>
													<td><strong>20%</strong></td>
													<td>Jul 14, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
												</tr>
												<tr>
													<td>4</td>
													<td>Gamma project</td>
													<td>Anna Jordan</td>
													<td>$823,198</td>
													<td>Tellus Ltd</td>
													<td><strong>18%</strong></td>
													<td>Jul 22, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
												</tr>
												<tr>
													<td>1</td>
													<td>Project <small>This is example of project</small></td>
													<td>Patrick Smith</td>
													<td>$778,696</td>
													<td>Inceptos Hymenaeos Ltd</td>
													<td><strong>20%</strong></td>
													<td>Jul 14, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
												</tr>
												<tr>
													<td>2</td>
													<td>Alpha project</td>
													<td>Alice Jackson</td>
													<td>$861,063</td>
													<td>Nec Euismod In Company</td>
													<td><strong>40%</strong></td>
													<td>Jul 16, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
												</tr>
												<tr>
													<td>3</td>
													<td>Betha project</td>
													<td>John Smith</td>
													<td>$109,125</td>
													<td>Erat Volutpat</td>
													<td><strong>75%</strong></td>
													<td>Jul 18, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
												</tr>
												<tr>
													<td>4</td>
													<td>Gamma project</td>
													<td>Anna Jordan</td>
													<td>$600,978</td>
													<td>Tellus Ltd</td>
													<td><strong>18%</strong></td>
													<td>Jul 22, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
												</tr>
												<tr>
													<td>2</td>
													<td>Alpha project</td>
													<td>Alice Jackson</td>
													<td>$150,161</td>
													<td>Nec Euismod In Company</td>
													<td><strong>40%</strong></td>
													<td>Jul 16, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
												</tr>
												<tr>
													<td>1</td>
													<td>Project <small>This is example of project</small></td>
													<td>Patrick Smith</td>
													<td>$160,586</td>
													<td>Inceptos Hymenaeos Ltd</td>
													<td><strong>20%</strong></td>
													<td>Jul 14, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
												</tr>
												<tr>
													<td>4</td>
													<td>Gamma project</td>
													<td>Anna Jordan</td>
													<td>$110,612</td>
													<td>Tellus Ltd</td>
													<td><strong>18%</strong></td>
													<td>Jul 22, 2015</td>
													<td><a href="#"><i class="fa fa-check text-navy"></i></a></td>
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

			<div class="footer">
				<%@ include file="/WEB-INF/views/template/menu/foot.jsp"%>
			</div>
		</div>

		<div id="right-sidebar">
			<%@ include file="/WEB-INF/views/template/menu/rightside.jsp"%>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<script>
		$(document).ready(
				function() {

					var sparklineCharts = function() {
						$("#sparkline1").sparkline(
								[ 34, 43, 43, 35, 44, 32, 44, 52 ], {
									type : 'line',
									width : '100%',
									height : '50',
									lineColor : '#1ab394',
									fillColor : "transparent"
								});

						$("#sparkline2").sparkline(
								[ 32, 11, 25, 37, 41, 32, 34, 42 ], {
									type : 'line',
									width : '100%',
									height : '50',
									lineColor : '#1ab394',
									fillColor : "transparent"
								});

						$("#sparkline3").sparkline(
								[ 34, 22, 24, 41, 10, 18, 16, 8 ], {
									type : 'line',
									width : '100%',
									height : '50',
									lineColor : '#1C84C6',
									fillColor : "transparent"
								});
					};

					var sparkResize;

					$(window).resize(function(e) {
						clearTimeout(sparkResize);
						sparkResize = setTimeout(sparklineCharts, 500);
					});

					sparklineCharts();

					var data1 = [ [ 0, 4 ], [ 1, 8 ], [ 2, 5 ], [ 3, 10 ],
							[ 4, 4 ], [ 5, 16 ], [ 6, 5 ], [ 7, 11 ], [ 8, 6 ],
							[ 9, 11 ], [ 10, 20 ], [ 11, 10 ], [ 12, 13 ],
							[ 13, 4 ], [ 14, 7 ], [ 15, 8 ], [ 16, 12 ] ];
					var data2 = [ [ 0, 0 ], [ 1, 2 ], [ 2, 7 ], [ 3, 4 ],
							[ 4, 11 ], [ 5, 4 ], [ 6, 2 ], [ 7, 5 ], [ 8, 11 ],
							[ 9, 5 ], [ 10, 4 ], [ 11, 1 ], [ 12, 5 ],
							[ 13, 2 ], [ 14, 5 ], [ 15, 2 ], [ 16, 0 ] ];
					$("#flot-dashboard5-chart").length
							&& $.plot($("#flot-dashboard5-chart"), [ data1,
									data2 ], {
								series : {
									lines : {
										show : false,
										fill : true
									},
									splines : {
										show : true,
										tension : 0.4,
										lineWidth : 1,
										fill : 0.4
									},
									points : {
										radius : 0,
										show : true
									},
									shadowSize : 2
								},
								grid : {
									hoverable : true,
									clickable : true,

									borderWidth : 2,
									color : 'transparent'
								},
								colors : [ "#1ab394", "#1C84C6" ],
								xaxis : {},
								yaxis : {},
								tooltip : false
							});

				});
	</script>
</body>
</html>