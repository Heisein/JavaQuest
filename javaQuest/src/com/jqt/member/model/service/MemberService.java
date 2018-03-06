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

}
