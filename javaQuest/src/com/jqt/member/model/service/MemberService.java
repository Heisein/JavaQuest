package com.jqt.member.model.service;

import com.jqt.member.model.dao.MemberDao;
import com.jqt.member.model.vo.Member;
import static com.jqt.common.JDBCTemplet.*;

import java.sql.Connection;
public class MemberService {

	public Member loginCheck(Member m) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con, m);
		
		close(con);
		
		return loginUser;
	}

	public int insertMember(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertMember(con,m);
		
		return result;
	}

	public int idcheck(String userId) {
		Connection con = getConnection();
		
		int result = new MemberDao().idcheck(con,userId);
		
		close(con);
		
		return result;
	}

	public int nickcheck(String user_nickname) {
		Connection con = getConnection();
		
		int result = new MemberDao().nickcheck(con,user_nickname);
		
		close(con);
		
		return result;
	}

}
