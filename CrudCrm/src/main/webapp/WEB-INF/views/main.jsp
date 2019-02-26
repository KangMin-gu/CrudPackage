<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<div id="wrapper" >
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>
		<div class="wrapper wrapper-content">
	        	<div class="row">                                                     
	               <div class="col-lg-4">
	                   <div class="ibox ">
	                      <div class="ibox-title">
	                           <h5>3개년 신규 고객 등록 현황(신규고객 등록 합계:1000명)</h5>
	                      </div>
	                      <div class="ibox-content">
	                          <canvas id="barChart" height="140"></canvas>
	                      </div>
	                   </div>
	              	</div>
	                <div class="col-lg-4">
	                   <div class="ibox ">
	                      <div class="ibox-title">                             
	                           <h5>상담 유형별</h5>
	                      </div>
	                    <div class="ibox-content">
	                        <canvas id="doughnutChart" height="140"></canvas>
	                    </div>
	                   </div>
	            	</div>
	            	<div class="col-lg-4">
	                   <div class="ibox ">
	                      <div class="ibox-title">
	                           <h5>3개년 신규 고객 등록 현황(신규고객 등록 합계:1000명)</h5>
	                      </div>
	                      <div class="ibox-content">
	                          <canvas id="barChart" height="140"></canvas>
	                      </div>
	                   </div>
	              	</div>	
	        	</div>
		        <div class="row" id="sortable-view">
		            <div class="col-lg-6">
		               <div class="ibox ">
		                   <div class="ibox-title">
		                       <h5>채널별 캠페인 현황</h5>                          
		                    </div>
		                    <div class="ibox-content">                        
		                            <div id="lineChart"></div>                       
		                     </div>
		                  </div>
		            </div>
		            <div class="col-lg-6">
		                  <div class="ibox ">
			                  <div class="ibox-title">
			                     <h5>영업 현황 분석</h5>                             
			                  </div>
			                  <div class="ibox-content">
			                       <canvas id="canvas" height="140"></canvas>                
			                  </div>
		               	</div>
		            </div>
		        </div>
		        
		 		<div class="row" id="sortable-view">
		            <div class="col-lg-6">
		               <div class="ibox ">
		                   <div class="ibox-title">
		                       <h5>채널별 캠페인 현황</h5>                          
		                    </div>
		                    <div class="ibox-content">                  
		                            <div id="lineChart"></div>                       
		                     </div>
		                  </div>
		            </div>
		            <div class="col-lg-6">
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
		</div>
  	</div>			

	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<%@ include file="/WEB-INF/views/template/inc/chartjsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>

     <script>
        $(document).ready(function() {
        	
       
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
     
//영업현황분석

		var color = Chart.helpers.color;
		var barChartData = {
			labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
			datasets: [{
				type: 'bar',
				label: 'Dataset 1',
				backgroundColor: color(window.chartColors.red).alpha(0.2).rgbString(),
				borderColor: window.chartColors.red,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}, {
				type: 'line',
				label: 'Dataset 2',
				backgroundColor: color(window.chartColors.blue).alpha(0.2).rgbString(),
				borderColor: window.chartColors.blue,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}, {
				type: 'bar',
				label: 'Dataset 3',
				backgroundColor: color(window.chartColors.green).alpha(0.2).rgbString(),
				borderColor: window.chartColors.green,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}]
		};

		// Define a plugin to provide data labels
		Chart.plugins.register({
			afterDatasetsDraw: function(chart) {
				var ctx = chart.ctx;

				chart.data.datasets.forEach(function(dataset, i) {
					var meta = chart.getDatasetMeta(i);
					if (!meta.hidden) {
						meta.data.forEach(function(element, index) {
							// Draw the text in black, with the specified font
							ctx.fillStyle = 'rgb(0, 0, 0)';

							var fontSize = 16;
							var fontStyle = 'normal';
							var fontFamily = 'Helvetica Neue';
							ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

							// Just naively convert to string for now
							var dataString = dataset.data[index].toString();

							// Make sure alignment settings are correct
							ctx.textAlign = 'center';
							ctx.textBaseline = 'middle';

							var padding = 5;
							var position = element.tooltipPosition();
							ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding);
						});
					}
				});
			}
		});

		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myBar = new Chart(ctx, {
				type: 'bar',
				data: barChartData,
				options: {
					responsive: true,
					title: {
						display: true,
						text: 'Chart.js Combo Bar Line Chart'
					},
				}
			});
		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			barChartData.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return randomScalingFactor();
				});
			});
			window.myBar.update();
		});
	
    </script>
</body>
</html>