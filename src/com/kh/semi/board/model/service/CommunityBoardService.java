package com.kh.semi.board.model.service;

import static com.kh.semi.common.JdbcTemplate.*;
import java.sql.Connection;
import java.util.List;
import com.kh.semi.board.model.dao.CommunityBoardDao;
import com.kh.semi.board.model.vo.CommunityBoard;

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

}