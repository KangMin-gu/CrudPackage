	$('.salesChain').keyup(function(e){//해결방안, 거절사유 이벤트. 값을 입력하면 다음 칸에 입력가능.
		//id = ex1,ex2,ex3,ex4 ..형식으로 구성 되어있음
		var id = e.target.id //현재 id 값 ex) ex1
		var position = parseInt( id.substr(id.length-1,id.length) ); //id의 마지막 숫자값 ex) 1		 
		var nextId = id.substr(0,id.length-1) + (position + 1 ); //다음id	ex)ex2 		 
		var tempId = id.substr(0,id.length-1);//ex
		var value = $('#'+id).val();
			 
		if( value.length >= 1 ){//값이있다면 다음입력 칸 활성화
			$('#'+nextId ).attr('readonly',false);
		}else if ( value.length == 0 ){//값이없다면 다음입력 칸 비활성화.				 
			for(var i=position;i<6;i++){
				$('#'+tempId+(i+1) ).val('');
				$('#'+tempId+(i+1) ).attr('readonly',true);
			}								
		}
	});