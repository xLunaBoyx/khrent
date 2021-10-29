package com.kh.semi.admin.model.dao;

import static com.kh.semi.common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.reservation.model.vo.Car;
import com.kh.semi.reservation.model.vo.CarInfo;
import com.kh.semi.reservation.model.vo.CarList;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		String filepath = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(filepath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Car> selectTotalCarList(Connection conn, int startRownum, int endRownum) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectTotalCarList"); 
		
		ResultSet rset = null;
		List<Car> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRownum);
			pstmt.setInt(2, endRownum);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Car car = new Car();

				car.setCarCode(rset.getString("car_code"));
				car.setCarName(rset.getString("car_name"));
				car.setMaker(rset.getString("maker"));
				car.setFuel(rset.getString("fuel"));
				car.setCarSize(rset.getString("car_size"));
				car.setReleaseYear(rset.getString("release_year"));
				car.setImg(rset.getString("img"));
				car.setCarOption(rset.getString("car_option"));
				car.setPrice(rset.getInt("price"));
				car.setNumberPlate(rset.getString("number_plate"));
				car.setAssessCnt(rset.getInt("assess_cnt"));
				car.setAvgScore(rset.getInt("avg_score"));
				car.setReservCnt(rset.getInt("reserv_cnt"));
			
				list.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 4.자원반납
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int selectTotalCarContents(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTotalCarContents");
		int totalContents = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
				totalContents = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}

	public List<Car> searchCar(Connection conn, Map<String, Object> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Car> list = new ArrayList<>();
		String sql = null;
		String searchType = (String) param.get("searchType");
		
		switch(searchType) {
		case "carCode":
			sql = prop.getProperty("searchCarByCarCode");
			param.put("searchKeyword", "%" + param.get("searchKeyword")); 
			break;
		case "carName":
			sql = prop.getProperty("searchCarByCarName");
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%"); 
			break;
		case "maker":
			sql = prop.getProperty("searchCarByMaker");
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%");
			break;
		case "fuel":
			sql = prop.getProperty("searchCarByFuel");
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%");
			break;
		case "carSize":
			sql = prop.getProperty("searchCarByCarSize");
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%");
			break;
		case "numberPlate":
			sql = prop.getProperty("searchCarByNumberPlate");
			param.put("searchKeyword", "%" + param.get("searchKeyword"));
			break;
		}
		
		System.out.println("searchType@dao = " + searchType);
		System.out.println("sql@dao = " + sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, (String) param.get("searchKeyword"));
			pstmt.setInt(2, (int) param.get("start"));
			pstmt.setInt(3, (int) param.get("end"));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Car car = new Car();
				
				car.setCarCode(rset.getString("car_code"));
				car.setCarName(rset.getString("car_name"));
				car.setMaker(rset.getString("maker"));
				car.setFuel(rset.getString("fuel"));
				car.setCarSize(rset.getString("car_size"));
				car.setReleaseYear(rset.getString("release_year"));
				car.setImg(rset.getString("img"));
				car.setCarOption(rset.getString("car_option"));
				car.setPrice(rset.getInt("price"));
				car.setNumberPlate(rset.getString("number_plate"));
				car.setAssessCnt(rset.getInt("assess_cnt"));
				car.setAvgScore(rset.getInt("avg_score"));
				car.setReservCnt(rset.getInt("reserv_cnt"));
			
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

	public int searchCarCount(Connection conn, Map<String, Object> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalContents = 0;
		
		String sql = null;
		String searchType = (String) param.get("searchType");
		
		switch(searchType) {
		case "carCode":
			sql = prop.getProperty("searchCarCountByCarCode");
			param.put("searchKeyword", "%" + param.get("searchKeyword")); 
			break;
		case "carName":
			sql = prop.getProperty("searchCarCountByCarName");
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%"); 
			break;
		case "maker":
			sql = prop.getProperty("searchCarCountByMaker");
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%");
			break;
		case "fuel":
			sql = prop.getProperty("searchCarCountByFuel");
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%");
			break;
		case "carSize":
			sql = prop.getProperty("searchCarCountByCarSize");
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%");
			break;
		case "numberPlate":
			sql = prop.getProperty("searchCarCountByNumberPlate");
			param.put("searchKeyword", "%" + param.get("searchKeyword"));
			break;
		}
		
		System.out.println("sql@dao = " + sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, (String) param.get("searchKeyword"));
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
				totalContents = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalContents;
	}

	public int selectLastCarInfoNo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLastCarInfoNo");
		int carInfoNo = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				carInfoNo = rset.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			//throw new BoardException("게시물번호 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return carInfoNo;
	}

	public int insertCarInfo(Connection conn, CarInfo carInfo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCarInfo");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, carInfo.getCarName());
			pstmt.setString(2, carInfo.getMaker());
			pstmt.setString(3, carInfo.getFuel());
			pstmt.setString(4, carInfo.getCarSize());
			pstmt.setString(5, carInfo.getImg());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			//throw new BoardException("게시글 등록 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectCarInfoTotalContents(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCarInfoTotalContents");
		int totalContents = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
				totalContents = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalContents;
	}

	public int insertCarList(Connection conn, CarList carList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertCarList"); 
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, carList.getCarName());
			pstmt.setString(2, carList.getReleaseYear());
			pstmt.setString(3, carList.getCarOption());
			pstmt.setInt(4, carList.getPrice());
			pstmt.setString(5, carList.getNumberPlate());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
