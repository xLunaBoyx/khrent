package com.kh.semi.reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reservation implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String reserNo;
	private String memberId;
	private String carCode;
	private String carName;
	private Date startDate;
	private Date endDate;
	private String insuranceType;
	private String issueDate;
	private String licenseType;
	private String reviewStatus;
	private String returnStatus;
	
	public Reservation() {
		super();
	}
	
	public Reservation(String reserNo, String memberId, String carCode, String carName, Date startDate, Date endDate,
			String insuranceType, String issueDate, String licenseType, String reviewStatus, String returnStatus) {
		super();
		this.reserNo = reserNo;
		this.memberId = memberId;
		this.carCode = carCode;
		this.carName = carName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.insuranceType = insuranceType;
		this.issueDate = issueDate;
		this.licenseType = licenseType;
		this.reviewStatus = reviewStatus;
		this.returnStatus = returnStatus;
	}
	
	public String getReserNo() {
		return reserNo;
	}
	public void setReserNo(String reserNo) {
		this.reserNo = reserNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getInsuranceType() {
		return insuranceType;
	}
	public void setInsuranceType(String insuranceType) {
		this.insuranceType = insuranceType;
	}
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public String getLicenseType() {
		return licenseType;
	}
	public void setLicenseType(String licenseType) {
		this.licenseType = licenseType;
	}
	public String getReviewStatus() {
		return reviewStatus;
	}
	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	public String getReturnStatus() {
		return returnStatus;
	}
	public void setReturnStatus(String returnStatus) {
		this.returnStatus = returnStatus;
	}
	
	@Override
	public String toString() {
		return "Reservation [reserNo=" + reserNo + ", memberId=" + memberId + ", carCode=" + carCode + ", carName="
				+ carName + ", startDate=" + startDate + ", endDate=" + endDate + ", insuranceType=" + insuranceType
				+ ", issueDate=" + issueDate + ", licenseType=" + licenseType + ", reviewStatus=" + reviewStatus
				+ ", returnStatus=" + returnStatus + "]";
	}
	
}
