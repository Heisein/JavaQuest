package com.jqt.ranking.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.jqt.ranking.model.dao.RankingDao;
import com.jqt.ranking.model.vo.Ranking;

import static com.jqt.common.JDBCTemplet.close;
import static com.jqt.common.JDBCTemplet.getConnection;

public class RankingService {

	public ArrayList<Ranking> RankingList() {
		Connection con = getConnection();
		ArrayList<Ranking> list = new RankingDao().RankingList(con);
		
		close(con);
		return list;
	}

	public ArrayList<Ranking> TimeAttackRanking() {
		Connection con = getConnection();
		ArrayList<Ranking> list = new RankingDao().TimeAttackRanking(con);
		
		close(con);
		return list;
	}

	public Ranking SearchNickName(String nickName, String order) {
		Connection con = getConnection();
		Ranking list = new RankingDao().SearchNickName(con, nickName, order);
		
		close(con);
		return list;
	}

	public ArrayList<Ranking> OxQuizRanking() {
		Connection con = getConnection();
		ArrayList<Ranking> list = new RankingDao().OxQuizRanking(con);
		
		close(con);
		return list;
	}

	
}
