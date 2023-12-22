<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#loginArea {width: 400px;margin: auto;border : 1px solid black;}
	table {margin: auto;}
	td { text-align: center;}
</style>
</head>
<body>
	<section id = "loginArea">
		<form method="post" action = "sessionLogin2.jsp">
			<table>
				<tr>
					<td><label for = "id">아이디</label></td>
					<td><input type = "text" name = "id" id = "id"/></td>
				</tr>
				<tr>
					<td><label for = "pass">비밀번호</label></td>
					<td><input type = "password" name = "pass" id = "pass"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type = "submit" value = "로그인">
						<input type = "reset" value = "다시작성">
					</td>
				</tr>
			</table>
		
		</form>
	</section>

</body>
</html>