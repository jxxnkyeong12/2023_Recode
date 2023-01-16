<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table tr td { text-align: left }
[name = address] { margin-top: 3px }
p { width:600px; text-align: right; margin: 10px auto; color:#ff0000; }
form table th span { color:#ff0000; margin-right:5px  }
input, div {margin-left: 3px}
</style>
</head>
<body>
<h3>회원가입</h3>
<p>*는 필수입력항목입니다</p>

<form method="post" action="NewInsert" > <!-- 컨트롤러에서 join을 받아줄 처리  -->
<table class = 'w-px600'>  
	<tr>
		<th class = 'w-px140'><span>* </span>성명</th>
		<td><input type='text' name = 'mb_name'  class = 'chk' title='이름' autofocus>
		<div class = 'valid'>이름을 입력하세요</div>
		</td>
		
	</tr>
	
	<tr>
		<th><span  >* </span>성별</th>
		<td>
			<label>
				<input type = 'radio' name = 'mb_gender'  value = '남'>남
				<input type = 'radio' name = 'mb_gender'  value = '여'  checked>여
			</label>
		</td>
	</tr>
	<tr>
      <th class = 'w-px140'><span>* </span>주민등록번호</th>
      <td>
             <input type="text" name="ResidentNumber" id="unum1" class = 'chk' size="12" maxlength="6"> - </input>
             <input type="password" name="ResidentNumber2" id="unum2" size="12" maxlength="7"></input>
   	   		 <div class = 'valid'>주민번호를 입력하세요 </div>
   	    	
      <input type="button" value="검사" onclick="jumin();" />
  <input type="reset" value="다시입력" />
      </td>
  </tr>
	<tr>
		<th><span>* </span>아이디</th>
		<td><input type = 'text'  name = 'mb_email'  title='아이디' class = 'chk'>
			<a class = 'btn-fill' onclick="id_check()">중복</a>
			<div class = 'valid'>아이디를 입력하세요(영문소문자,숫자만)</div>
		</td>
	</tr>
	<tr>
		<th><span  >* </span>비밀번호</th>
		<td><input type = 'password'  name= 'mb_pw' title='비밀번호' class = 'chk'>
			<div class = 'valid'>비밀번호를 입력하세요(영문대/소문자,숫자 모두 포함)</div>
		</td>
	</tr>
	<tr>
		<th><span  >* </span>비밀번호확인</th>
		<td><input type = 'password'  name = 'mb_pw_chk' title='비밀번호확인' class = 'chk'>
			<div class = 'valid'>비밀번호를 다시 입력하세요 </div>
		</td>
	</tr>
	
	
	 <tr>
		<th>생년월일</th>
		<td><input type = 'date'  name ='mb_birth'  class ='date'>
		 
		</td>
	</tr> 
	<tr>
		<th>전화번호</th>
		<td><input type = 'text'  name = 'mb_tell'  maxlength="13" title='전화번호'></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><a class = 'btn-fill' onclick="post()" >우편번호찾기</a>
		<input type = 'text'  name = 'mb_post'  class = 'w-px60'  readonly>
		<input type = 'text'  name = 'mb_address'  class = 'full'  readonly>
		<input type = 'text'   name = 'mb_addressmore'  class = 'full'>
		</td>
	</tr>

</table>
</form>

<div class= 'btnSet'>
	<a class = 'btn-fill' onclick="join()">회원가입</a>
	<a class = 'btn-empty' href = '<c:url value="/"/>'>취소</a><!-- 위에 태그라이브러리 선언하고 오기 -->
</div>


<!--  비밀번호 체크, 아이디 중복, 아이디 확인 위해-->
 <script src ='js/member.js?<%=new java.util.Date() %>'></script>
<!--  우편 위해서 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script >


//주민번호 

/* function jumin() {

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
 } */

//회원가입처리
function join() {
	
		if(	$('[name=name]').val() =='' ) {
		var title = $('[name=name]').closest('tr').children('th').text();	
			alert( title + '을 입력하세요');
		$('[name=name]').focus();
			return;
		 }
			
	
	//중복확인한 경우
	if($('[name=mb_email]').hasClass('chked')) {
		//이미 사용중인 경우만 
		if($('[name=mb_email]').siblings('div').hasClass('invalid')) {
			alert('회원가입 불가!\n' + member.mb_email.unusable.desc);
			$('[name=mb_email]').focus();
			return;
		} 
		
		
	}else {
	//중복확인 하지 않은 경우
	   //입력자체가 유효하지 않은 입력값
		if(tagIsInvalid($('[name=mb_email]') ) ) return;
		else {
			//입력자체는 유효하지만 아이디 중복확인을 해야하는 경우! (아이디 중복확인하라고 띄어주는거야)
			alert('회원가입 불가!\n' + member.mb_email.valid.desc);
			$('[name=mb_email]').focus();
			return;
		}
		
	}
	
	if( tagIsInvalid( $('[name=mb_name]') ) ) return;
	if( tagIsInvalid( $('[name= mb_email]') ) ) return;
	if( tagIsInvalid( $('[name=mb_pw]') ) ) return;
	if( tagIsInvalid( $('[name=mb_pw_chk]') ) ) return;
	
	$('form').submit();
	
}




//아이디, 비번, 비번확인, 이메일태그의 입력상태가 invalid 하면 submit할수 없다
function tagIsInvalid( tag ) {
	var status = member.tag_status( tag );
	if(status.code =='invalid') {
		alert( '회원가입 불가! \n' +status.desc );
		tag.focus();
		return true;
	}else {
		return false;
	}
	
}


$('.chk').on('keyup', function(e) {
	
	//아이디 중복확인 한 후에 다시입력하면 중복확인 하지 않은 상태로 가야 하니까
	//chked클래스 없애려고 추가함
	if($(this).hasClass('chked')) $(this).removeClass('chked');
	
	//아이디태그에 엔터 키 입력인 경우는 아이디 중복확인
	if($(this).attr('name') == 'mb_email' && e.keyCode==13) {
		id_check();
	}else {
	
	//태그 상태
	var status = member.tag_status( $(this) );
	$(this).siblings('div').text( status.desc )
					.removeClass().addClass(status.code);
		
	}
});



//아이디 중복확인 검사
function id_check() {
	//올바른 아이디 입력값 상태인지 판단먼저 해주자
	var $id = $('[name=mb_email]');
	if($id.hasClass('chked')) return; 
		//console.log('중복확인'); 
		//이러면 이제 중복확인 된것은 다시 되지 않는다.
	
	
	var status  =member.tag_status( $id );
	if (status.code =='invalid'){
		alert('아이디 중복확인 불필요! \n ' + status.desc);
		$id.focus();
		return;
	}
	//DB에 입력한 아이디가 있다면 사용할 수 없는 아이디
	
/* 	loading( true ); */
		$.ajax({
			url : 'id_check',
			data: { mb_email:$id.val() },
			success : function ( resopnse ) {
					 response = member.id_check( resopnse );
				     $id.siblings('div').text(response.desc)
				     			.removeClass().addClass(response.code);
					$id.addClass('chked'); //중복확인했으니 다시 할필요 없다는 클래스!
			}, error: function (req,status) {
// 				loading( false );
				alert(status + ':' + req.status );
			}
		
	}) ;
}












/* 우편번호 서비스 */
	function post() {
		 new daum.Postcode({
		        oncomplete: function(data) {
		           console.log(data);
		           var address = data.userSelectType == 'R' ? data.roadAddress : data.jibunAddress;
		           //빌딩 이름을 넣어보는 처리
		           if(data.buildingName !='' ) address += " (" + data.buildingName +")"
		           //우리는 2개니까 하나에만  - input 태그니까 val! (text가 아니다)
		           $('[name=mb_address]').eq(0).val( address );
		           $('[name=mb_post]').val(data.zonecode);
		        }
		    }).open();
	}
	
	
	//핸드폰 번호 자동 하이픈 처리
$('[name=mb_tell]').on('keyup', function(){
		var num = $('[name=mb_tell]').val();
		num.trim(); 
		this.value = autoHypenPhone(num) ;
});



	function autoHypenPhone(str){
	            str = str.replace(/[^0-9]/g, '');
	            var tmp = '';
	            if( str.length < 4){
	                return str;
	            }else if(str.length < 7){
	                tmp += str.substr(0, 3);
	                tmp += '-';
	                tmp += str.substr(3);
	                return tmp;
	            }else if(str.length < 11){
	                tmp += str.substr(0, 3);
	                tmp += '-';
	                tmp += str.substr(3, 3);
	                tmp += '-';
	                tmp += str.substr(6);
	                return tmp;
	            }else{              
	                tmp += str.substr(0, 3);
	                tmp += '-';
	                tmp += str.substr(3, 4);
	                tmp += '-';
	                tmp += str.substr(7);
	                return tmp;
	            }
	            return str;
	        }
	
	
</script>




</body>
</html>