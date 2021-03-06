package com.kh.semi.board.model.service;

import static com.kh.semi.common.JdbcTemplate.*;
import java.sql.Connection;
import java.util.List;
import com.kh.semi.board.model.dao.CommunityBoardDao;
import com.kh.semi.board.model.vo.Attachment;
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
		Attachment attach = communityBoardDao.selectOneAttachmentByCommunityBoardNo(conn, no);
		communityBoard.setAttach(attach);
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

	public int updateReadCount(int no) {
		Connection conn = getConnection();
		int result = communityBoardDao.updateReadCount(conn,no);
	
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result;
	}

	public int insertCommunityBoard(CommunityBoard communityBoard) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			// board????????? ?????????
			result = communityBoardDao.insertCommunityBoard(conn, communityBoard);
			
			// ????????? board_no ????????????
			int communityBoardNo = communityBoardDao.selectLastCommunityBoardNo(conn);
			System.out.println("questionBoardNo@service = " + communityBoardNo);
			
			// board????????? set -> servlet?????? ??????
			communityBoard.setNo(communityBoardNo);
			
			// attachment????????? ?????????
			Attachment attach = communityBoard.getAttach();
			if(attach != null) {
				attach.setBoardNo(communityBoardNo);
				result = communityBoardDao.insertCommunityAttachment(conn, attach);
			}
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			result = 0;
		}
		
		close(conn);
		return result;
	}

	public Attachment selectOneCommunityAttachment(int no) {
		Connection conn = getConnection();
		Attachment attach = communityBoardDao.selectOneCommunityAttachment(conn, no);
		close(conn);
		return attach;
	}

	public int deleteCommunityBoard(int no) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = communityBoardDao.deleteCommunityBoard(conn, no);
			if(result == 0)
				throw new IllegalArgumentException("?????? ???????????? ???????????? ????????????. : " + no );
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			throw e; //controller??? ??????????????? ????????? ??? ????????? ??????.
		} finally {
			close(conn);
		}
		return result;
	}

	public int deleteCommunityAttachment(int attachNo) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = communityBoardDao.deleteCommunityAttachment(conn, attachNo);
			if(result == 0)
				throw new IllegalArgumentException("?????? ??????????????? ???????????? ????????????. : " + attachNo);
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			throw e; //controller??? ??????????????? ????????? ??? ????????? ??????.
		} finally {
			close(conn);
		}
		
		return result;
	}

	public int updateCommunityBoard(CommunityBoard communityBoard) {
		Connection conn = getConnection();
		int result = 0;
		try {
			// 1. ????????? ?????? - update board
			result = communityBoardDao.updateCommunityBoard(conn, communityBoard);
			
			// 2. ??????????????? ?????? ?????? - insert into attachment
			Attachment attach = communityBoard.getAttach();
			if(attach != null) {
				// ?????? boardEnroll?????? ?????? ?????????. ??????????????? ??????????????? ????????? ?????? ???????????? ????????? ???????????? ?????? ?????????, ???????????? ??????????????? ?????? ???????????? ??? ????????? ????????????.
				result = communityBoardDao.insertCommunityAttachment(conn, attach);   
			}
			
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	public int deleteCommunityBoardComment(int no) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			result = communityBoardDao.deleteCommunityBoardComment(conn, no);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

}




