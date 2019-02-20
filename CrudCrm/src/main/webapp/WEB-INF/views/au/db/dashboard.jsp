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
<link href="${pageContext.request.contextPath}/resources/js/layout-grid.css" rel="stylesheet">
</head>
<body>
	<div id="wrapper" >
		<%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
	<div id="page-wrapper" class="gray-bg">
		<%@ include file="/WEB-INF/views/template/menu/top.jsp"%>
		<div class="wrapper wrapper-content">	
            <div class="col-md-12">
                <div data-arrange="lt-grid" class="lt-container lt-xs-h-6 lt-sm-h-5 lt-md-h-4">

                    <div draggable="true" class="lt lt-xs-x-0
                            lt-xs-y-0
                            lt-xs-w-1
                            lt-xs-h-1
                            lt-sm-x-0
                            lt-sm-y-0
                            lt-sm-w-1
                            lt-sm-h-1
                            lt-md-x-0
                            lt-md-y-0
                            lt-md-w-1
                            lt-md-h-1                            
							lt-lg-x-0
                            lt-lg-y-0
                            lt-lg-w-1
                            lt-lg-h-1">
                        <div class="lt-body bg-info text-center">
                            <h3>1</h3>
                        </div>
                    </div>
                    <div
                     draggable="true"
                     class="lt
                            lt-xs-x-0
                            lt-xs-y-1
                            lt-xs-w-1
                            lt-xs-h-2
                            lt-sm-x-1
                            lt-sm-y-0
                            lt-sm-w-1
                            lt-sm-h-2
                            lt-md-x-2
                            lt-md-y-0
                            lt-md-w-1
                            lt-md-h-2
                            lt-lg-x-1
                            lt-lg-y-0
                            lt-lg-w-1
                            lt-lg-h-2">
                        <div class="lt-body bg-info text-center">
                            <h3>2</h3>
                        </div>
                    </div>
                    <div
                     draggable="true"
                     class="lt
                            lt-xs-x-0
                            lt-xs-y-3
                            lt-xs-w-1
                            lt-xs-h-1
                            lt-sm-x-0
                            lt-sm-y-1
                            lt-sm-w-1
                            lt-sm-h-1
                            lt-md-x-1
                            lt-md-y-0
                            lt-md-w-1
                            lt-md-h-1
                            lt-lg-x-0
                            lt-lg-y-1
                            lt-lg-w-1
                            lt-lg-h-1">
                        <div class="lt-body bg-info text-center">
                            <h3>3</h3>
                        </div>
                    </div>
                    <div
                     draggable="true"
                     class="lt
                            lt-xs-x-0
                            lt-xs-y-4
                            lt-xs-w-1
                            lt-xs-h-2
                            lt-sm-x-0
                            lt-sm-y-2
                            lt-sm-w-2
                            lt-sm-h-2
                            lt-md-x-0
                            lt-md-y-1
                            lt-md-w-2
                            lt-md-h-2
                            lt-lg-x-2
                            lt-lg-y-0
                            lt-lg-w-2
                            lt-lg-h-2">
                        <div class="lt-body bg-info text-center">
                            <h3>4</h3>
                        </div>
                    </div>
                   
                   
                </div>
            </div>
	</div>
  	</div>			

	<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>
	<%@ include file="/WEB-INF/views/template/inc/chartjsinc.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/layout-grid.js"></script>
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
     
     $( "#resizable" ).resizable({
         containment: "#container"
       });
     

        $('.dad').dad();
  
    </script>
</body>
</html>