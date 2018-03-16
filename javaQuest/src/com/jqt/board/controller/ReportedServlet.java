package com.jqt.board.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.board.model.service.BoardService;
import com.jqt.board.model.vo.Board;

/**
 * Servlet implementation class ReportedServlet
 */
@WebServlet("/reportbd.bo")
public class ReportedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportedServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*var rno = <%= loginUser.getUserNum() %>
		var user_num = <%= n.getBno() %>
		var bid = <%= n.getBid() %>
		var date = <%= n.getBdate() %>*/
		
		String rno = request.getParameter("rno");
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		int bid = Integer.parseInt(request.getParameter("bid"));
		Date date = Date(request.getParameter("date"));
		
		System.out.println(rno);
		System.out.println(user_num);
		System.out.println(bid);
		System.out.println(date);
		
		Board n = new Board();
		n.setBwriter(rno);
		n.setBno(user_num);
		n.setBid(bid);
		n.setBdate(date);
		
		int result = new BoardService().insertreported(n);
		String page= "";
		if(n != null) {
			page = "views/board/noticedetailForm.jsp";
			request.setAttribute("n", n);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("page","실패!");
		}
		
		
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
