package board;

import java.util.List;

public interface BoardService {
//  //CRUD
   List<BoardVO> board_list(); //공지글 목록조회
   BoardPageVO board_list(BoardPageVO vo); //페이징 처리된 목록 조회
   int board_insert(BoardVO vo); //새 글쓰기
   BoardVO board_detail(int id); //공지 상세보기
   int board_update(BoardVO vo); //공지글 변경저장
   int board_delete(int id); //공지글 삭제
   int board_delete_recode(int id);  //공지글 삭제지만 기록 보관하기
   int board_read(int id);
   
  
   
  
}
