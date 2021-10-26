package com.kh.semi.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.QuestionBoardService;
import com.kh.semi.board.model.vo.QuestionBoard;
import com.kh.semi.board.model.vo.QuestionBoardComment;

/**
 * Servlet implementation class QuestionDetailViewServlet
 */
@WebServlet("/board/questionView")
public class QnaBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	QuestionBoardService questionBoardService = new QuestionBoardService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 사용자 입력값 처리
		int no = Integer.parseInt(request.getParameter("no"));
		
		// 2. 업무로직 : 
		// 읽음 여부 확인(Cookie)
		Cookie[] cookies = request.getCookies();
		boolean hasRead = false;
		String boardValue = "";
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				System.out.println(name + " : " + value);
				
				if("board".equals(name)) {
					boardValue = value;
					// 현재 게시글 읽음여부
					if(value.contains("|" + no + "|")) {
						hasRead = true;
					}
					break;
				}
			}
		}
		
		System.out.printf("hasRead = %b, boardValue = %s%n", hasRead, boardValue);
		
		// 게시글을 처음 읽는 경우
		if(!hasRead) {
			// 게시글 Cookie
			Cookie cookie = new Cookie("board", boardValue + "|" + no + "|");   // 그냥 no만 적으면 혼동된다고? 하시면서 패딩(|)을 넣었다고 하셨다.
			cookie.setMaxAge(354 * 24 * 60 * 60);   // 1년
			cookie.setPath(request.getContextPath() + "/board/questionView");   // 해당 요청시에만 이 cookie를 전송하겠다는 뜻
			response.addCookie(cookie);
			
			
			// 조회수 1 증가 (이게 아래의 게시글 불러오기보다 먼저 처리되어야 글을 클릭했을때 1 증가한 조회수로 보이게 된다.
			int result = questionBoardService.updateReadCount(no);
		}
		
 
		// 해당 글번호의 문의게시판 글 불러오기
		QuestionBoard questionBoard = questionBoardService.selectOneQnaBoard(no);
		System.out.println("questionBoard@QnaViewServlet = "+ questionBoard);
		
		// XSS 공격 대비 일단 안썼음. 03_hello_mvc의 BoardViewServlet에 있음
		
		// 댓글목록 가져오기 (10-13 1교시)
		List<QuestionBoardComment> commentList = questionBoardService.selectQnaCommentList(no);
		System.out.println("qnaCommentList@QnaBoardViewServlet = " + commentList);
		
		request.setAttribute("questionBoard", questionBoard);
		request.setAttribute("commentList", commentList);
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
