package com.fokefoke.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		Integer adminCk = (Integer)session.getAttribute("adminCk");
		
		if(adminCk == null || adminCk.intValue() == 0) { // 관리자 계정 아닌 경우
			
			response.sendRedirect("/"); //메인 페이지로 리다이렉트
			return false;
			
		}
		
		return true; // 관리자 계정 로그인 성공
	
	}
}
