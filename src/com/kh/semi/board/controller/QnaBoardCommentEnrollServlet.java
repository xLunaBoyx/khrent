package com.kh.semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.QuestionBoardService;
import com.kh.semi.board.model.vo.QuestionBoardComment;

/**
 * Servlet implementation class QnaBoardCommentEnrollServlet
 */
@WebServlet("/board/qnaBoardCommentEnroll")
public class QnaBoardCommentEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	QuestionBoardService questionBoardService = new QuestionBoardService();
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자 입력값 처리
		int commentLevel = Integer.parseInt(request.getParameter("commentLevel"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int commentRef = Integer.parseInt(request.getParameter("commentRef"));
		
		QuestionBoardComment bc = new QuestionBoardComment(0, boardNo, writer, content, null, commentLevel, commentRef);
		System.out.println("QnaBoardComment@QnaBoardCommentEnrollServlet = " + bc);
		
		// 2. 업무로직
		int result = questionBoardService.insertQnaBoardComment(bc);
		String msg = result > 0 ? "댓글 등록 성공!" : "댓글 등록 실패!";
		
		// 3. 리다이렉트
		request.getSession().setAttribute("msg", msg);

		String loaction = request.getContextPath() + "/board/questionView?no=" + boardNo;
		response.sendRedirect(loaction);
	}

}
