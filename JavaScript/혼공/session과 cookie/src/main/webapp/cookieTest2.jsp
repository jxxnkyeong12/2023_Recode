<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키테스트</title>
</head>
<body>

<%
	String name = "";
	String value = "";
	String cookie = request.getHeader("Cookie");
	
	if(cookie !=null ){
		Cookie cookies[] = request.getCookies();
		
		for(int i = 0; i < cookies.length ; i++) {
			if(cookies[i].getName().equals("name")) {
				name = cookies[i].getName();
				value = cookies[i].getValue();
			}
		}
	}
%>


<h2>쿠기 이름 = <%=name %></h2>
<h2>쿠기 값 = <%=value %></h2>

</body>
</html>