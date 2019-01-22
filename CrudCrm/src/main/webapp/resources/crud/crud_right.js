$('#save').click(function(e){

	var servicetype = $("#servicetype").val();
	var servicename= $("#servicename").val();
    var servicedesc = $("#servicedesc").val();
    var vocstep = $('.check:checked').val();
    var nextowner = $('#nextowner').val();
    var conveyreason = $('#conveyreason').val();
    var conveydesc = $('#conveydesc').val();
   // var memo = $("#memo").val();
    //var param = {"servicetype":servicetype,"servicename":servicename,"servicedesc":servicedesc,"memo":memo};
    var param = {"servicetype":servicetype,"servicename":servicename,"servicedesc":servicedesc,"vocstep":vocstep,"nextowner":nextowner
    		,"conveyreason":conveyreason,"conveydesc":conveydesc};

    var goodsLength = $('[id*="goodsb"]').length;
    
    for (i=0; i< goodsLength;i++){
    	var test = $('[id*="goodsb"]:eq('+i+')').attr('id');
    	var test2 = $('[id*="goodsm"]:eq('+i+')').attr('id');
    	var test3 = $('[id*="goodss"]:eq('+i+')').attr('id');
    	
    	param[test] = $('[id*="goodsb"]:eq('+i+')').val();
    	param[test2] = $('[id*="goodsm"]:eq('+i+')').val();
    	param[test3] = $('[id*="goodss"]:eq('+i+')').val();
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