<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>   
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix='c'%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토로닉스 - ${title}</title>

<script src = 'https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel ='stylesheet' type = 'text/css'  href = 'css/common.css?<%=new java.util.Date()%>'> 
<link rel = 'icon' type = 'image/x-icon' href = 'http://tronix.kr/resources/favicon/cf/favicon.ico'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">


</head>
<body>
 <c:choose>
 	<c:when test="${category eq 'no'}"><c:set var = 'title' value = '- 공지사항'/></c:when>
 	<c:when test="${category eq 'te'}"><c:set var = 'title' value = '- 테스트'/></c:when>
 	<c:when test="${category eq 'in'}"><c:set var = 'title' value = '- 진행중'/></c:when>
 </c:choose>

<!-- 타일 조각 붙이기 (선언) -->
<tiles:insertAttribute name = 'header'/>
<div id = 'container'>
<tiles:insertAttribute name = 'container'/>
</div>
<tiles:insertAttribute name = 'footer'/>

<script type="text/javascript" src ='js/common.js?<%=new java.util.Date()%>'></script>
<script type="text/javascript" src ='js/member.js?<%=new java.util.Date()%>'></script>
</body>
</html>