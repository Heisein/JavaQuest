package com.jqt.game.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jqt.game.model.service.RoomService;

@WebServlet("/upCount.g")
public class PresentUpCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PresentUpCountServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String roomNumber = request.getParameter("roomNumber");
		
		System.out.println("upCount roomNumber : " + roomNumber);
		
		int result = new RoomService().upCount(roomNumber);
		
		if(result > 0){
			String page = "views/games/Oxquiz.jsp";
			request.setAttribute("roomNumber", roomNumber);
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
