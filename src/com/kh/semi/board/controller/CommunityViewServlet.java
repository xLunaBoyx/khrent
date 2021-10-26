package com.kh.semi.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.semi.board.model.service.CommunityBoardService;
import com.kh.semi.board.model.vo.CommunityBoard;
import com.kh.semi.board.model.vo.CommunityBoardComment;

/**
 * Servlet implementation class CommunityDetailViewServlet
 */
@WebServlet("/board/boardView")
public class CommunityViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CommunityBoardService boardService = new CommunityBoardService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		CommunityBoard communityBoard = boardService.selectOneBoard(no);
		System.out.println("selectOneBoard@servlet = "+ communityBoard);
		
		// 댓글목록 가져오기
		List<CommunityBoardComment> commentList = boardService.selectCommentList(no);
		System.out.println("commentList@servlet = " + commentList);
		
		request.setAttribute("list", commentList);
		request.setAttribute("communityBoard", communityBoard);
		request.getRequestDispatcher("/WEB-INF/views/board/communityView.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
