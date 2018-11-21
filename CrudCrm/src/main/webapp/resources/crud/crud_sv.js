$(".tabRact").click(function(e){
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
$('#clino_').change(function(){
	
	var id = $('#clino').val();
	/*
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
    */
});



