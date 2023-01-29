package hello.core.member;

public class MemberServiceImpl implements MemberService{

	//DB대신 쓰는거 불러와야지 일단은 
	private final MemberRepository memberRepository = new MemoryMemberRepository();
	
	@Override
	public void join(Member member) {
		memberRepository.save(member);
	}

	@Override
	public Member findMember(Long memberId) {
		return memberRepository.findById(memberId);
	}

}
