package com.jqt.member.model.service;

import static com.jqt.common.JDBCTemplet.close;
import static com.jqt.common.JDBCTemplet.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.jqt.member.model.dao.MemberDao;
import com.jqt.member.model.vo.Member;
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

}
