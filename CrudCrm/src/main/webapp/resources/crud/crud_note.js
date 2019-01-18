//내부통지 알람
function send_message(){

    var sock = new SockJS("http://125.129.242.156/noteCount");
    sock.onopen = function(evt) {
        console.log("open");
        timerNote();
    };

    sock.onmessage = function(evt) {
        var alarmNum = evt.data;
        console.log(alarmNum);
        if(alarmNum != 0){
            $("#alarm").text(evt.data);
        }else {
            $("#alarm").text("");
        }
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
        var wsSiteid = $("#wsSiteid").val();
        var wsCstid = $("#wsCstid").val();
        var countVal = {userid:	wsCstid,siteid: wsSiteid};
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