package com.kh.semi.board.model.service;

import static com.kh.semi.common.JdbcTemplate.*;
import java.sql.Connection;
import java.util.List;
import com.kh.semi.board.model.dao.CommunityBoardDao;
import com.kh.semi.board.model.vo.CommunityBoard;
import com.kh.semi.board.model.vo.CommunityBoardComment;

public class CommunityBoardService {
	
	private CommunityBoardDao communityBoardDao = new CommunityBoardDao();

	public List<CommunityBoard> selectAllCommunityBoard(int startRownum, int endRownum) {
		Connection conn = getConnection();
		List<CommunityBoard> list = communityBoardDao.selectAllCommunityBoard(conn, startRownum, endRownum);
		close(conn);
		
		return list;
	}

	public int selectTotalCommunityContents() {
		Connection conn = getConnection();        
		int totalContents = communityBoardDao.selectTotalCommunityContents(conn);

		close(conn);
		return totalContents;
	}

	public CommunityBoard selectOneBoard(int no) {
		Connection conn = getConnection();
		
		CommunityBoard communityBoard =  communityBoardDao.selectOneBoard(conn,no);
		
		close(conn);
		
		return communityBoard;
	}

	public int insertCommunityComment(CommunityBoardComment communityBoardComment) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = communityBoardDao.insertCommunityComment(conn,communityBoardComment);
		}catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
		
	}

	public List<CommunityBoardComment> selectCommentList(int no) {
		Connection conn = getConnection();
		List<CommunityBoardComment> list = null;
		
		list = communityBoardDao.selectCommentList(conn,no);
		
		close(conn);
		
		return list;
	}

}




