package com.kh.semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.board.model.service.ReviewBoardService;
import com.kh.semi.common.MvcFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class ReviewBoardEnrollServlet
 */
@WebServlet("/board/reviewBoardEnroll")
public class ReviewBoardEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ReviewBoardService reviewBoardService = new ReviewBoardService();
	/**
	 * 1. 파일업로드(사용자파일을 서버컴퓨터에 저장) : MultipartRequest객체 생성
	 * 	a. HttpServletRequest
	 * 	b. saveDirectory 파일이 저장될 directory
	 *  c. maxPostSize 업로드 최대용량(10mb)
	 *  d. encoding
	 *  e. FileRenamePolicy객체 : DefaultFileRenamePolicy객체 -> MvcFileRenamePolicy객체
	 * 	
	 * 
	 * 2. 저장된 파일정보를 db에 저장
	 * 
	 * 
	 * *MultipartRequest객체를 생성하면 기존의 HttpServletRequest객체로부터 사용자입력값을 가져올수 없다.
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0. 파일 업로드
		// b. 파일 저장경로
		ServletContext application = getServletContext(); 
		String saveDirectory = application.getRealPath("/upload/board");
		System.out.println("saveDirectory = " + saveDirectory);
		
		// c.최대파일용량 10mb = 1kb * 1000 * 10
		int maxPostSize = 1024 * 1024 * 10;
		
		// d.인코딩
		String encoding = "utf-8";
		// e.파일명 재지정 정책 객체
		FileRenamePolicy policy = new MvcFileRenamePolicy();
		
		MultipartRequest multipartRequest = 
				new MultipartRequest(
						request, 
						saveDirectory, 
						maxPostSize, 
						encoding, 
						policy
					);
		// 파일정보 가져오기
		String originalFilename = multipartRequest.getOriginalFileName("upFile");
		String renamedFilename = multipartRequest.getFilesystemName("upFile");
		
		// 1. 사용자 입력값 처리
		String title = multipartRequest.getParameter("title");
		String writer = multipartRequest.getParameter("writer");
		String content = multipartRequest.getParameter("content");
		String carName = multipartRequest.getParameter("carName");
	}

}