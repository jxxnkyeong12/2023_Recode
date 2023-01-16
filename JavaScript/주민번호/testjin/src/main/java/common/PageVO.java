package common;

public class PageVO {

	private int totalist; //총 글 건수
	private int pageList = 10; // 한 페이지당 목록갯수- 기본값을 지정
	private int blockPage = 10; //한 블럭당 페이지갯수
	private int totalPage; //총 페이지의 갯수
	private int totalBlock; // 총 블럭 갯수
	private int curPage;    // 현재 선택된 페이지번호
	private int beginList, endList; // 현재페이지에 보여질 목록의 시작/끝 글번호
	private int curBlock; // 현재 보여지는 블럭번호
	private int beginPage , endPage; // 현재블럭에 보여질 페이지의 시작/끝 페이지번호
	private String keyword, search; // 검색조건, 검색어
	private String viewType; //보기형태: 리스트/그리드
	
	
	
	
	public String getViewType() {
		return viewType;
	}
	public void setViewType(String viewType) {
		this.viewType = viewType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public int getTotalist() {
		return totalist;
	}
	public void setTotalist(int totalist) {
		this.totalist = totalist;
		//DB로부터 총 글의 갯수를 조회해 오면 총 페이지객수가 결정
		//총 페이지갯수에 따라 총 블럭의 갯수가 정해진다
		//총 페이지갯수 : 총 글의 갯수/한 페이지당 보여질 글 갯수
		// 382/10 - 38....2 38페이지 인데 2건이 남으니까 총 39개가 될것이다
		totalPage = totalist / pageList; 
		if(totalist % pageList > 0) ++totalPage;
		
		//총 블럭갯수: 총 페이지갯수/한 블럭당 보여질 페이지 갯수로 나누면 된다
		//39/10 - 3....9 -> 총 4블럭이 필요하다
		totalBlock = totalPage / blockPage;
		if(totalPage % blockPage > 0) ++totalBlock;
		
		
		//현재 페이지번호에 따라 보여질 목록의 시작/끝 글번호를 결정할 수 있다.
		//1: 373~382
		//2: 363~372
		//끝 글번호 : 총 목록 갯수 - (현재페이지번호-1)*페이지당보여질 글 건수 ex)1페이지면 0*10! 
		// 1페이지 : 382, 2페이지 : 372, 3페이지 : 362
		endList = totalist - (curPage-1)* pageList;
		//시작 글 번호: 끝 글번호 - (페이지당 보여질 글의 건수-1) 10건이었으니까 -1해줘
		beginList = endList - (pageList-1);
		
		//현재블럭 : 현재페이지 / 블럭당 보여질 페이지수
		// 1블럭 1~10 :, 2블럭 11~20 :, 3블럭 21~30페이지 까지! 
		// 만약 9페이지 : 9/10 몫 0..나머지9 : 1블럭
		// 만약 16페이지 : 16/10 몫 1..나머지6 :2블럭 나머지가 있어도 2블럭!
		// 만약 20페이지 : 20/10 몫 2..나머지0 :2블럭 딱 떨어져도 2블럭!
		
		
		 curBlock = curPage / blockPage;
		 if(curPage % blockPage > 0) ++curBlock;
		 
		//페이지 번호에 따라 결정. 
		//현재 블럭에 따라 보여질 시작/끝 페이지 번호 결정
		//끝 페이지번호 : 현재 블럭번호 * 블럭당 보여질 페이지의 갯수
		// 1블럭 1~10 :, 2블럭 11~20 :, 3블럭 21~30페이지 까지! 
		endPage = curBlock * blockPage;
		// 시작 페이저번호: 끝 페이지 번호 - (블럭당 보여질 페이지수-1)
		beginPage = endPage - (blockPage-1);
		
		//총 페이지가 39페이지 : 1~10, 11~20, 21~30, 31~39
		//끝 페이지 번호가 총 페이지수 보다 크면 총 페이지수를 끝페이지 번호로 한다!
		if(endPage > totalPage ) endPage = totalPage; //끝 페이지 번호가 총 페이지수보다 크면 끝페이지 번호를 총 페이지 번호로 한다!
	}
	public int getPageList() {
		return pageList;
	}
	public void setPageList(int pageList) {
		this.pageList = pageList;
	}
	public int getBlockPage() {
		return blockPage;
	}
	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getBeginList() {
		return beginList;
	}
	public void setBeginList(int beginList) {
		this.beginList = beginList;
	}
	public int getEndList() {
		return endList;
	}
	public void setEndList(int endList) {
		this.endList = endList;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
	
	
}
