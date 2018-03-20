package com.jqt.game.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.quest.model.service.QuestService;
import com.jqt.quest.model.vo.Quest;

@WebServlet("/countGame.g")
public class CountGameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CountGameServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//이번주에 내는 게임 번호를 입력
			int qid = 18;
			Quest q = new QuestService().selectOne(qid);
			
			String page = null;
			if(q != null){
				page = "views/games/countGame.jsp";
				System.out.println(page);
				request.setAttribute("q", q);
			}else{
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg","퀘스트 수락 실패");
			}
			
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request,response);
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
