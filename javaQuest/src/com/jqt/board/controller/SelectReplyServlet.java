package com.jqt.board.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.jqt.board.model.service.BoardService;
import com.jqt.board.model.vo.Board;


/**
 * Servlet implementation class SelectReplyServlet
 */
@WebServlet("/selectReply.bo")
public class SelectReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String writer = request.getParameter("writer");
		int bid = Integer.parseInt(request.getParameter("bid"));
		String content = request.getParameter("content");
		Date date = Date(request.getParameter("date"));
		
		System.out.println("댓글작성자:"+writer);
		System.out.println("댓글bid"+bid);
		System.out.println("댓글내용"+content);
		
		Board b = new Board();
		b.setBid(bid);
		//b.setRef_bid(bid);
		b.setBwriter(writer);
		b.setBcontext(content);
		b.setBdate(date);
		
		ArrayList<Board> replyList = new BoardService().selectReply(b);
		System.out.println("자유게시판"+replyList);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(replyList,response.getWriter());
		
	}

	private Date Date(String parameter) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
