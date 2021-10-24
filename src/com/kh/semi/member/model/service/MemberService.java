package com.kh.semi.member.model.service;

import static com.kh.semi.common.JdbcTemplate.close;
import static com.kh.semi.common.JdbcTemplate.commit;
import static com.kh.semi.common.JdbcTemplate.getConnection;
import static com.kh.semi.common.JdbcTemplate.rollback;

import java.sql.Connection;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Member;

public class MemberService {

	public static final String MEMBER_ROLE = "U";
	public static final String ADMIN_ROLE = "A";
	
	private MemberDao memberDao = new MemberDao();

	public Member selectOneMember(String memberId) {
		Connection conn = getConnection();
		Member member = memberDao.selectOneMember(conn, memberId);
		close(conn);
		return member;
	}
	
	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = memberDao.insertMember(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}

    public int updatePassword(Member member) {
		Connection conn = getConnection();
		int result = memberDao.updatePassword(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}

    public int deleteMember(String memberId) {
 		Connection conn = getConnection();
 		int result = memberDao.deleteMember(conn, memberId);
 		if(result>0)
 			commit(conn);
 		else 
 			rollback(conn);
 		close(conn);
 		return result;
 	}

    public int updateMemberPhone(Member member) {
		Connection conn = getConnection();
		int result = memberDao.updateMemberPhone(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}

	public int LicenseRegister(Member member) {
		Connection conn = getConnection();
		int result = memberDao.LicenseRegister(conn, member);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}
}