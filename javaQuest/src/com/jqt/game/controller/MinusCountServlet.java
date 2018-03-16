package com.jqt.game.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.game.model.service.RoomService;

/**
 * Servlet implementation class MinusCountServlet
 */
@WebServlet("/minusCount.g")
public class MinusCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MinusCountServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String delete = request.getParameter("type");
		String roomNumber = request.getParameter("roomNumber");
		
		System.out.println("delete : " + delete);
		System.out.println("roomNumber : " + roomNumber);
		//나간 방의 인원수를 감소 후 가져옴.
		int present = 0;
		present = new RoomService().minusCount(roomNumber);
		
		System.out.println("minusCount present : " + present);
		if(present > 0){
			request.setAttribute("present", present);
			request.setAttribute("roomNumber", roomNumber);
		}else {
			request.setAttribute("type", delete);
			request.setAttribute("roomNumber", roomNumber);
			request.setAttribute("present", String.valueOf(present));
		}
		request.getRequestDispatcher("/oxRoomList.g").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
