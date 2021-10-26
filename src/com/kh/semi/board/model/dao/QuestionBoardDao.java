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
import com.kh.semi.board.model.vo.QuestionBoard;
import com.kh.semi.board.model.vo.QuestionBoardComment;

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
	public int insertBoard(Connection conn, QuestionBoard questionBoard) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, questionBoard.getWriter());
			pstmt.setString(2, questionBoard.getQna_title());
			pstmt.setString(3, questionBoard.getQna_content());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			//throw new BoardException("게시글 등록 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectLastBoardNo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLastBoardNo");
		int boardNo = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				boardNo = rset.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			//throw new BoardException("게시물번호 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return boardNo;
	}

	public int insertAttachment(Connection conn, Attachment attach) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, attach.getBoardNo());
			pstmt.setString(2, attach.getOriginalFilename());
			pstmt.setString(3, attach.getRenamedFilename());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			//throw new BoardException("첨부파일 등록 오류", e);
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<QuestionBoard> ajaxMainQuestionBoardList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<QuestionBoard> list = new ArrayList<>();
		String sql = prop.getProperty("selectHomeQnaBoardList");
		
		try {
			// 1. pstmt 객체 생성 & 미완성쿼리 값대입
			pstmt = conn.prepareStatement(sql);
			
			// 2. 쿼리 실행
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				QuestionBoard qnaBoard = new QuestionBoard();
				
				qnaBoard.setQna_title(rset.getString("qna_title"));
				qnaBoard.setRegDate(rset.getDate("reg_date"));

				System.out.println("qnaBoard = " + qnaBoard);
				
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

	public int updateQnaReadCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateQnaReadCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<QuestionBoardComment> selectQnaCommentList(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<QuestionBoardComment> commentList = new ArrayList<>();
		String sql = prop.getProperty("selectQnaCommentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				QuestionBoardComment boardComment = new QuestionBoardComment();
				
				boardComment.setNo(rset.getInt("no"));
				boardComment.setBoardNo(rset.getInt("qna_no"));
				boardComment.setWriter(rset.getString("writer"));
				boardComment.setContent(rset.getString("content"));
				boardComment.setRegDate(rset.getDate("reg_date"));
				boardComment.setCommentLevel(rset.getInt("comment_level"));
				boardComment.setCommentRef(rset.getInt("comment_ref"));
				
				commentList.add(boardComment);
			}
			
		} catch (SQLException e) {
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return commentList;
	}

	public int insertQnaBoardComment(Connection conn, QuestionBoardComment bc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertQnaBoardComment");
		System.out.println("QuestionBoardDao@sql = " + sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bc.getBoardNo());
			pstmt.setString(2, bc.getWriter());
			pstmt.setString(3, bc.getContent());
			pstmt.setInt(4, bc.getCommentLevel());
			pstmt.setObject(5, bc.getCommentRef() == 0 ? null : bc.getCommentRef());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
