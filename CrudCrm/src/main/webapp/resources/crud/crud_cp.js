// step 강제 클릭 함수
function campStep(hash){	
	$(hash).click();
}

$('#sendtype').change(function(e){
	var data = $('#sendtype').val();
	sendtype(data);
});

function sendtype(data){	
	if(data == '1'){
		$('.direct').hide();
		$('.days').hide();
		$('.term').hide();
	}else if(data =='2'){
		$('.direct').show();
		$('.days').hide();
		$('.term').hide();
		
	}else if(data =='3'){
		$('.direct').hide();
		$('.days').show();
		$('.term').hide();
		
	}else if(data == '4'){
		$('.direct').hide();
		$('.days').hide();
		$('.term').show();
	}else{
		$('.direct').hide();
		$('.days').hide();
		$('.term').hide();
	}
}
// 캠페인 테스트 발송
function testSend(){	
	var id = $('#campno').val();
	var returnmail= $("#returnmail").attr('value');
    var testmail = $("#testmail").attr('value');
    var title = $("#title").attr('value');
    var senddesc = $("#senddesc").attr('value');
    
    var param = {"returnmail":returnmail,"testmail":testmail,"senddesc":senddesc,"title":title};
	
	$.ajax({
        url: "/campaign/test/"+id,
        method: "POST",
        dataType: "json",
        data:param,
        success: function (data) {
        	alert("테스트 발송이 되었습니다.");
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}


$('.contents').click(function(e){
	openNewWindow('서식','/popcontents',e.target.id,650,700);
});

$('.camptarget').click(function(e){
	openNewWindow('추출내용','/poptarget',e.target.id,650,700);
})

// 대상추출에서 click 이벤트
function tabHistory(){
	var id = $('#campno').val();
    $.ajax({
        url: "/tab/targetHistory/"+id,
        method: "GET",
        dataType: "json",
        success: function (data) {
        	$('#tab2 tbody tr').remove();
        	var length = data.length;
        	var html ="";
        	for (var i = 0; i < length; i++) {
        		html = '<tr><td>' + data[i].regdate + '</td><td>' + data[i].history + '</td>';
        		$('#tab2 tbody').append(html);
        	}
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}
function tabTargetCust(pageNum){
	var id = $('#campno').val();
	var custname = $('#custname').val();
    $.ajax({
        url: '/tab/targetCust/'+id+'?pageNum='+pageNum+'&custname='+encodeURI(custname) ,
        method: "GET",
        dataType: "json",
        success: function (data) {
        	$('#tab1 tbody tr').remove();
        	$('#tab1 .pagination li').remove();
        	var length = data.tabCust.length;
        	var html ="";
        	for (var i = 0; i < length; i++) {
        		html = '<tr><td>' + data.tabCust[i].CUSTNAME + '</td><td>' + data.tabCust[i].CUSTID + '</td><td>' + data.tabCust[i].MOBILENO + '</td><td>' + data.tabCust[i].EMAIL + '</td><td>' + data.tabCust[i].INFOAGREE_ + '</td><td>' + data.tabCust[i].CUSTGUBUN_ + '</td><td>' + data.tabCust[i].CUSTGRADE_ + '</td><td>' + data.tabCust[i].ADDR_ + '</td></tr>';
        		$('#tab1 tbody').append(html);
        	}
        	var html2= "";
        	
        	if (data.page.startPageNum != 1) {
                html2 += '<li class="footable-page-arrow disabled"><a onclick="tabTargetCust(' + eval(data.page.startPageNum - 1) + ')" >&laquo;</a></li>'
            } else {
                html2 += '<li class="disabled"><a href="javascript:">&laquo;</a></li>'
            }
            for (var i = data.page.startPageNum; i <= data.page.endPageNum; i++) {
                if (i == data.page.pageNum) {
                    html2 += '<li class="footable-page active"><a onclick="tabTargetCust(' + i + ')">'+i+'</a></li>'
                } else {
                    html2 += '<li><a onclick="tabTargetCust(' + i + ')">'+i+'</a></li>'
                }
            }
            if (data.page.endPageNum < data.page.totalPageCount) {
                html2 += '<li><a onclick="tabTargetCust(' + eval(data.page.endPageNum + 1)+')">&raquo;</a></li>'
            } else {
                html2 += '<li class="disabled"><a href="javascript:">&raquo;</a></li>'
            }
            
            $('#tab1 .pagination').append(html2);
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}	
	// 대상추출에서 추가를 클릭했을때 동작시키는 함수
	function addAddr(Obj){

		var divObj = Obj.parent().parent().parent().parent().parent().parent();
		
		var addrLength = $('.addr').length + 1;
		if(addrLength >=5){
			alert("주소지는 4개까지만 가능합니다.");
			return false;
		}else{
			var html = '<div class="box1 col-lg-12 col-xl-6 p-0 addr"><table class="table table-bordered mb-0"><colgroup><col style="width: 110px; background: #fafafa;"><col style="width: auto;"></colgroup><tbody><tr>'
				html +=   '<th>주소지'+addrLength+'</th>'
				html +=            '<td><select name="addr'+addrLength+'1" id="addr11" class="form-control col-3 float-left mr-2" style="height: 23px;"><option>경기도 부천시</option><option>경기도 부천시</option><option>경기도 부천시</option><option>경기도 부천시</option></select>'
				html +=                '<select name="addr'+addrLength+'2" id="addr12" class="form-control col-3 float-left mr-2" style="height: 23px;"><option>소사구</option><option>소사구</option><option>소사구</option><option>소사구</option></select>'
				html +=                '<select name="addr'+addrLength+'3" id="addr13" class="form-control col-3 float-left mr-2" style="height: 23px;"><option>괴안동</option><option>괴안동</option><option>괴안동</option><option>괴안동</option></select>'
				html +=                '<a onclick="javascript:addAddr($(this))" style="height: 23px; font-size: 13px; padding: 0 0.75rem;">추가</button></td></tr></tbody></table></div>'
		
				divObj.append(html);
		}
}
	
	function parentContents(tr){

		var parentid = $('#parentid').val();

		opener.$("#"+parentid).next().val(tr.getAttribute("value"));
		opener.$("#"+parentid).val(tr.children.title.textContent).trigger('keyup');
		opener.$("#senddesc").text(tr.children.content.textContent).trigger('keyup');
		opener.$('#senddesc').summernote('code', tr.children.content.textContent);
		window.close();
	}
	
	function parentTarget(tr){
		
		var parentid = $('#parentid').val();
		var id = tr.getAttribute("value");
		
		$.ajax({
	        url: "/poptarget/"+id,
	        method: "GET",
	        dataType: "json",
	        success: function (data) {
	        	
	        	var length = data.length;
	        	
	        	for(i = 0; i < length; i++){
	        		opener.$('#'+data[i].NAME).val(data[i].VALUE);
	        	}
	        	
	        	opener.$("#"+parentid).val(tr.children.campname.textContent).trigger('keyup');
	        	window.close();
	        	
	        },
	        error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        }
			
		});
		
		
		
		
		// window 창을 종료 -> 담당자 팝업을 종료함.
		
	}