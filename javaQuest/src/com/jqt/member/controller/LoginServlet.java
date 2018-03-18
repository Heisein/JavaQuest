package com.jqt.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jqt.member.model.service.MemberService;
import com.jqt.member.model.vo.Member;

@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int type = Integer.parseInt(request.getParameter("type"));
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		System.out.println("LoginServlet doGet(type) : " + type);
		System.out.println("LoginServlet doGet(userId) : " + userId);
		System.out.println("LoginServlet doGet(userPwd) : " + userPwd);
		
		Member m = null;
		//타입에 맞춰서 LoginUser가 될 (temp)Member객체를 생성
		if(type == 1){
			m = new Member();
			m.setType(type);
			m.setUserId(userId);
			m.setUserPwd(userPwd);
		}else if (type == 2){
			m = new Member();
			m.setType(type);
			m.setUserId(userId);
			m.setUserPwd(userPwd);
		}else{
			m = new Member();
			m.setType(type);
			m.setUserId(userId);
			m.setUserPwd(userPwd);
		}
		
		//Service로직 작성
		Member loginUser = new MemberService().loginCheck(m);
		
		String page = "";
		if(loginUser != null){
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			page = "";
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "로 그 인 실 패!");	
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
