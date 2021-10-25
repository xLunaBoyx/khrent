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
import com.kh.semi.board.model.vo.QuestionBoard;

public class QuestionBoardDao {
	
	private Properties prop = new Properties();
	
	public QuestionBoardDao() {
		String filepath = QuestionBoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(filepath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<QuestionBoard> selectAllQuestionBoard(Connection conn, int startRownum, int endRownum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<QuestionBoard> list = new ArrayList<>();
		String sql = prop.getProperty("selectAllQuestionBoard");
		
		try {
			// 1. pstmt 객체 생성 & 미완성쿼리 값대입
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRownum);
			pstmt.setInt(2, endRownum);
			
			// 2. 쿼리 실행
			rset = pstmt.executeQuery();
			while(rset.next()) {
				QuestionBoard qnaBoard = new QuestionBoard();
				
				qnaBoard.setNo(rset.getInt("qna_no"));
				qnaBoard.setQna_title(rset.getString("qna_title"));
				qnaBoard.setWriter(rset.getString("qna_writer"));
				qnaBoard.setQna_content(rset.getString("qna_content"));
				qnaBoard.setAnswer_status(rset.getString("answer_status"));
				qnaBoard.setRegDate(rset.getDate("reg_date"));
				qnaBoard.setReadCount(rset.getInt("read_count"));
				
				qnaBoard.setBoardCommentCount(rset.getInt("bc_count"));
				System.out.println("qnaBoard = " + qnaBoard);
				
				if(rset.getInt("attach_no") != 0) {
					Attachment attach = new Attachment();
					attach.setNo(rset.getInt("attach_no"));
					attach.setBoardNo(rset.getInt("attach_no"));
					attach.setOriginalFilename(rset.getString("original_filename"));
					attach.setRenamedFilename(rset.getString("renamed_filename"));
					attach.setRegDate(rset.getDate("attach_reg_date"));
					
					qnaBoard.setAttach(attach);
				}
				
				list.add(qnaBoard);
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

	public int selectTotalQuestionContents(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalContents = 0;
		String sql = prop.getProperty("selectTotalQuestionContents");
		
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
	public QuestionBoard selectOneBoard(Connection conn, int no) {
		QuestionBoard questionBoard = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOneQuestionBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				questionBoard = new QuestionBoard();
				
				questionBoard.setNo(rset.getInt("qna_no"));
				questionBoard.setWriter(rset.getString("qna_writer"));
				questionBoard.setQna_title(rset.getString("qna_title"));
				questionBoard.setQna_content(rset.getString("qna_content"));
				questionBoard.setRegDate(rset.getDate("reg_date"));
				questionBoard.setReadCount(rset.getInt("read_count"));
				questionBoard.setAnswer_status(rset.getString("answer_status"));
				questionBoard.setBoardCommentCount(rset.getInt("bc_count"));
		
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return questionBoard;
	}

	

}
