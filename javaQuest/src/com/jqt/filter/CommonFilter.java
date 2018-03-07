package com.jqt.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class CommonFilter
 */
@WebFilter(filterName="encoding", urlPatterns="/*")
public class CommonFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CommonFilter() {
    	System.out.println("common 필터 객체 생성");
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		System.out.println("filter의 destroy() 호출...");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("CommonFilter 인코딩 완료");
		// System.out.println("doFilter() 호출됨...");
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("init() 호출됨...");
	}

}
