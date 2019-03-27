<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>IDEACRM</title>
    <%@ include file="/WEB-INF/views/template/inc/linkinc.jsp"%> 
    <link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <!-- orris -->
    <link href="${pageContext.request.contextPath}/resources/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
</head>
<style>
    th{
        background-color: #f5f6f7;
    }
</style>
<body>

<div id="wrapper">
    <%@ include file="/WEB-INF/views/template/menu/leftside.jsp"%>
    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <%@ include file="/WEB-INF/views/template/menu/top.jsp"%>
        </div>


        <div class="wrapper wrapper-content animated fadeInRight">

            <div class="row">
                <div class="col-lg-3">
                    <a href="#" class="btn btn-default"><i class="fa fa-envelope fa-lg"></i></a>
                    <a href="#" class="btn btn-default"><i class="fa fa-mobile fa-lg"></i></a>
                    <a href="#" class="btn btn-default"><i class="fa fa-comment fa-lg"></i></a>
                    <a href="#" class="btn btn-default"><i class="fa fa-file-excel-o fa-lg"></i></a>
                    <a href="#" class="btn btn-default"><i class="fa fa-file-pdf-o fa-lg"></i></a>
                </div>
                
                <div class="col-lg-6">
                <form:form action="/vc/report/1" method="POST">
                	<div class="container">
						<div class="row">
							<div class="d-flex col-lg-12">													
								<input id="datefr" name="datefr" type="text" class="form-control" value="${search.datefr }" placeholder="시작일">						                                    		
 							    <input id="dateto" name="dateto" type="text" class="form-control" value="${search.dateto }" placeholder="종료일">																	
								<button type="submit" class="btn btn-sm btn-primary">검색</button>
							</div>								
						</div>
					</div>
				</form:form>																																													
				</div>	
            </div>

            <br/>
            <div class="row">
                <div class="col-lg-6">
                  <div class="row">
                      <div class="col-lg-12">
                          <div class="ibox">
                              <div class="ibox-title">
                                  <h5><i class="fa fa-certificate"></i> 인입 현황</h5>
                                  <div class="ibox-tools">
                                      <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                  </div>
                              </div>
                              <div class="ibox-content">
                                  <div class="row">
                                      <div class="col-lg-12">
                                          <div class="row">
                                              <div class="col-lg-12">
                                                  총 건수 : ${serviceCodeReportCnt }
                                              </div>
                                              <div class="col-lg-3">
                                              	<div class="table-responsive">
                                              		<table class="table table-bordered" style="white-space:nowrap;">
                                                  		<colgroup>
                                                      		<col width="40%">
                                                      		<col width="60%">
                                                  		</colgroup>
                                                  	<tbody>
                                                  	
                                                  	<c:forEach var="vcServiceCodeReport" items="${serviceCodeReport }">
                                                    	<tr>
                                                        	<th>${vcServiceCodeReport.label }</th>
                                                        	<td>${vcServiceCodeReport.value }</td>
                                                    	</tr>
                                                    </c:forEach>
                                                  </tbody>
                                              </table>
                                          </div>
                                              </div>
                                              <div class="col-lg-9">
                                                  <div id="morris-donut-chart" ></div>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="col-lg-12">
                          <div class="ibox">
                              <div class="ibox-content">
                                  <div class="table-responsive">
                                      <table class="" style="white-space:nowrap;">
                                          <colgroup>
                                              <col width="25%">
                                              <col width="25%">
                                              <col width="25%">
                                              <col width="25%">
                                              <col width="25%">
                                          </colgroup>
                                          <tbody>
                                          <tr>
                                              <td>
                                                  <div class="text-center">
                                                      <img src="${pageContext.request.contextPath}/resources/img/crud/angry.png" alt="" height="100px;">
                                                  </div>
                                                  <div class="text-center"><strong>불만</strong></div>
                                              </td>
                                              <td>
                                                  <div class="text-center">
                                                      <img src="${pageContext.request.contextPath}/resources/img/crud/question.png" height="100px;">
                                                  </div>
                                                  <div class="text-center"><strong>문의</strong></div>
                                              </td>
                                              <td>
                                                  <div class="text-center">
                                                      <img src="${pageContext.request.contextPath}/resources/img/crud/good.png" height="100px;">
                                                  </div>
                                                  <div class="text-center"><strong>칭찬</strong></div>
                                              </td>
                                              <td>
                                                  <div class="text-center">
                                                      <img src="${pageContext.request.contextPath}/resources/img/crud/Document.png" height="100px;">
                                                  </div>
                                                  <div class="text-center"><strong>VOC 정독</strong></div>
                                              </td>
                                              <td>
                                                  <div class="text-center">
                                                      <img src="${pageContext.request.contextPath}/resources/img/crud/callcenter.png" height="100px;">
                                                  </div>
                                                  <div class="text-center"><strong>VOC 접속</strong></div>
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
                <div class="col-lg-6">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox">
                                <div class="ibox-title">
                                    <h5><i class="fa fa-certificate"></i> 담당자별 상담 집계</h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </div>
                                </div>
                                <div class="ibox-content">
                                    <div class="table-responsive">
                                        <table style="white-space:nowrap;">
                                            <colgroup>
                                                <col width="10%">
                                                <col width="40%">
                                                <col width="10%">
                                                <col width="40%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th>기간</th>
                                                <td>2018/12/10 - 2019/3/20</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div id="morris-bar-chart" style="height:150px;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="ibox">
                                <div class="ibox-title">
                                    <h5><i class="fa fa-certificate"></i> 고객접점현황 / 필수 VOC</h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </div>
                                </div>
                                <div class="ibox-content">
                                    <div id="morris-bar-chart2" style="height:150px;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="ibox">
                                <div class="ibox-title">
                                    <h5><i class="fa fa-certificate"></i> 필수 VOC 전달사항 정독률</h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </div>
                                </div>
                                <div class="ibox-content">
                                    <div id="morris-bar-chart3" style="height:150px;"></div>
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
</div>

<!--js includ-->
<%@ include file="/WEB-INF/views/template/inc/jsinc.jsp"%>	
<!-- Morris -->
<script src="${pageContext.request.contextPath}/resources/js/plugins/morris/raphael-2.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/morris/morris.js"></script>
<script>


var result = ${serviceCodeReportJson};
    Morris.Donut({
        element: 'morris-donut-chart',
        /*
        data: [{ label: "AS문의", value: 35 },
            { label: "불만", value: 10 },
            { label: "칭찬", value: 5 },
            { label: "일반문의", value: 50 }],
		*/
		
		data:result,
        resize: true,
        colors: ['#87d6c6', '#54cdb4','#1ab394','#1ab394'],
    }).on('click', function (i, row) {  
        // Do your actions
       // Example:
    	   debugger;
       alert(i);
    
    });

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{ y: '2006', a: 60, b: 50 },
            { y: '2007', a: 75, b: 65 },
            { y: '2008', a: 50, b: 40 },
            { y: '2009', a: 75, b: 65 },
            { y: '2010', a: 50, b: 40 },
            { y: '2011', a: 75, b: 65 },
            { y: '2012', a: 100, b: 90 } ],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        hideHover: 'auto',
        resize: true,
        barColors: ['#1ab394', '#cacaca'],
    });

    Morris.Bar({
        element: 'morris-bar-chart2',
        data: [{ y: '2006', a: 60, b: 50 },
            { y: '2007', a: 75, b: 65 },
            { y: '2008', a: 50, b: 40 },
            { y: '2009', a: 75, b: 65 },
            { y: '2010', a: 50, b: 40 },
            { y: '2011', a: 75, b: 65 },
            { y: '2012', a: 100, b: 90 } ],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        hideHover: 'auto',
        resize: true,
        barColors: ['#1ab394', '#cacaca'],
    });

    Morris.Bar({
        element: 'morris-bar-chart3',
        data: [{ y: '2006', a: 60, b: 50 },
            { y: '2007', a: 75, b: 65 },
            { y: '2008', a: 50, b: 40 },
            { y: '2009', a: 75, b: 65 },
            { y: '2010', a: 50, b: 40 },
            { y: '2011', a: 75, b: 65 },
            { y: '2012', a: 100, b: 90 } ],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        hideHover: 'auto',
        resize: true,
        barColors: ['#1ab394', '#cacaca'],
    });

</script>

</body>
</html>