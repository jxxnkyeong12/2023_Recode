2023-01-16
● 유효성 검사
    //내용 유효성검사
    function fn_validation(id, msg) {
    	
    	var check = true;	
    	if(!$('#'+id).val()){
    		alert(msg);
    		$('#'+id).focus();
    		check = false;
    	}

    	return check;
    }
 ▶ 아이디값을 가져와서 msg 를 넣어주는 파라메터를 넣어준다! 
 ▶ alert도 띄워주고 메시지도 띄워주면서, 어딘지 알수 있도록 focus해주기

    //저장
    function fn_Save(type){
    	
    	var select = document.getElementById('컬럼1');  //input type 태그에 넣은 값을 넣어줌
    	var grae = document.getElementById('컬럼2');
    	var date = document.querySelector("date 컬럼값3").value;  // input type date는 이런식으로 값을 확인한다.
    	
    	if(!fn_validation('컬럼1', '제목을 입력하여주세요.')) return false;
    	
    	if(!fn_validation('주소', '주소를 입력하여주세요.')) return false;
    	
    	if(select.options[select.selectedIndex].text == '--선택하세요--') {  //selecte 에 있는 option의 값이 --기본이라면 지역을 선택하여 달라는 문구를 띄워준다.
    		fn_validation('지역','지역을 선택하여주세요'); 
    		return false;
    	}
    	
    	
	  	document.frm.action = "/jin/testinsert.do"; // 이 모든 과정을 거치고 난 후 맵핑
	  	document.frm.submit(); //보내라
	 
	        
    }

