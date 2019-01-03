		//거래처 상세 2탭 영업리스트
    	function tabTargetCustSalesList(pageNum){
    		debugger;
    		var routeName;
    		var routeVal;
    		var custNo = $('#custno').val();
    		var saleName = $('#salename').val();
    		if (custNo != null){
    			routeName = "custno";
    			routeVal = custNo;
    		}
    			
    		var urlStr = '/cust/view/tab/sales?'+routeName+'='+routeVal+'&pageNum='+pageNum+'&salename='+saleName;
    		
    		$.ajax({
    	        url: urlStr,
    	        method: "GET",
    	        dataType: "json",
    	        success: function (data) {
    	        	debugger;
    	        	$('#tab2 tbody tr').remove();
    	        	$('#tab2 .pagination li').remove();
    	        	var length = data.salesList.length;
    	        	var html ="";
    	        	for (var i = 0; i < length; i++) {
    	        		html = '<tr><td>' + data.salesList[i].SALENAME + '</td><td>' + data.salesList[i].FORDDATE + '</td><td>' + data.salesList[i].USERNAME + '</td><td>' + data.salesList[i].SALESTATE + '</td><td>' + data.salesList[i].STATEDATE + '</td></tr>';
    	        		$('#tab2 tbody').append(html);
    	        	}
    	        	var html2= "";
    	        	
    	        	if (data.page.startPageNum != 1) {
    	                html2 += '<li class="footable-page-arrow disabled"><a onclick="tabTargetCustSalesList(' + eval(data.page.startPageNum - 1) + ')" >&laquo;</a></li>'
    	            } else {
    	                html2 += '<li class="disabled"><a href="javascript:">&laquo;</a></li>'
    	            }
    	            for (var i = data.page.startPageNum; i <= data.page.endPageNum; i++) {
    	                if (i == data.page.pageNum) {
    	                    html2 += '<li class="footable-page active"><a onclick="tabTargetCustSalesList(' + i + ')">'+i+'</a></li>'
    	                } else {
    	                    html2 += '<li><a onclick="tabTargetCustSalesList(' + i + ')">'+i+'</a></li>'
    	                }
    	            }
    	            if (data.page.endPageNum < data.page.totalPageCount) {
    	                html2 += '<li><a onclick="tabTargetCustSalesList(' + eval(data.page.endPageNum + 1)+')">&raquo;</a></li>'
    	            } else {
    	                html2 += '<li class="disabled"><a href="javascript:">&raquo;</a></li>'
    	            }
    	            
    	            if(length != 0){
    	            	$('#tab2 .pagination').append(html2);
    	            }
    	        },
    	        error: function (request, status, error) {
    	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    	        }
    	    });
    	}
      	
      	
    	//거래처 상세 2탭 - 캠페인리스트
    	function tabTargetCustCampList(pageNum){
    		debugger;
    		var custNo = $('#custno').val();
      		var campName = $('#campname').val();	
    		var urlStr = '/cust/view/tab/camp?custno='+custNo+'&pageNum='+pageNum+'&campname='+encodeURI(campName);
    		
    		$.ajax({
    	        url: urlStr,
    	        method: "GET",
    	        dataType: "json",
    	        success: function (data) {
    	        	debugger;
    	        	$('#tab4 tbody tr').remove();
    	        	$('#tab4 .pagination li').remove();
    	        	var length = data.campList.length;
    	        	var html ="";
    	        	for (var i = 0; i < length; i++) {
    	        		html = '<tr><td>' + data.campList[i].CAMPNAME + '</td><td>' + data.campList[i].STARTDATE + '</td><td>' + data.campList[i].ENDDATE + '</td><td>' + data.campList[i].CAMPTYPE + '</td><td>' + data.campList[i].USERNAME + '</td></tr>';
    	        		$('#tab4 tbody').append(html);
    	        	}
    	        	var html2= "";
    	        	
    	        	if (data.page.startPageNum != 1) {
    	                html2 += '<li class="footable-page-arrow disabled"><a onclick="tabTargetCustCampList(' + eval(data.page.startPageNum - 1) + ')" >&laquo;</a></li>'
    	            } else {
    	                html2 += '<li class="disabled"><a href="javascript:">&laquo;</a></li>'
    	            }
    	            for (var i = data.page.startPageNum; i <= data.page.endPageNum; i++) {
    	                if (i == data.page.pageNum) {
    	                    html2 += '<li class="footable-page active"><a onclick="tabTargetCustCampList(' + i + ')">'+i+'</a></li>'
    	                } else {
    	                    html2 += '<li><a onclick="tabTargetCustCampList(' + i + ')">'+i+'</a></li>'
    	                }
    	            }
    	            if (data.page.endPageNum < data.page.totalPageCount) {
    	                html2 += '<li><a onclick="tabTargetCustCampList(' + eval(data.page.endPageNum + 1)+')">&raquo;</a></li>'
    	            } else {
    	                html2 += '<li class="disabled"><a href="javascript:">&raquo;</a></li>'
    	            }
    	            
    	            if(length != 0){
    	            	$('#tab4 .pagination').append(html2);
    	            }
    	        },
    	        error: function (request, status, error) {
    	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    	        }
    	    });
    	}
    	
    	 //고객-엑셀다운
	    $("#excelBtn").on("click", function () {
	    	debugger;
	    	var $exModal = $("#exModal");
			var url = $('#excelUrl').val();
	    	
	        $exModal.dialog({ modal: true });
	      	$('.ui-front').removeAttr('style');
	      	
	        $.fileDownload(url, {
	            successCallback: function (url) {
	            	$exModal.dialog('close');
	            	$('#modalCloseBtn').trigger('click');  
	            },
	            failCallback: function (responseHtml, url) {
	            	$exModal.dialog('close');
	            	$('#modalCloseBtn').trigger('click');
	            }
	        });
	    });	 