package com.kh.semi.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.CommunityBoardService;
import com.kh.semi.board.model.vo.CommunityBoard;

/**
 * Servlet implementation class CommunityDetailViewServlet
 */
@WebServlet("/board/boardView")
public class CommunityDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CommunityBoardService boardService = new CommunityBoardService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		CommunityBoard communityBoard = boardService.selectOneBoard(no);
		System.out.println("selectOneBoard@servlet = "+ communityBoard);
		
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
