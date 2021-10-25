package com.kh.semi.board.model.service;

import static com.kh.semi.common.JdbcTemplate.close;
import static com.kh.semi.common.JdbcTemplate.commit;
import static com.kh.semi.common.JdbcTemplate.getConnection;
import static com.kh.semi.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.board.model.dao.QuestionBoardDao;
import com.kh.semi.board.model.vo.Attachment;
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
	
	public QuestionBoard selectOneBoard(int no) {
		Connection conn = getConnection();
		
		QuestionBoard questionBoard =  questionBoardDao.selectOneBoard(conn,no);
		
		close(conn);
		
		return questionBoard;
	}
	
	public int insertBoard(QuestionBoard questionBoard) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			// board테이블 행추가
			result = questionBoardDao.insertBoard(conn, questionBoard);
			
			// 생성된 board_no 가져오기
			int questionBoardNo = questionBoardDao.selectLastBoardNo(conn);
			System.out.println("questionBoardNo@service = " + questionBoardNo);
			
			// board객체에 set -> servlet에서 참조
			questionBoard.setNo(questionBoardNo);
			
			// attachment테이블 행추가
			Attachment attach = questionBoard.getAttach();
			if(attach != null) {
				attach.setBoardNo(questionBoardNo);
				result = questionBoardDao.insertAttachment(conn, attach);
			}
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			result = 0;
		}
		
		close(conn);
		return result;
	}
}
