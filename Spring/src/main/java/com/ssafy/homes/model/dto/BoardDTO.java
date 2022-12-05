package com.ssafy.homes.model.dto;

public class BoardDTO {
	private int boardno;
	private String boardtype;
	private String boardwriter;
	private String boardtitle;
	private String boardcontent;
	private String boarddate;
//////////////////////////////////////////////////////////	

	public BoardDTO() {
	}

	public BoardDTO(int boardno, String boardtype, String boardwriter, String boardtitle, String boardcontent,
			String boarddate) {

		this.boardno = boardno;
		this.boardtype = boardtype;
		this.boardwriter = boardwriter;
		this.boardtitle = boardtitle;
		this.boardcontent = boardcontent;
		this.boarddate = boarddate;
	}
	
	public BoardDTO(String boardtype, String boardwriter, String boardtitle, String boardcontent) {
		this.boardtype = boardtype;
		this.boardwriter = boardwriter;
		this.boardtitle = boardtitle;
		this.boardcontent = boardcontent;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getBoardtype() {
		return boardtype;
	}

	public void setBoardtype(String boardtype) {
		this.boardtype = boardtype;
	}

	public String getBoardwriter() {
		return boardwriter;
	}

	public void setBoardwriter(String boardwriter) {
		this.boardwriter = boardwriter;
	}

	public String getBoardtitle() {
		return boardtitle;
	}

	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}

	public String getBoardcontent() {
		return boardcontent;
	}

	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}

	public String getBoarddate() {
		return boarddate;
	}

	public void setBoarddate(String boarddate) {
		this.boarddate = boarddate;
	}

	@Override
	public String toString() {
		return "BoardDTO [boardno=" + boardno + ", boardtype=" + boardtype + ", boardwriter=" + boardwriter
				+ ", boardtitle=" + boardtitle + ", boardcontent=" + boardcontent + ", boarddate=" + boarddate + "]";
	}
	
	

}