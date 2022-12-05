package com.ssafy.homes.model.dto;

public class CommentDTO {
	private int commentno;
	private int boardno;
	private String commentwriter;
	private String commentcontent;
	private String commentdate;
	
	public CommentDTO(int commentno, int boardno, String commentwriter, String commentcontent, String commentdate) {
		this.commentno = commentno;
		this.boardno = boardno;
		this.commentwriter = commentwriter;
		this.commentcontent = commentcontent;
		this.commentdate = commentdate;
	}
	
	public CommentDTO(int boardno, String commentwriter, String commentcontent) {
		this.boardno = boardno;
		this.commentwriter = commentwriter;
		this.commentcontent = commentcontent;
	}

	public CommentDTO() {}

	public int getCommentno() {
		return commentno;
	}

	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getCommentwriter() {
		return commentwriter;
	}

	public void setCommentwriter(String commentwriter) {
		this.commentwriter = commentwriter;
	}

	public String getCommentcontent() {
		return commentcontent;
	}

	public void setCommentcontent(String commentcontent) {
		this.commentcontent = commentcontent;
	}

	public String getCommentdate() {
		return commentdate;
	}

	public void setCommentdate(String commentdate) {
		this.commentdate = commentdate;
	}

	@Override
	public String toString() {
		return "CommentDTO [commentno=" + commentno + ", boardno=" + boardno + ", commentwriter=" + commentwriter
				+ ", commentcontent=" + commentcontent + ", commentdate=" + commentdate + "]";
	}
	
}
