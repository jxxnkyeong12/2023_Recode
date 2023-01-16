package board;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired private BoardDAO dao;

	@Override
	public List<BoardVO> board_list() {
		return dao.board_list();
	}

	@Override
	public BoardVO board_detail(int id) {
		return dao.board_detail(id);
	}

	@Override
	public int board_update(BoardVO vo) {
		return dao.board_update(vo);
	}



	@Override
	public int board_insert(BoardVO vo) {
		return dao.board_insert(vo);
	}

	@Override
	public BoardPageVO board_list(BoardPageVO vo) {
		return dao.board_list(vo);
	}

	@Override
	public int board_delete(int id) {
		return dao.board_delete(id);
	}

	@Override
	public int board_read(int id) {
		return dao.board_read(id);
	}

	@Override
	public int board_delete_recode(int id) {
		return dao.board_delete_recode(id);
	}
    
	

}
