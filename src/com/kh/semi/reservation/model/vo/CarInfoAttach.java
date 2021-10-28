package com.kh.semi.reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class CarInfoAttach implements Serializable {

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;

	private int no;
	private int carInfoNo;
	private String originalFileName;
	private Date regDate;
	
	public CarInfoAttach() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CarInfoAttach(int no, int carInfoNo, String originalFileName, Date regDate) {
		super();
		this.no = no;
		this.carInfoNo = carInfoNo;
		this.originalFileName = originalFileName;
		this.regDate = regDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCarInfoNo() {
		return carInfoNo;
	}

	public void setCarInfoNo(int carInfoNo) {
		this.carInfoNo = carInfoNo;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "CarInfoAttach [no=" + no + ", carInfoNo=" + carInfoNo + ", originalFileName=" + originalFileName
				+ ", regDate=" + regDate + "]";
	}
	
}
