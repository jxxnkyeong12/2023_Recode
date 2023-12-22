<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name;
	if(session.getAttribute("name") !=null){
		name =(String)session.getAttribute("name");
	}else {
		name = "세션 없음";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 테스트</title>
</head>
<body>
<h2> 세션 테스트 </h2>

<input type = "button" onclick="location.href = 'sessionSet.jsp'" value = "세션 저장 값">
<input type = "button" onclick="location.href = 'sessionDel.jsp'" value = "세션 값 삭제">
<input type = "button" onclick="location.href = 'sessionInvalidate.jsp'" value = "세션 초기화">

<h3><%=name %></h3>
</body>
</html>