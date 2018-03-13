package com.jqt.member.model.service;

import com.jqt.member.model.dao.MemberDao;
import com.jqt.member.model.vo.Member;
import static com.jqt.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;
public class MemberService {

	public Member loginCheck(Member m) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con, m);
		
		close(con);
		
		return loginUser;
	}

	public ArrayList<Member> selectList() {
		Connection con = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectList(con);
		
		close(con);
		
		return list;
	}

	public int deleteMember(int num) {
		Connection con = getConnection();
		
		int result = new MemberDao().deleteMember(con, num);
		
		close(con);
		
		return result;
	}
		
	public int insertMember(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertMember(con,m);
		
		close(con);
		
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
