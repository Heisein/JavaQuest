package com.jqt.game.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jqt.store.model.service.StoreService;

@WebServlet("/pointCheck.g")
public class PointCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PointCheckServlet() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int userNum = Integer.parseInt(request.getParameter("userNum"));
    	
    	int result = new StoreService().pointCheck(userNum);
    	
    	PrintWriter out = response.getWriter();
    	
    	if(result > 0){
    		out.append("success");
    	}else {
    		out.append("fail");
    	}
    	out.flush();
    	out.close();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
