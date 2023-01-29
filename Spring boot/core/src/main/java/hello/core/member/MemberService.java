package hello.core.member;

public interface MemberService {

	//2가지 기능이 있다.. 회원가입,, 회원조회
	void join(Member member);
	
	Member findMember(Long memberId);
}
