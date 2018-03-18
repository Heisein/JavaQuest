package com.jqt.game.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jqt.game.model.service.GameService;
import com.jqt.game.model.service.RoomService;
import com.jqt.game.model.vo.SelectGame;
import com.jqt.member.model.vo.Member;
import com.jqt.store.model.service.StoreService;

@WebServlet("/oxquizList.g")
public class OxquizListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OxquizListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String roomNumber = request.getParameter("roomNumber");
		int userNum = ((Member)(request.getSession().getAttribute("loginUser"))).getUserNum();
		
		//시작했으니 포인트 소비함.
		new StoreService().joinPay(userNum);
		
		//시작했으니까 데이터베이스 시작했다고 변경
		new RoomService().roomStart(roomNumber);
		
		// 문제 가지고오기
		ArrayList<SelectGame> list = new GameService().oxGameList();
		
		response.setContentType("application/json");
    	response.setCharacterEncoding("UTF-8");		
    	
    	System.out.println(list.toString());
		new Gson().toJson(list, response.getWriter());
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
