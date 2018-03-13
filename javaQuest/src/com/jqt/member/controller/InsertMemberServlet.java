package com.jqt.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.member.model.service.MemberService;
import com.jqt.member.model.vo.Member;


/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insertMember.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String nickName = request.getParameter("userNickName");
		String userPwd = request.getParameter("userPwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		//객체 생성
		Member m = new Member();
		m.setUserId(userId);
		m.setNickName(nickName);
		m.setUserPwd(userPwd);
		m.setEmail(email);
		m.setPhone(phone);
		
		//서비스로 전달
		int result = new MemberService().insertMember(m);
		System.out.println("result:"+result);
		//페이지연결~
		String page ="";
		if(result>0) {
			page = "views/common/joinafter.jsp";
			request.setAttribute("msg", "회원가입이~");
			request.setAttribute("userId", userId);
			request.setAttribute("nickname", nickName);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "회원가입이!");
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
