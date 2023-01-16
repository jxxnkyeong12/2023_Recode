package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	 @Autowired private MemberDAO dao;
	
	@Override
	public int member_join(MemberDTO dto) {
		return dao.member_join(dto);
	}

	@Override
	public MemberDTO member_myinfo(String mb_email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO member_login(MemberDTO vo) {
		return dao.member_login(vo);
	}

	@Override
	public boolean member_id_check(String mb_email) {
		return dao.member_id_check(mb_email);
	}

	@Override
	public int member_update(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int member_delete(String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String member_salt(String mb_email) {
		return dao.member_salt(mb_email);
	}

}
