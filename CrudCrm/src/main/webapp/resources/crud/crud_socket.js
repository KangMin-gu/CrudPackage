//내부통지 알람
function send_message(){

    var sock = new SockJS("http://211.233.81.190/noteCount");
    sock.onopen = function(evt) {
        timerNote();
    };

    sock.onmessage = function(evt) {
        var alarmNum = evt.data;   
        console.log('실행'+evt.data);
        if(alarmNum != 0){        	
            $("#alarm").text(evt.data);
            $('#dropClick span').show();
        }else {
        	$('#dropClick span').hide();
        }
    };

    sock.onclose = function(evt) {
        sock.close;
    };

    sock.onerror = function(evt) {
        sock.close
    };

    function timerNote(){
        var wsSiteid = $("#hiddenSiteId").val();
        var wsUserNo = $("#hiddenUserNo").val();
        var countVal = {userNo:	wsUserNo,siteId: wsSiteid};        
        sock.send(JSON.stringify(countVal));
    }
    
    //내부통지 알림 1분마다 실행
    setInterval(function(){
        timerNote();        
    }, 10000);
}
    //내부통지 알람 MG
    $(document).ready(function(){
        send_message();
});