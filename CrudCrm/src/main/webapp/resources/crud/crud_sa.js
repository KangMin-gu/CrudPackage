	
	//관련고객추가
	$('.relcustBtn').click(function(e){
		var value = e.target.value;
		var urlStr = '/popsalescust/'+value;
		openNewWindow('관련고객',urlStr,e.target.id,600,500);
	});
	//영업상태추가	
	function saleStateInsert(salesno,salestate){
		var urlStr = '/popsalesstate/'+salesno+'?salestate='+salestate;
		openNewWindow('영업단계',urlStr,'sales',600,500);
	}
	//영업-관련고객 검색
	function salesCustSearch(salesNo){
		var custName=$('#custname').val();
		location.href="/sales/view/"+salesNo+"?custname="+encodeURI(custName);
	}
	//거래처-관련고객검색
	function cliCustSearch(clino){
		var custname = $('#custname').val();		
		var urlStr = '/sales/client/view/'+clino+'?custname='+encodeURI(custname);
		location.replace(urlStr);
	}
	//거래처- 관련고객 추가 팝업
	$('.cliCustBtn').click(function(e){
		var value = e.target.value;
		var urlStr = '/popclicust/'+value;
		openNewWindow('관련고객',urlStr,e.target.id,600,500);
	});
	
	//영업삭제-체크박스
	function goSalesDel(){
		var chkLength = $('input:checkbox[id="salesno"]:checked').length; 
		if(chkLength == 0){
			alert("삭제할 항목이 정해지지 않았습니다.");
		}else if(chkLength > 0){
			$('#commandCheck').submit();	
		}			
	} 
	
	//거래처삭제-체크박스
	function goCliDel(){
		debugger;
		var chkLength = $('input:checkbox[id="clino"]:checked').length; 
		if(chkLength == 0){
			alert("삭제할 항목이 정해지지 않았습니다.");
		}else if(chkLength > 0){
			console.log(chkLength);
			$('#cliCheck').submit();	
		}			
	} 
	
	//영업 상세 2탭 리스트
	function tabTargetState(pageNum){
		debugger;
		var salesNo = $('#salesno').val();
		var state = $('#state').val();
		var urlStr = '/sales/view/tab/state?salesno='+salesNo+'&pageNum='+pageNum+'&state='+state;
	    $.ajax({
	        url: urlStr,
	        method: "GET",
	        dataType: "json",
	        cache: false,
	        success: function (data) {
	        	debugger;
	        	$('#tab2 tbody tr').remove();
	        	$('#tab2 .pagination li').remove();
	        	
	        	var length = data.stateList.length;
	        	var html ="";
	        	for (var i = 0; i < length; i++) {
	        		html = '<tr><td>' + data.stateList[i].ENTDATE + '</td><td>' + data.stateList[i].PRESTATE + '</td><td>' + data.stateList[i].STATE + '</td><td>' + data.stateList[i].MODREASON + '</td><td>' + data.stateList[i].PROB + '</td><td>' + data.stateList[i].USERNAME + '</td></tr>';
	        		$('#tab2 tbody').append(html);
	        	}
	        	var html2= "";
	        	
	        	if (data.page.startPageNum != 1) {
	                html2 += '<li class="footable-page-arrow disabled"><a onclick="tabTargetState(' + eval(data.page.startPageNum - 1) + ')" >&laquo;</a></li>'
	            } else {
	                html2 += '<li class="disabled"><a href="javascript:">&laquo;</a></li>'
	            }
	            for (var i = data.page.startPageNum; i <= data.page.endPageNum; i++) {
	                if (i == data.page.pageNum) {
	                    html2 += '<li class="footable-page active"><a onclick="tabTargetState(' + i + ')">'+i+'</a></li>'
	                } else {
	                    html2 += '<li><a onclick="tabTargetState(' + i + ')">'+i+'</a></li>'
	                }
	            }
	            if (data.page.endPageNum < data.page.totalPageCount) {
	                html2 += '<li><a onclick="tabTargetState(' + eval(data.page.endPageNum + 1)+')">&raquo;</a></li>'
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
	//영업,거래처,고객 - 상세 3탭 리스트 (접촉)
	function tabTargetContect(pageNum){
		debugger;
		var routeName;
		var routeVal;
		var salesNo = $('#salesno').val();
		var cliNo = $('#clino').val();
		var custNo = $('#custno').val();
		if (salesNo != null){
			routeName = "salesno";
			routeVal = salesNo;
		}else if (cliNo != null){
			routeName = "clino";
			routeVal = cliNo;
		}else{
			routeName = "custno";
			routeVal = custNo;
		}
		
		var contcustname = $('#contcustname').val();
		var urlStr = '/sales/view/tab/contect?'+routeName+'='+routeVal+'&pageNum='+pageNum+'&contcustname='+encodeURI(contcustname);
		
		$.ajax({
	        url: urlStr,
	        method: "GET",
	        dataType: "json",
	        cache: false,
	        success: function (data) {
	        	debugger;
	        	$('#tab3 tbody tr').remove();
	        	$('#tab3 .pagination li').remove();
	        	
	        	var length = data.contList.length;
	        	var html ="";
	        	var channelName;
	        	for (var i = 0; i < length; i++) {	
	        		if(data.contList[i].CTTCHANNEL == 1){
	        			channelName = "영업일정";
	        		}else{
	        			channelName = data.contList[i].CTTCHANNEL;
	        		}
	        		html = '<tr><td>' + data.contList[i].CUSTNAME + '</td><td>' + data.contList[i].CTTDATE + '</td><td>' + data.contList[i].USERNAME + '</td><td>' + channelName + '</td><td>' + data.contList[i].MEMO + '</td></tr>';
	        		$('#tab3 tbody').append(html);
	        	}
	        	var html2= "";
	        	
	        	if (data.page.startPageNum != 1) {
	                html2 += '<li class="footable-page-arrow disabled"><a onclick="tabTargetContect(' + eval(data.page.startPageNum - 1) + ')" >&laquo;</a></li>'
	            } else {
	                html2 += '<li class="disabled"><a href="javascript:">&laquo;</a></li>'
	            }
	            for (var i = data.page.startPageNum; i <= data.page.endPageNum; i++) {
	                if (i == data.page.pageNum) {
	                    html2 += '<li class="footable-page active"><a onclick="tabTargetContect(' + i + ')">'+i+'</a></li>'
	                } else {
	                    html2 += '<li><a onclick="tabTargetContect(' + i + ')">'+i+'</a></li>'
	                }
	            }
	            if (data.page.endPageNum < data.page.totalPageCount) {
	                html2 += '<li><a onclick="tabTargetContect(' + eval(data.page.endPageNum + 1)+')">&raquo;</a></li>'
	            } else {
	                html2 += '<li class="disabled"><a href="javascript:">&raquo;</a></li>'
	            }
	            
	            if(length != 0){
	            	$('#tab3 .pagination').append(html2);
	            }
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
	    });
	}
	
	
	//거래처 상세 2탭 영업리스트
	function tabTargetSalesList(pageNum){
		
		var routeName;
		var routeVal;
		var custNo = $('#custno').val();
		var cliNo = $('#clino').val();
		if (custNo != null){
			routeName = "custno";
			routeVal = custNo;
		}else{
			routeName = "clino";
			routeVal = cliNo;
		}
			
		var urlStr = '/sales/client/view/tab/sales?'+routeName+'='+routeVal+'&pageNum='+pageNum+'&salename='+saleName;
		
		$.ajax({
	        url: urlStr,
	        method: "GET",
	        dataType: "json",
	        cache: false,
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
	                html2 += '<li class="footable-page-arrow disabled"><a onclick="tabTargetContect(' + eval(data.page.startPageNum - 1) + ')" >&laquo;</a></li>'
	            } else {
	                html2 += '<li class="disabled"><a href="javascript:">&laquo;</a></li>'
	            }
	            for (var i = data.page.startPageNum; i <= data.page.endPageNum; i++) {
	                if (i == data.page.pageNum) {
	                    html2 += '<li class="footable-page active"><a onclick="tabTargetContect(' + i + ')">'+i+'</a></li>'
	                } else {
	                    html2 += '<li><a onclick="tabTargetContect(' + i + ')">'+i+'</a></li>'
	                }
	            }
	            if (data.page.endPageNum < data.page.totalPageCount) {
	                html2 += '<li><a onclick="tabTargetContect(' + eval(data.page.endPageNum + 1)+')">&raquo;</a></li>'
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