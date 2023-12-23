<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드 폼 작성중</title>
<style>
 #uploadFromArea {margin: auto; width: 350px; border: 1px solid black;}
 .td_title {font-size: xx-large; text-align: center;}
</style>
</head>
<body>
	<section id = "uploadFromArea">
		<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td colspan="2" class = "td_title">파일 업로드 폼</td>
				</tr>
				<tr>
					<td><label for = "name">올린 사람 : </label></td>
					<td><input type = "text" id = "name" name = "name"></td>
				</tr>
				<tr>
					<td><label for="subject"> 제목 : </label></td>
					<td><input type="text" id="subject" name="subject"></td>
				</tr>
				<tr>
					<td><label for="fileName1">파일명1 : </label></td>
					<td><input type="file" id="fileName1" name="fileName1"></td>
				</tr>
				<tr>
					<td><label for="fileName2">파일명2 : </label></td>
					<td><input type="file" id="fileName2" name="fileName2"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"> <input type = "submit" value = "전송"></td>
				</tr>

			</table>
			
		</form>
	</section>

</body>
</html>