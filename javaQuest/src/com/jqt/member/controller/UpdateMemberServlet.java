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

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/update.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				
				//2.request 객체에서 파라메터 꺼내기 
				
				String userId = request.getParameter("userId");
				//String userPwd = request.getParameter("userPwd");
				String nickName = request.getParameter("nickname");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				
				
				System.out.println("userId = " + userId);
				//System.out.println("password = " + userPwd);
				
				//3.member 객체 생성
				
				Member m = new Member();
				
				m.setUserId(userId);
				//m.setUserPwd(userPwd);
				m.setNickName(nickName);
				m.setEmail(email);
				m.setPhone(phone);
				
				
				//4. service로 전달
				
				int result = new MemberService().updateMember(m);
				
				//5. 처리 결과를 따른 뷰 페이지 결정 
				
				String page = "";
				
				
				
				if(result>0){
					page = "views/common/updateSuccessPage.jsp";
					request.setAttribute("msg", "회원 정보가 수정되었습니다.");
					
					System.out.println("result : " + result);
					//세션 객체를 받아옴
					HttpSession session = request.getSession();
					
					//로그인 유저 정보 갱신
					session.setAttribute("loginUser", m);
											
					RequestDispatcher view = request.getRequestDispatcher(page);
					view.forward(request, response);
					
					
				} else {
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "회원 정보 수정에 실패하였습니다.");
					
					RequestDispatcher view = request.getRequestDispatcher(page);
					view.forward(request, response);
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
