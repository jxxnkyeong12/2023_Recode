package member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements MemberService {

	@Autowired private SqlSession sql;
	
	@Override
	public int member_join(MemberDTO dto) {
		return sql.insert("member.join", dto);
	}

	@Override
	public MemberDTO member_myinfo(String mb_email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO member_login(MemberDTO vo) {
		return sql.selectOne("member.login", vo);
	}

	@Override
	public boolean member_id_check(String mb_email) {
		return (Integer) sql.selectOne("member.id_check",mb_email)==1 ? true : false;
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
		return sql.selectOne("member.salt", mb_email);
	}

}
