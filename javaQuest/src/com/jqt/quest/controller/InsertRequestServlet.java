package com.jqt.quest.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.member.model.vo.Member;
import com.jqt.quest.model.service.QuestService;
import com.jqt.quest.model.vo.Quest;

/**
 * Servlet implementation class InsertRequestServlet
 */
@WebServlet("/insertRequest.qu")
public class InsertRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		String questName = request.getParameter("questName");
		String questContents = request.getParameter("questContents");
		String defaultCode = request.getParameter("defaultCode");
		String questWriter = request.getParameter("questWriter");
		String questAnswer = request.getParameter("questAnswer");
		
		Quest q = new Quest();
		
		q.setQuestName(questName);
		q.setQuestContents(questContents);
		q.setQuestWriter(questWriter);
		q.setDefaultCode(defaultCode);
		q.setQuestAnswer(questAnswer);
		
		//서비스로 전달
		int result = new QuestService().insertRequest(q);
		
		//페이지 연결
		String page = "";
		if(result > 0){
			page = "views/quest/questListPage.jsp";
			request.setAttribute("list", new QuestService().selectList(loginUser.getUserNum()));
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "퀘스트 요청에 실패했습니다.");
		}
				
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
