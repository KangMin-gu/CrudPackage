	 $('.custom-file-input').on('change', function() {
		   let fileName = $(this).val().split('\\').pop();
		   $(this).next('.custom-file-label').addClass("selected").html(fileName);
		}); 

	 $('.save').click(function(e){		
		check_required(e);
	});
	
    $('.resets').click(function(e){
    	e.preventDefault();
    	$('.reset').val('');
    });
    //i-check 클릭 이벤트
    $('thead .i-checks').on('ifChecked',function(event){
    	$('tbody .i-checks').parent().addClass('checked');
    });
    //i-check 해제 이벤트
    $('thead .i-checks').on('ifUnchecked',function(event){
    	$('tbody .i-checks').parent().removeClass('checked');
    });
    
	$('.owner').click(function(e){
		openNewWindow('담당자','/common/user',e.target.id,650,700);
	});
	var newWindow = null;
    // 부모 window 가 실행
	function openNewWindow(name,url,target,x,y){
		// specs -> 팝업창의 설정들을 정의해 둔 부분
		var specs= "menubar=no,status=no,toolbar=no,Width="+x+",Height="+y;
		// window.open 함수를 통해서 팝업창 호출
		newWindow = window.open(url, name, specs);
		// window Popup이 되고 난후에 바로 실행시키면 inpu창이 만들어지지 않아서 1초의 시간을 지연시킴
		setTimeout(function(){
			$(newWindow.document.body).append('<input type="hidden" id="parentid" name="parentid" value="'+target+'">');	
		},1000);
	}
	// 자식 window가 실행
	// 영업 담당자 및 담당자 가지고옴
	//tr -> 실제로 클릭한 tr 자체
	function parentOwnerUser(tr){
		// 접수자, 담당자가 겹치는 경우에 발생할 것 같아서 한번에 처리 할수 있게 수정작업함..
		// parentid => 버튼을 눌렀을때의 id 값
		var parentid = $('#parentid').val();
		// opener -> 부모의 window를 의미함.
		// tr.getAttribute("value") -> tr 값에 value를 넣어두었는데 해당 value 값을 가지고옴 => 여기서는 영업담당자의 키값(USERNO)
		// 버튼을 눌렀을때의 id 값의 next값 즉 Owner_ 옆의 Owner 값(DB에 들어갈값)
		opener.$("#"+parentid).next().val(tr.getAttribute("value"));
		// tr.children.userName.textContent -> tr하위에있는 td 값중 userName의 text값을 가지고옴 => 여기서는 영업담당자의 이름을 의미
		// 버튼을 눌렀을때의 id 값을 실제로 넣음. 
		opener.$("#"+parentid).val(tr.children.username.textContent);
		// window 창을 종료 -> 담당자 팝업을 종료함.
		window.close();
	}
	function parentCode(tr){
		// 접수자, 담당자가 겹치는 경우에 발생할 것 같아서 한번에 처리 할수 있게 수정작업함..
		// parentid => 버튼을 눌렀을때의 id 값
		var parentid = $('#parentid').val();
		// opener -> 부모의 window를 의미함.
		// tr.getAttribute("value") -> tr 값에 value를 넣어두었는데 해당 value 값을 가지고옴 => 여기서는 영업담당자의 키값(USERNO)
		// 버튼을 눌렀을때의 id 값의 next값 즉 Owner_ 옆의 Owner 값(DB에 들어갈값)
		opener.$("#"+parentid).next().val(tr.getAttribute("value"));
		// tr.children.userName.textContent -> tr하위에있는 td 값중 userName의 text값을 가지고옴 => 여기서는 영업담당자의 이름을 의미
		// 버튼을 눌렀을때의 id 값을 실제로 넣음. 
		opener.$("#"+parentid).val(tr.children.username.textContent);
		// window 창을 종료 -> 담당자 팝업을 종료함.
		window.close();
	}

    function check_required(e){
        // 필수로 저장되어야 하는 값 체크
        var length = $('.required').length;
        var check = "true";
        for(i=0;i<length;i++){
            var check_value = $('.required:eq('+i+')').val();

            if(check_value =='' || check_value == undefined){
                $('.required:eq('+i+')').parent().addClass('has-error');
                var error = $('.required:eq('+i+')').parent().prev().text().trim();
                if(error ==''){
                	var error = $('.required:eq('+i+')').parent().parent().prev().text().trim();
                }
                alert(error+"를 입력해주세요");
                e.preventDefault();
                check = false;
            }else{
                $('.required:eq('+i+')').parent().removeClass('has-error').addClass('has-success');
            }
        }
        return check;
        
    }
    
    function paging(prm){
    	//파라미터로 클릭한 페이지 번호를 받아온다
        var htmlStr = '<input type="hidden" id="pageNum" name="pageNum" value="'+prm+'">';
        // 첫번쨰 form:form 가져옴.
        var form = $('form:eq(0)');
        //form 안에 생성해둔 <span id ='selectpage'> 에 위의 값을 히든으로 넘긴다.
        form.children().append(htmlStr);
        // 폼 submit
        form.submit();
     }
    
    function today(){
    
    	
    	var today = new Date();
    	var dd = today.getDate();
    	var mm = today.getMonth()+1; //January is 0!
    	var yyyy = today.getFullYear();
    	if(dd<10) {
    	    dd='0'+dd
    	} 
    	if(mm<10) {
    	    mm='0'+mm
    	} 
    	today = yyyy+'-' + mm+'-'+dd;
    	
    	return today;
    }
    
    
    