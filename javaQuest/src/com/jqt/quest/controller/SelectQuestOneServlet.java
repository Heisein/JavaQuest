package com.jqt.quest.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.quest.model.service.QuestService;
import com.jqt.quest.model.vo.Quest;

/**
 * Servlet implementation class SelectQuestOneServlet
 */
@WebServlet("/selectOne.qu")
public class SelectQuestOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectQuestOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qid = Integer.parseInt(request.getParameter("qid"));
		
		Quest q = new QuestService().selectOne(qid);
		
		System.out.println("qid : " + qid);
		
		String page = null;
		if(q != null){
			page = "views/compiler/compileMain.jsp";
			System.out.println(page);
			request.setAttribute("q", q);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg","퀘스트 수락 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
