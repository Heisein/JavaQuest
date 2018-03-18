package com.jqt.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jqt.board.model.service.BoardService;
import com.jqt.board.model.vo.Board;


/**
 * Servlet implementation class SelectLikeServlet
 */
@WebServlet("/selectLike.bo")
public class InsertLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_num = request.getParameter("user_num");	//좋아요누른사람
		int bid = Integer.parseInt(request.getParameter("bid"));	//좋아요게시물
		System.out.println("좋아요한 사람~"+user_num);
		System.out.println("좋아요 당한 글!"+bid);
		
		Board n = new Board();
		n.setBwriter(user_num);
		n.setBid(bid);
		System.out.println("좋아요 ?:"+n);
		
		int list = new BoardService().insertlike(n);
		System.out.println("좋아요 list" + list);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list,response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
