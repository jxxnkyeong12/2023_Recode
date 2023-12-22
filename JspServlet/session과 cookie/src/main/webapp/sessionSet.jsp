<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session set</title>
</head>
<body>
<%session.setAttribute("name", "세션 셋 테스트!"); %>
<script>
	location.href = "sessionTest.jsp";
</script>
</body>
</html>