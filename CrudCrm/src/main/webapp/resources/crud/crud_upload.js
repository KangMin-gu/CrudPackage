/*********확장자 체크***********/

/*
 * 
 * Ajax 파일업로드 확장자체크 파일서치키만 DB 전달.
 * 
 * 
 */

//파일서치키 생성
	jQuery.extend({
		fileSearchKey : function(){
			var Now = new Date();
			var yyyy = Now.getFullYear().toString(); 
			var MM = (Now.getMonth()+1).toString(); 
			var dd = Now.getDate().toString(); 
			var HH = Now.getHours().toString(); 
			var mm = Now.getMinutes().toString(); 
			var ss = Now.getSeconds().toString(); 
			var SSS = Now.getMilliseconds().toString();
			
			var fileSearchKey = yyyy+MM+dd+HH+mm+ss+SSS;
			
			return fileSearchKey;
		}
	});
//로고이미지체크

//내부통지 파일업로드

//파일업로드 ajax 실행
    function fileSubmit() {
        var formData = new FormData($("#fileForm")[0]);
        $.ajax({
            type : 'post',
            url : 'fileUpload',
            data : formData,
            processData : false,
            contentType : false,
            success : function(html) {
                alert("파일 업로드하였습니다.");
            },
            error : function(error) {
                alert("파일 업로드에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
    }