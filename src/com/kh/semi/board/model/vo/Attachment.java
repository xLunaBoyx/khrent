package com.kh.semi.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private int boardNo;
	private String originalFilename; 
	private String renamedFilename; 
	private Date regDate;
	
	public Attachment() {
		super();
	}
	
	@Override
	public String toString() {
		return "Attachment [no=" + no + ", boardNo=" + boardNo + ", originalFilename=" + originalFilename
				+ ", renamedFilename=" + renamedFilename + ", regDate=" + regDate + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getRenamedFilename() {
		return renamedFilename;
	}
	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Attachment(int no, int boardNo, String originalFilename, String renamedFilename, Date regDate) {
		super();
		this.no = no;
		this.boardNo = boardNo;
		this.originalFilename = originalFilename;
		this.renamedFilename = renamedFilename;
		this.regDate = regDate;
	} 

}
