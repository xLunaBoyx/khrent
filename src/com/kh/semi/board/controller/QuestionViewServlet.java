package com.kh.semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.QuestionBoardService;
import com.kh.semi.board.model.vo.QuestionBoard;

/**
 * Servlet implementation class QuestionDetailViewServlet
 */
@WebServlet("/board/questionView")
public class QuestionViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	QuestionBoardService questionBoardService = new QuestionBoardService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		QuestionBoard questionBoard = questionBoardService.selectOneBoard(no);
		System.out.println("questionBoard@servlet = "+ questionBoard);
		
		request.setAttribute("questionBoard", questionBoard);
		request.getRequestDispatcher("/WEB-INF/views/board/questionView.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
