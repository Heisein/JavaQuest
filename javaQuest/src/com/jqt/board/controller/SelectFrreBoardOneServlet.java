package com.jqt.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.board.model.service.BoardService;
import com.jqt.board.model.vo.Board;


/**
 * Servlet implementation class SelectFrreBoardOneServlet
 */
@WebServlet("/selectOneFb.bo")
public class SelectFrreBoardOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFrreBoardOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		Board n = new BoardService().selectOnebd(num);
		String page ="";
		
		if(n != null) {
			page = "views/board/FreeBoardDetailForm.jsp";
			request.setAttribute("n", n);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판조회실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
