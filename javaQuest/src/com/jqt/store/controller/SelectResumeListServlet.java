package com.jqt.store.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.member.model.vo.Member;
import com.jqt.store.model.service.StoreService;
import com.jqt.store.model.vo.PayedResume;

/**
 * Servlet implementation class SelectResumeListServlet
 */
@WebServlet("/selectResume.st")
public class SelectResumeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectResumeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginUser");

		ArrayList<PayedResume> list = new StoreService().selectResumeList(m.getUserNum());
		
		String page = "";
		if(list != null){
			page = "views/store/storeResumePage.jsp";
			request.setAttribute("list", list);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "결제내역 조회 실패");
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
