package com.jqt.game.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.game.model.service.RoomService;
import com.jqt.game.model.vo.Room;

@WebServlet("/oxRoomList.g")
public class OxRoomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OxRoomListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("리스트 뽑아보자");
		String type = request.getParameter("type");
		String roomNumber = request.getParameter("roomNumber");
		
		if(type.equals("allList")){
			ArrayList<Room> list = new RoomService().allList();

			if(list != null){
				System.out.println("안녕하세요~~~");
				request.setAttribute("list", list);
				request.setAttribute("type", type);
				request.setAttribute("roomNumber", roomNumber);
			}
		}
		else if(type.equals("delete")){
			ArrayList<Room> list = new RoomService().allList();

			if(list != null){
				System.out.println("delete~~~");
				request.setAttribute("list", list);
				request.setAttribute("type", type);
				request.setAttribute("roomNumber", roomNumber);
			}
		}
		else if(type.equals("minus")){
			int result = new RoomService().minusCount(roomNumber);
			ArrayList<Room> list = new RoomService().allList();

			if(list != null){
				System.out.println("minus~~~");
				request.setAttribute("list", list);
				request.setAttribute("type", type);
				request.setAttribute("roomNumber", roomNumber);
				request.setAttribute("present", String.valueOf(result));
			}
		}
		
		request.getRequestDispatcher("views/games/waitingRoom.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
