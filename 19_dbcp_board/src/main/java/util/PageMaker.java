package util;

public class PageMaker {

	private Criteria cri;		// 정렬 기준과 현제 페이지에 대한 정보 저장
	private int totalCount;		// 전체 게시물 수
	private int startPage;		// 현재 페이지에서 출력되는 시작 페이지 
	private int endPage;		// 현재 페이지에서 출력되는 끝 페이지
	private int displayPageNum;	// 한번에 보여줄 페이지 수
	private int maxPage;		// 전체 페이지 블럭 수(마지막 페이지 번호)
	private boolean prev;		// 이전 페이지 존재 유무
	private boolean next;		// 다음 페이지 존재 유무
	
	public PageMaker() {
		this.cri = new Criteria();
		this.displayPageNum = 5;
	}
	
	public void calcPaging() {
		endPage = (int)Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum;
		startPage = endPage - displayPageNum + 1;
		
		maxPage = (int)Math.ceil(totalCount / (double)cri.getPerPageNum());
		
		if (endPage > maxPage) endPage = maxPage;
		
		prev = (startPage > 1) ? true : false;
		next = (endPage == maxPage) ? false : true; 
	}

	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
		calcPaging();
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPaging();
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
		calcPaging();
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}

	@Override
	public String toString() {
		return "PageMaker [cri=" + cri + ", totalCount=" + totalCount + ", startPage=" + startPage + ", endPage="
				+ endPage + ", displayPageNum=" + displayPageNum + ", maxPage=" + maxPage + ", prev=" + prev + ", next="
				+ next + "]";
	}
		
}