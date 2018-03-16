package com.jqt.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.board.model.service.BoardService;
import com.jqt.board.model.vo.Board;


/**
 * Servlet implementation class InsertQuestionServlet
 */
@WebServlet("/insertQuestion.bo")
public class InsertQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btitle = request.getParameter("title");
		String bcontent = request.getParameter("content");
		String uno = request.getParameter("uno");
		
		Board m = new Board();
		m.setBwriter(uno);
		m.setBtitle(btitle);
		m.setBcontext(bcontent);
		
		int result = new BoardService().inserquestion(m);
		String page ="";
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/selectQuestion.bo");
		}else {
			request.setAttribute("msg", "질문답 글쓰기실패!!");
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
