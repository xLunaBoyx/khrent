package com.kh.semi.board.model.service;

import static com.kh.semi.common.JdbcTemplate.close;
import static com.kh.semi.common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.board.model.dao.QuestionBoardDao;
import com.kh.semi.board.model.vo.QuestionBoard;

public class QuestionBoardService {

	private QuestionBoardDao questionBoardDao = new QuestionBoardDao();
	
	public List<QuestionBoard> selectAllQeustionBoard(int startRownum, int endRownum) {
		Connection conn = getConnection();
		List<QuestionBoard> list = questionBoardDao.selectAllQuestionBoard(conn, startRownum, endRownum);
		close(conn);
		
		return list;
	}

	public int selectTotalQuestionContents() {
		Connection conn = getConnection();        
		int totalContents = questionBoardDao.selectTotalQuestionContents(conn);

		close(conn);
		return totalContents;
	}
	
	
}
