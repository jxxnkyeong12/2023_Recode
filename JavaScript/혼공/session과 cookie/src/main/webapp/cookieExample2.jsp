<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%Cookie cookie = new Cookie("language", request.getParameter("language")); //파라메터로 받아온 값을 cookie에 담고
	cookie.setMaxAge(60*60*24); //쿠키 유효시간 설정
	response.addCookie(cookie); // 클라이언트에 쿠키 값 전송
%>

<script>
	location.href = "cookieExample1.jsp";
</script>
</body>
</html>