package com.kh.semi.reservation.model.service;

import static com.kh.semi.common.JdbcTemplate.close;
import static com.kh.semi.common.JdbcTemplate.commit;
import static com.kh.semi.common.JdbcTemplate.getConnection;
import static com.kh.semi.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.reservation.model.dao.ReservationDao;
import com.kh.semi.reservation.model.vo.Car;
import com.kh.semi.reservation.model.vo.Reservation;

public class ReservationService {

	private ReservationDao reservationDao = new ReservationDao();

	public List<Car> searchCar(String startDate, String endDate) {
		Connection conn = getConnection();
		List<Car> list = reservationDao.searchCar(conn, startDate, endDate);
		close(conn);
		
		return list;
	}

	public Car selectOneCar(String carCode) {
		Connection conn = getConnection();
		Car car = reservationDao.selectOneCar(conn, carCode);
		return car;
	}

	public int insertReservation(Reservation reservation) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			result = reservationDao.insertReservation(conn, reservation);
			
			commit(conn);
			
		} catch(Exception e) {
			rollback(conn);
			result = 0;
		}
		
		close(conn);
		return result;
	}
	
	
}
