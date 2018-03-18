package com.jqt.ranking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.ranking.model.service.RankingService;
import com.jqt.ranking.model.vo.Ranking;

@WebServlet("/searchNickName.ro")
public class SearchNickNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SearchNickNameServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName");
		String type = request.getParameter("type");
		Ranking list = null;
		System.out.println(type);
		System.out.println(nickName);
		
		String order = "";
		if(type.equals("Level")){
			order = "user_level";
			list = new RankingService().SearchNickName(nickName, order);
		}
		
		if(type.equals("Timeattack")){
			order = "quiz_time";
			list = new RankingService().SearchNickName(nickName, order);
		}
		
		if(type.equals("OX")){
			order = "quiz_time";
			list = new RankingService().SearchNickName(nickName, order);
		}
		
		if(type.equals("Quiz")){
			order = "quiz_time";
			list = new RankingService().SearchNickName(nickName, order);
		}
		
		String page = "";
		if(list != null){
			request.setAttribute("list", list);
			request.setAttribute("type", type);
			page = "views/ranking/searchNickNameList.jsp";
		}else{
			request.setAttribute("msg", "에러");
			page = "views/common/errorPage.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
