package com.jqt.game.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.game.model.service.TimeAttackService;

@WebServlet("/timeAttack.g")
public class TimeAttackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TimeAttackServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int record = Integer.parseInt(request.getParameter("record"));
		int userNum = Integer.parseInt(request.getParameter("userNum"));
		
		int result = new TimeAttackService().insertRecord(record, userNum);
		
		String page = "";
		if(result > 0){
			page = "views/games/gameMainPage.jsp";
			response.sendRedirect(page);
		}else {

		}
			
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
