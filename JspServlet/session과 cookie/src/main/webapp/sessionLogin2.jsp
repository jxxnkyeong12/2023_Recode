<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%session.setAttribute("id", request.getParameter("id")); %>
<h3>로그인 되었습니다.</h3>
<h3>로그인 아이디 : <%= (String)session.getAttribute("id") %></h3>
<a href = "sessionLogout.jsp">로그아웃</a>
</body>
</html>