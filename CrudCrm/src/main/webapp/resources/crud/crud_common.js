
	$('.save').click(function(e){		
		check_required(e);
	});
	
    $('.resets').click(function(e){
    	e.preventDefault();
    	$('.reset').val('');
    });

    
    // 부모 window 가 실행
	function openNewWindow(url,target){
		var name= "영업담당자";
		// specs -> 팝업창의 설정들을 정의해 둔 부분
		var specs= "menubar=no,status=no,toolbar=no,innerWidth=600,innerHeight=900";
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
            }else{
                $('.required:eq('+i+')').parent().removeClass('has-error').addClass('has-success');
            }
        }
        return true;
    }
    
    function paging(prm){
    	//파라미터로 클릭한 페이지 번호를 받아온다
        var htmlStr = '<input type="hidden" id="pageNum" name="pageNum" value="'+prm+'">';
        // 첫번쨰 form:form 가져옴.
        var form = $('form:eq(0)');
        
        form.children().append(htmlStr);
        // 폼 submit
        form.submit();
     }
    
    //팝업창열기 메서드
    function openPop(url,target,width,height){
    	var property = "width="+width+", height="+height+",top=300,menubar=no,location=no, status=no,toolbar=no,scrollbars=yes";
    	window.open(url,target,property);
    }
    
    
  
    
    
    