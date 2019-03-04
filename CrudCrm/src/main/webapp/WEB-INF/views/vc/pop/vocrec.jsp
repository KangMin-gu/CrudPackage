<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>녹취</title>

</head>
<body>

<div id="audio" class="line_audio"></div>	
<input type="hidden" name="checkTryCount" id="checkTryCount" value="0">
<input type="hidden" name="checkDownTryCount" id="checkDownTryCount" value="0">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.min.js"></script>

<script>
var strCtiBrowser = "";
var urlStr = "http://203.239.159.133:8090";

$(document).ready(function() {
	var nucIdx = opener.$('#nucIdx').val();
	audio();
	fn_nuc_url_conv_check(nucIdx);
});

//오디오플레이어 활성화
function audio(){
	strCtiBrowser = navigator.userAgent;
	var player = "";	
	
	if(strCtiBrowser.indexOf("MSIE") > 0 || strCtiBrowser.indexOf("Trident") > 0) {
		player += "<object id='Player' classid='clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95' codebase='http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,5,71' ";
		player += "width='100%' height='70' standby='Loading Microsoft Windows Media Player components...' type='application/x-oleobject'>";
		player+="<param name='AutoStart' value='true'>"
		player+="<param name='TransparentAtStart' value='True'>";
		player+="<param name='ShowControls' value='1'>";
		player+="<param name='ShowDisplay' value='0'>";
		player+="<param name='ShowStatusBar' value='1'>";
		player+="<param name='AutoSize' value='1'>";
		player+="<param name='AnimationAtStart' value='false'>";
		player+="<param name='hidden' value='true'>";
		player+="<param name='FileName' value=''>";
		player+="</object>";
		document.getElementById("audio").innerHTML = player;
	} else if(strCtiBrowser.indexOf("Chrome") > 0){//크롬
		player+="<audio id='Player' controls='controls' controlsList='nodownload' class='audio_con' preload='metadata'>";
		player+="<source src='' type='audio/wav'/></audio>";
		document.getElementById("audio").innerHTML = player; 
	} else {
		player+="<audio id='Player' controls='controls' controlsList='nodownload' class='audio_con' preload='metadata'>";
		player+="<source src='' type='audio/wav'/></audio>";		
		document.getElementById("audio").innerHTML = player;
	}
}

function fn_nuc_url_conv_check(nucIdx){
	debugger;
	var nucStatus = "N";
	var nucFile = "";
	var checkHomeUrl = urlStr+"/wav/urldown/";
	
	$.ajax({
		type : "POST",
		url : urlStr+"/ncrUrlConvStatus.do",    	
		data : {
			"nuc_idx" : nucIdx
		},
		dataType : "json",
		success : function(req) {
			nucStatus = req.nucStatus;
			nucFile = req.nucFile;
			//녹취변환성공시
			if(nucStatus == "Y"){
				debugger;
				$("#checkTryCount").val("0");
				$("#nucFile").val(nucFile);

			    if(strCtiBrowser.indexOf("MSIE") > 0 || strCtiBrowser.indexOf("Trident") > 0) {
			    	document.getElementById("Player").FileName = checkHomeUrl + nucFile;
			    } else if(strCtiBrowser.indexOf("Chrome") > 0) {
			    	$("#Player").attr("src", checkHomeUrl + nucFile);
				    document.getElementById("Player").play(); 
			    }		

			    var prm = document.getElementsByTagName("param");
			    var value = "";
			    for(var i = 0; i<prm.length;i++){
			        if(prm[i].getAttribute("name") == "FileName"){
			            value = prm[i].getAttribute("value");
			            //prm[i].setAttribute('value',"C:\\recfile_temp\\" + recfilename);
			            prm[i].setAttribute('value',checkHomeUrl + nucFile);
			        }
			    }				    
			}else{
				if( $("#checkTryCount").val() < 60){
					setTimeout("(fn_nuc_url_conv_check("+nucIdx+"))", 1000);
					$("#checkTryCount").val( parseInt($("#checkTryCount").val()) +1  ); 
				}else{
					$("#checkTryCount").val("0");
					alert("오류");
				}				
			}
		},		
		error : function(result, status, err) {
			alert(result + " / " + status + " / " + err);
		},
		beforeSend: function() {
		    
		},
		complete: function(){
		}
	});  				
}



</script>
</body>
</html>