<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>주민번호 마스킹 처리</h1>
        <input type="tel"  id="jumin1" name="inputValue" maxlength="6"> 
        - <input type="input" id="jumin2" maxlength="7">
          <input type="hidden" id="juminE" name="inputValue" maxlength="7">
          
          
          
 <script>
        $("#jumin1").on('keypress', function(){
          var text = $('#jumin1').val().replace(/[^0-9]/g,"");
          if(text.length >= $(this).attr("maxlength")){
              $("#jumin2").focus();
              return;
          }
            $(this).val(text);
        });
       
        $("#jumin2").on('keypress', function(e){
            //숫자만 입력되게..
            var inVal="";
            if ( event.keyCode === 8 ) {             //백스페이스
                //if(confirm("주민번호 뒷자리 전체를 삭제 후 다시 입력하시겠습니까?")){
                    $("#juminE").val("");
                    $("#jumin2").val("");
                //}                
            }else if(e.keyCode >=96 && e.keyCode <=105){
                switch (e.keyCode) {
                    case 96 : inVal=0; break;
                    case 97 : inVal=1; break;
                    case 98 : inVal=2; break;
                    case 99 : inVal=3; break;
                    case 100 : inVal=4; break;
                    case 101 : inVal=5; break;
                    case 102 : inVal=6; break;
                    case 103 : inVal=7; break;
                    case 104 : inVal=8; break;
                    case 105 : inVal=9; break;
                }
            }else if(e.keyCode >=48 && e.keyCode <= 57 ){
               inVal = String.fromCharCode(e.keyCode);               
            }else{
                e.preventDefault();
                return false;
            }            
            var text = $(this).val();
            if(text.length >= $(this).attr("maxlength")){
                return;
            }
          
            //주민번호에 넣고..
            var jume = $("#juminE").val()+inVal;
            $("#juminE").val(jume.replace(/[^0-9]/g,""));               
        }).on('input',function(e){
            $(this).val($(this).val().replace(/(?<=.{1})./gi, "*"));
        });  
            

           </script>



</body>
</html>