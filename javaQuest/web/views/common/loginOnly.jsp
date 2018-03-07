<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.jqt.member.model.vo.*" %>
<%
	Member loginUser = null;
	
	if(request.getSession().getAttribute("loginUser") != null) 
		loginUser = (Member)request.getSession().getAttribute("loginUser");	
	else{
		request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
		
		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
	}
%>