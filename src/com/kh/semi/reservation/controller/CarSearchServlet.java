package com.kh.semi.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.reservation.model.service.ReservationService;
import com.kh.semi.reservation.model.vo.CarInfo;
import com.kh.semi.reservation.model.vo.CarList;

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
		// 사용자입력값 처리
		String startDate = request.getParameter("mainSDate");
		String endDate = request.getParameter("mainEDate");
		
		System.out.println(startDate);
		System.out.println(endDate);
		
		List<CarInfo> list = reservationService.searchCar(startDate, endDate);
		System.out.println(list);
		
		// view단 연결
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
