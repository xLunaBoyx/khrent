package com.kh.semi.reservation.model.dao;

import static com.kh.semi.common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.semi.board.model.dao.CommunityBoardDao;
import com.kh.semi.reservation.model.vo.CarInfo;
import com.kh.semi.reservation.model.vo.CarList;

public class ReservationDao {
	
	private Properties prop = new Properties();
	
	public ReservationDao() {
		String filepath = CommunityBoardDao.class.getResource("/sql/reservation/reservation-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filepath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<CarInfo> searchCar(Connection conn, String startDate, String endDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<CarInfo> list = new ArrayList<>();
		String sql = prop.getProperty("searchCar");
		System.out.println(sql);
		System.out.println("sdate = " + startDate);
		System.out.println("edate = " + endDate);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate);
			pstmt.setString(3, startDate);
			pstmt.setString(4, endDate);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				CarInfo car = new CarInfo();
				
				car.setCarInfoNo(rset.getInt("car_info_no"));
				car.setCarName(rset.getString("car_name"));
				car.setFuel(rset.getString("fuel"));
				car.setBackCamera(rset.getString("back_camera"));
				car.setNavigation(rset.getString("navigation"));
				car.setBlackbox(rset.getString("blackbox"));
				car.setSmoke(rset.getString("smoke"));
				car.setMaker(rset.getString("maker"));
				car.setRelease(rset.getString("release"));
				car.setCapacity(rset.getString("capacity"));
				car.setPrice(rset.getInt("price"));
				car.setCarSize(rset.getString("car_size"));
				car.setImg(rset.getString("img"));
				
				list.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
