package com.jqt.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.board.model.service.boardService;
import com.jqt.board.model.vo.board;

/**
 * Servlet implementation class InsertQaaServlet
 */
@WebServlet("/insertQaa.bo")
public class InsertQaaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQaaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bwriter = request.getParameter("nickname");
		String btitle = request.getParameter("title");
		String bcontent = request.getParameter("content");
		String uno = request.getParameter("uno");
		
		System.out.println("btitle :" + btitle);
		System.out.println("bcontent:" + bcontent);
		System.out.println("nick:"+ bwriter);
		
		board m = new board();
		m.setBwriter(uno);
		m.setBtitle(btitle);
		m.setBcontext(bcontent);
		
		
		int result = new boardService().insertqaa(m);
		System.out.println(result);
		String page="";
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/selectqaa.no");
		}else {
			
			request.setAttribute("msg", "게시판글쓰기실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
