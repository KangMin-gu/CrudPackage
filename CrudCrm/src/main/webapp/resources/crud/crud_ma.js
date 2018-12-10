
function btnFirst(){
	$(".body input").attr("readonly",true);
	$('select').attr('disabled','disabled');
	$('#create').show();
	$('#delete').hide();
	$('#update').hide();
	$('#save').hide();
	$('#cancel').hide();
	$('#reset').hide();
}
function btnRead(){
	$(".body input").attr("readonly",true);
	$('select').attr('disabled','disabled');
	$('#create').show();
	$('#delete').show();
	$('#update').show();
	$('#save').hide();
	$('#cancel').hide();
	$('#reset').hide();
}
function btnCreate(){
	$(".body input").attr("readonly",false);
	$('.body select').attr("readonly",false);
	$('select').removeAttr('disabled'); 
	$('#create').hide();
	$('#delete').hide();
	$('#update').hide();
	$('#save').show();
	$('#cancel').show();
	$('#reset').show();
}

function bodyReset(){
	$('.body input').val('');
}

if(window.location.pathname == '/ma/license') {
    var QueryString = window.location.pathname;
    btnFirst();
    
    $('#cancel').click(function (e) {
        var id = $('.selected').attr('value');
        $.ajax({
            url: QueryString+"/"+id,
            method: "GET",
            dataType: "json",
            success: function (data) {

                $('.body input[id="licensename"]').val(data.LICENSENAME);
                $('.body input[id="licensecost"]').val(data.LICENSECOST);
                btnRead();
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    });
    $('#reset').click(function (e) {
    	bodyReset();
    });
    $('#delete').click(function(e){
        var id = $('.selected').attr('value');
        var param = {"id":id};
        $.ajax({
            url: QueryString+"/"+id,
            method: "POST",
            dataType: "json",
            data:param,
            success: function () {
                alert("삭제되었습니다.");
                btnFirst();
                location.reload();
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });

    });
    $('#create').click(function(e){
    	bodyReset();
    	btnCreate();

    });
    $('#update').click(function(e){
    	
    	btnCreate();
    });
    $('#save').click(function(e){
    	var no = $('#no').val();
    	if(no == '' || no == undefined){
    		url= QueryString+"/post";	
    	}else{
    		url= QueryString+"/post/"+no;
    	}
        var licensename= $(".body #licensename").val();
        var licensecost = $(".body #licensecost").val();
        var isdelete = $(".body #isdelete").val(); 
        var param = {"licensename":licensename,"licensecost":licensecost,"isdelete":isdelete};
        
        
        $.ajax({
        	
            url: url,
            method: "POST",
            dataType: "json",
            data:param,
            success: function () {
            	btnRead();
                alert("저장되었습니다.");
                location.reload();
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });

    });
    $('.head tbody tr').click(function (e) {
        $('.head tbody tr').removeClass('selected');
        $(this).addClass('selected');
        
        var id = $('.selected').attr('value');
        $('#no').val(id);
        btnRead();
        $.ajax({
            url: QueryString+"/"+id,
            method: "GET",
            dataType: "json",
            success: function (data) {

                $('.body #licensename').val(data.LICENSENAME);
                $('.body #licensecost').val(data.LICENSECOST);

            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    });
}

if(window.location.pathname == '/ma/menu') {
    var QueryString = window.location.pathname;
    btnFirst();
    
    $('#cancel').click(function (e) {
        var id = $('.selected').attr('value');
        $.ajax({
            url: QueryString+"/"+id,
            method: "GET",
            dataType: "json",
            success: function (data) {

                $('.body #namename').val(data.MENUNAME);
                $('.body #nameval').val(data.NAMEVAL);
                $('.body #licensename').val(data.LICENSENAME_);
                $('.body #isdelete').val(data.ISDELETE);
                $('.body #menudesc').val(data.MENUDESC);
                btnRead();
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    });
    $('#reset').click(function (e) {
    	bodyReset();
    });
    $('#delete').click(function(e){
        var id = $('.selected').attr('value');
        var param = {"id":id};
        $.ajax({
            url: QueryString+"/"+id,
            method: "POST",
            dataType: "json",
            data:param,
            success: function () {
                alert("삭제되었습니다.");
                btnFirst();
                location.reload();
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });

    });
    $('#create').click(function(e){
    	bodyReset();
    	btnCreate();

    });
    $('#update').click(function(e){
    	
    	btnCreate();
    });
    $('#save').click(function(e){
    	var no = $('#no').val();
    	if(no == '' || no == undefined){
    		url= QueryString+"/post";	
    	}else{
    		url= QueryString+"/post/"+no;
    	}

        
        var menuname = $(".body #menuname").val();
        var menuval = $(".body #menuval").val();
        var licenseno = $(".body #licenseno").val();
        var isdelete = $(".body #isdelete").val();
        var menudesc = $(".body #menudesc").val();
        var param = {"menuname":menuname,"menuval":menuval,"licenseno":licenseno,"isdelete":isdelete,"menudesc":menudesc};
        
        $.ajax({
        	
            url: url,
            method: "POST",
            dataType: "json",
            data:param,
            success: function () {
            	btnRead();
                alert("저장되었습니다.");
                location.reload();
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });

    });
    $('.head tbody tr').click(function (e) {
        $('.head tbody tr').removeClass('selected');
        $(this).addClass('selected');
        
        var id = $('.selected').attr('value');
        $('#no').val(id);
        
        btnRead();
        $.ajax({
            url: QueryString+"/"+id,
            method: "GET",
            dataType: "json",
            success: function (data) {

                $('.body #menuname').val(data.MENUNAME);
                $('.body #menuval').val(data.MENUVAL);
                $('.body #licenseno').val(data.LICENSENO);
                $('.body #isdelete').val(data.ISDELETE);
                $('.body #menudesc').val(data.MENUDESC);
                

            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    });
}

if(window.location.pathname == '/ad/code') {
    var QueryString = window.location.pathname;
    btnFirst();
    
    $('#cancel').click(function (e) {
        var id = $('.selected').attr('value');
        $.ajax({
            url: QueryString+"/"+id,
            method: "GET",
            dataType: "json",
            success: function (data) {

                $('.body #codegrp').val(data.CODEGRP);
                $('.body #codename').val(data.CODENAME);
                $('.body #codeval').val(data.CODEVAL);
                $('.body #isdelete').val(data.ISDELETE);
                $('.body #uppercodegrp').val(data.UPPERCODEGRP);
                btnRead();
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    });
    $('#reset').click(function (e) {
    	bodyReset();
    });
    $('#delete').click(function(e){
        var id = $('.selected').attr('value');
        var param = {"id":id};
        $.ajax({
            url: QueryString+"/"+id,
            method: "POST",
            dataType: "json",
            data:param,
            success: function () {
                alert("삭제되었습니다.");
                btnFirst();
                location.reload();
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });

    });
    $('#create').click(function(e){
    	bodyReset();
    	btnCreate();

    });
    $('#update').click(function(e){
    	
    	btnCreate();
    });
    $('#save').click(function(e){
    	var no = $('#no').val();
    	if(no == '' || no == undefined){
    		url= QueryString+"/post";	
    	}else{
    		url= QueryString+"/post/"+no;
    	}
        var codegrp= $(".body #codegrp").val();
        var codename = $(".body #codename").val();
        var codeval = $(".body #codeval").val();
        var isdelete = $(".body #isdelete").val();
        var uppercodegrp = $(".body #uppercodegrp").val();
        
        var param = {"codegrp":codegrp,"codename":codename,"codeval":codeval,"isdelete":isdelete,"uppercodegrp":uppercodegrp};
        
        
        $.ajax({
        	
            url: url,
            method: "POST",
            dataType: "json",
            data:param,
            success: function () {
            	btnRead();
                alert("저장되었습니다.");
                location.reload();
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });

    });
    $('.head tbody tr').click(function (e) {
        $('.head tbody tr').removeClass('selected');
        $(this).addClass('selected');
        
        var id = $('.selected').attr('value');
        $('#no').val(id);
        btnRead();
        $.ajax({
            url: QueryString+"/"+id,
            method: "GET",
            dataType: "json",
            success: function (data) {

            	$('.body #codegrp').val(data.CODEGRP);
                $('.body #codename').val(data.CODENAME);
                $('.body #codeval').val(data.CODEVAL);
                $('.body #isdelete').val(data.ISDELETE);
                $('.body #uppercodegrp').val(data.UPPERCODEGRP);
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    });
}
// /ma/mc가 포함되어있는 경로
if(window.location.pathname.lastIndexOf('/ma/company') == 0) {
	
	var id = $('#siteid').val();
	$('.nav-tabs .user').click(function(e){
        $.ajax({
            url: "/user/tab/"+id,
            method: "GET",
            dataType: "json",
            success: function (data) {
            	var length = data.length;
            	$('#tab3 tbody tr').remove();
            	for (var i = 0; i < length; i++) {
            		var html = '<tr><td>' + data[i].USERNAME + '</td><td>' + data[i].USERID + '</td><td>' + data[i].USERDUTY + '</td><td>' + data[i].EMAIL + '</td><td>' + data[i].ISDELETE_ + '</td></tr>';
            		$('#tab3 tbody').append(html);
            	}
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });

	});
	
	$('.nav-tabs .li').click(function(e){
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
	
	
}

