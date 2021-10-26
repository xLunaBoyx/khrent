package com.kh.semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.NoticeBoardService;
import com.kh.semi.board.model.vo.NoticeBoard;
import com.kh.semi.board.model.vo.QuestionBoard;

/**
 * Servlet implementation class QuestionDetailViewServlet
 */
@WebServlet("/board/noticeView")
public class NoticeDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	NoticeBoardService noticeBoardService = new NoticeBoardService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		NoticeBoard noticeBoard = noticeBoardService.selectOneBoard(no);
		System.out.println("noticeBoard@servlet = "+ noticeBoard);
		
		request.setAttribute("noticeBoard", noticeBoard);
		request.getRequestDispatcher("/WEB-INF/views/board/noticeView.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
