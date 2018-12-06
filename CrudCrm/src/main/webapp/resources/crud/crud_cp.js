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

// 대상추출에서 click 이벤트
$('.targetcust').click(function(e){
		var id = $('#campno').val();

});
// 대상추출에서 이력 확인 탭
	$('.sql').click(function(e){
        $.ajax({
            url: "/ma/license/tab/"+id,
            method: "GET",
            dataType: "json",
            success: function (data) {
            	$('#tab1 tbody tr').remove();
            	var length = data.length;
            	for (var i = 0; i < length; i++) {
            		var html = '<tr><td>' + data[i].LICENSENAME + '</td><td>' + data[i].LICENSECOST + '</td><td>' + data[i].BUYCNT + '</td><td>' + data[i].LASTDATE + '</td></tr>';
            		$('#tab1 tbody').append(html);
            	}
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });

	});
	
	
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
		// 접수자, 담당자가 겹치는 경우에 발생할 것 같아서 한번에 처리 할수 있게 수정작업함..
		// parentid => 버튼을 눌렀을때의 id 값
		var parentid = $('#parentid').val();
		// opener -> 부모의 window를 의미함.
		// tr.getAttribute("value") -> tr 값에 value를 넣어두었는데 해당 value 값을 가지고옴 => 여기서는 영업담당자의 키값(USERNO)
		// 버튼을 눌렀을때의 id 값의 next값 즉 Owner_ 옆의 Owner 값(DB에 들어갈값)
		opener.$("#"+parentid).next().val(tr.getAttribute("value"));
		// tr.children.userName.textContent -> tr하위에있는 td 값중 userName의 text값을 가지고옴 => 여기서는 영업담당자의 이름을 의미
		// 버튼을 눌렀을때의 id 값을 실제로 넣음. 
		opener.$("#"+parentid).val(tr.children.title.textContent).trigger('keyup');
		opener.$("#senddesc").text(tr.children.content.textContent).trigger('keyup');
		opener.$('#senddesc').summernote('code', tr.children.content.textContent);
		// window 창을 종료 -> 담당자 팝업을 종료함.
		window.close();
	}