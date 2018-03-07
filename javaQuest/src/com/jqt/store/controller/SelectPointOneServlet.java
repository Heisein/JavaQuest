package com.jqt.store.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jqt.store.model.service.StoreService;
import com.jqt.store.model.vo.PointProduct;

/**
 * Servlet implementation class SelectPointOneServlet
 */
@WebServlet("/selectPP.st")
public class SelectPointOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPointOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		
		System.out.println("productCode : " + productCode);
		
		PointProduct pp = new StoreService().selectOne(productCode);
		
		
		String page = null;
		if(pp != null){
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(pp, response.getWriter());
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg","포인트상품 json중 실패");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
