<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단일 파일 업로드를 위한 클라이언트 코드</title>
</head>
<body>
	<form action="partUploadPro1" method="post" enctype="multipart/form-data">
		<label for="writer"> 작성자 : </label>
		<input type= "text" name = "writer" id = "writer"/> <br>
		<label for="partFile1"> 업로드 파일 : </label>
		 <img id="img" style = "display: none;"></img>
		<input type= "file" name = "partFile1" id = "partFile1"/> <br>
		<input type = "submit" value = "단일업로드"/>
	</form>


</body>
<script>
document.addEventListener("DOMContentLoaded", function () {
    let partFile1 = document.getElementById("partFile1");
    if (partFile1) {
        partFile1.addEventListener("change", handleImgFileSelect);
    }
});

function handleImgFileSelect(e) {
    let files = e.target.files;
    let reader = new FileReader();

    reader.onload = function (e) {
        let img = document.getElementById("img");
        if (img) {
            img.src = e.target.result;
            img.style.display = "block";
        }
    };

    reader.readAsDataURL(files[0]);
}

</script>
</html>

