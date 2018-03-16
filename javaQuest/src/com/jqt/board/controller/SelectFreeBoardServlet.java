package com.jqt.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.board.model.service.BoardService;
import com.jqt.board.model.vo.Board;
import com.jqt.board.model.vo.PageInfo;


/**
 * Servlet implementation class SelectFreeBoardServlet
 */
@WebServlet("/selectFb.no")
public class SelectFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFreeBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage; // 현재 페이지를 표시할 변수
	    int limit; //한 페이지에 게시글이 몇개 보여질 것인지 
	    int maxPage; //전체 페이지에서 가장 마지막 페이지 
	    int startPage; // 페이지 버튼 페이징 시작값
	    int endPage; // 페이지 버튼 페이징 마지막값 
		
	    //게시판은 1페이지 부터 시작함
	    currentPage = 1;
	    if(request.getParameter("currentPage") != null) {
	    	currentPage = Integer.parseInt(request.getParameter("currentPage"));
	    }
	    System.out.println("게시판페이지"+currentPage);
	    //한페이지에서 보여질 목록 갯수들
	    limit = 10;
	    
	    //전체 목록 갯수를 리턴한다
	    BoardService bs = new BoardService();
	    int listCount = bs.getListCount1();
	    System.out.println("목록 갯수들:"+listCount);
	    //총 페이지수 계산 
	    //예를 들면, 목록 수가 123개 이면  13페이지가 필요함 , 짜투리 목록이 최소 한개일때, 1page로 처리가기 위해서
	    //전체 목록 / limit + 0.9 
	    maxPage = (int)((double)listCount / limit + 0.9);
	    System.out.println("멕스페이지는?"+maxPage);
	    //소수점 계산을 하기위해 더블로 형변환후 뒤에 잘라버리기 위해서 인트로 다시 형변환 
	      
	    //현재 페이지에 보여줄 시작 페이지 수 (10개씩 보여지게 할 경우) 
	    //아래쪽 페이지 수가 10개씩 보여지게 한다면 1, 11, 21, 31...
	    startPage = (int)(((double)currentPage / limit + 0.9) - 1) * limit + 1;
	    System.out.println("스타트페이지는?"+startPage);
	    //목록 아래 보여질 마지막 페이지 수 (10,20,30,...)
	    endPage = startPage + limit -1;
	    System.out.println("마지막페이지는?"+endPage);
	    if(maxPage < endPage){
	       endPage =  maxPage;
	    }
	    
	    PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	    
		ArrayList<Board> list = new BoardService().selectFb(currentPage,limit);
		String page ="";
		if(list !=null) {
			page = "views/board/FreeBoardList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판안보여줌!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**asdf
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
