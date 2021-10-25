package com.kh.semi.board.model.service;

import static com.kh.semi.common.JdbcTemplate.close;
import static com.kh.semi.common.JdbcTemplate.getConnection;

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
	
	
	
}
