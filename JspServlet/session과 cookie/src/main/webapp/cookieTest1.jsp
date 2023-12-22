<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 테스트 중</title>
</head>
<body>
<% 
	Cookie cookie = new Cookie("name", "kjk");
	cookie.setMaxAge(600);
	response.addCookie(cookie);
%>

<h2>셋팅된 쿠키 이름 : <%=cookie.getName() %></h2>
<h2>셋팅된 쿠키 값  : <%=cookie.getValue() %></h2>
<h2>셋팅된 쿠기 시간 :  <%=cookie.getMaxAge() %></h2>

<a href = "cookieTest2.jsp">쿠키값 불러오기</a>
</body>
</html>