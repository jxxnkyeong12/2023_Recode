package hello.core;

import hello.core.member.Grade;
import hello.core.member.Member;
import hello.core.member.MemberService;
import hello.core.member.MemberServiceImpl;

public class MemberApp {
  
	public static void main(String[] args) {
		MemberService memberService = new MemberServiceImpl();
		//잘 작동되는지 test하기 위해 회원정보 하나를 넣어보자.. 1L인 이유는 long 타입이라서 뒤에 L 넣어준거
		Member member	=  new Member(1L, "memberA", Grade.VIP);
		memberService.join(member);
	
		Member findMember = memberService.findMember(1L);
		System.out.println("new member = " + member.getName());
		System.out.println("find Member = " + findMember.getName());
	}
	
}
