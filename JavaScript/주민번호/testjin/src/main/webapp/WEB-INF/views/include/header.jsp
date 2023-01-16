<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<header>
	<div class = 'category'>
		<ul>
			<li style="background-color: #012b5d;"><a href="<c:url value='/'/>"><img class = 'tronix' src = 'https://www.tronix.kr/resources/img/logo/logo_Top.png'></a></li>
			<li><a ${category eq 'no' ? 'class="active"' : ''} href='list.no'>공지사항</a></li>
			<li><a ${category eq 'ro' ? 'class="active"' : ''} href='list.ro'>오시는길</a></li>
			<li><a ${category eq 'ju' ? 'class="active"' : ''} href='list.ju'>주민번호</a></li>
			<li><a ${category eq 'te' ? 'class="active"' : ''} href='test.ju'>주민번호테스트</a></li>
		</ul>
	</div>
	<div>
	  <ul>
	  <c:if test="${empty loginInfo }">
	  	<li><a style="font-size: 14px;" href = 'login'>로그인</a></li>
	  	<li><a style="font-size: 14px;" href = 'join'>회원가입</a></li>
	  </c:if>
	  <c:if test='${not empty loginInfo}'>
		<li class='items-center'>
			<span>${loginInfo.mb_name} 님</span>	
			<a class='btn-empty' href='password'>비밀번호변경</a>
			<a class='btn-fill' href='logout'>로그아웃</a></li>
		</c:if>	
	  </ul>
	</div>
</header>
<style>
header {
 	border-bottom: 1px solid #ccc; 
	margin-top: 5px;
	display: flex;
	justify-content: space-between;
	padding: 0 100px;
	align-items: center;
	margin: 0;
}

header div.category ul { display: flex; font-weight: bold; }
header div.category ul li:not(:last-child) { margin-right: 50px }
header div.category ul li a:hover
, header div.category ul li a.active { color: #7f8df5; }



header div ul { display: flex; font-weight: bold;}
header div ul li:not(:last-child) {margin-right: 50px;}
a{ cursor: pointer; }

.tronix {
	background-color: #012b5d;
	padding: 10px 30px;
}

</style>