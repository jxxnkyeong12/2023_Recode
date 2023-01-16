package member;

public interface MemberService {

	//CRUD
	int member_join(MemberDTO dto); //회원가입
	MemberDTO member_myinfo(String mb_email); //내 정보보기
	MemberDTO member_login(MemberDTO vo); //로그인처리
	String member_salt(String mb_email); //로그인시 salt 찾아오기
	boolean member_id_check(String mb_email); // 회원가입시 아이디 중복체크
	int member_update(MemberDTO dto); //내정보 수정
	int member_delete(String email); //회원탈퇴
	
	
}
