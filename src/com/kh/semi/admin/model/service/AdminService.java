package com.kh.semi.admin.model.service;

import static com.kh.semi.common.JdbcTemplate.close;
import static com.kh.semi.common.JdbcTemplate.commit;
import static com.kh.semi.common.JdbcTemplate.getConnection;
import static com.kh.semi.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.kh.semi.admin.model.dao.AdminDao;
import com.kh.semi.board.model.vo.Attachment;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.reservation.model.vo.CarInfo;
import com.kh.semi.reservation.model.vo.CarInfoAttach;
import com.kh.semi.reservation.model.vo.CarList;

public class AdminService {

	private AdminDao adminDao = new AdminDao();
	
	public List<CarList> selectAllCar(int startRownum, int endRownum) {
		Connection conn = getConnection();
		List<CarList> list = adminDao.selectAllCar(conn, startRownum, endRownum);
		close(conn);
		return list;
	}
	
	public int selectTotalContents() {
		Connection conn = getConnection();
		int totalContent = adminDao.selectTotalContents(conn);
		close(conn);
		return totalContent;
	}

	public List<CarList> searchCar(Map<String, Object> param) {
		Connection conn = getConnection();
		List<CarList> list = adminDao.searchCar(conn, param);
		close(conn);
		return list;
	}

	public int searchCarCount(Map<String, Object> param) {
		Connection conn = getConnection();
		int totalContent = adminDao.searchCarCount(conn, param);
		close(conn);
		return totalContent;
	}

	public List<CarInfo> selectAllCarInfo(int startRownum, int endRownum) {
		Connection conn = getConnection();
		List<CarInfo> list = adminDao.selectAllCarInfo(conn, startRownum, endRownum);
		close(conn);
		return list;
	}

	public List<CarInfo> searchCarInfo(Map<String, Object> param) {
		Connection conn = getConnection();
		List<CarInfo> list = adminDao.searchCarInfo(conn, param);
		close(conn);
		return list;
	}

	public int searchCarInfoCount(Map<String, Object> param) {
		Connection conn = getConnection();
		int totalContent = adminDao.searchCarInfoCount(conn, param);
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


}
