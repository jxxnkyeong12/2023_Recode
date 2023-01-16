package board;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements BoardService {
	@Autowired  private SqlSession sql;

	
	@Override
	public List<BoardVO> board_list() {
		return sql.selectList("board.list");
	}

	

	@Override
	public int board_update(BoardVO vo) {
		return sql.update("board.update", vo);
	}

	

	@Override
	public int board_insert(BoardVO vo) {
		return sql.insert("board.insert", vo);
	}

	@Override
	public BoardPageVO board_list(BoardPageVO vo) {
		vo.setTotalist( sql.selectOne("board.totalList", vo));
		vo.setList( sql.selectList("board.list",vo) ) ; //10건의 정보만 
		return vo;
	}

	@Override
	public int board_delete(int id) {
		return sql.delete("board.delete",id);
	}

	@Override
	public int board_read(int id) {
		return sql.update("board.read", id);
	}

	@Override
	public BoardVO board_detail(int id) {
		return sql.selectOne("board.detail", id);
	}



	@Override
	public int board_delete_recode(int id) {
		return sql.update("board.delete_recode", id);
	}

	


}
