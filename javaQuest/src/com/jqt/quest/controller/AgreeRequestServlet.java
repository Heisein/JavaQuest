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
 * Servlet implementation class AgreeRequestServlet
 */
@WebServlet("/agree.qu")
public class AgreeRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgreeRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		
		//서비스로 전달
		int result = new QuestService().insertRequestToQuest(rnum);
		
		//페이지 연결
		String page = "";
		if(result > 0){
			new QuestService().deleteRequest(rnum);
			page = "views/quest/requestListPage.jsp";
			request.setAttribute("list", new QuestService().selectRequestList());
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
