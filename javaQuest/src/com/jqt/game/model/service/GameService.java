package com.jqt.game.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

import com.jqt.game.model.dao.GameDao;
import com.jqt.game.model.vo.SelectGame;

import static com.jqt.common.JDBCTemplet.*;
public class GameService {
	
	
	//사지선다 문제 추출용 메소드
	public ArrayList<SelectGame> selectGame() {
		Connection con = getConnection();
		
		ArrayList<SelectGame> list = new GameDao().selectGame(con);
		
		close(con);
		
		return list;
	}

	
	//ox게임 문제 추출용 메소드
	public ArrayList<SelectGame> oxGameList() {
		Connection con = getConnection();
		
		ArrayList<SelectGame> list = new GameDao().oxGameList(con);
		
		close(con);
		
		return list;
	}

}
