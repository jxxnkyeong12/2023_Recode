package com.test.jin;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.BoardPageVO;
import board.BoardServiceImpl;
import board.BoardVO;
import common.Common;

@Controller
public class BoardController {

	@Autowired private BoardServiceImpl service; 
//	2022-11-19 코드리뷰 : @Autowired private BoardPageVO page; VO와 DTO는 일회성으로 사용하라 Autowired는 오류 많고,내부에서 자동주입되지만 못찾아올 확률이 높다
	private BoardPageVO page = new BoardPageVO();
	@Autowired private Common common;
	
	
	
	
	
	//2022-11-19: 공지사항 삭제 - 진짜로  delete 하지말고 컬럼하나 더 추가해서 기록 보관하기 
	@RequestMapping("/delete.no")
	public String delete (int id, String filepath, HttpServletRequest request) {
		//기록보관용으로 만들기
		service.board_delete_recode(id);
		
		
		
//		위에 파라메터는 int id를 줬었는데 기록 보관용으로 하려고 BoardVo로 변경!
//		BoardVO notice = service.board_detail(id);
//		
//		if( notice.getFilepath() != null) {
//			filepath = notice.getFilepath();
//			//String filename = "";
//			filepath = filepath.replace(common.appName(request), "d:/board_file" + request.getContextPath() );
//			if( ! filepath.isEmpty() ) {
//				if( notice.getFilename() != null ) {
//					File f = new File( filepath ); 
//					if( f.exists() ) f.delete();
//				}
//			}
//			
//		}
//		System.out.println(notice.getFilename());
//		service.board_delete(notice.getId());
		return "redirect:list.no";
	}
	
	
	//공지사항 수정!
	@RequestMapping("/update.no")
	public String update(BoardVO vo, String filename, MultipartFile file, HttpServletRequest request) {
		//파일 일단 찾아주고
		BoardVO notice = service.board_detail(vo.getId());
		String filepath = notice.getFilepath(); 

		if( filepath != null ) {
			filepath = filepath.replace( common.appName(request), "d://board_file/" + request.getContextPath() );
		}
		
		
		//파일첨부하지 않은 경우
		if( file.isEmpty() ) {
			//원래부터 첨부파일 없는경우
			//원래있던 첨부파일을 삭제한 경우-물리적인 파일도 삭제
			// 2022/11/19  코드리뷰 : if문을 하나로 쓰는게 더 좋다고 피드백 받음!
			if( filename.isEmpty() && notice.getFilename() != null ) {
//				if( notice.getFilename() != null ) {
					File f = new File( filepath ); 
					if( f.exists() ) f.delete();
				
				
			}else {
				//원래첨부파일을 그대로 쓰는 경우: filename 에 파일명이 있음
				vo.setFilename( notice.getFilename() );
				vo.setFilepath( notice.getFilepath() );
			}			
			
		}else {
		//파일첨부한 경우
			vo.setFilename( file.getOriginalFilename() );
			vo.setFilepath( common.fileUpload("board", file, request) );
			
			//원래첨부파일이 있던 경우 물리적 파일도 삭제
			if( notice.getFilename() != null ) {
				File f = new File(filepath);
				if( f.exists() ) f.delete();
			}
		}
		
		
		service.board_update(vo);
		return "redirect:detail.no?id="+vo.getId();
		
	}
	
	
	//공지사항 수정 화면연결
	@RequestMapping("/modify.no")
	public String modify(Model model, int id) {
		model.addAttribute("vo", service.board_detail(id));
		return "board/modify";
	}
	
	
	//공지사항 디테일
	@RequestMapping("/detail.no")
	public String detail (int id, Model model) {
		
		//조회수 증가시키기
		service.board_read(id);
		
		BoardVO vo = service.board_detail(id);
		
		if(vo.getFilepath() != null) {
			String str = vo.getFilename();
			//2022-11-19 코드피드백: lastindex 사용하면 더 수월!
			System.out.println(str.substring(str.length()-3, str.length())); 
			//System.out.println(str.substring(str.lastIndexOf(str), str.length())); 
			str = str.substring(str.length()-3, str.length());
			model.addAttribute("str", str);
			
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("crlf", "\r\n");
		return "board/detail";
	}
	
	//공지사항 첨부파일 다운로드
	@RequestMapping("/download.no")
	public void download(int id, HttpServletResponse response, HttpServletRequest request) {
		BoardVO vo = service.board_detail(id);
		common.download(vo.getFilename(), vo.getFilepath(), response, request);
	}
	
	
	
	//신규 공지글쓰기
	@RequestMapping("/insert.no")
	public String insert (
			@ModelAttribute BoardVO vo, HttpServletRequest request) {
		
		MultipartHttpServletRequest mReq = (MultipartHttpServletRequest) request;
		MultipartFile file = mReq.getFile("file");
		
		if(! file.isEmpty() ) { //첨부파일이 비어있지 않은 경우
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.fileUpload("board", file, request));
			
		}
		
		service.board_insert(vo);
		return "redirect:list.no";
	}
	
	
	//신규 공지글쓰기 화면요청
	@RequestMapping("/new.no")
	public String notice() {
		return "board/new";
	}
	
	
	//공지사항 리스트
	@RequestMapping("/list.no")
	public String list (HttpSession session, Model model
			, String search, String keyword
			,@RequestParam(defaultValue = "10") int pageList
			,@RequestParam(defaultValue = "1") int curPage) {
	    session.setAttribute("category", "no");
		
	    page.setCurPage(curPage);
	    page.setPageList(pageList);
	    page.setSearch(search);
	    page.setKeyword(keyword);
	 
	    
	    model.addAttribute("page", service.board_list(page));
	    return "board/list";
	}
	
}
