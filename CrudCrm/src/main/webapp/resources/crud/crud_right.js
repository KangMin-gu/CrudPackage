$('#save').click(function(e){

	var servicetype = $("#servicetype").val();
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
    var custno = $('#custno').val();
    
    var param = {"custno":custno,"servicetype":servicetype,"servicename":servicename,"servicedesc":servicedesc,"vocstep":vocstep,"nextowner":nextowner
    		,"conveyreason":conveyreason,"conveydesc":conveydesc,"reservphone":reservphone,"reservdate":reservdate,"reservtimeto":reservtimeto,"reservtimefrom":reservtimefrom};

    var goodsLength = $('.plus').length;
    
    for (i=1; i <= goodsLength;i++){
    	var test = $('[id*="goods'+i+'1"]').attr('id');
    	var test2 = $('[id*="goods'+i+'2"]').attr('id');
    	var test3 = $('[id*="goods'+i+'3"]').attr('id');
    	
    	param[test] = $('[id*="goods'+i+'1"]').val();
    	param[test2] = $('[id*="goods'+i+'2"]').val();
    	param[test3] = $('[id*="goods'+i+'3"]').val();
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

function upperCode(codeGrp){
	 var code = $('#'+codeGrp).val();
	 var id = $('#'+codeGrp).attr('id');
	 var url = "/code/upper"
	 $.ajax({
 		url: url+"?codegrp="+id+"&codeval="+code,
 		method: "GET",
 		dataType: "json",
 		cache: false,
 		success: function (data) {
 			var text = "";
 			$('[upper="'+codeGrp+'"] option').remove();
 			$('[upper="'+codeGrp+'"]').append('<option label="선택" value="0"/>');
 			for(i=0;i<data.length;i++){
 				text = '<option label="'+data[i].codename+'" value="'+data[i].codeval+'"/>';
 				$('[upper="'+codeGrp+'"]').append(text);
 			}
 		},
 		error: function (request, status, error) {
 			alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
 		}
 	});
	
	
	
}


