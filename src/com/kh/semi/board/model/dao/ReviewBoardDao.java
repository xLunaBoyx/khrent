package com.kh.semi.board.model.dao;
import static com.kh.semi.common.JdbcTemplate.close;
import java.sql.Connection;
import java.io.FileReader;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.semi.reservation.model.vo.Reservation;

public class ReviewBoardDao {

	private Properties prop = new Properties();
	public ReviewBoardDao() {
		String filepath = ReviewBoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(filepath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Reservation> selectOneReservation(String reserNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Reservation> reservationList = new ArrayList<>();
		String sql = prop.getProperty("selectOneReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reserNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Reservation reservation = new Reservation();
				
				reservation.setReserNo(rset.getString("reserv_no"));
				reservation.setCarCode(rset.getString("car_code"));
				reservation.setCarName(rset.getString("car_name"));
				reservation.setStartDate(rset.getString("start_date"));
				reservation.setEndDate(rset.getString("end_date"));
				reservation.setPrice(rset.getInt("price"));
				reservation.setReviewStatus(rset.getString("review_status"));
				reservation.setReturnStatus(rset.getString("return_status"));
				
				reservationList.add(reservation);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return reservationList;
	}

}
