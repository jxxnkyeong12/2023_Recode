<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h3>공지글 안내</h3>

<table class = 'w-px1200'>

<tr>
	<th class = 'w-px140'>제목</th>
	<td colspan="5" class = 'left'>${vo.title}</td>
</tr>

<tr>
	<th>작성자</th>
	<td class = 'left'>${vo.mb_name}</td>
	<th class = 'w-px140' style="">작성일자</th>
	<td class = 'w-px140' class = 'left'>${vo.writedate}</td>
	<th class = 'w-px100'>조회수</th>
	<td class = 'w-px100'>${vo.readcnt}</td>
</tr>

<tr>
	<th>내용</th>
	<td colspan="5" class = 'left' >${fn: replace(vo.content, crlf, '<br>')}</td>
</tr>

<tr>
	<th>첨부파일</th>
	<td colspan="5">
	<!-- 첨부파일이 있는 경우 다운로드가 보이게 처리하기 -->
	<c:if test="${empty vo.filename }">
		<span>첨부파일 없음</span>
	</c:if>
	<c:if test="${not empty vo.filename }">
	<!-- 이미지만 미리보기, 파일처리는 아직 txt안함 -->
	    <span>${vo.filename}</span> 
	    <c:if test="${str ne 'txt' }">
	    <a class = 'preview'> 
	    <img src="${vo.filepath}" /> </a>
	    </c:if>
		<a href = 'download.no?id=${vo.id}'>
		<i class="font-b fa-solid fa-circle-arrow-down"></i></a>
	</c:if>
	</td>
	
</tr>


</table>

<div class = 'btnSet'>
<a class='btn-fill' href ='list.no' >목록으로</a>

 <c:if test="${loginInfo.admin eq 'Y' }">
<a class='btn-fill' href ='modify.no?id=${vo.id}'>수정</a>
<a class='btn-fill remove'>삭제</a>
</c:if> 
</div>

<div id='popup-background'></div>
<div id='popup' class='center'></div>



<script>
$(document).on('click', '.preview img', function(){
	$('#popup, #popup-background').css('display', 'block');
	//클릭한 이미지를 복제해서 popup 안에 넣기
	$('#popup').append( $(this).clone() );
});


$('#popup-background').click(function(){
	$('#popup, #popup-background').css('display', 'none');
	//$('#popup img').remove();  //복제해 보여졌던 태그 삭제
	$('#popup').empty();	  //popup 내부를 비우기
});



$(window).resize(function(){
	center( $('#popup'), $('#popup-background') );
});
$(window).scroll(function(){
	center( $('#popup'), $('#popup-background') );
})




$('.remove').click(function () {
	if( confirm('삭제하시겠습니까?')){
		location = 'delete.no?id=${vo.id}';
	}
});





</script>

</body>
</html>