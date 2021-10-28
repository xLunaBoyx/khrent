package com.kh.semi.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.reservation.model.service.ReservationService;
import com.kh.semi.reservation.model.vo.Car;

/**
 * Servlet implementation class CarSearchServlet
 */
@WebServlet("/reservation/carSearch")
public class CarSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ReservationService reservationService = new ReservationService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자입력값 처리 - 날짜검색에서 받아온 예약시작일과 종료일
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		System.out.println(startDate);
		System.out.println(endDate);
		
		// 업무로직 - 받아온 시작일부터 종료일까지 대여가능한 차량을 조회  
		List<Car> list = reservationService.searchCar(startDate, endDate);
		System.out.println(list);
		
		// view단 연결
		request.setAttribute("list", list);
		request
			.getRequestDispatcher("/WEB-INF/views/reservation/carSearch.jsp")
			.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
