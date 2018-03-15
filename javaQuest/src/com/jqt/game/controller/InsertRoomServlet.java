package com.jqt.game.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jqt.game.model.service.RoomService;
import com.jqt.game.model.vo.Room;

@WebServlet("/insertRoom.g")
public class InsertRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertRoomServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = "" + request.getParameter("roomTitle");
		System.out.println("insertRoom.g roomTitle : " + title);
		
		//방정보 리턴
		Room room = new RoomService().insertRoom(title);
		
		System.out.println("insertRoom.g roomNumber : " + room);
		
		if(room != null){
			response.setContentType("application/json");
	    	response.setCharacterEncoding("UTF-8");		
	    	
	    	new Gson().toJson(room, response.getWriter());
    	
		}
		
/*		if(result > 0) {
			request.setAttribute("roomNumber", result);
			request.getRequestDispatcher("views/games/Oxquiz.jsp").forward(request, response);
		}	
*/		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
