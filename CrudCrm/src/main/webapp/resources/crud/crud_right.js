$('#save').click(function(e){

	
	
	var servicetype = $('.servicetype .checked input').val();
	var servicename= $("#servicename").val();
    var servicedesc = $("#servicedesc").val();
    var vocstep = $('.check:checked').val();
    var nextowner = $('#nextowner').val();
    var conveyreason = $('#conveyreason').val();
    var conveydesc = $('#conveydesc').val();
    var reservphone = $('#reservphone').val();
    var reservdate = $('#reservdate').val();
    var reservtimeto = $('#reservtimeto').val();
    var reservtimefrom = $('#reservtimefrom').val();
    var nextadminowner = $('#nextadminowner').val();
    var servicecode1 = $('#servicecode1').val();
    var servicecode2 = $('#servicecode2').val();
    var memo = $('#memo').val();
    var custno = $('#custno').val();
    var asowner = $('#asowner').val();
    var visitdate = $('#visitdate').val();
    var visittime = $('#visittime').val();
    debugger;
    var visitaddr1 = $('#visitaddr1').val();
    var visitaddr2 = $('#visitaddr2').val();
    var visitaddr3 = $('#visitaddr3').val();
    
    
    var param = {"custno":custno,"servicetype":servicetype,"servicename":servicename,"servicedesc":servicedesc,"vocstep":vocstep,"nextowner":nextowner
    		,"conveyreason":conveyreason,"conveydesc":conveydesc,"reservphone":reservphone,"reservdate":reservdate,"reservtimeto":reservtimeto,"reservtimefrom":reservtimefrom
    		,"nextadminowner":nextadminowner,"memo":memo,"servicecode1":servicecode1,"servicecode2":servicecode2,"asowner":asowner
    		,"visitdate":visitdate,"visittime":visittime,"visitaddr1":visitaddr1,"visitaddr2":visitaddr2,"visitaddr3":visitaddr3};

    var goodsLength = $('.plus').length;
    
    for (i=1; i <= goodsLength;i++){
    	var goods = $('[id*="goods'+i+'1"]').attr('id');
    	var goods2 = $('[id*="goods'+i+'2"]').attr('id');
    	var goods3 = $('[id*="goods'+i+'3"]').attr('id');
    	
    	param[goods] = $('[id*="goods'+i+'1"]').val();
    	param[goods2] = $('[id*="goods'+i+'2"]').val();
    	param[goods3] = $('[id*="goods'+i+'3"]').val();
    }
    
    /*
    var d = [];
    $(".voc").each(function() {
        d.push({ id: this.id, value: this.value });
    });
    d.push({"vocstep":vocstep});
    */
    $.ajax({
        url: "/vc/voc/post",
        method: "POST",
        dataType: "json",
        data:param,
        cache: false,
        success: function (data) {
            if(data != 0){
            	alert("저장되었습니다.");
            	// 데이터 전부 초기화
            	$('.form-control').val('').keyup();
            }
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
	
});

$('.i-checks').on('ifChecked', function(event){
	var value = event.target.value;
	var name = event.target.name;
	if(name =='vocstep'){
		if(value == 5 ){
			$('.convey').show();
			$('.adminconvey').hide();
			$('.reservation').hide();
		}else if(value== 6){
			$('.convey').hide();
			$('.adminconvey').show();
			$('.reservation').hide();
		}else if (value == 4){
			$('.convey').hide();
			$('.adminconvey').hide();
			$('.reservation').show();
		}else{
			$('.convey').hide();
			$('.adminconvey').hide();
			$('.reservation').hide();
		}
	}else if(name=="servicetype"){
		if(value == 1){
			$('.result').show();
			$('.as').hide();
		}else if(value == 2){
			$('.convey').hide();
			$('.adminconvey').hide();
			$('.reservation').hide();
			$('.result').hide();
			$('.as').show();
		}
	}else if(name=="addrsame"){
		$('#visitaddr1').val($('#homaddr1').val());
		$('#visitaddr2').val($('#homaddr2').val());
		$('#visitaddr3').val($('#homaddr3').val());
	}
});


