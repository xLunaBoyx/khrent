package com.kh.semi.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.common.MvcUtils;
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberUpdate
 */

@WebServlet("/admin/adminMemberUpdate")
public class AdminMemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// view단 연결
		request.getRequestDispatcher("/WEB-INF/views/admin/adminMemberUpdate.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.encoding처리
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String password = MvcUtils.getEncryptedPassword(request.getParameter("password"));
		String phone = request.getParameter("phone");
		String issue_date = request.getParameter("issue_date");
		String license_type = request.getParameter("license_type");
		String license_no = request.getParameter("license_no");
	
		Member member = new Member(memberId, password, MemberService.MEMBER_ROLE, null, phone, 0, null, issue_date, license_type, license_no);

		System.out.println("member@servlet = " + member);

		
		int result = memberService.adminMemberUpdate(member);
		String msg = result > 0 ? "회원 정보 변경 성공" : "회원 정보 변경 실패";
		
		if(result > 0) {
			HttpSession session = request.getSession();
			Member newMember = memberService.selectOneMember(memberId);
			session.setAttribute("loginMember", newMember);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("msg", msg);
		
		String location = request.getContextPath() + "/admin/adminMemberUpdate";
		response.sendRedirect(location);
	}

}
