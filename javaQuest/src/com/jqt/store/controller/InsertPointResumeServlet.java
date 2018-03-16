package com.jqt.store.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jqt.member.model.vo.Member;
import com.jqt.quest.model.service.QuestService;
import com.jqt.store.model.service.StoreService;
import com.jqt.store.model.vo.PayedResume;

/**
 * Servlet implementation class InsertPayedResumeServlet
 */
@WebServlet("/insertPayed.st")
public class InsertPointResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPointResumeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int productCode = Integer.parseInt(request.getParameter("pc"));
		String impUid = request.getParameter("impUid");
		String msg = request.getParameter("msg");
		int givePoint = Integer.parseInt(request.getParameter("givePoint"));
		
		System.out.println(loginUser);
		System.out.println(productCode);
		System.out.println(impUid);
		System.out.println(msg);
		
		PayedResume ps = new PayedResume();
		
		ps.setUserNum(loginUser.getUserNum());
		ps.setProductCode(productCode);
		ps.setProductType(1); // 1포인트 2상품
		ps.setPayUid(impUid);
		ps.setPayMsg(msg);
		ps.setPointUpdown(givePoint); // 증감액
		
		//서비스로 전달
		int result = new StoreService().insertResume(ps);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
