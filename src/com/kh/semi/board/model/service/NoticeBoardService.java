package com.kh.semi.board.model.service;

import static com.kh.semi.common.JdbcTemplate.close;
import static com.kh.semi.common.JdbcTemplate.commit;
import static com.kh.semi.common.JdbcTemplate.getConnection;
import static com.kh.semi.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.board.model.dao.NoticeBoardDao;
import com.kh.semi.board.model.vo.NoticeBoard;
import com.kh.semi.board.model.vo.QuestionBoard;

public class NoticeBoardService {

	private NoticeBoardDao noticeBoardDao = new NoticeBoardDao();

	public List<NoticeBoard> selectAllNoticeBoard(int startRownum, int endRownum) {
		Connection conn = getConnection();
		List<NoticeBoard> list = noticeBoardDao.selectAllNoticeBoard(conn, startRownum, endRownum);
		close(conn);
		
		return list;
	}

	public int selectTotalNoticeContents() {
		Connection conn = getConnection();        
		int totalContents = noticeBoardDao.selectTotalNoticeContents(conn);

		close(conn);
		return totalContents;
	}
	
	public NoticeBoard selectOneBoard(int no) {
		Connection conn = getConnection();
		NoticeBoard noticeBoard =  noticeBoardDao.selectOneBoard(conn,no);
		close(conn);
		return noticeBoard;
	}
	public int insertNoticeBoard(NoticeBoard noticeBoard) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			// board테이블 행추가
			result = noticeBoardDao.insertNoticeBoard(conn, noticeBoard);
			
			// 생성된 board_no 가져오기
			int noticeBoardNo = noticeBoardDao.selectLastNoticeBoardNo(conn);
			System.out.println("noticeBoardNo@service = " + noticeBoardNo);
			
			// board객체에 set -> servlet에서 참조
			noticeBoard.setNoticeNo(noticeBoardNo);
			
			// attachment테이블 행추가
			
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			result = 0;
		}
		
		close(conn);
		return result;
	}
	
	
}
