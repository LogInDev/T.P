package com.fokefoke.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.fokefoke.dto.MemberDTO;

public class CartInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		MemberDTO mvo = (MemberDTO)session.getAttribute("member");
		
		if(mvo == null) {
			response.sendRedirect("/index");
			return false;
		} else {
			return true;
		}
	}

}

