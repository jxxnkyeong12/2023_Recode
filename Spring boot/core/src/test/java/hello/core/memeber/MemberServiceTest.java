package hello.core.memeber;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;

import hello.core.member.Grade;
import hello.core.member.Member;
import hello.core.member.MemberService;
import hello.core.member.MemberServiceImpl;

public class MemberServiceTest {

	MemberService memberService = new MemberServiceImpl();
	
	@Test
	void join() {
		//given - 머리
		Member member = new Member(1L, "memberA", Grade.VIP);
			
		//when - 가슴
		memberService.join(member);
		Member findMember = memberService.findMember(1L);
		
		//then - 배
		//검증 org.asser. API 이걸 사용하고,,memeber는 findmember가 똑같냐
		Assertions.assertThat(member).isEqualTo(findMember);
	}
}
