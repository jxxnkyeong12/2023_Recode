<%@page import="java.net.FileNameMap"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<% 
	String uploadPath = request.getRealPath("/upload"); //파일을 업로드할 서버상의 폴더명을 지정
    // getRealPaht메소드는 현제 웹 서버의 상대 경로를 웹 경로(예: uploadTest/upload)가 아닌 실제 서버 시스템상의 디렉토리 경로 (예:c:/uploadtest/upload)를 반환
														
	
	int size = 10*1024*1024; // 파일 사이즈 지정 10MB 넘어가면 exception 뜬다
	String name = "";
	String subject = "";
	String filename1 = "";
	String filename2 = "";
	String origfilename1 = "";
	String origfilename2 = "";
	
	//실제 업로드를 담당하고 있는 부분
	
	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		//1. 폼에서 전달된 파라미터 값을 얻기 위해 request. 
		//2. 업로드될 파일의 위치를 의미
		//3. 파일 사이즈
		//4. 인코딩 (파일이름이 한글인 경우 문제가 되지 않기 위해 설정)
		//5. 파일 이름 중복 방지. 자동으로 파일 이름을 변환해주는거 
		
		
		//폼에서 mutipart/form-data 로 설정했기 때문에 일반 request 객체로는 폼에서 입력한 파라미터 값들을 받을 수가 없고 MultipartRequest 객체를 사용해야 한다
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		
		
		Enumeration files = multi.getFileNames(); //폼에서 전송되어온 파일 타입의 입력상자의 이름들을 반환한다.
		
		String file1 =(String) files.nextElement(); //파일 2개 업로드 했을때 첫번째 입력상자의 이름을 얻어온다.
		filename1 = multi.getFilesystemName(file1); // 서버상에 업로드된 실제 파일명을 얻어온다.
		origfilename1 = multi.getOriginalFileName(file1);
		
		String file2 =(String) files.nextElement();
		filename2 = multi.getFilesystemName(file2);
		origfilename2 = multi.getOriginalFileName(file2);
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileUpload</title>
</head>
<body>
	
	<form name = "filecheck" action="fileCheck.jsp" method="post">
		<input type = "hidden" name = "name" value = "<%= name %>">
		<input type = "hidden" name = "subject" value = "<%= subject %>">
		<input type = "hidden" name = "filename1" value = "<%= filename1 %>">
		<input type = "hidden" name = "filename2" value = "<%= filename2 %>">
		<input type = "hidden" name = "origfilename1" value = "<%= origfilename1 %>">
		<input type = "hidden" name = "origfilename2" value = "<%= origfilename2 %>">
	
	</form>
	<a href = "javascript:;" onclick="javascript:filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
	
</body>
</html>