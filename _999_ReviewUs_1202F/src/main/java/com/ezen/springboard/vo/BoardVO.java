package com.ezen.springboard.vo;

import java.sql.Date;

public class BoardVO {
	private int boardNo;
	private String boardTitle;
	private String boardMain;
	private int boardStar;
	private int rprtCnt;
	private Date boardRgd;
	private int boardCatecd;
	private String boardCate;
	private String userId;
	private String boardAddr;
	private String boardCnt;
	private String placeTitle;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardMain() {
		return boardMain;
	}
	public void setBoardMain(String boardMain) {
		this.boardMain = boardMain;
	}
	public int getBoardStar() {
		return boardStar;
	}
	public void setBoardStar(int boardStar) {
		this.boardStar = boardStar;
	}
	public int getRprtCnt() {
		return rprtCnt;
	}
	public void setRprtCnt(int rprtCnt) {
		this.rprtCnt = rprtCnt;
	}
	public Date getBoardRgd() {
		return boardRgd;
	}
	public void setBoardRgd(Date boardRgd) {
		this.boardRgd = boardRgd;
	}
	public int getBoardCatecd() {
		return boardCatecd;
	}
	public void setBoardCatecd(int boardCatecd) {
		this.boardCatecd = boardCatecd;
	}
	public String getBoardCate() {
		return boardCate;
	}
	public void setBoardCate(String boardCate) {
		this.boardCate = boardCate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBoardAddr() {
		return boardAddr;
	}
	public void setBoardAddr(String boardAddr) {
		this.boardAddr = boardAddr;
	}
	
	public String getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(String boardCnt) {
		this.boardCnt = boardCnt;
	}
	public String getPlaceTitle() {
		return placeTitle;
	}
	public void setPlaceTitle(String placeTitle) {
		this.placeTitle = placeTitle;
	}
	
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardMain=" + boardMain
				+ ", boardStar=" + boardStar + ", rprtCnt=" + rprtCnt + ", boardRgd=" + boardRgd + ", boardCatecd="
				+ boardCatecd + ", boardCate=" + boardCate + ", userId=" + userId + ", boardAddr=" + boardAddr
				+ ", boardCnt=" + boardCnt + ", placeTitle=" + placeTitle + "]";
	}
	
}
