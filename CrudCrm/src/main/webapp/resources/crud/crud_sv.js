// 서비스 처리 이력 탭
$(".tabRact").click(function(e){
	var id = $('#serviceno').val();
    $.ajax({
        url: "/tab/ract/"+id,
        method: "GET",
        dataType: "json",
        success: function (data) {
        	$('#tab1 tbody tr').remove();
        	var length = data.length;
        	for (var i = 0; i < length; i++) {
        		var html = '<tr><td>' + data[i].RACTDATE_ + '</td><td>' + data[i].RACTTIME + '</td><td>' + data[i].RACTCODE_ + '</td><td>' + data[i].RACTDESC + '</td></tr>';
        		$('#tab1 tbody').append(html);
        	}
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
});
//서비스 이관 이력 탭
$(".tabConvey").click(function(e){
	var id = $('#serviceno').val();
    $.ajax({
        url: "/tab/convey/"+id,
        method: "GET",
        dataType: "json",
        success: function (data) {
        	$('#tab2 tbody tr').remove();
        	var length = data.length;
        	var html = '';
        	for (var i = 0; i < length; i++) {
        		 html = '<tr><td>' + data[i].CONVEYDATE + '</td><td>' + data[i].CONVEYREASON + '</td><td>' + data[i].PREVOWNER_ + '</td><td>' + data[i].NEXTOWNER_ + '</td><td>' + data[i].CONVEYDESC + '</td></tr>';
        		$('#tab2 tbody').append(html);
        	}
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
});

// 이관 팝업
$('.servicenext').click(function(e){
	var name = '담당자이관'
	var id = $('#serviceno').val();
	var url = '/convey/'+id;
	var x = '1232';
	var y = '370';
	
	openNewWindow(name,url,e,x,y);
	
});
// 이관 팝업에서 저장버튼 눌렀을때 동작
$('#svSave').click(function(e){
	debugger;
	var	url= "/convey";	
	var serviceno = $('#serviceno').val();
    var conveydate= $("#conveydate").val();
    var conveyreason = $("#conveyreason").val();
    var nextowner = $("#nextowner").val();
    var conveydesc = $('#conveydesc').val();
    var param = {"serviceno":serviceno,"conveydate":conveydate,"conveyreason":conveyreason,"nextowner":nextowner,"conveydesc":conveydesc};
    
    $.ajax({
        url: url,
        method: "POST",
        dataType: "json",
        data:param,
        success: function () {
            alert("저장되었습니다.");
            window.opener.location.reload();
            window.close();
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });

});




