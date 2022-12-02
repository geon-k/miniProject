package com.ezen.springboard.vo;

import java.sql.Date;

public class CommentVO {
	
	private int cno;
	private int boardNo;
	private String writer;
	private String content;
	private Date regdate;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "CommentVO [cno=" + cno + ", boardNo=" + boardNo + ", writer=" + writer + ", content=" + content
				+ ", regdate=" + regdate + "]";
	}
	

	
	
}
