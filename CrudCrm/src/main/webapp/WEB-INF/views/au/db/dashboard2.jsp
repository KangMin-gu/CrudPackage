<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>IDEA CRM</title>
<%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%>
<%@ include file="/WEB-INF/views/template/inc/chartlininc.jsp"%>
<link href="${pageContext.request.contextPath}/resources/css/plugins/jQueryUI/jquery-ui.css" rel="stylesheet">
</head>

<body>
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
		<div id="page-wrapper" class="gray-bg">
			<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>
			<div class="wrapper wrapper-content">
				<div class="row" id="sortable-view">
					<div class="col-lg-6">		                
	                   	<div class="ibox ">
	                        <div class="ibox-title">
	                            <h5>3개년 신규 고객 등록 현황(신규고객 등록 합계:1000명)</h5>
	                        </div>
	                        <div class="ibox-content">
	                            <div>
	                                <canvas id="barChart" height="140"></canvas>
	                            </div>
	                        </div>           
		                </div>
            		</div>
					<div class="col-lg-6">
						<div class="ibox ">
							<div class="ibox-title">								
								<h5>상담 유형별</h5>
							</div>
							<div class="ibox-content">								
                                	<canvas id="doughnutChart" height="140"></canvas>                            	
							</div>
						</div>
					</div>
				</div>			
				<div class="row" id="sortable-view">
					<div class="col-lg-12">									
						 <div class="ibox-title">
                            <h5>채널별 캠페인 현황</h5>
                        </div>
                        <div class="ibox-content">
                            <div>
                                <div id="lineChart"></div>
                            </div>
                        </div>			
					</div>
				</div>
						
				<div class="row" id="sortable-view">
					<div class="col-lg-12">
						<div class="ibox ">
							<div class="ibox ">
								<div class="ibox-title">								
									<h5>영업 현황 분석</h5>
								</div>
								<div class="ibox-content">								
	                               <canvas id="mixed-chart" width="800" height="140"></canvas>                          	
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row" id="sortable-view">
					<div class="col-lg-4">
						<div class="ibox ">
							<div class="ibox-title">
								<h5>Messages</h5>
								<div class="ibox-tools">
									<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
									</a> <a class="close-link"> <i class="fa fa-times"></i>
									</a>
								</div>
							</div>
							<div class="ibox-content ibox-heading">
								<h3>
									<i class="fa fa-envelope-o"></i> New messages
								</h3>
								<small><i class="fa fa-tim"></i> You have 22 new
									messages and 16 waiting in draft folder.</small>
							</div>
							<div class="ibox-content">
								<div class="feed-activity-list">
									<div class="feed-element">
										<div>
											<small class="float-right">5m ago</small> <strong>Damian
												Nowak</strong>
											<div>The standard chunk of Lorem Ipsum used</div>
											<small class="text-muted">Yesterday 8:48 pm -
												10.06.2014</small>
										</div>
									</div>
									<div class="feed-element">
										<div>
											<small class="float-right">5m ago</small> <strong>Gary
												Smith</strong>
											<div>200 Latin words, combined with a handful</div>
											<small class="text-muted">Yesterday 8:48 pm -
												10.06.2014</small>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="row">
							<div class="col-lg-6">
								<div class="ibox ">
									<div class="ibox-title">
										<h5>User project list</h5>
										<div class="ibox-tools">
											<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
											</a> <a class="close-link"> <i class="fa fa-times"></i>
											</a>
										</div>
									</div>
									<div class="ibox-content table-responsive">
										<table class="table table-hover no-margins">
											<thead>
												<tr>
													<th>Status</th>
													<th>Date</th>
													<th>User</th>
													<th>Value</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><small>Pending...</small></td>
													<td><i class="fa fa-clock-o"></i> 11:20pm</td>
													<td>Samantha</td>
													<td class="text-navy"><i class="fa fa-level-up"></i>
														24%</td>
												</tr>											
												<tr>
													<td><small>Pending...</small></td>
													<td><i class="fa fa-clock-o"></i> 02:20pm</td>
													<td>Agnes</td>
													<td class="text-navy"><i class="fa fa-level-up"></i>
														12%</td>
												</tr>
												
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="ibox ">
									<div class="ibox-title">
										<h5>User project list</h5>
										<div class="ibox-tools">
											<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
											</a> <a class="close-link"> <i class="fa fa-times"></i>
											</a>
										</div>
									</div>
									<div class="ibox-content table-responsive">
										<table class="table table-hover no-margins">
											<thead>
												<tr>
													<th>Status</th>
													<th>Date</th>
													<th>User</th>
													<th>Value</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><small>Pending...</small></td>
													<td><i class="fa fa-clock-o"></i> 11:20pm</td>
													<td>Samantha</td>
													<td class="text-navy"><i class="fa fa-level-up"></i>
														24%</td>
												</tr>											
												<tr>
													<td><small>Pending...</small></td>
													<td><i class="fa fa-clock-o"></i> 02:20pm</td>
													<td>Agnes</td>
													<td class="text-navy"><i class="fa fa-level-up"></i>
														12%</td>
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


	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<%@ include file="/WEB-INF/views/template/inc/chartjsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
	<script>
        $(document).ready(function() {
        	WinMove();   	
        	$(".ibox").resizable({
                helper: "ui-resizable-helper",
                grid: 20
            });
			
        	//채널별 캠페인 현황
        	  c3.generate({
                  bindto: '#lineChart',
                  data:{
                      columns: [
                          ['data1', 30, 200, 100, 400, 150, 250],
                          ['data2', 50, 20, 10, 40, 15, 25]
                      ],
                      colors:{
                          data1: '#1ab394',
                          data2: '#BABABA'
                      }
                  }
              });
        	
        });
        
        //월별 신규 고객 등록 현황
       var barData = {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
            {
                label: "Data 1",
                backgroundColor: 'rgba(220, 220, 220, 0.5)',
                pointBorderColor: "#fff",
                data: [65, 59, 80, 81, 56, 55, 40]
            },
            {
                label: "Data 2",
                backgroundColor: 'rgba(26,179,148,0.5)',
                borderColor: "rgba(26,179,148,0.7)",
                pointBackgroundColor: "rgba(26,179,148,1)",
                pointBorderColor: "#fff",
                data: [28, 48, 40, 19, 86, 27, 90]
            },
            {
                label: "Data 2",
                backgroundColor: 'rgba(26,179,148,0.5)',
                borderColor: "rgba(26,179,148,0.7)",
                pointBackgroundColor: "rgba(26,179,148,1)",
                pointBorderColor: "#fff",
                data: [28, 48, 40, 19, 86, 27, 90]
            }
        ]
    };

    var barOptions = {
        responsive: true
    };

	
    var ctx2 = document.getElementById("barChart").getContext("2d");
    new Chart(ctx2, {type: 'bar', data: barData, options:barOptions});


        
        
   //상담유형별 PIE chart
        var doughnutData = {
                labels: ["App","Software","Laptop" ],
                datasets: [{
                    data: [300,50,100],
                    backgroundColor: ["#a3e1d4","#dedede","#b5b8cf"]
                }]
            } ;


       var doughnutOptions = {
                responsive: true
       };


       var ctx4 = document.getElementById("doughnutChart").getContext("2d");
       new Chart(ctx4, {type: 'doughnut', data: doughnutData, options:doughnutOptions});
       
       
       new Chart(document.getElementById("mixed-chart"), {
    	    type: 'bar',
    	    data: {
    	      labels: ["1900", "1950", "1999", "2050"],
    	      datasets: [{
    	          label: "Europe",
    	          type: "line",
    	          borderColor: "#8e5ea2",
    	          data: [408,547,675,734],
    	          fill: false
    	        }, {
    	          label: "Africa",
    	          type: "line",
    	          borderColor: "#3e95cd",
    	          data: [133,221,783,2478],
    	          fill: false
    	        }, {
    	          label: "Europe",
    	          type: "bar",
    	          backgroundColor: "rgba(0,0,0,0.2)",
    	          data: [408,547,675,734],
    	        }, {
    	          label: "Africa",
    	          type: "bar",
    	          backgroundColor: "rgba(0,0,0,0.2)",
    	          backgroundColorHover: "#3e95cd",
    	          data: [133,221,783,2478]
    	        }
    	      ]
    	    },
    	    options: {
    	      title: {
    	        display: true,
    	        text: 'Population growth (millions): Europe & Africa'
    	      },
    	      legend: { display: false }
    	    }
    	});
    </script>
</body>
</html>