package com.test.jin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import board.BoardVO;
import common.Common;
import member.MemberDTO;
import member.MemberServiceImpl;

/**
 * @author kimjinkyeong
 *
 */
/**
 * @author kimjinkyeong
 *
 */
/**
 * @author kimjinkyeong
 * com.test.jin
 * MemberController.java
 */
/**
 * @author kimjinkyeong
 * com.test.jin
 * MemberController.java
 */
@Controller
public class MemberController {

	@Autowired private MemberServiceImpl service;
    @Autowired private Common common;
	
    
    //주민번호 테스트 
    @RequestMapping("/test.ju")
    public String jumintest(HttpSession session) {
    	session.setAttribute("category", "te");
     return "member/jumin";	
    }
    
    //주민번호 화면 연결
    @RequestMapping("/list.ju")
    public String jumin(HttpSession session) {
    	session.setAttribute("category", "ju");
    	return "member/ResidentNumber";
    }
    
	
    //비밀번호 찾기
    @RequestMapping("/loginPw")
    public String loginPw(MemberDTO vo) {
    	
        return "default/member/findPw";
    }
    
    
	//회원가입 처리해주기 
	@ResponseBody @RequestMapping(value = "/NewInsert", produces = "text/html; charset=utf-8")
	public String join(MemberDTO vo, HttpServletRequest req) {
		
			String salt = common.generateSalt();
			
			
			vo.setSalt(salt);
			vo.setMb_pw( common.getEncrypt(salt, vo.getMb_pw()));
		
			//DB에 저장!
			StringBuffer msg = new StringBuffer("<script>");
			if( service.member_join(vo) ==1 ) {
				msg.append("alert('회원가입 축하^^♥'); location='").append(req.getContextPath() ).append( "';") ;
				System.out.println(req.getContextPath());
			}else {
				msg.append("alert('회원가입 실패ㅠㅠ'); history.go(-1);");
			}
			
		//응답화면은 home.jsp로 보내면 된다.
		msg.append("</script>");
		return msg.toString();
		
	}
	
	
	
	//회원가입 화면 요청
	@RequestMapping("/join")
	public String join(HttpSession session) {
		session.setAttribute("category", "join");
		return "default/member/join";
	}
	
	
	
	
	
	
	//로그아웃 처리
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:/";
	}
	
	/** 코드리뷰중 테스트! 주석!
	 * 회원가입 솔트해놨으면 좋았을것 근데 회원가입할려면 유효성검사해야하공 ㅠ할게 많아짐..!
	 * @param vo
	 * @param session
	 * @return
	 */
	
	//회원 로그인 처리 요청
	@ResponseBody @RequestMapping("/memberlogin")
	public boolean login(  MemberDTO vo, HttpSession session) {
		//객체생성을 안하고 바로 파라메터로 가져온 vo를 쓰려니까 데이터가 날라갔다 ㅠ 그래서 객체 생성하고 dto에 하나하나 담아서 찾아주니까 성공!
		// 이럴거면 해쉬맵 쓰나 똑같넹...ㅎ salt처리를 할거면 다음부턴 hashmap처리로 하기
		
		  MemberDTO dto = new MemberDTO();
		  dto.setMb_email( vo.getMb_email() );
		  dto.setMb_pw(vo.getMb_pw());
		  String salt = service.member_salt(dto.getMb_email());
		  vo.setMb_pw( common.getEncrypt(salt, dto.getMb_pw() ) ); //암호화된 비번!!!!
		  
		  vo =  service.member_login(vo);
		  session.setAttribute("loginInfo", vo);
		  //연산자 안써도 기본값이 있으니까 
		  
	 return vo != null;
	}

	@ResponseBody @RequestMapping("/id_check")
	public boolean id_check(String mb_email) {
		return service.member_id_check(mb_email);
	}
	
	
	//로그인 화면 요청
	@RequestMapping("/login")
	public String login(HttpSession session) {
		session.setAttribute("category", "login");
		
		return "default/member/login";
		
	}
	
	
}
