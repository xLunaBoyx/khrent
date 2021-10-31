package com.kh.semi.board.model.service;
import static com.kh.semi.common.JdbcTemplate.close;
import static com.kh.semi.common.JdbcTemplate.getConnection;
import static com.kh.semi.common.JdbcTemplate.commit;
import static com.kh.semi.common.JdbcTemplate.rollback;
import java.sql.Connection;
import java.util.List;

import com.kh.semi.board.model.dao.ReviewBoardDao;
import com.kh.semi.board.model.vo.Attachment;
import com.kh.semi.board.model.vo.CommunityBoardComment;
import com.kh.semi.board.model.vo.ReviewBoard;
import com.kh.semi.board.model.vo.ReviewBoardComment;
import com.kh.semi.reservation.model.vo.Reservation;

public class ReviewBoardService {

	private ReviewBoardDao reviewBoardDao = new ReviewBoardDao();
	
	public List<Reservation> selectOneReservation(String reserNo) {
		Connection conn = getConnection();
		List<Reservation> reservationList = reviewBoardDao.selectOneReservation(reserNo, conn);
		close(conn);
		return reservationList;
	}

	public int insertReviewBoard(ReviewBoard reviewBoard) {
		Connection conn = getConnection();
		int result = 0;
		
		
		try {
			// review_board 테이블 행 추가
			result = reviewBoardDao.insertReviewBoard(conn, reviewBoard);
			
			// 생성된 review_no 가져오기
			int reviewBoardNo = reviewBoardDao.selectLastReviewBoardNo(conn);
			System.out.println("reviewBoardNo@servlet = " + reviewBoardNo);
			
			// reviewBoard객체에 set -> servlet에서 참조
			reviewBoard.setReviewNo(reviewBoardNo);
			
			// attachment테이블 행 추가
			Attachment attach = reviewBoard.getAttach();
			if(attach != null) {
				attach.setBoardNo(reviewBoardNo);
				result = reviewBoardDao.insertReviewAttachment(conn, attach);
			}
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			result = 0;
		}
		
		close(conn);
		return result;
	}

	public List<ReviewBoard> selectAllReviewBoard(int startRownum, int endRownum) {
		Connection conn = getConnection();
		List<ReviewBoard> list = reviewBoardDao.selectAllReviewBoard(conn, startRownum, endRownum);
		close(conn);
		return list;
	}

	public int selectTotalReviewContents() {
		Connection conn = getConnection();
		int totalContents = reviewBoardDao.selectTotalReviewContents(conn);
		close(conn);
		return totalContents;
	}

	public int updateReviewBoardReadCount(int no) {
		Connection conn = getConnection();
		int result = reviewBoardDao.updateReviewBoardReadCount(conn, no);
		 
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result;
	}

	public ReviewBoard selectOneReviewBoard(int no) {
		Connection conn = getConnection();
		
		ReviewBoard reviewBoard = reviewBoardDao.selectOneReviewBoard(conn, no);
		Attachment attach = reviewBoardDao.selectOneAttachmentByReviewBoardNo(conn, no);
		reviewBoard.setAttach(attach);
		close(conn);
		return reviewBoard;
		
	}

	public List<ReviewBoardComment> selectReviewCommentList(int no) {
		Connection conn = getConnection();
		List<ReviewBoardComment> list = null;
		
		list = reviewBoardDao.selectReviewBoardCommentList(conn,no);
		
		close(conn);
		
		return list;
	}

	public int insertReviewBoardComment(ReviewBoardComment reviewBoardComment) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			result = reviewBoardDao.insertReviewBoardComment(conn, reviewBoardComment);
			
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
