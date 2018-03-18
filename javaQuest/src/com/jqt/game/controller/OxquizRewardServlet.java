package com.jqt.game.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.store.model.service.StoreService;

@WebServlet("/reward.g")
public class OxquizRewardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OxquizRewardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNum = Integer.parseInt(request.getParameter("userNum"));
		int point = Integer.parseInt(request.getParameter("reward"));
		
		new StoreService().reward(userNum, point);
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
