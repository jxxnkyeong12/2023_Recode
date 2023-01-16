package common;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;



@Service
public class Common {
	
	//첨부파일 다운로드 요청
	public void download(String filename, String filepath, HttpServletResponse response, HttpServletRequest request) {
		filepath = filepath.replace(appName(request), "d://board_file" +  request.getContextPath());
		File file = new File(filepath);
		String mime = request.getSession().getServletContext().getMimeType(filepath);
		response.setContentType(mime);
		
	    try {
	    	 filename = URLEncoder.encode(filename, "utf-8");
	    	 response.setHeader("content-disposition", "attachment; filename=" + filename);
	    	 ServletOutputStream out  = response.getOutputStream(); // getWriter가 아니라 이걸로 해줘야함!
			FileCopyUtils.copy(new FileInputStream(file), out);  //첨부된 파일을 읽어야돼 저 위에 있는  File file! 읽어와야 하니까 FileInputStream
			out.flush();
	     } catch (Exception e) {
//			e.printStackTrace(); 이걸 사용하면 너무 길어지니까 아래 getMessage
	    	 e.getMessage();
		}
		
		
		
	}
	
	
	//첨부파일 업로드 
	public String fileUpload(String category, MultipartFile file, HttpServletRequest request) {
		String path  = "d://board_file" + request.getContextPath();
		System.out.println(request.getSession().getServletContext());
		String upload = "/upload/" + category ;
		path += upload;
		
		//해강 파일 경로가 없다면 만들어주자
		File folder = new File( path );
		if(! folder.exists()) folder.mkdirs(); //존재하지 않는다면, 한꺼번에 만들여면 -s
		
		
		String uuid = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		
		//file이 null일때 처리해주는거
		
		try {
			file.transferTo(new File(path, uuid));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} 
		
		return appName(request) + upload + "/" + uuid;
	}
	
	
	//경로하려고
	public String appName(HttpServletRequest req) {
			//replace 후에 남는건  :  http://localhost/iottest (요 정보를 뽑아내는 거였어)
		  return "http://192.168.0.125:8080/jin".replace(req.getServletPath(), ""); //전체 주소! 스트링 버퍼 타입이고 문자화 시켜야 한다!
			  					
		  
	}
	
	
	// 비밀번호를 암호화 salt생성
	public String generateSalt() {
		SecureRandom random = new SecureRandom();// 암호화 랜덤한 데이터
		byte[] bytes = new byte[24]; // 16을 줘도 됨
		random.nextBytes(bytes); // 랜덤한 바이트 데이터로 다 채운다!

		StringBuffer data = new StringBuffer();
		for (byte b : bytes) {
			// 이 데이터를 16진수로 변환한다->// 데이터에 어펜드 해서 담는다.
			data.append(String.format("%02x", b)); 
		}

		return data.toString(); // 반환해줘야지

	}

	// 문자열을 salt를 사용해 비밀번호를 암호화하는 처리
	public String getEncrypt(String salt, String pw) { // DB에서 가져온 salt정보가 하나 있을것이고, 무엇을 암호화 할 것이냐 pw를 ! 2개의 정보가 필요하다
		pw += salt; 
		
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			digest.update(pw.getBytes());

			byte[] bytes = digest.digest();
			StringBuffer data = new StringBuffer();
			for (byte b : bytes) {
				// 16진수로 각각의 하나로 바꿔서
				data.append(String.format("%x", b)); // 포멧시킬 것은 16진수로 변환 00~09
			}
			
			pw = data.toString();// 암호화된 pw 정보를 다시 pw에 넣기!

		} catch (Exception e) {
			e.getMessage();
		}
		return pw;

	}
	
}
