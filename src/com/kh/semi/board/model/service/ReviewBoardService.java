package com.kh.semi.board.model.service;
import static com.kh.semi.common.JdbcTemplate.close;
import static com.kh.semi.common.JdbcTemplate.getConnection;
import static com.kh.semi.common.JdbcTemplate.commit;
import static com.kh.semi.common.JdbcTemplate.rollback;
import java.sql.Connection;
import java.util.List;

import com.kh.semi.board.model.dao.ReviewBoardDao;
import com.kh.semi.reservation.model.vo.Reservation;

public class ReviewBoardService {

	private ReviewBoardDao reviewBoardDao = new ReviewBoardDao();
	
	public List<Reservation> selectOneReservation(String reserNo) {
		Connection conn = getConnection();
		List<Reservation> reservationList = reviewBoardDao.selectOneReservation(reserNo, conn);
		close(conn);
		return reservationList;
	}

}
