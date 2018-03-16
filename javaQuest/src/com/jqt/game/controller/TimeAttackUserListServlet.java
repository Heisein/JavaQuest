package com.jqt.game.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.game.model.service.TimeAttackService;

@WebServlet("/timeAttackUserList.g")
public class TimeAttackUserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TimeAttackUserListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNum = Integer.parseInt(request.getParameter("userNum"));
		int quizId = 1;
		
		int result = new TimeAttackService().checkUser(quizId, userNum);
		
		PrintWriter out = response.getWriter();
		if(result > 0){
			out.append("check");
		}else {
			out.append("no");
		}
		out.flush();
		out.close();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
