<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 상태 유지 test</title>
</head>
<body>
<% 
	String language = "korea";
	String cookie = request.getHeader("Cookie"); //먼저 쿠키가 header에 있는지 확인
	
	if(cookie !=null ){
		Cookie cookies[] = request.getCookies(); //받아온 cookies 배열로 넣기
		for(int i = 0; i < cookies.length ; i++) {
			if(cookies[i].getName().equals("language")) {
				language = cookies[i].getValue();
			}
		}
	}
%>

 <%if(language.equals("korea")) {%>
  <h3>한글버전! 쿠키 예제입니다.</h3>
 <%}else { %>
  <h3>Hello. This is Cookie example.</h3>
  <%} %>
  
  <form action="cookieExample2.jsp" method="post">
  	<label id = "ko"><input type = "radio"  name = "language" id = "ko" value = "korea" <%if(language.equals("korea")) { %> checked="checked" <%} %>> 한국어 페이지 보기</label>
  	<label id = "en"><input type = "radio"  name = "language" id = "en" value = "eng" <%if(language.equals("eng")) { %> checked="checked" <%} %>> 영어 페이지 보기</label>
  	<input type = "submit" value="설정">
  </form>
</body>
</html>