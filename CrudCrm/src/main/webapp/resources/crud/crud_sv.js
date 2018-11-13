$('.ownerModal').click(function(e){
	var _Obj = e.target.id;
    // 처음에 생길때 ownerShow함수 호출 기본값이 1이기 때문에 강제로 1 호출
	$("#ownerModal").modal();
	ownerModal(1,_Obj);
	
});

function owner(tr,id){
	
	var value = tr.cells[0].textContent;
	var text = tr.cells[1].textContent;
	$('#'+id).val(text);
	$('#'+id).next().val(value);
	
	$("#ownerModal").modal('hide');
    $('.modal-backdrop').remove();

};
function ownerModal(pageNum,target){
	var id  = "'"+ target + "'";
	$.ajax({
    	url: "/modal/user?pageNum=" + pageNum,
    	method: "GET",
    	dataType: "json",
    	success: function (data) {
        //기존에 있는 tr 값들 삭제
        	$('#ownerModal tbody tr').remove();
        // 페이지를 중복으로 호출하는 경우가 발생하여서 처음 시작할때 remove한 후에 시작
        	$('#ownerModal .pagination li').remove();
        	var page = '';
        // html -> 데이터 바인딩해서 tr 부분 만들어줌
        	html = '';
        	for (var i = 0; i < data.length; i++) {
            	var paging = data[i].page;
            	if(paging != undefined){
                	page = data[i].page;
            	}else {
                	html += '<tr onclick="javascript:owner(this,' + id + ')"><td hidden>' + data[i].USERNO + '</td><td>' + data[i].USERNAME + '</td><td>' +data[i].USERID + '</td><td>' + data[i].USERDUTY + '</td><td>' + data[i].MOBILE + '</td><td>' + data[i].EMAIL + '</td></tr>';
            	}
        	}
        	$('#ownerModal').find('tbody').append(html);

            // html2 -> 모달 팝업의 페이징 처리 부분
        	html2 = '';
        	if (page.startPageNum != 1) {
            	html2 += '<li class="page-item"><a class="page-link" onclick="ownerModal(' + eval(page.startPageNum - 1) + ','+ id +')"><<</a></li>'
        	} else {
            	html2 += '<li class="disabled"><a class="page-link" href="javascript:"><<</a></li>'
        	}
        	for (var i = page.startPageNum; i <= page.endPageNum; i++) {
            	if (i == page.pageNum) {
                	html2 += '<li class="page-item"><a class="page-link" onclick="ownerModal(' + i + ','+ id +')">' + i + '</a></li>'
            	} else {
                	html2 += '<li class="page-item"><a class="page-link" onclick="ownerModal(' + i + ','+ id +')">' + i + '</a></li>'
            	}
        	}
        	if (page.endPageNum < page.totalPageCount) {
            	html2 += '<li class="page-item"><a class="page-link" onclick="ownerModal(' + eval(page.endPageNum + 1) + ','+ id +')">>></a></li>'
        	} else {
        		html2 += '<li class="disabled"><a class="page-link" href="javascript:">>></a></li>'
        	}
            	$('#ownerModal .pagination').append(html2);
            
    	},
    	error: function (request, status, error) {
        	alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
    	}
	});
}




$(".tabRact").click(function(e){
	debugger;
	var id = $('#rcvno').val();
    $.ajax({
        url: "/tab/ract/"+id,
        method: "GET",
        dataType: "json",
        success: function (data) {
        	$('#tab1 tbody tr').remove();
        	var length = data.length;
        	for (var i = 0; i < length; i++) {
        		var html = '<tr><td>' + data[i].RACTDATE_ + '</td><td>' + data[i].RACTTIME + '</td><td>' + data[i].RACTCODE_ + '</td><td>' + data[i].RACTOWNER_ + '</td><td>' + data[i].RACTDESC + '</td></tr>';
        		$('#tab1 tbody').append(html);
        	}
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
});
$(".tabConvey").click(function(e){
	debugger;
	var id = $('#rcvno').val();
    $.ajax({
        url: "/tab/convey/"+id,
        method: "GET",
        dataType: "json",
        success: function (data) {
        	$('#tab2 tbody tr').remove();
        	var length = data.length;
        	for (var i = 0; i < length; i++) {
        		var html = '<tr><td>' + data[i].CONVEYDATE + '</td><td>' + data[i].CONVEYREASON + '</td><td>' + data[i].PREVOWNER_ + '</td><td>' + data[i].NEXTOWNER_ + '</td><td>' + data[i].CONVEYDESC + '</td></tr>';
        		$('#tab2 tbody').append(html);
        	}
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
});