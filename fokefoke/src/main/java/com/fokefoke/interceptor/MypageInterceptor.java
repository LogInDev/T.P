package com.fokefoke.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class MypageInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		String memberId = (String)session.getAttribute("memberId");
		
		if(memberId == null ) { // 로그인 되지 않았을 시 
			
			response.sendRedirect("/"); //메인 페이지로 리다이렉트
			return false;
			
		}
		
		return true; // 보내준다
	
	}
}
