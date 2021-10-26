package com.kh.semi.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.NoticeBoardService;
import com.kh.semi.board.model.vo.NoticeBoard;
import com.kh.semi.common.MvcUtils;

/**
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet("/board/notice")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	NoticeBoardService noticeBoardService = new NoticeBoardService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자 입력값 처리
				int cPage = 1;
				int numPerPage = 10;
				
				try {
					cPage = Integer.parseInt(request.getParameter("cPage"));
				} catch (NumberFormatException e) {
					
				}
				System.out.println("cPage = " + cPage);
				
				int startRownum = cPage * numPerPage - (numPerPage - 1); // 10- 9 = 1
				int endRownum = cPage * numPerPage;
				
				// 2. 업무로직
				// a. content 영역
				List<NoticeBoard> list = noticeBoardService.selectAllNoticeBoard(startRownum, endRownum);
				System.out.println("NoticeBoard@servlet = " + list);
				 
				// b. pagebar 영역
				int totalContents = noticeBoardService.selectTotalNoticeContents();
				System.out.println("totalContents = " + totalContents);
				String url = request.getRequestURI();
				System.out.println("url@servlet = " + url);   // /project/board/notice
				String pagebar = MvcUtils.getPagebar(cPage, numPerPage, totalContents, url);
				System.out.println("pagebar@servlet = " + pagebar);
				
				// 3. view단 처리
				request.setAttribute("list", list);
				request.setAttribute("pagebar", pagebar);
				request
					.getRequestDispatcher("/WEB-INF/views/board/noticeList.jsp")
					.forward(request, response);
					
	}


}
