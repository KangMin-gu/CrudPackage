//내부통지 알람
function send_message(){

    var sock = new SockJS("http://localhost/noteCount");
    sock.onopen = function(evt) {
        console.log("open");
        timerNote();
    };

    sock.onmessage = function(evt) {
        var alarmNum = evt.data;
        console.log("alarmNum"+evt.data	);
     /*   if(alarmNum != 0){
            $("#alarm").text(evt.data);
        }else {
            $("#alarm").text("");
        }*/
    };

    sock.onclose = function(evt) {
        console.log("close");
        sock.close;
    };

    sock.onerror = function(evt) {
        console.log("error");
        sock.close
    };

    function timerNote(){
        var wsSiteid = $("#hiddenSiteId").val();
        var wsUserNo = $("#hiddenUserNo").val();
        var countVal = {userNo:	wsUserNo,siteId: wsSiteid};
        console.log(JSON.stringify(countVal));
        sock.send(JSON.stringify(countVal));
    }
    
    //내부통지 알림 1분마다 실행
    setInterval(function(){
        timerNote();
        console.log("siteid" + $("#hiddenSiteId").val());
    }, 10000);
}
    //내부통지 알람 MG
    $(document).ready(function(){
        send_message();
});