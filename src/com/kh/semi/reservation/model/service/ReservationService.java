package com.kh.semi.reservation.model.service;

import static com.kh.semi.common.JdbcTemplate.*;
import java.sql.Connection;
import java.util.List;
import com.kh.semi.reservation.model.dao.ReservationDao;
import com.kh.semi.reservation.model.vo.Car;
import com.kh.semi.reservation.model.vo.CarInfo;
import com.kh.semi.reservation.model.vo.CarList;

public class ReservationService {

	private ReservationDao reservationDao = new ReservationDao();

	public List<Car> searchCar(String startDate, String endDate) {
		Connection conn = getConnection();
		List<Car> list = reservationDao.searchCar(conn, startDate, endDate);
		close(conn);
		
		return list;
	}
	
	
}
