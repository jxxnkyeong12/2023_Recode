<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="">
<table width="500" height="100" border="1" align="center" cellspacing="0">
  <tr height="10" align="center">
      <td colspan="2" style="background:#7b80ab;" ><font color=white><b>주민등록 유효성검사</b></font></td>
  </tr>
  <tr>
      <td align="center">주민등록번호</td>
      <td align="center">
             <input type="text" name="unum1" id="unum1" size="12" maxlength="6"> - </input>
             <input type="password" name="unum2" id="unum2" size="12" maxlength="7"></input><br/>
   	    예) 123456-1234567
      </td>
  </tr>
</table>
<center>
  <br/>
  <input type="button" value="검사" onclick="jumin();" />
  <input type="reset" value="다시입력" />
</center>
</form>
 
 <script type="text/javascript">
 
 function jumin() {

     var num1 = document.getElementById("unum1");
     var num2 = document.getElementById("unum2");
     var reg =  /^[0-9]*$/;
     
     var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
     var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열
  

     // -------------- 주민번호 -------------

     for (var i=0; i<num1.value.length; i++) {
         arrNum1[i] = num1.value.charAt(i);
     } // 주민번호 앞자리를 배열에 순서대로 담는다.

     for (var i=0; i<num2.value.length; i++) {
         arrNum2[i] = num2.value.charAt(i);
     } // 주민번호 뒷자리를 배열에 순서대로 담는다.

     var tempSum=0;

     for (var i=0; i<num1.value.length; i++) {
         tempSum += arrNum1[i] * (2+i);
     } // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함

     for (var i=0; i<num2.value.length-1; i++) {
         if(i>=2) {
             tempSum += arrNum2[i] * i;
         }
         else {
             tempSum += arrNum2[i] * (8+i);
         }
     } // 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함


     
 	//아무값도 입력하지 않았을때
 	
     if(num1.value == "" && !num1.value){
    	 console.log("나와")
    	 alert ("주민번호를 입력해주세요")
    	 num1.focus();
    	 return false;
     }
     if(!reg.test(num1.value)){
    	 alert ("정수만 입력해주세요")
    	 num1.value = "";
    	 num1.focus();
    	 return false;
     }
     if(!reg.test(num2.value)){
    	 alert ("정수만 입력해주세요")
    	 num2.value = "";
    	 num2.focus();
    	 return false;
     }
     
     if( num2.value == "" && !num2.value ){
    	 alert ("주민번호를 입력해주세요")
    	 num2.focus();
    	 return false;
     
     }
    	 
      if((11-(tempSum%11))%10!=arrNum2[6]) {
             alert("올바른 주민번호가 아닙니다.");
             num1.value = "";
             num2.value = "";
             num1.focus();
            return false;
       }else{
         	alert("올바른 주민등록번호 입니다.");
        }
 }

 
 </script>
</body>
</html>