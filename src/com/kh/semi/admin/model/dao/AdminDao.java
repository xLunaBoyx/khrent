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
import com.kh.semi.reservation.model.vo.CarList;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		String filepath = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(filepath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<CarList> selectAllCar(Connection conn, int startRownum, int endRownum) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAllCar"); 
		
		ResultSet rset = null;
		List<CarList> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRownum);
			pstmt.setInt(2, endRownum);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				CarList carList = new CarList();
				
				carList.setCarCode(rset.getString("car_code"));
				carList.setCarName(rset.getString("car_name"));
				carList.setReleaseYear(rset.getString("release_year"));
				carList.setCarOption(rset.getString("car_option"));
				carList.setPrice(rset.getInt("price"));
				carList.setNumberPlate(rset.getString("number_plate"));
			
				list.add(carList);
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

	public int selectTotalContents(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTotalContents");
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

	public List<CarList> searchCar(Connection conn, Map<String, Object> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<CarList> list = new ArrayList<>();
		String sql = null;
		String searchType = (String) param.get("searchType");
		
		switch(searchType) {
		case "carCode":
			sql = prop.getProperty("searchCarByCarCode");
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%"); 
			break;
		case "carName":
			sql = prop.getProperty("searchCarByCarName");
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%");
			break;
		case "numberPlate":
			sql = prop.getProperty("searchCarByCarNumberPlate");
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%");
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
				
				CarList carList = new CarList();
				
				carList.setCarCode(rset.getString("car_code"));
				carList.setCarName(rset.getString("car_name"));
				carList.setReleaseYear(rset.getString("release_year"));
				carList.setCarOption(rset.getString("car_option"));
				carList.setPrice(rset.getInt("price"));
				carList.setNumberPlate(rset.getString("number_plate"));
			
				list.add(carList);
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
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%"); 
			break;
		case "carName":
			sql = prop.getProperty("searchCarCountByCarName");
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%");
			break;
		case "numberPlate":
			sql = prop.getProperty("searchCarCountByCarNumberPlate");
			param.put("searchKeyword", "%" + param.get("searchKeyword") + "%");
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

}
