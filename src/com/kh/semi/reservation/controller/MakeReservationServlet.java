package com.kh.semi.reservation.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.reservation.model.service.ReservationService;

/**
 * Servlet implementation class MakeReservationServlet
 */
@WebServlet("/reservation/makeReservation")
public class MakeReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ReservationService reservationService = new ReservationService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자입력값 처리
		String memberId = request.getParameter("member_id");
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		String carCode = request.getParameter("car_code");
		String carName = request.getParameter("car_name");
		String price = request.getParameter("price");
		
		System.out.println("MakeReservationServlet@memberId = " + memberId);
		System.out.println("MakeReservationServlet@startDate = " + startDate);
		System.out.println("MakeReservationServlet@endDate = " + endDate);
		System.out.println("MakeReservationServlet@carCode = " + carCode);
		System.out.println("MakeReservationServlet@carName = " + carName);
		System.out.println("MakeReservationServlet@price = " + price);
		
		Map<String, Object> reservation = new HashMap<>();
		reservation.put("memberId", memberId);
		reservation.put("startDate", startDate);
		reservation.put("endDate", endDate);
		reservation.put("carCode", carCode);
		reservation.put("carName", carName);
		reservation.put("price", price);
		
		// 2. 업무로직 - 전달받은 정보들로 예약테이블에 행 추가
		int result = reservationService.insertReservation(reservation);
		
		// 3. 리다이렉트
		HttpSession session = request.getSession();
		session.setAttribute("msg", result > 0 ? "예약이 완료되었습니다." : "예약에 실패하였습니다.");
		
		String location = request.getContextPath() + "/member/myPage";
		response.sendRedirect(location);
		
		
		
	}

}
