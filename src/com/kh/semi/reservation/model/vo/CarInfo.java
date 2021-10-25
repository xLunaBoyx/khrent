package com.kh.semi.reservation.model.vo;

import java.io.Serializable;

public class CarInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int carInfoNo;
	private String carName;
	private String fuel;
	private String backCamera;
	private String navigation;
	private String blackbox;
	private String smoke;
	private String maker;
	private String release;
	private String capacity;
	private int price;
	private String carSize;
	private String img;
	
	public CarInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CarInfo(int carInfoNo, String carName, String fuel, String backCamera, String navigation, String blackbox,
			String smoke, String maker, String release, String capacity, int price, String carSize, String img) {
		super();
		this.carInfoNo = carInfoNo;
		this.carName = carName;
		this.fuel = fuel;
		this.backCamera = backCamera;
		this.navigation = navigation;
		this.blackbox = blackbox;
		this.smoke = smoke;
		this.maker = maker;
		this.release = release;
		this.capacity = capacity;
		this.price = price;
		this.carSize = carSize;
		this.img = img;
	}

	public int getCarInfoNo() {
		return carInfoNo;
	}

	public void setCarInfoNo(int carInfoNo) {
		this.carInfoNo = carInfoNo;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getFuel() {
		return fuel;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
	}

	public String getBackCamera() {
		return backCamera;
	}

	public void setBackCamera(String backCamera) {
		this.backCamera = backCamera;
	}

	public String getNavigation() {
		return navigation;
	}

	public void setNavigation(String navigation) {
		this.navigation = navigation;
	}

	public String getBlackbox() {
		return blackbox;
	}

	public void setBlackbox(String blackbox) {
		this.blackbox = blackbox;
	}

	public String getSmoke() {
		return smoke;
	}

	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getRelease() {
		return release;
	}

	public void setRelease(String release) {
		this.release = release;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCarSize() {
		return carSize;
	}

	public void setCarSize(String carSize) {
		this.carSize = carSize;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "CarInfo [carInfoNo=" + carInfoNo + ", carName=" + carName + ", fuel=" + fuel + ", backCamera="
				+ backCamera + ", navigation=" + navigation + ", blackbox=" + blackbox + ", smoke=" + smoke + ", maker="
				+ maker + ", release=" + release + ", capacity=" + capacity + ", price=" + price + ", carSize="
				+ carSize + ", img=" + img + "]";
	}
	
	
	
	
}
