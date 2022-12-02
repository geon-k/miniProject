package com.ezen.springboard.vo;

public class BoardFileVO {
	private int fileNo;
	private int boardNo;
	private String fileName;
	private String oriFileName;
	private String filePath;
	private String fileCate;
	private String fileStatus;
	private String newFileNm;
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getfileCate() {
		return fileCate;
	}
	public void setfileCate(String FileCate) {
		this.fileCate = FileCate;
	}
	public String getFileStatus() {
		return fileStatus;
	}
	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}
	public String getNewFileNm() {
		return newFileNm;
	}
	public void setNewFileNm(String newFileNm) {
		this.newFileNm = newFileNm;
	}
	
	@Override
	public String toString() {
		return "BoardFileVO [fileNo=" + fileNo + ", boardNo=" + boardNo + ", fileName=" + fileName + ", oriFileName="
				+ oriFileName + ", filePath=" + filePath + ", fileCate=" + fileCate + ", fileStatus=" + fileStatus
				+ ", newFileNm=" + newFileNm + "]";
	}
	
}
