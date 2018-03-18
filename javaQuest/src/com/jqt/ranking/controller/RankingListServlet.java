package com.jqt.ranking.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.ranking.model.service.RankingService;
import com.jqt.ranking.model.vo.Ranking;


@WebServlet("/rankingList.ro")
public class RankingListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public RankingListServlet() {
    	super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		
		String page = "";
		ArrayList<Ranking> list = null;
		System.out.println(type);
		
		int code = 0;
		if(type.equals("Level")){
			list = new RankingService().RankingList();			
		}
		
		if(type.equals("TimeaAttack")){
			list = new RankingService().TimeAttackRanking();
		}
		
		if(type.equals("Quiz")){
			code = 3;
			list = new RankingService().QuizRanking(code);
		}
		
		if(type.equals("RealTime")){
			code = 4;
			list = new RankingService().QuizRanking(code);
		}
		
		if(type.equals("Battle")){ 
			code = 5;
			list = new RankingService().QuizRanking(code);
		}
		
		System.out.println(list);
		
		if(list != null){
			request.setAttribute("list", list);
			request.setAttribute("type", type);
			page = "views/ranking/rankingList.jsp";
		}else{
			request.setAttribute("msg", "잘못된 접근입니다.");
			page = "views/common/errorPage.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
