<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- common.css에 center로 가운데 정렬해주기-->
<div class = 'center'>
	<a href = '<c:url value = "/"/>'>로그인</a>
	<div class = 'box'>
		<ul>
			<li><input type = 'text'  id = 'mb_email'  class = 'chk'  placeholder="아이디"></li>
			<li><input type= 'password'   class = 'chk' id = 'mb_pw'  placeholder="비밀번호" ></li>
			<li><input type= 'button' value = '로그인' onclick='login()'></li>
			<li><hr></li>
	
		</ul>
	</div>
	
<div>
	<a href  = 'join'>아직 회원이 아니세요? 회원가입</a><BR>
	<a href = 'loginPw'>비밀번호 찾기</a>
</div>
</div>
<div class='loading center'><img src='img/loading.gif'></div>



<script>
$('#mb_pw').keypress(function ( e ) {
	if(e.keyCode==13) {
	     login();
		
	} 
	
});
function login() {
// 	입력이 되어야만 submit해야 하니까 common.js 에 함수를 만들어주고 다시 호출해주기!
//이게 참이면! 중괄호 블럭을 써줘야 하니까. 참이 아니면! 그러면 빠져나가도록 해주는거야 
//false이면 return 
 if(! emptyCheck() ) return;
 
 //alert('로그인 처리')
 
	  $.ajax({
			  url : 'memberlogin',  //요청할 url
			  data : {mb_email : $('#mb_email').val(), mb_pw : $('#mb_pw').val()  },
		      success : function ( response ) { //주소에 이런 요청이 들어오면 성공했을때
				 if( response) location = '<c:url  value ="/" />';
				 else {
					 alert ('아이디나 비밀번호가 일치하지 않습니다! ');
					 $('#mb_email').focus();
				 }
				}
	  	});
 
}
</script>
</body>
</html>