	
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
	function relCustSearch(){
		var searchCust = $('#custname').val();
		location.href="/sales/view/${salesDetail.SALESNO}?custname="+searchCust;
	}
	//거래처-관련고객검색
	function cliCustSearch(){
		var custname = $('#custname').val();		
		var urlStr = '/sales/client/view/${cliDetail.CLINO}?custname='+custname
		location.replace(urlStr);
	}
	//거래처- 관련고객 추가 팝업
	$('.cliCustBtn').click(function(e){
		var value = e.target.value;
		var urlStr = '/popclicust/'+value;
		openNewWindow('관련고객',urlStr,e.target.id,600,500);
	});