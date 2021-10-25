package com.kh.semi.reservation.model.vo;

import java.io.Serializable;

public class CarList implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String carCode;
	private String carName;
	private String startDate;
	private String endDate;
	private String numberPlate;
	
	public CarList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CarList(String carCode, String carName, String startDate, String endDate, String numberPlate) {
		super();
		this.carCode = carCode;
		this.carName = carName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.numberPlate = numberPlate;
	}

	public String getCarCode() {
		return carCode;
	}

	public void setCarCode(String carCode) {
		this.carCode = carCode;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getNumberPlate() {
		return numberPlate;
	}

	public void setNumberPlate(String numberPlate) {
		this.numberPlate = numberPlate;
	}

	@Override
	public String toString() {
		return "CarList [carCode=" + carCode + ", carName=" + carName + ", startDate=" + startDate + ", endDate="
				+ endDate + ", numberPlate=" + numberPlate + "]";
	}
	
	
	
}

