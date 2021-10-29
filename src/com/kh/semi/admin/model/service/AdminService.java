package com.kh.semi.admin.model.service;

import static com.kh.semi.common.JdbcTemplate.close;
import static com.kh.semi.common.JdbcTemplate.commit;
import static com.kh.semi.common.JdbcTemplate.getConnection;
import static com.kh.semi.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.kh.semi.admin.model.dao.AdminDao;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.reservation.model.vo.Car;
import com.kh.semi.reservation.model.vo.CarInfo;
import com.kh.semi.reservation.model.vo.CarList;

public class AdminService {

	private AdminDao adminDao = new AdminDao();

	public List<Car> selectTotalCarList(int startRownum, int endRownum) {
		Connection conn = getConnection();
		List<Car> list = adminDao.selectTotalCarList(conn, startRownum, endRownum);
		close(conn);
		return list;
	}
	
	public int selectTotalCarContents() {
		Connection conn = getConnection();
		int totalContent = adminDao.selectTotalCarContents(conn);
		close(conn);
		return totalContent;
	}

	public List<Car> searchCar(Map<String, Object> param) {
		Connection conn = getConnection();
		List<Car> list = adminDao.searchCar(conn, param);
		close(conn);
		return list;
	}

	public int searchCarCount(Map<String, Object> param) {
		Connection conn = getConnection();
		int totalContent = adminDao.searchCarCount(conn, param);
		close(conn);
		return totalContent;
	}

	public int insertCarInfo(CarInfo carInfo) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			// board테이블 행추가
			result = adminDao.insertCarInfo(conn, carInfo);
			
			// 생성된 board_no 가져오기
			int carInfoNo = adminDao.selectLastCarInfoNo(conn);
			System.out.println("carInfoNo@service = " + carInfoNo);
			
			// board객체에 set -> servlet에서 참조
			carInfo.setCarInfoNo(carInfoNo);
			
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			result = 0;
		}
		
		close(conn);
		return result;
	}

	public int selectCarInfoTotalContents() {
		Connection conn = getConnection();
		int totalContent = adminDao.selectCarInfoTotalContents(conn);
		close(conn);
		return totalContent;
	}

	public int insertCarList(CarList carList) {
		Connection conn = getConnection();
		int result = adminDao.insertCarList(conn, carList);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}

	public CarList selectOneCar(String carCode) {
		Connection conn = getConnection();
		CarList carList = adminDao.selectOneCar(conn, carCode);
		close(conn);
		return carList;
	}

	public int adminCarListUpdate(CarList carList) {
		Connection conn = getConnection();
		int result = adminDao.adminCarListUpdate(conn, carList);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}




}
