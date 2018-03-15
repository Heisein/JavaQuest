package com.jqt.game.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.game.model.service.GameService;
import com.jqt.game.model.vo.SelectGame;

@WebServlet("/selectGame.g")
public class SelectGameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectGameServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<SelectGame> list = new GameService().selectGame();

		if(list != null){
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/games/selectedGamePage.jsp").forward(request, response);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
