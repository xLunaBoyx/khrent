package com.kh.semi.board.model.dao;

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

import com.kh.semi.board.model.vo.Attachment;
import com.kh.semi.board.model.vo.CommunityBoard;

public class CommunityBoardDao {
	
	private Properties prop = new Properties();
	
	public CommunityBoardDao() {
		String filepath = CommunityBoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(filepath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<CommunityBoard> selectAllCommunityBoard(Connection conn, int startRownum, int endRownum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<CommunityBoard> list = new ArrayList<>();
		String sql = prop.getProperty("selectAllCommunityBoard");
		
		try {
			// 1. pstmt 객체 생성 & 미완성쿼리 값대입
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRownum);
			pstmt.setInt(2, endRownum);
			
			// 2. 쿼리 실행
			rset = pstmt.executeQuery();
			while(rset.next()) {
				CommunityBoard board = new CommunityBoard();
				
				board.setNo(rset.getInt("community_no"));
				board.setTitle(rset.getString("community_title"));
				board.setWriter(rset.getString("community_writer"));
				board.setContent(rset.getString("community_content"));
				board.setRegDate(rset.getDate("reg_date"));
				board.setReadCount(rset.getInt("read_count"));
				
				board.setBoardCommentCount(rset.getInt("bc_count"));
				System.out.println("board = " + board);
				
				if(rset.getInt("attach_no") != 0) {
					Attachment attach = new Attachment();
					attach.setNo(rset.getInt("attach_no"));
					attach.setBoardNo(rset.getInt("attach_no"));
					attach.setOriginalFilename(rset.getString("original_filename"));
					attach.setRenamedFilename(rset.getString("renamed_filename"));
					attach.setRegDate(rset.getDate("attach_reg_date"));
					
					board.setAttach(attach);
				}
				
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 3. 자원반납
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	
	public int selectTotalCommunityContents(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalContents = 0;
		String sql = prop.getProperty("selectTotalCommunityContents");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next())
				totalContents = rset.getInt("cnt");   // ()안에는 컬럼명 또는 컬럼의 순서
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return totalContents;
	}

	public CommunityBoard selectOneBoard(Connection conn, int no) {
		CommunityBoard communityBoard = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOneCommunityBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				communityBoard = new CommunityBoard();
				
				communityBoard.setNo(rset.getInt("community_no"));
				communityBoard.setWriter(rset.getString("member_id"));
				communityBoard.setTitle(rset.getString("title"));
				communityBoard.setContent(rset.getString("content"));
				communityBoard.setRegDate(rset.getDate("reg_date"));
				communityBoard.setReadCount(rset.getInt("read_count"));				
				communityBoard.setBoardCommentCount(rset.getInt("bc_count"));
		
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return communityBoard;
	}

}
