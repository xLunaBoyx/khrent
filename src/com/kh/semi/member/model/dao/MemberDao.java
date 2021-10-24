    package com.kh.semi.member.model.dao;

import static com.kh.semi.common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filepath = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(filepath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertMember"); 
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getMemberRole());
			pstmt.setString(4, member.getMemberName());
			pstmt.setString(5, member.getPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public Member selectOneMember(Connection conn, String memberId) {
		String sql = prop.getProperty("selectOneMember");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				String password = rset.getString("member_pwd");
				String memberRole = rset.getString("member_role");
				String memberName = rset.getString("member_name");
				String phone = rset.getString("phone");
				int mileage = rset.getInt("mileage");
				Date regDate = rset.getDate("reg_date");
				Date issueDate = rset.getDate("issue_date");
				String licenseType = rset.getString("license_type");
				
				member = new Member(memberId, password, memberRole, memberName, phone, mileage, regDate, issueDate, licenseType);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 4.자원 반납
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

    public int updatePassword(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updatePassword"); 

		try {

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

    public int deleteMember(Connection conn, String membmerId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteMember"); 

		try {
			
			pstmt = conn.prepareStatement(query);
		
			pstmt.setString(1, membmerId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMemberPhone(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMemberPhone"); 
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getPhone());
			pstmt.setString(2, member.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
   