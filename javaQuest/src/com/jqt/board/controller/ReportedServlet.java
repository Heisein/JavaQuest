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
		String rno = request.getParameter("rno");
		int bid = Integer.parseInt(request.getParameter("bid"));
		System.out.println("신고한사람:"+rno);
		System.out.println("신고당한게시글:"+bid);
		
		Board n = new Board();
		n.setBwriter(rno);
		n.setBid(bid);
		
		
		System.out.println("n값:"+n);
		int list = new BoardService().insertreported(n);
		System.out.println("result값"+list);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list,response.getWriter());
		
		
		/*String page= "";
		if(result>0) {
			page = "views/board/noticedetailForm.jsp";
			request.setAttribute("n", n);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("page","실패!");
		}*/
		
		
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
