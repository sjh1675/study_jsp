package vo;

import java.util.Date;

public class BoardVO {
	
	private int boardNum;
	private String boardTitle;
	private String boardAuth;
	private String boardContent;
	private int boardReadCount;
	private Date boardDate;
	
	public BoardVO() {}

	public BoardVO(int boardNum, String boardTitle, String boardAuth, String boardContent, int boardReadCount,
			Date boardDate) {
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.boardAuth = boardAuth;
		this.boardContent = boardContent;
		this.boardReadCount = boardReadCount;
		this.boardDate = boardDate;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardAuth() {
		return boardAuth;
	}

	public void setBoardAuth(String boardAuth) {
		this.boardAuth = boardAuth;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardReadCount() {
		return boardReadCount;
	}

	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNum=" + boardNum + ", boardTitle=" + boardTitle + ", boardAuth=" + boardAuth
				+ ", boardContent=" + boardContent + ", boardReadCount=" + boardReadCount + ", boardDate=" + boardDate
				+ "]";
	}
	
}
