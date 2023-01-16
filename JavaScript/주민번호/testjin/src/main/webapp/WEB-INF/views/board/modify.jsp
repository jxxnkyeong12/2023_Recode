<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>공지사항 수정</h3>
<form method='post' action='update.no' enctype="multipart/form-data">
<%-- <input type = 'hidden' name = 'writer' value = '${loginInfo.mb_email}'>  --%>
<!-- 	이미 관리자로 타고 들어왔으니까 어떤 글인지만 알면 되니까 아이디가 필요해! -->
 
 <input type = 'hidden' name = 'id' value = '${vo.id}'>

<table class='w-px1200'>
<tr><th class='w-px140'>제목</th>
	<td><input type='text' class='full chk' name='title' title = '제목' value = '${vo.title}'></td>
</tr>
<tr><th>내용</th>
	<td><textarea class='full chk' name='content' title = '내용'>${vo.content}</textarea></td>
</tr>
<tr><th>첨부파일</th>
	<td class = 'left'>
	

		<label>
		<input type ='file' name = 'file' multiple class ='attach-file' >
		<a><i class="font fa-solid fa-file-circle-plus"></i></a>
	</label>

	<span class = 'file-name'>${vo.filename}</span> <!--span태그는 form태그로 전송이 안돼 ㅠ그래서 아래 input type hidden으로 따로 담아둬야해!  -->
	<a class ='delete-file' style="display: ${empty vo.filename ? 'none' : 'inline'}"><i class="font-r fa-regular fa-trash-can"></i> </a>
	</td>
</tr>
</table>
<input type = 'hidden' name = 'filename'> <!-- span태그에 있는 데이터를 여기에 숨겨두고 담아두자 -->
</form>

<div class='btnSet'>
	<a class='btn-fill' onclick='update()'>저장</a>
	<a class='btn-empty' onclick="history.go(-1)">취소</a>
</div>

<script>
function update() { 
	if( emptyCheck() ){
		$('[name=filename]').val( $('.file-name').text() );
		$('form').submit()
	}
}
</script>
</body>
</html>