<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>    
<%@ page import="java.io.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다운로드</title>
</head>
<body>
<% 
	String fileName = request.getParameter("file_name");
	
    String savePath = "upload"; // 서버에 파일이 업로드된 폴더명을 지정하는 부분
    ServletContext context = getServletContext(); //현재 웹 애플리케이션의 ServletContext를 얻기 위한 메서드
    
	String sDownloadPath = context.getRealPath(savePath); // upload 폴더의 서버상의 실제 물리적인 경로를 얻어오는 부분
	String sFilePath = sDownloadPath + "\\" + fileName; //다운로드할 파일의 전체 경로를 지정하는 부분
	byte b[] = new byte[4096];  // 아래쪽 한번에 읽고 출력할 바이트 크기로 배열을 생성하는 부분
	FileInputStream in = new FileInputStream(sFilePath); //다운로드할 파일의 경로를 인자로 지정하면서 FileInputStream 객체를 생성하는 부분
	String sMimeType = getServletContext().getMimeType(sFilePath); // 다운로드할 파일의 망미 타입을 얻어오는 부분
	System.out.println("sMimeType>>>" + sMimeType); 
	
	if(sMimeType == null)  // 다운로드할 파일의 마임 타입이 제대로 반환되지 않으면 기본 마임 타입을 지정하는 부분
		sMimeType = "application/octet-stream";
		
		response.setContentType(sMimeType); // 응답할 데이터의 마임 타입을 다운로드할 파일의 마임 타입으로 지정하는 부분
		String agent = request.getHeader("User-Agent"); // 클라이언트 사용하는 브라우저 종류가 Internet Explorer 인지를 판단하는 부분
		boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);

		
 // 사용브라우저가의 종류가 Internet Explorer인 경우 다운로드 시 한글 파일명이 깨지지 않도록 처리하는 부분
 // 또한 사용 브라우저의 종류가 Internet Explorer인 경우 공백 부분이 "+" 문자로 변경되므로 " +" 문자를 다시 공백문자 "%20"으로 변경해주고 있음.	
	if(ieBrowser){ 
		fileName = URLEncoder.encode(fileName, "UTF-8").replace("\\+", "%20");
	}else {
		//사용 브라우저가 Internet Explorer가 아닌 경우 다운로드 시 한글 파일명이 깨지지 않도록 처리하는 부분
		fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
	}

	
	response.setHeader("Content-Disposition", "Attachment; filename=" + fileName);
	
	ServletOutputStream out2 = response.getOutputStream();
	int numRead;
	
	while((numRead = in.read(b, 0, b.length)) != -1) {
		out2.write(b, 0, numRead);
	}
	
	
	out2.flush();
	out2.close();
	in.close();
%>


</body>
</html>